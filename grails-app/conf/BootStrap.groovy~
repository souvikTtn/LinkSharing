import linksharing.*
import linksharing.scr.groovy.*

class BootStrap {

    def init = { servletContext ->

	createUsers()
	createTopics()
	createResources()
	createReadingItems()
	createRatings()
	createSubcriptions()

    }

  

 void createUsers(){
     User user=new User			(firstName:"ajay",email:"ajay@gmail.com",username:"ajay123",password:"ajay123",passwordConfirm:"ajay123",lastName:"dixit");
      saveObject(user);
    user=new User			(firstName:"umesh",email:"umeshk820@gmail.com",username:"umeshk820",password:"umesh@123",passwordConfirm:"umesh@123",lastName:"kumar");
      
	saveObject(user);
	}
		

void createTopics(){
    
        List users=User.list();
        users.each{user->
              5.times{
                Topic topic=new Topic(name:"Topic ${it+1}" ,visibility:Visibility.PUBLIC )
                user.addToTopic(topic)
                user.addToSubscription(new Subscription(topic:topic,seriousness:Seriousness.SERIOUS))
                saveObject(user);
	
        }

	}
        }



void createResources(){
    
       List topics=Topic.list();
		
       topics.eachWithIndex {  topic,index-> 
	
	User user=User.findById(index%2+1)
  
/*there is error occuring in this section compiler is coplaining about creater can not be null in resource creation but i have passed a user ,even though the same error occuring ,therefor just for temporary avoiding the error  in Resource domain class i have made a constraint on creater that it can be null and blank  
  */  
	topic.addToResource(
		new LinkResource(creater:user, title:"link tittle ${index+1}",description:"link tiitle${index+1}	descripion", url:"https://grails.github.io/grails-doc/link${index+1}"  ) 
		)


        topic.addToResource(	
 		new  DocumentResource(creater:user, title:"document tittle ${index+1}",description:" document tiitle${index+1}descripion", filePath:"//filepath/grails.github.io/grails-doc/link${index+1}"  ) 


	)


      saveObject(topic);	
 

	}
    

	}


void createReadingItems()
{
   
int size=Resource.list().size();	
User.list().each{user->
	Random random=new Random()
	user.addToReadingItem(new ReadingItem(resource:Resource.get(Math.abs(random.nextInt() % size)),isRead:true   ))
	user.addToReadingItem(new ReadingItem(resource:Resource.get(Math.abs(random.nextInt() % size)),isRead:true   ))
	user.addToReadingItem(new ReadingItem(resource:Resource.get(Math.abs(random.nextInt() % size)),isRead:true   ))
	  saveObject(user);	
 
     }

}
	
	
void createRatings(){}

void createSubcriptions(){}

void saveObject(Object object) {
        if (object.hasErrors() || !object.save(flush: true)) {
            object.errors.allErrors.each {
                println "Errror ${it}"
            }
        }
    }


def destroy = {
    }
}

