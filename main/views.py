from asyncio.windows_events import selector_events
import imp
from django.shortcuts import render,redirect
from django.http import HttpResponse
from django.contrib.auth.models import User,auth
from django.contrib import messages
import mysql.connector
import json
from datetime import datetime

# Create your views here.

import requests
import json

def get_toxicity_score(comment): #the toxicity score ranges from 0 to 1
    
    url = "https://commentanalyzer.googleapis.com/v1alpha1/comments:analyze"

    params = {
        'key': 'AIzaSyBZtz4t73ApQKICnPJKT6rrK7vYLlJwJ_8'
    }

    payload = {
        'comment': {'text': comment},
        'requestedAttributes': {'TOXICITY': {}},
        'doNotStore': True
    }

    headers = {
        'Content-Type': 'application/json'
    }

    response = requests.post(url, params=params, headers=headers, json=payload)

    if response.status_code == requests.codes.ok:
        response_dict = json.loads(response.text)
        toxicity_score = response_dict['attributeScores']['TOXICITY']['summaryScore']['value']
        return toxicity_score
    else:
        return None
def landing(request,*args,**kwargs):
    return render(request,'landing.html')

def post_to_db(title,hashtag,description,user_id,categ_id):
    db = mysql.connector.connect(host="localhost",user="root",password="1234",database = "cca_db")

    cur = db.cursor()
    cur.execute("insert into post(title,description,post_like,post_dislike,categ_id,user_id) values(%s,%s,%s,%s,%s,%s)",(title,description,0,0,categ_id,user_id,))
    cur.execute("select post_id from post order by post_id")
    post_id=cur.fetchall()[-1][0]
    cur.execute("select tag_name from tag")
    s=cur.fetchall() #s will be list of tuples
    db_tags=[]
    for it in s:
        db_tags.append(it[0])
    list_of_tags=hashtag.split(" ")
    print(list_of_tags)
    for tags in list_of_tags:
        tags=tags.lower()
        if tags in db_tags:
            pass
        else:
            cur.execute("insert into tag(tag_name) values(%s)",(tags,))
        #temp=cur.execute("select * from tag where tag_name=%s",(tags,))
        cur.execute("select tag_id from tag where tag_name=%s",(tags,))
        temp=cur.fetchall()
        tag_id=temp[0][0]
        cur.execute("insert into question_tag(tag_id,post_id) values(%s,%s)",(tag_id,post_id,))
        db.commit()
    db.close()


def db_to_post(categ_id,user_id,flag,isTags):
    db = mysql.connector.connect(host="localhost",user="root",password="1234",database = "cca_db")

    cur = db.cursor()
    cur.execute("""select COUNT(*),answer.post_id as count from answer,post where answer.post_id=post.post_id and post.categ_id=%s GROUP BY answer.post_id""",([categ_id]))
    count_data = cur.fetchall()
    count = {}
    for x,y in count_data:
        count[y] = x
    print(count_data)
    cur.execute("""select post_id,title,SUBSTR(description,1,100) as description,post_like,SUBSTR(post_dt,1,10) as date,user_name from post,user where post.categ_id=%s and post.user_id=user.user_id""",([categ_id]))
    temp = cur.fetchall() 
    data = []
    print(temp)
    for x in temp:
        id = x[0]
        if id in count.keys():
            x +=(count[id],)
        else:
            x = x+(0,)
        data.append(x)
    
    cur.execute("""select user_name from user where user_id=%s""",([user_id]))
    name = cur.fetchall()[0][0]
    message1="We have detected abusive langauge in your content which is against our community guidelines"
    message2="No posts found, try a different tag"
    value = {'data':data,'name':name,'flag':flag,'message1':message1,'message2':message2,'isTags':isTags}
    print(name)
    print(value)
    db.close()
    return value


