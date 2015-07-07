package linksharing

import org.springframework.web.multipart.MultipartFile

class ProfileController {
    def userService

    def editProfile() {


        User user = session["user"]
        Integer userSubscriptionCount=userService.userSubscriptionsCount(user)
        Integer userTopicCount= userService.userTopicsCount(user)

        List<Topic> topicList = userService.userTopics(user);


        [user: user, topicList: topicList,userSubscriptionCount:userSubscriptionCount, userTopicCount:userTopicCount]
    }


    def updateProfile() {

        User user = session["user"]

        println(" ProfileController ... profileUpdate()....")
        println("profileUpdate :: " + params)
//For image :-
        MultipartFile uploadedFile = params['photo']
        if (!uploadedFile.empty) {
            def status = userService.uploadFile(uploadedFile, uploadedFile.originalFilename, "/home")
            println("File Stat :- " + status)
        }
        String fileName = uploadedFile.originalFilename
        println("FILE NAME :- " + fileName)

        if (params["username"] != null) {
            user.username = params["username"]
        }
        if (params["firstName"] != null) {
            user.firstName = params["firstName"]
        }
        if (params["lastName"] != null) {
            user.lastName = params["lastName"]
        }
        if (fileName != null && fileName != "") {
            user.photo = fileName
        }
        user.confirmPassword = user.password


        boolean status = updateUserProfile(user)
        println("user creation status :- " + status)
        if (status == true) {
            session["user"] = user
            session["user_id"] = user.id
            redirect(controller: 'profile', action: 'editProfile', params: [msg: 'Dear User ,You are successfully updated.'])
        } else {
            println("IncOrrect User :: going to redirect .... ")
            redirect(controller: 'profile', action: 'editProfile', params: [msg: 'Dear User ,You are not updated successfully.'])
        }

    }


    def updatePassword() {
        User user = session["user"]
        String pass = params["password"]
        String cpass = params["confirmPassword"]

        if (pass.equals(cpass)) {
            user.password = pass
            user.confirmPassword = cpass
            updateUserPassword(user)
            redirect(controller: 'profile', action: 'editProfile', params: [msg: 'Dear User ,You are successfully updated.'])
        } else {
            redirect(controller: 'profile', action: 'editProfile', params: [msg: 'Dear User ,You are not updated successfully.'])
        }


    }


    private updateUserProfile(User user) {

        int status = User.executeUpdate("update User u set u.firstName=:fname,u.lastName=:lname,u.username=:uname,u.photo=:photo where u.id=:uId",
                [fname: user.firstName, lname: user.lastName, uname: user.username, photo: user.photo, uId: user.id])
        if (status != 0) {
            return true
        } else {
            user.errors.each {
                println it
            }
            return false
        }

    }

    private updateUserPassword(User user) {

        int status = User.executeUpdate("update User u set u.password=:passw where u.id=:uId",
                [passw: user.password, uId: user.id])
        if (status != 0) {
            return true
        } else {
            user.errors.each {
                println it
            }
            return false
        }

    }


}

