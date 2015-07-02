package linksharing

class HomeController {


    def index() {
        if (session["user"]) {
            redirect(action: "dashboard")
        } else {
            redirect(controller: "Login", action: "index")
        }
    }

    def dashboard() {
        //current user
        User user = session["user"]

        //user subscriptions
        List<Subscription> usersubscriptions = Subscription.findAllByUser(user);
        Integer totalUserSubscription=Subscription.countByUser(user);
        //user created topic
        List<Topic> usertopics = Topic.findAllByUser(user)
        Integer totalUserCreatedTopic= Topic.countByUser(user)

        //top 5 subscription as per recently added topic in it
        List<Topic> subscriptionsTop5Topic = Subscription.createCriteria().list{
            projections{
                property('topic')
            }
            eq('user',user)
            'topic'{
                'resources'{
                    order('lastUpdated','desc')
                }

            }
            maxResults(5)

        }

        // trending topics
        def a = Resource.createCriteria().list(max: 3, offset: 0) {
            projections {
                groupProperty('topic')
                rowCount("a")

            }

            'topic' {
                eq('visibility', Visibility.PUBLIC)


            }

            order("a", "desc")
        }



        List<Topic> trendingTopics = a.collect { it.first() }
        println "trendingTopics ${trendingTopics}"
        println "hello"

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


        [user: user,totalUserSubscription:totalUserSubscription, totalUserCreatedTopic:totalUserCreatedTopic,usersubscriptions: usersubscriptions, usertopics: usertopics, subscriptionsTop5Topic: subscriptionsTop5Topic, inboxlist: inboxlist, total: inboxlist.totalCount, tredingTopics: trendingTopics]
    }

}
