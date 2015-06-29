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
