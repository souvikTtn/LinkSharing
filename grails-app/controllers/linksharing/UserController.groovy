package linksharing

class UserController {


    def userPublicProfile() {

        User user = User.findById(params.userId)
        List<Topic> userTopic;
        User currentUser = session["user"]
        if (currentUser) {

            if (currentUser.id == user.id || currentUser.admin == true) {

                userTopic = Topic.findAllByUser(user, [max: 3, offset: 0, sort: 'lastUpdated', order: 'desc'])
            } else {

                userTopic = Topic.findAllByUserAndVisibility(user, Visibility.PUBLIC, [max: 3, offset: 0, sort: 'lastUpdated', order: 'desc'])
            }

        } else {

            userTopic = Topic.findAllByUserAndVisibility(user, Visibility.PUBLIC, [max: 3, offset: 0, sort: 'lastUpdated', order: 'desc'])
        }



        List<Resource> resourceonPublicTopic = Resource.createCriteria().list(max: 3, offset: 0) {

            eq("creator", user)
            "topic" {
                eq('visibility', Visibility.PUBLIC)
            }
        }

        [user: user, userTopic: userTopic, resourceonPublicTopic: resourceonPublicTopic]
    }
}
