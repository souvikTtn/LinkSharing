package linksharing


import org.springframework.web.multipart.MultipartFile

class LoginController {
    def userService
    def mailService

    def index() {

        List<Resource> recentResources = userService.recentResources();

        List<ResourceRating> topPosts = userService.topPosts();

        [recentResources: recentResources, topPosts: topPosts]

    }

    def loginHandler() {

        String email = params.get("email");
        String password = params.get("password")
        User user = User.findByEmail(email);

        if (user?.password == password) {
            if (user.active == false) {

                flash.message = "User is Deactivated by Admin,can't login..."
                redirect(controller: "login", action: "index");
                return false;
            }
            session["user"] = user;
            session["user_id"] = user.id;
            flash.welcome = " ${user}, you have successfully login."
            redirect(controller: "Home", action: "dashboard");
        } else {

            flash.message = "Please Enter the Correct Credentials"
            redirect(controller: "login", action: "index");
        }


    }


    def register() {


        MultipartFile uploadedFile = params['photo']
        if (!uploadedFile.empty) {
//            println "Class: ${uploadedFile.class}"
//            println "Name: ${uploadedFile.name}"
//            println "OriginalFileName: ${uploadedFile.originalFilename}"
//            println "Size: ${uploadedFile.size}"
//            println "ContentType: ${uploadedFile.contentType}"


            def status = userService.uploadFile(uploadedFile, uploadedFile.originalFilename, "/home")
            println("File Stat :- " + status)
        }
        User user = new User()
        String fileName = uploadedFile.originalFilename
        user.photo = fileName
        user.email = params["email"]
        user.password = params["password"]
        user.confirmPassword = params["confirmPassword"]
        user.username = params["username"]
        user.firstName = params["firstName"]
        user.lastName = params["lastName"]


        if (user.validate()) {

            user.save(flush: true)
            session["user"] = user;
            session["user_id"] = user.id

            flash.welcome = " ${user}, you have successfully Registered."
            redirect(controller: "home", action: "dashboard");
        } else {

            flash["user"] = user;
            redirect(controller: 'login', action: 'index')
        }
    }

    def logout() {
        session.invalidate()
        redirect(controller: "login", action: "index")
    }


    def recoverPassword() {
        String email = params["email"]
        User user = User.findByEmail(email)
        if (user) {
            mailService.sendMail {
                to "${email}"
                subject "LinkSharing Application:Recover Password"
                body "Your Password is : ${user.password}"
            }
            flash.message = "Your Recovery Password is sent on :${email}"

        } else {
            flash.message = "Email Id ${email} is not found with Record"

        }
        render(view: "forgotPassword")
    }

    def forgotPassword() {

    }


}







