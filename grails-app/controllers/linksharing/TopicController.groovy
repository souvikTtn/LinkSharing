package linksharing

class TopicController {
    def userService = new UserService()

    def create(){

    }

    def save(Topic topic) {
        User user = session["user"]
        topic.user = user

        if (topic.validate()) {
            topic.save()
            Subscription subs = new Subscription(topic: topic, user: user, seriousness: Seriousness.SERIOUS)
            if (subs.validate()) {
                subs.save()
            }

            flash.message = "topic created succesfully"

        } else {
            flash.topic=topic;
        }

        redirect(action: "create")
    }

    def topicShow(String tid) {
        Topic topic = Topic.findById(tid)
        List<User> topicUsers = Subscription.createCriteria().list {
            projections {
                property 'user'
            }
            eq('topic', topic)
        }


        List<Resource> topicResources = Resource.findAllByTopic(topic)

        boolean showToSubscribe = false
        if (session["user"]) {
            User user = session["user"]
            int count = Subscription.countByTopicAndUser(topic, user)
            if (count == 0) {
                showToSubscribe = true
            }
            if (user.id == topic.user.id) {
                showToSubscribe = false
            }

        }


        [topic: topic, topicUsers: topicUsers, topicResources: topicResources, showToSubscribe: showToSubscribe]


    }

    def deleteTopic(String tid) {
        // throwing refrential integrity exception by database
//        int status=Topic.executeUpdate("delete Topic as topic where topic.id=:tid",[tid:tid.toLong()] )
//        if(status!=0){
//            redirect( controller: "home",action: "dashboard")
//        }else {
//             render "failure"
//        }

        Topic topic = Topic.findById(tid)
        topic.delete(flush: true, failOnError: true)
        render "success"


    }

    def editTopic(String tid, String topicName) {

        int status = Topic.executeUpdate("update Topic as topic set topic.name =:topicName where topic.id=:tid", [topicName: topicName, tid: tid.toLong()])
        if (status != 0) {
            render "success"
        } else {
            render "failure"
        }


    }

    def changeVisibility(String tid) {

        println params
        Visibility visibility = params["visibility"];

        int status = Topic.executeUpdate("update Topic as topic set topic.visibility=:visibility  where topic.id=:tid", [visibility: visibility, tid: tid.toLong()])
        if (status != 0) {
            render "success visibility changed"
        } else {
            render "failure in changing visibility"
        }


    }






}