def home(request,*args,**kwargs):
    if request.method=="POST":
        title=request.POST['title']
        hashtag=request.POST['hashtags']
        description=request.POST['content']
        catg_id=request.POST['catg_id']
        user_id=request.user.id
        categ_id=int(catg_id)
        if get_toxicity_score(description)>=0.4 or get_toxicity_score(title)>=0.4:
            value = db_to_post(1,request.user.id,1,0)
            return render(request,'home.html',value)    
        else:
            post_to_db(title,hashtag,description,user_id,categ_id)
    categ_id = 1
    value = db_to_post(categ_id,request.user.id,0,0)
    return render(request,'home.html',value)


def answer(request,id,*args,**kwargs):
    
    db = mysql.connector.connect(host="localhost",user="root",password="1234",database = "cca_db")
    cur = db.cursor()

    if request.method=="POST":
        content = request.POST['content']
        user_id = request.user.id
        cur.execute("""insert into answer(content,ans_like,ans_dislike,post_id,user_id) values(%s,%s,%s,%s,%s)""",(content,0,0,id,user_id))
        db.commit()

    cur.execute("""select post_id,title,description,SUBSTR(post_dt,1,10) as date,user_name,post_like,post_dislike from post,user where post_id=%s and post.user_id=user.user_id""",([id]))
    question = cur.fetchall()
    # print("question",question)

    cur.execute("""select ans_id,content,ans_like,ans_dislike,SUBSTR(answer.post_dt,1,10) as date,user_name from user,answer where answer.post_id=%s and answer.user_id=user.user_id order by answer.post_dt desc""",([id]))
    answer = cur.fetchall()
    # print("Answer",answer)

    cur.execute(""" select reply_id,reply.ans_id,user.user_name,reply.content,reply_like,reply_dislike,SUBSTR(reply.post_dt,1,10) from reply,post,answer,user where reply.ans_id=answer.ans_id and answer.post_id=post.post_id and reply.user_id=user.user_id and post.post_id=%s """,([id]))
    reply = cur.fetchall()
    # print("reply",reply)

    cur.execute("""select user_name from user where user_id=%s""",([request.user.id]))
    user_name = cur.fetchall()[0][0]

    data = {
        'user_name':user_name,
        'id':question[0][0],'title':question[0][1],'description':question[0][2],
        'like':question[0][5],'dislike':question[0][6],'date':question[0][3],
        'name':question[0][4],'count':len(answer),'answer':answer,'reply':reply
    }
    # print(answer)
    # print(reply)
    db.close()
    # print(data)
    return render(request,'answer.html',data)

def replyPost(request,id,*args,**kwargs):
    reply_content=request.POST['replyContent']
    post_id = request.POST['postID']
    ans_id = id 
    user_id = request.user.id

    db = mysql.connector.connect(host="localhost",user="root",password="1234",database = "cca_db")
    cur = db.cursor()

    cur.execute("insert into reply(content,reply_like,reply_dislike,ans_id,user_id) values(%s,0,0,%s,%s)",(reply_content,ans_id,user_id))
    db.commit()
    db.close()

    print(reply_content,post_id,ans_id)
    request.method = "GET"
    return answer(request,post_id)



def interview_experience(request,*args,**kwargs):
    if request.method=="POST":
        title=request.POST['title']
        hashtag=request.POST['hashtags']
        description=request.POST['content']
        catg_id=request.POST['catg_id']
        user_id=request.user.id
        categ_id=int(catg_id)
        if get_toxicity_score(description)>=0.4 or get_toxicity_score(title)>=0.4:
            value = db_to_post(2,request.user.id,1,0)
            return render(request,'interview_experience.html',value)    
        else:
            post_to_db(title,hashtag,description,user_id,categ_id)

    categ_id = 2
    value = db_to_post(categ_id,request.user.id,0,0)
    return render(request,'interview_experience.html',value)


def placement_help(request,*args,**kwargs):
    if request.method=="POST":
        title=request.POST['title']
        hashtag=request.POST['hashtags']
        description=request.POST['content']
        catg_id=request.POST['catg_id']
        user_id=request.user.id
        categ_id=int(catg_id)
        if get_toxicity_score(description)>=0.4 or get_toxicity_score(title)>=0.4:
            value = db_to_post(3,request.user.id,1,0)
            return render(request,'placement_help.html',value)    
        else:
            post_to_db(title,hashtag,description,user_id,categ_id)
    
    categ_id = 3
    value = db_to_post(categ_id,request.user.id,0,0)
    return render(request,'placement_help.html',value)


