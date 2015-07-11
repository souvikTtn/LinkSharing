package linksharing
import grails.plugin.mail.MailService
import org.apache.commons.validator.routines.EmailValidator

class HomeController {

 def userService
    def mailService
    def index() {
        if (session["user_id"]) {
            redirect(action: "dashboard")
        } else {
            redirect(controller: "Login", action: "index")
        }
    }

    def dashboard() {

        Integer uid=session["user_id"]

        //current user
        User user = userService.currentUser(uid)

        //user subscriptions
        List<Subscription> usersubscriptions = userService.userSubscriptions(user)
        Integer totalUserSubscription=userService.userSubscriptionsCount(user)

        //user created topic
        List<Topic> usertopics =userService.userTopics(user)
        Integer totalUserCreatedTopic= userService.userTopicsCount(user)

        //top 5 subscription as per recently added topic in it

        List<Topic> subscriptionsTop5Topic= userService.top5SubscribedTopic(user)


        // trending topics

        List<Topic> trendingTopics = userService.trendingTopics();


        //user inbox item
        params.max = params.max ?: 5

        List<Resource> inboxlist = ReadingItem.createCriteria().list(params) {
            projections {
                property 'resource'
            }
            eq('user', user)
            eq('isRead', false)
            'resource' {
                order('lastUpdated', 'desc')
            }
        }

        println trendingTopics*.id
        [user: user,totalUserSubscription:totalUserSubscription, totalUserCreatedTopic:totalUserCreatedTopic,usersubscriptions: usersubscriptions, usertopics: usertopics, subscriptionsTop5Topic: subscriptionsTop5Topic, inboxlist: inboxlist, total: inboxlist.totalCount, tredingTopics: trendingTopics]
    }


    def inboxFilter(){

        params.max = params.max ?: 5
        Integer uid=session["user_id"]
        User user = userService.currentUser(uid)

        List<Resource> inboxlist = ReadingItem.createCriteria().list(params) {
            projections {
                property 'resource'
            }
            eq('user', user)
            eq('isRead', false)
            'resource' {
                order('lastUpdated', 'desc')
            }
        }

        render(template:"userInbox",model:[inboxlist: inboxlist, total: inboxlist.totalCount])

    }





    def invitation(){
        List<Topic> subscribedTopics=[]

        if(params['topicId']){
            Topic topic=Topic.findById(params["topicId"])
            subscribedTopics.add(topic)

        }
        else{
            User user=session["user"]
            subscribedTopics=userService.userSubscribedTopic(user)
        }



        [subscribedTopics:subscribedTopics]



    }

    def invite() {
        User user=session["user"]
        boolean valid=true
        List<String> emails
        emails = params['email'].toString().split(';')


        EmailValidator emailValidator = EmailValidator.getInstance()

        try{
            emails.each { email ->

                if (!emailValidator.isValid(email)) {
                    valid=false
                    throw new Exception()
                }

            }
        }
        catch(Exception e){
            flash.message="Not a Valid Email Id Set..!please Check ie. 'emailid@domain.com;emailid2@domain.com'"
            redirect (controller: 'home',action:'invitation' )
        }

        if(valid) {
            Topic topic = Topic.findById(params['topicId'])
            emails.each { email ->

//                //String key=(topic.id+"^"+email).toString()
//                click the below link..for subscribe
//                http://localhost:8080/linksharing/subscription/permission/?key=${key}

                mailService.sendMail {
                    //  async true
                    to email
                    subject "Invitation"
                    body """ Hi,
                          You are invited by ${user.firstName}  to join this Topic ${topic.name}


                            Thanks

                            Regards
                            LinksharingTeam
                          """
                }

            }
            flash.message = "Invitations Successfully Sends."
            redirect(controller: 'home',action: 'invitation')
        }
    }


}
