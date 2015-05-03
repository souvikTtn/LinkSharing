package linksharing
import linksharing.*;

/*

- Subscription in user dashboard will show the top 5 subscription on the basis of recently added resource in it. (Page 4 of the document)
- Use criteria to show the Inbox to the user.
- User criteria to show the subscribed topics of the user and count of post and subscription of the topic ( Page 7 of the Document)

*/



class TestGorm2Controller {

    def index() { }

    def query1(){
			
		 User u=User.get(1);//Assuming current user
		 List<Subscription> subscriptions =Subscription.findAllByUser(u,[offset:0,max:4,sort:"topic.lastUpdated",order:"desc"])
		render "${subscriptions}"
	}



 def query2() {
		
		/*Inbox creation
strategy first find allready readed resource from readingItem, Second User subscribed topic, third: using this two list in finding user unread resource */	

	     User u=User.get(1);//Assuming current user
		 List<Resource> readedResource=ReadingItem.createCriteria().list(){
						projections{
							property('resource')						
						}
						eq('user',u)
		 }
			//render "${readedResource}"

		def topicSubscribed=Subscription.createCriteria().list{

				projections{
					property('topic')					
				}
				eq('user',u)
		}

			
		//render "<br>${topicSubscribed}"
		
		List<Resource> unreadResource = Resource.createCriteria().list{
			
			    'in'('topic',topicSubscribed)
				not{
					'in'('id',readedResource.collect{it.id})					
				}
		}
			
		render "<br><br>${unreadResource}"
                 

	}


		
	def query3() {

		User u=User.get(1);//Assuming current user
		// user Subscribed topic
		def topicSubscribed=Subscription.createCriteria().list{

				projections{
				property('topic')
				
				}
				eq('user',u)
		}


		render "<br>${topicSubscribed}"
		
		//Total count of Resource for each Topic		
		
	List<Resource> unreadResource =Resource.createCriteria().list{
			         projections{
						groupProperty('topic')
						rowCount()					
					}
				'in'('topic',topicSubscribed)	
			}
			
		 render "<br><br>${unreadResource}"
                 
		//total number of subscription for each topic
		
	  def  countForEachTopicSubs =Subscription.createCriteria().list{
			         projections{
						groupProperty('topic')
						rowCount()					
					}
				'in'('topic',topicSubscribed)	
			}
			
		render "<br><br>${countForEachTopicSubs}"
	



	}		

							

}//end of Controller block