def announcements(request,*args,**kwargs):
    if request.method=="POST":
        title=request.POST['title']
        hashtag=request.POST['hashtags']
        description=request.POST['content']
        catg_id=request.POST['catg_id']
        user_id=request.user.id
        categ_id=int(catg_id)
        if get_toxicity_score(description)>=0.4 or get_toxicity_score(title)>=0.4:
            value = db_to_post(4,request.user.id,1,0)
            return render(request,'announcement.html',value)    
        else:
            post_to_db(title,hashtag,description,user_id,categ_id)
    
    categ_id = 4
    value = db_to_post(categ_id,request.user.id,0,0)
    return render(request,'announcement.html',value)


def login(request,*args,**kwargs):
    if request.method=="POST":
            email=request.POST['email']
            password=request.POST['password']
            user=auth.authenticate(username=email,password=password)
            print(email,password)
            if user is not None: #if user id and password is same
                auth.login(request,user)
                return redirect('home')
            else:
                messages.info(request,'invalid credentials')
                return render(request,"login.html")   
    return render(request,'login.html')


def signup(request,*args,**kwargs):
    if(request.method == 'POST'):
        username=request.POST['username'] #gets value from the frontend 
        password=request.POST['password']
        email=request.POST['email']
        college=request.POST['college']
        print(username,password,email,college)
        if User.objects.filter(username=email).exists(): #checks if the user requests
             messages.info(request,'Email Already Registered')
             return render(request,'signup.html')  #redirects the register page again
        else:
            user = User.objects.create_user(username=email, password=password)
            user.save() #its saves the users id and password in the databasse
            db = mysql.connector.connect(host="localhost",user="root",password="1234",database = "cca_db")

            cur = db.cursor()
            cur.execute("select id from auth_user order by id")
            s=cur.fetchall()
            userid=s[-1][0]
            print(userid)
            cur.execute("insert into user(user_id,user_name,college,email) values(%s,%s,%s,%s)",(userid,username,college,email))
            db.commit()
            db.close()
            return render(request,'login.html')
    return render(request,'signup.html')  


def profile(request,*args,**kwargs):
    db = mysql.connector.connect(host="localhost",user="root",password="1234",database = "cca_db")

    cur = db.cursor()

    user_id=request.user.id
    cur.execute("select name,branch,about,count(*),user_name from user,post where user.user_id=%s and user.user_id=post.user_id group by user.user_id",([user_id]))
    user_details = cur.fetchall()[0]
    
    cur.execute("select count(*) from answer where user_id=%s group by user_id;",([user_id]))
    try:
        ans_count = cur.fetchall()[0][0]
    except:
        ans_count = 0
    
    cur.execute("""select COUNT(*),answer.post_id as count from answer,post where answer.post_id=post.post_id and post.user_id =%s GROUP BY answer.post_id""",([user_id]))
    count_data = cur.fetchall()
    count = {}
    for x,y in count_data:
        count[y] = x
    cur.execute("""select post_id,title,SUBSTR(description,1,100) as description,post_like,SUBSTR(post_dt,1,10) as date,user_name from post,user where post.user_id=%s and post.user_id=user.user_id""",([user_id]))
    temp = cur.fetchall() 
    data = []
    for x in temp:
        id = x[0]
        if id in count.keys():
            x +=(count[id],)
        else:
            x = x+(0,)
        data.append(x)
    post_data = data

    cur.execute("""select post.post_id,post.title,SUBSTR(post.description,1,100) as description,post.post_like,SUBSTR(post.post_dt,1,10) as date,count(*) from post,answer where answer.user_id=%s and post.post_id=answer.post_id group by post.post_id""",([user_id]))
    answer_data = cur.fetchall()

    db.close()

    value = {'user_name':user_details[4],'name':user_details[0],'branch':user_details[1],'about':user_details[2],'post_count':user_details[3],'ans_count':ans_count,'post':post_data,'answer':answer_data}
    return render(request,'profile.html',value)
    
