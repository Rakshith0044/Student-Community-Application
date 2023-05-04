
const ul=document.getElementById('tags'),

input= ul.querySelector("input");
let tags=[];
function createTag()
{
	ul.querySelectorAll("li").forEach(li =>li.remove());
	tags.slice().reverse().forEach(tag =>
	{
		//console.log(tag)
		let liTag=`<li class="border rounded-4 border-dark p-2 me-1 mb-1 d-flex align-items-center" onclick="remove(this, '${tag}')">${tag}<button type="button" class="btn-close btn-close-width rounded rounded-circle" aria-label="Close"></button></li>`
		ul.insertAdjacentHTML("afterbegin",liTag);
	})
}

function remove(element, tag)
{
	//console.log(element,tag)
	let index  = tags.indexOf(tag);
    tags = [...tags.slice(0, index), ...tags.slice(index + 1)];
    element.remove();
    //console.log(tags)	
}

function addTag(e)
{
	if(e.key=='Enter')
	{
		let tag = e.target.value.replace(/\s+/g, ' ').trim();
		 if(tag.length > 1 && !tags.includes(tag))
		 {
            if(tags.length < 10)
            {
                tag.split(" ").forEach(tag => {
                	if(tag!="" && !tags.includes(tag)){
                		tags.push(tag);
                    //console.log(tags)
                	}
				});
				createTag();
			}
			
		}
		e.target.value="";
		//console.log(tags)
	}
};

input.addEventListener("keyup", addTag);