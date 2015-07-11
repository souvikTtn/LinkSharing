package linksharing

import grails.converters.*

class SubscriptionController {
    def userService

    def changeSeriousness(String tid) {
        println params

        String user_id = session["user_id"];
        Seriousness seriousness = params.seriousness
        int status = Subscription.executeUpdate("update Subscription as subs set subs.seriousness=:seriousness where subs.user.id=:uid and subs.topic.id=:tid", [seriousness: seriousness, uid: user_id.toLong(), tid: tid.toLong()])

        if (status != 0) {

            render "seriousness changed successfully"
        } else {
            return false
        }


    }

//    def subscribeTopic(String tid) {
//        User user = session["user"]
//        Topic topic = Topic.findById(tid)
//        Subscription subs = new Subscription(user: user, topic: topic, seriousness: Seriousness.SERIOUS);
//        if (subs.validate()) {
//            subs.save();
//            render "success"
//        } else {
//
//            render subs.errors
//        }
//
//
//    }
//
//
//    def unSubcribeTopic(String tid) {
//        String user_id = session["user_id"];
//
//        int status = Subscription.executeUpdate("delete Subscription subs where subs.user.id=:uid and subs.topic.id=:tid", [uid: user_id.toLong(), tid: tid.toLong()])
//
//        if (status != 0) {
//
//            render "success"
//        } else {
//            render("failure")
//        }
//
//    }


    def subscrineAndUnsubscribe(String tid) {
        User user = session["user"];
        Topic topic = Topic.findById(tid);
        int flag = Subscription.countByUserAndTopic(user, topic)
        if (flag != 0) {
            int status = Subscription.executeUpdate("delete Subscription subs where subs.user.id=:uid and subs.topic.id=:tid", [uid: user.id, tid: topic.id])
            if (status != 0) {

                render "Subscribe"
            } else {
                return false;
            }

        } else {
            Subscription subs = new Subscription(user: user, topic: topic, seriousness: Seriousness.SERIOUS);
            if (subs.validate()) {
                subs.save(failOnError: true,flush: true);
                render "Unsubscribe"

            } else {

                return  false;
            }


        }


    }


    def userSubscription() {
        User user = session["user"]

        List<Topic> userSubscribedTopic = Subscription.createCriteria().list([max: 5, offset: 0]) {
            projections {
                property('topic')
            }
            eq('user', user)
            'topic' { order('name', 'asc') }

        }
        println userSubscribedTopic*.id

        [userSubscribedTopic: userSubscribedTopic, totalSubcribtion: userSubscribedTopic.totalCount]


    }

    def filterUserSubscription() {
        User user = session["user"]
        params.max = params.max ?: 5

        List<Topic> userSubscribedTopic = Subscription.createCriteria().list(params) {
            projections {
                property('topic')
            }
            eq('user', user)
            'topic' { order('name', 'asc') }

        }
        println userSubscribedTopic*.id


        render(template: "subscription", model: [userSubscribedTopic: userSubscribedTopic, totalSubcribtion: userSubscribedTopic.totalCount])


    }


}