def update_user(name,gender,college,branch,location,birthday,about,user_id):
    db = mysql.connector.connect(host="localhost",user="root",password="1234",database = "cca_db")

    cur = db.cursor()
    cur.execute("update user set name=%s,gender=%s,college=%s, branch=%s ,location=%s,dob=%s,about=%s where user_id=%s",(name,gender,college,branch,location,birthday,about,user_id,))
    db.commit()
    db.close()

def changepass(request,*args,**kwargs):
    
    db = mysql.connector.connect(host="localhost",user="root",password="1234",database = "cca_db")

    cur = db.cursor()
    cur.execute("select user_name from user where user_id=%s",(request.user.id,))
    s=cur.fetchall()[0]
    db.close()

    my_dict = { 'name':s[0]}

    return render(request,'changepass.html',my_dict)

def editprofile(request,*args,**kwargs):
    if request.method=="POST":
        name=request.POST['name'] #gets value from the frontend 
        gender=request.POST['gender']
        college=request.POST['college']
        branch=request.POST['branch']
        location=request.POST['location']
        birthday=request.POST['birthday']
        about=request.POST['about']
        if(gender=='1'):
            gender="male"
        elif gender=='2':
            gender="female"
        else:
            gender="male"
        update_user(name,gender,college,branch,location,birthday,about,request.user.id)
        return redirect('profile') 
    db = mysql.connector.connect(host="localhost",user="root",password="1234",database = "cca_db")

    cur = db.cursor()
    cur.execute("select * from user where user_id=%s",(request.user.id,))
    s=cur.fetchall()[0]
    db.close()
    print(s)
    my_dicti={
            'name':s[1],
            'email':s[3],
            'gender':s[4],
            'college':s[5],
            'depart':s[6],
            'city':s[10],
            'date':str(s[11]),
            'about':s[12]
    }
    
    print(my_dicti,str(s[11]))
    return render(request,'editprofile.html',my_dicti)

def editacc(request,*args,**kwargs):
    db = mysql.connector.connect(host="localhost",user="root",password="1234",database = "cca_db")
    cur = db.cursor()
    
    if request.method=="POST":
        name=request.POST['name'] 
        email=request.POST['email']

        cur.execute("update user set user_name=%s,email=%s where user_id=%s",(name,email,request.user.id))
        db.commit()
        db.close()
    
        return redirect('profile') 

    cur.execute("select name,user_name,email from user where user_id=%s",(request.user.id,))
    s=cur.fetchall()[0]
    db.close()

    my_dict = {
        'name' : s[0],
        'user_name' : s[1],
        'email' : s[2]
    }

    return render(request,'editacc.html',my_dict)

def update_socials(linkdin,github,facebook,leetcode,user_id):
    db = mysql.connector.connect(host="localhost",user="root",password="1234",database = "cca_db")

    cur = db.cursor()
    cur.execute("select user_id from social_links")
    s=cur.fetchall()
    ll=[]
    for it in s:
        ll.append(it[0])
    if user_id in ll:
        cur.execute("update social_links set linkedin=%s,github=%s,facebook=%s,leetcode=%s where user_id=%s",(linkdin,github,facebook,leetcode,user_id,))
    else:
        cur.execute("insert into social_links(user_id,linkedin,github,facebook,leetcode) values(%s,%s,%s,%s,%s)",(user_id,linkdin,github,facebook,leetcode,))
    db.commit()
    db.close()

