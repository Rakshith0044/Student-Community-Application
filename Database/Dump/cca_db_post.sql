CREATE DATABASE  IF NOT EXISTS `cca_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `cca_db`;
-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: cca_db
-- ------------------------------------------------------
-- Server version	8.0.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post` (
  `post_id` int NOT NULL AUTO_INCREMENT,
  `title` tinytext,
  `description` text,
  `post_like` int DEFAULT NULL,
  `post_dislike` int DEFAULT NULL,
  `pic` blob,
  `post_dt` datetime DEFAULT CURRENT_TIMESTAMP,
  `categ_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`post_id`),
  KEY `categ_id` (`categ_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `post_ibfk_1` FOREIGN KEY (`categ_id`) REFERENCES `category` (`categ_id`),
  CONSTRAINT `post_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (14,'How to join a club ?','I am fresher in cmrit,can anyone guide us on how to join clubs here',0,0,NULL,'2022-12-17 14:46:14',1,1),(35,'Game Of Codes  ||  HackerEarth  ||  Event ','Code and conquer!!!!\n\n\nMany noble geeks wage war against each other in order to gain control over the mythical land of Codearth. Join the clan and take control over the Codearth with your tactics and code.\nRules for the war-\n1) individual participation\n2) the fastest geek wins\n3) duration is 1 hr\n4) Blades(laptops) can be brought or Swords(lab systems) ll be provided.\n5) Titles (certificates) will be awarded.\n\n\n• Venue: CSE Lab 502\n• Date of event: 13.07.2022\n• Time of the event: 1PM to 2PM\n• Duration: 1hr\n\nRegistration link: https://forms.gle/dDhnFaCoAb56rV3A6\n\nFollow us here:https://instagram.com/hehubcmr?igshid=YmMyMTA2M2Y=\n\n• WhatsApp group:  https://chat.whatsapp.com/GOntVNHRh4jFcX3UutvWE3\n\nContact:\n• Nalin: +91 7838924336\n• Rakshith: +91 9606852844\n\nRegards\nHackerearth 9team',0,0,NULL,'2022-12-21 16:34:02',4,3),(36,'TECHNOBUG?   ||  HackerEarth  ||  Event ','Have you ever thought how important is the process of debugging a code? \r\nDebugging is the process of finding and fixing errors. It also help reduces unnecessary & intrusive details. Which makes the software development process easier. Interesting right!!? .\r\nSo what\'s the wait for?! Brushup your basics and register with the link below to join us in the fun-filled event.?‍?.\r\n\r\nTheme: Java\r\nVenue: CSE dept Room(505)  \r\nLink for Registration: https://forms.gle/UByicZzCMB3HeqHSA  \r\nGroup link: https://chat.whatsapp.com/KT09fJeIaDNIAoxJcbxh7K  \r\nFor any queries  contact us:   \r\nKeerthi A: 9945938789   \r\nShiva Baidya: 7892602770',0,0,NULL,'2022-12-21 16:37:41',4,3),(37,'Ctrl+Intelligent ||  HackerEarth  ||  Event','Attention techies! ?‍?\r\n\r\nHackerearth brings to you a fun coding event Ctrl + Intelligent !!!?‍?? Want to test your coding intelligence and improve your coding skills? Ctrl + Intelligent is all about that!? It\'s a fun and exciting event which would require you to crack interesting codes within a time limit.So get ready to feel tech savy, the clock is ticking and can you crack the code before the timer runs out? ⏱? Win places and update your resume with our competitions .\r\nWhat are you waiting for? Join us on 27/04/2022 and Register now! ☑️\r\n> Certificates will be issued.\r\n>  Easy problems, easy solutions\r\n> Please get your own laptops\r\n\r\n• Date & Time of the event: 27/04/2022 - 1PM to 2PM\r\n• Venue: lab 504 CSE \r\n• Registration form: https://forms.gle/NWJgTvaJLe9RNU4z5\r\n• WhatsApp group: https://chat.whatsapp.com/EzgwcOu0xoA1j8VjBUhsLH\r\nContact:\r\n   • Nalin: 7838924336\r\n   • Rakshith: 9606852844',0,0,NULL,'2022-12-21 17:06:36',4,3),(38,'Answer the Unanswerable  || HackerEarth || Event','Hackerearth CMRIT presents:\r\nAnswer the Unanswerable.\r\n\r\nWhat\'s up genius?\r\nThink you are bright headed to solve just ONE QUESTION?\r\nYes, you read that right, just ONE QUESTION.\r\nAs you figured, it won\'t be the easiest of questions but it\'s not the most difficult either. \r\nDefinitely a coding question. You have 45 mins to solve it. Give it your best shot. The top two solutions will be given certificates.\r\n> Try getting your own laptops for the event.\r\n> Give us the logic of the solution at the least and we will consider.\r\n\r\n• Date & Time of the event: 26/05/2022 - 12.40PM to 1.40PM\r\n• Venue: 503 CSE \r\n• Registration form: https://forms.gle/vEnfBtiZAFjeDALQ8\r\n• WhatsApp group: https://chat.whatsapp.com/I5WEU89M5toC1y34yuEu7E\r\nContact:\r\n   • Nalin: 7838924336\r\n   • Rakshith: 9606852844\r\n\r\nOur Instagram Page: https://instagram.com/hehubcmr?utm_medium=copy_link',0,0,NULL,'2022-12-21 17:08:38',4,3),(39,'Answer the Unanswerable  || HackerEarth || Event','Hackerearth CMRIT presents:\r\nAnswer the Unanswerable.\r\n\r\nWhat\'s up genius?\r\nThink you are bright headed to solve just ONE QUESTION?\r\nYes, you read that right, just ONE QUESTION.\r\nAs you figured, it won\'t be the easiest of questions but it\'s not the most difficult either. \r\nDefinitely a coding question. You have 45 mins to solve it. Give it your best shot. The top two solutions will be given certificates.\r\n> Try getting your own laptops for the event.\r\n> Give us the logic of the solution at the least and we will consider.\r\n\r\n• Date & Time of the event: 26/05/2022 - 12.40PM to 1.40PM\r\n• Venue: 503 CSE \r\n• Registration form: https://forms.gle/vEnfBtiZAFjeDALQ8\r\n• WhatsApp group: https://chat.whatsapp.com/I5WEU89M5toC1y34yuEu7E\r\nContact:\r\n   • Nalin: 7838924336\r\n   • Rakshith: 9606852844\r\n\r\nOur Instagram Page: https://instagram.com/hehubcmr?utm_medium=copy_link',0,0,NULL,'2022-12-21 17:08:45',4,3),(40,'Amadeus ||  2023','Round 1 : OA(cooding+mcq)\r\n\r\nRound 2 : Technical + hr\r\nOops: \r\nWhat is Oops and its pillar ?\r\nImplement polymorphism(Function Overloading,  Function Overriding), More questions on inheritance and polymorphism based on implementation.\r\nImplement a class for MakeMyTrip website.?\r\n\r\nDbms:  \r\nNormalization and its forms\r\n\r\nOS:  \r\nMulti-Threading\r\nMultiprocessing OS,\r\nexample of OS.\r\n\r\nImplement Tree from scratch from the given arrays.\r\n\r\nRelated project.\r\n\r\nWhat if two people are booking the same ticket and how to handle it?.\r\nWhile searching for a flight how the different airline data are rendered ?',0,0,NULL,'2022-12-21 23:11:10',2,1),(41,'Can anyone share Ellucian interview experience ?','Can anyone share Ellucian interview experience ?\r\nThe company will be visiting with in a week.',0,0,NULL,'2022-12-21 23:21:23',2,1),(42,'Need help - regarding aptitude preparation for on campus placements','I am currently pursuing final year CSE and placements are around the corner.\r\nFound many resources and links to prepare for coding and CS Fundamentals, but I could hardly find any posts about what to prepare and how to prepare for aptitude questions.\r\n\r\nCan someone kindly help me with some good resources and study guide for aptitude preparation.',0,0,NULL,'2022-12-21 23:28:23',3,1),(43,'Study Guide & Interview Preparation Using LEETCODE','Hello LeetCoders !!!\r\n\r\nI have designed a 6 to 9 months study plan & 3 months interview preparation plan to crack Top MNC\'S Companies coding round & interviews in your interview process or placement drives.\r\n\r\n\"Practice More Learn More\"\r\nPlan to Learn DS Concepts With LeetCode:\r\nI have compiled some important topics which are very important in our interview process to learn below useful concepts.\r\n\r\nArrays\r\nStrings\r\nLinkedList\r\nStack & Queue\r\nRecursion\r\nBacktracking\r\nDynamic Programming\r\nGraphs\r\nTrees\r\nHeaps\r\nTrie Data Structure\r\n\r\nThe LeetCode link for the problems Set:- https://leetcode.com/problemset/all/\r\nApply tags according to topics which you want to practice.\r\n\r\nComplete 20 to 25 problems on each of these topics or concepts.\r\nEasy Problems: 6 to 8\r\nMedium Problems: 12 to 15\r\nHard Problems: 4 to 5\r\n\r\nSome Tips:\r\nDon\'t use Google / Youtube / Discuss on LeetCode for Solution if you are stuck any problem, follow my plan:\r\nTry to solve the problem yourself at least 5 times\r\nIf you are still not able to solve the problem then as a hint 2 to 3 lines of code from the discuss part of LeetCode & try again.\r\nIf you are still not able to solve the problem then see the next 3 lines of code from the discuss part of LeetCode & follow these.\r\nIf you are weak at any topic then you are practicing 30 questions on that topic.\r\nYou should also practice MCQ questions (Multiple Choice Questions) on a daily basis for 15 minutes on the following topics:\r\nData Structure & Algorithms\r\nDBMS (Database Management System)\r\nOS (Operating System)\r\nLogical Reasoning\r\nYou should practice at least 3 hours per day in LeetCode problems.\r\nYou should practice problems to learn DS concepts with <= 55% acceptance rate & avoid doing such problems where unlike ratio is larger than like ratio.\r\nYou should practice the same problem until the submission of your solution is >= 80% faster than online submissions for any problem.\r\n\r\nRevision Plan to Crack Top MNC\'s Company Interviews:\r\nThe LeetCode link for the Interview problems: https://leetcode.com/explore/interview/\r\n\r\nThe first & half months Plan:\r\nComplete Easy Collections of Top Interview Questions\r\nLink: https://leetcode.com/explore/interview/card/top-interview-questions-easy/\r\nTry to solve each problem in 5 to 10 minutes\r\nBest Time: 5 minutes\r\n3 Days Task\r\nComplete Medium Collections of Top Interview Questions\r\nLink: https://leetcode.com/explore/interview/card/top-interview-questions-medium/\r\nTry to solve each problem in 15 to 20 minutes\r\nBest Time: 15 minutes\r\n15 Days Task\r\nComplete Hard Collections of Top Interview Questions\r\nLink: https://leetcode.com/explore/interview/card/top-interview-questions-hard/\r\nTry to solve each problem in 25 to 30 minutes\r\nBest Time: 25 minutes\r\n25 Days Task\r\nThe next first & half months Plan:\r\nComplete Top Interview Questions on the Top Hits of LeetCode\r\nLink: https://leetcode.com/problemset/top-interview-questions/\r\nMixture of Easy, Medium & Hard Interview Problems\r\nComplete Top 100 Liked Questions on the Top Hits of LeetCode\r\nLink: https://leetcode.com/problemset/top-100-liked-questions/\r\nMixture of Easy, Medium & Hard Problems\r\nSome Tips:\r\nYou should practice the revision plan as a live coding round which is time bound, that is you have to try to complete the solution in the same amount of time which will be given to you in your real test.\r\nKeep practicing until you are able to complete the solution in the given amount of time.\r\nLeetCode Contest (Live Coding Round):\r\nOn the weekend, you should participate in the Biweekly & Weekly LeetCode Contest because it helps to complete 4 questions in 1:30 hours which are very important aspects according to the online coding round in your interview process.\r\n\r\nLOVE CODING :)\r\nHAPPY CODING :)\r\nHAPPY LEARNING :)',0,0,NULL,'2022-12-21 23:31:09',3,1),(44,'How to Improve Your Placement Strategy for this Upcoming Placement Season?','1. Resume \r\nA Resume is a fundamental requirement for the interview process and consequently the first step for placement preparations. It is basically your first impression for possible recruiters as it displays your educational qualifications, abilities, skills, projects, etc. \r\n\r\nTo succeed in today’s job market, you have to think of your resume as an advertisement targeted towards your future boss. \r\n\r\nSo craft a well-formatted resume well before the placements start as it may increase your chances of being shortlisted much more than a haphazardly put-together resume. \r\n\r\n2. Personality Development\r\nDeveloping a personality is very important if you are thinking of appearing for an interview. Every career line requires compelling and dynamic employees who wish to take challenges and are outspoken. Therefore, do work properly on certain things before going for an interview such as communications skills, corporate behavior, formal dialect, etc. Keeping these things will definitely help you and help you impress your interviewer.\r\n\r\n3. Connect with Alumni\r\nConnecting with seniors is the best thing you can do as it provides you with the background of the complete placement process. They can tell you properly about the whole process in detail because they have been part of it and know everything very well. Along with this, your seniors can also help you with some golden tips which you can prepare before going for an interview. \r\n\r\n4. Research About Companies\r\nWe get various companies during campus placement sessions and try to sit in every company’s interview. Although it is a good thing, if you sit in an interview without researching the company then it can be a disaster for you. Therefore, it is vital that you go through the company profile, their work, working environment, etc so that you can ace that in a go. \r\n\r\n5. Aptitude Test \r\nAn Aptitude Test is the first hurdle to clear in most of the campus placement scenarios. It can consist of Communication Skills, Logical Reasoning, Quantitative Ability as well as Domain Knowledge and is normally used to eliminate multiple candidates in the beginning stages. To clear the Aptitude Test, practice online tests and mock question papers within a stipulated time frame. It is also very important to practice the previous aptitude tests set up by your target company as they familiarize you with the test pattern. In general, work on your speed and accuracy as that is mostly the focus of Aptitude Tests. \r\n\r\n6. Technical Interview \r\nYour Technical Interview can make or break your chances of getting the job. They mainly test your technical knowledge as well as your problem-solving skills. That is the reason why Data Structures and Algorithms are so heavily emphasized in technical interviews (They demonstrate your problem-solving ability and analytical skills). To prepare for technical interviews, it is very important to study Data Structures and Algorithms in depth. In addition to that, coding challenges are helpful in inculcating analytical and logical skills. Also, it is always a good idea to brush up on the technical details of your internships and projects as they may be asked in the interview. \r\n\r\n7. HR Interview \r\nThe HR interview is generally the last round in the recruitment process of any company, and it is used to judge your personality, your strengths, and your weaknesses and to understand if you’re the right fit for this job. So it is important to thoroughly understand the job position you are applying for before the HR interview. It is also important to prepare for well-known HR questions such as Tell me about yourself, What are your strengths and weaknesses? etc. In addition to that, it is important to thoroughly read your resume and prepare for any possible questions that may be asked. ',0,0,NULL,'2022-12-21 23:34:00',3,NULL),(45,'How to Improve Your Placement Strategy for this Upcoming Placement Season?','1. Resume \r\nA Resume is a fundamental requirement for the interview process and consequently the first step for placement preparations. It is basically your first impression for possible recruiters as it displays your educational qualifications, abilities, skills, projects, etc. \r\n\r\nTo succeed in today’s job market, you have to think of your resume as an advertisement targeted towards your future boss. \r\n\r\nSo craft a well-formatted resume well before the placements start as it may increase your chances of being shortlisted much more than a haphazardly put-together resume. \r\n\r\n2. Personality Development\r\nDeveloping a personality is very important if you are thinking of appearing for an interview. Every career line requires compelling and dynamic employees who wish to take challenges and are outspoken. Therefore, do work properly on certain things before going for an interview such as communications skills, corporate behavior, formal dialect, etc. Keeping these things will definitely help you and help you impress your interviewer.\r\n\r\n3. Connect with Alumni\r\nConnecting with seniors is the best thing you can do as it provides you with the background of the complete placement process. They can tell you properly about the whole process in detail because they have been part of it and know everything very well. Along with this, your seniors can also help you with some golden tips which you can prepare before going for an interview. \r\n\r\n4. Research About Companies\r\nWe get various companies during campus placement sessions and try to sit in every company’s interview. Although it is a good thing, if you sit in an interview without researching the company then it can be a disaster for you. Therefore, it is vital that you go through the company profile, their work, working environment, etc so that you can ace that in a go. \r\n\r\n5. Aptitude Test \r\nAn Aptitude Test is the first hurdle to clear in most of the campus placement scenarios. It can consist of Communication Skills, Logical Reasoning, Quantitative Ability as well as Domain Knowledge and is normally used to eliminate multiple candidates in the beginning stages. To clear the Aptitude Test, practice online tests and mock question papers within a stipulated time frame. It is also very important to practice the previous aptitude tests set up by your target company as they familiarize you with the test pattern. In general, work on your speed and accuracy as that is mostly the focus of Aptitude Tests. \r\n\r\n6. Technical Interview \r\nYour Technical Interview can make or break your chances of getting the job. They mainly test your technical knowledge as well as your problem-solving skills. That is the reason why Data Structures and Algorithms are so heavily emphasized in technical interviews (They demonstrate your problem-solving ability and analytical skills). To prepare for technical interviews, it is very important to study Data Structures and Algorithms in depth. In addition to that, coding challenges are helpful in inculcating analytical and logical skills. Also, it is always a good idea to brush up on the technical details of your internships and projects as they may be asked in the interview. \r\n\r\n7. HR Interview \r\nThe HR interview is generally the last round in the recruitment process of any company, and it is used to judge your personality, your strengths, and your weaknesses and to understand if you’re the right fit for this job. So it is important to thoroughly understand the job position you are applying for before the HR interview. It is also important to prepare for well-known HR questions such as Tell me about yourself, What are your strengths and weaknesses? etc. In addition to that, it is important to thoroughly read your resume and prepare for any possible questions that may be asked. ',0,0,NULL,'2022-12-21 23:35:18',3,1),(46,'How to begin with Competitive Programming?','At the very beginning to competitive programming, barely anyone knows the coding style to be followed. Below is an example to help you understand how problems are crafted in competitive programming.\r\n\r\n\r\n1. Learn the Preferred Programming Language\r\n2. Learn Data Structures & Algorithms  \r\n3. Start Practicing and Solving Problems\r\n4. Start Participating in Coding Challenges or Contests\r\n5. Stay Consistent with the Process – LEARN, PRACTICE, PARTICIPATE!\r\n',0,0,NULL,'2022-12-21 23:40:57',3,NULL),(47,'How to begin with Competitive Programming?','Let\'s get started:\r\n\r\nLearn the Preferred Programming Language. ...\r\nLearn Data Structures & Algorithms. ...\r\nStart Practicing and Solving Problems. ...\r\nStart Participating in Coding Challenges or Contests. ...\r\nStay Consistent with the Process – LEARN, PRACTICE, PARTICIPATE!',0,0,NULL,'2022-12-21 23:42:18',3,1),(48,'What is the key to crack the campus placements?','1. Prepare Well for the Online Test\r\n2. Improve your Quantitative Abilities and Maintain the Speed vs Accuracy Ratio\r\n3. Improve your Logical Reasoning skills\r\n4. Good Command of the English language\r\n5. Practice Coding Questions Regularly\r\n6. Maintain an Updated LinkedIn Profile\r\n7. Prepare your Resume Well\r\n8. Prepare your Introduction Well\r\n9. Have a Good Knowledge of the Core Fundamental Subjects\r\n10. Ask Relevant Questions to the Interviewer\r\n\r\n\r\n',0,0,NULL,'2022-12-21 23:45:46',3,1),(49,'SUREWAVES || 2023 ','Round 1:\r\nAptitude round consists of many sections Quantitative,Logical reasoning,Data interpretation,Technical mcqs,One section was based entirely on\r\nobservational skills.\r\n\r\nWe had 2 technical rounds and 1 hr round.\r\n \r\nIn first technical round questions asked were:\r\nTell me about yourself\r\nQuestions on project\r\nDSA questions - binary search, time complexity analysis, reverse\r\nstring using recursion, find kth largest element in an array\r\nMore questions were asked on OOPs- types of polymorphism along\r\nwith code, difference between abstract class and interface, Singleton\r\nclasses\r\n Why are strings immutable in java and how to make them mutable\r\n Difference between mongoDB and SQL\r\n Questions on DBMS- deadlocks, few sql queries\r\n And a puzzle was asked at the end\r\n In second technical round\r\n They went more in depth in OOPs concept and a dsa question based\r\non subset sum was asked. In the end a puzzle was asked.\r\n Finally in HR interview\r\n General HR questions like tell me about yourself, hobbies, questions\r\non blockchain as I had done a project based on it,Do you have plans\r\nof higher studies, where do you see yourself in few years..\r\n situational based question-\r\n If you and your colleague have a different solution to a problem, your\r\nsolution is the ideal one but everyone agrees with your colleague\'s\r\nsolution.. How would you convince them with your solution.\r\n They also asked me what I would do with my first salary.\r\n\r\nDSA questions - binary search, time\r\ncomplexity analysis, reverse string\r\nusing recursion, find kth largest\r\nelement in an array,\r\n Subset sum\r\n All in Java',0,0,NULL,'2022-12-21 23:51:31',2,1),(50,'Deloitte  ||  7.6 lpa  ||  2023','Round 1:\r\nThe questions asked were very easy and based on Percentage, Average, Profit and Loss, Work and Time, Blood Relations and paragraph based Verbal ability questions.\r\n\r\nGD :\r\nA case study was given on Cindy\'s Kitchen\r\n\r\nHR:\r\nWhy Deloitte \r\nWhere do you see yourself after 5 year \r\nShort term goal\r\nIf not Deloitte then what\r\nHigher study or job\r\n\r\n',0,0,NULL,'2022-12-21 23:54:47',2,NULL),(51,'Deloitte || 7.6 lpa || 2023','Round 1:\r\nThe questions asked were very easy and based on Percentage, Average, Profit and Loss, Work and Time, Blood Relations and paragraph based Verbal ability questions. \r\n\r\nGD :\r\nA case study was given on Cindy\'s Kitchen\r\n\r\nHR :\r\nWhy Deloitte Where do you see yourself after 5 year\r\nShort term goal\r\nIf not Deloitte then what\r\nHigher study or job',0,0,NULL,'2022-12-21 23:56:58',2,1),(52,'GlobalLogic  ||  5.5lpa || 2023','Round 1:\r\nTotal 44 Questions\r\n40-MCQ(Code Snippet\r\n+ Aptitude + Reasoning)\r\n4 Coding Question\r\n\r\nTechnical Round:\r\nCode: Reverse individual Words in a String.\r\nDBMS: Find the 2nd Highest salary from a table(Queries).Rank of the\r\nTable(Queries)\r\nOOPs: All Four pillars of OOPs with its implementation.\r\n\r\nMR:\r\nPuzzles, Discuss about our Project.\r\nDiscuss about your favourite Algorithm in DSA(Any One)',0,0,NULL,'2022-12-21 23:58:44',2,1),(53,'How is CMRIT ?','Hi recently joined cmrit how it is ?',0,0,NULL,'2022-12-22 00:07:49',1,1),(54,'Benefits of Joining a Club in College ?','Any Benefits?',0,0,NULL,'2022-12-22 00:13:08',1,3),(55,'PG/Hostel ?','Hi can any one suggest me that shuld i join pg or hostel ?\r\nHow hostel fees and food ?\r\nAny near by good PGs ?',0,0,NULL,'2022-12-22 00:23:16',1,1),(56,'Parking fees ?','Hi i am fresher ,\r\nShould i pay parking fees ?\r\nMy friends says not to pay',0,0,NULL,'2022-12-22 00:25:29',1,3),(61,'juspay','werty',0,0,NULL,'2023-01-02 10:59:12',2,1);
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-08 18:51:47