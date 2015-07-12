package linksharing

class UserController {
    def userService


    def userPublicProfile() {

        User user = User.findById(params.userId)
        List<Topic> userTopic;
        User currentUser = session["user"]
        if (currentUser) {

            if (currentUser.id == user.id || currentUser?.admin == true) {

                userTopic = Topic.findAllByUser(user, [sort: 'lastUpdated', order: 'desc'])
            } else {

                userTopic = Topic.findAllByUserAndVisibility(user, Visibility.PUBLIC, [sort: 'lastUpdated', order: 'desc'])
            }

        } else {

            userTopic = Topic.findAllByUserAndVisibility(user, Visibility.PUBLIC, [sort: 'lastUpdated', order: 'desc'])
        }


        Integer userSubscriptionCount = userService.userSubscriptionsCount(user)
        Integer userTopicCount = userService.userTopicsCount(user)

        List<Resource> resourceonPublicTopic = Resource.createCriteria().list([max:5,offset:0]) {

            eq("creator", user)
            "topic" {
                eq('visibility', Visibility.PUBLIC)
            }
        }

        [user: user, userTopic: userTopic, resourceonPublicTopic: resourceonPublicTopic,totalResourceonPublicTopic:resourceonPublicTopic.totalCount, userSubscriptionCount: userSubscriptionCount, userTopicCount: userTopicCount]
    }

    def filterResourcesOnPublicTopic(){
        User user = User.findById(params.userId)

        params.max = params.max ?: 5

        List<Resource> resourceonPublicTopic = Resource.createCriteria().list(params) {

            eq("creator", user)
            "topic" {
                eq('visibility', Visibility.PUBLIC)
            }
        }

        render(template: 'userResources',model: [resourceonPublicTopic: resourceonPublicTopic,totalResourceonPublicTopic:resourceonPublicTopic.totalCount])

    }



    def allUserList() {

        List<User> users = User.createCriteria().list(max: 3, offset: 0) {}


        [users: users, total: users.totalCount]

    }

    def showActiveUser() {
        List<User> users = User.createCriteria().list(max: 3, offset: 0) {
            eq('active', true)
        }
        render(view: 'allUserList', model: [users: users, total: users.totalCount])
    }


    def showDeactiveUser() {
        List<User> users = User.createCriteria().list(max: 3, offset: 0) {
            eq('active', false)
        }
        render(view: 'allUserList', model: [users: users, total: users.totalCount])
    }


    def manageUser(Integer id, Boolean active) {


        int status = User.executeUpdate("update User u set u.active=:activeStatus where u.id=:uId",
                [activeStatus: active, uId: id.toLong()])
        if (status != 0) {

            flash.message = "user updated succesfully"
        } else {
            flash.message = "user not updated succesfully"
        }
        redirect(action: 'allUserList')

    }


}