def editsocials(request,*args,**kwargs):
    if request.method=="POST":
        linkdin=request.POST['linkdin'] #gets value from the frontend 
        github=request.POST['github']
        facebook=request.POST['facebook']
        leetcode=request.POST['leetcode']
        update_socials(linkdin,github,facebook,leetcode,request.user.id)
        return redirect('profile') 
    db = mysql.connector.connect(host="localhost",user="root",password="1234",database = "cca_db")

    my_dicti={}
    cur = db.cursor()
    cur.execute("select user.user_id,linkedin,github,facebook,leetcode,name,user_name from social_links,user where user.user_id=social_links.user_id and user.user_id=%s",(request.user.id,))
    try:
        s=cur.fetchall()[0]
    
        my_dicti={
                'name':s[5],
                'user_name':s[6],
                'linkdin':s[1],
                'github':s[2],
                'facebook':s[3],
                'leetcode':s[4]
        }
    except : 
        pass
    db.close()
    return render(request,'editsocials.html',my_dicti)


def likeHandling(request,content,content_id,like,*args,**kwargs):
    db = mysql.connector.connect(host="localhost",user="root",password="1234",database = "cca_db")
    cur = db.cursor()
    
    if content=="Post":
        cur.execute("update post set post_like=%s where post_id=%s",(int(like),content_id))
    else :
        cur.execute("update answer set ans_like=%s where ans_id=%s",(int(like),content_id))

    db.commit()
    db.close()

    return HttpResponse('success')
def dbtags_to_post(categ_id,user_id,flag,tag):
    db = mysql.connector.connect(host="localhost",user="root",password="1234",database = "cca_db")

    cur = db.cursor()
    cur.execute("""select tag_id from tag where tag_name=%s""",([tag]))
    tag_id=cur.fetchall()
    print(tag_id)
    if tag_id==[]:
        return db_to_post(categ_id,user_id,0,1)
    else:
        tag_id=tag_id[0][0]
        cur.execute("""select post_id from question_tag where tag_id=%s""",([tag_id]))
        temp=cur.fetchall()
        post_id=[]
        for it in temp:
            post_id.append(it[0])
    cur.execute("""select COUNT(*),answer.post_id as count from answer,post where answer.post_id=post.post_id and post.categ_id=%s GROUP BY answer.post_id""",([categ_id]))
    count_data = cur.fetchall()
    count = {}
    for x,y in count_data:
        count[y] = x
    print(count_data)
    cur.execute("""select post_id,title,SUBSTR(description,1,100) as description,post_like,SUBSTR(post_dt,1,10) as date,user_name from post,user where post.categ_id=%s and post.user_id=user.user_id""",([categ_id]))
    temp = cur.fetchall() 
    data = []
    for x in temp:
        id = x[0]
        print(id)
        if id in post_id:
            if id in count.keys():
                x +=(count[id],)
            else:
                x = x+(0,)
            data.append(x)
    
    cur.execute("""select user_name from user where user_id=%s""",([user_id]))
    name = cur.fetchall()[0][0]
    message="We have detected abusive langauge in your content which is against our community guidelines"
    value = {'data':data,'name':name,'flag':flag,'message':message,'isTags':0}
   
    db.close()
    return value
def searchHome(request):
    if request.method=="POST":
        tagSearch=request.POST['tagSearch']
        value=dbtags_to_post(1,request.user.id,0,tagSearch)
        return render(request,'home.html',value)
    return redirect('home')

def searchAnnouncement(request):
    if request.method=="POST":
        tagSearch=request.POST['tagSearch']
        value=dbtags_to_post(4,request.user.id,0,tagSearch)
        return render(request,'announcement.html',value)
    return redirect('announcement')

def searchInterview(request):
    if request.method=="POST":
        tagSearch=request.POST['tagSearch']
        value=dbtags_to_post(2,request.user.id,0,tagSearch)
        return render(request,'interview_experience.html',value)
    return redirect('interview_experience')

def searchPlacement(request):
    if request.method=="POST":
        tagSearch=request.POST['tagSearch']
        value=dbtags_to_post(3,request.user.id,0,tagSearch)
        return render(request,'placement_help.html',value)
    return redirect('placement_help')

def faq(request,*args,**kwargs):

    db = mysql.connector.connect(host="localhost",user="root",password="1234",database = "cca_db")

    cur = db.cursor()
    cur.execute("""select user_name from user where user_id=%s""",([request.user.id]))
    name = cur.fetchall()[0][0]
    db.close()
    return render(request,'faq.html',{'name':name})

