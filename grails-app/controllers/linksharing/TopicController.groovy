package linksharing

class TopicController {
    def userService = new UserService()

    def createTopic(Topic topic) {
        User user = session["user"]
        topic.user = user

        if (topic.validate()) {
            topic.save()
            Subscription subs = new Subscription(topic: topic, user: user, seriousness: Seriousness.SERIOUS)
            if (subs.validate()) {
                subs.save()
            }

            flash.message = "topic created succesfully"
            render(view: "/home/_createTopic")
        } else {
            render topic.errors
        }
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


}
