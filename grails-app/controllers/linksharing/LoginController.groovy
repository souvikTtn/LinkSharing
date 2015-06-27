package linksharing

import linksharing.*

import org.springframework.web.multipart.MultipartFile

class LoginController {
    def userService
    def mailService

    def index() {
        //Recent Shares
        List<Resource> rlist = Resource.createCriteria().list(sort: 'lastUpdated', order: 'desc', max: 3, offset: 0) {
            'topic' {
                eq('visibility', Visibility.PUBLIC)
            }
        }
        //Top post according to hightest  of ratings
        List<ResourceRating> rr = ResourceRating.createCriteria().list() {
            projections {
                groupProperty 'resource'
                sum('score', 'sumscore')
            }
            'resource' {
                'topic' {
                    eq('visibility', Visibility.PUBLIC)
                }
            }
            order('sumscore', 'desc')
            maxResults(2)

        }


        List<Resource> topPost = rr.collect { it.first() }

        [recentResources: rlist, topPost: topPost]
    }

    def loginHandler() {

        String email = params.get("email");
        String password = params.get("password")
        User user = User.findByEmail(email);

        if (user?.password == password) {
            session["user"] = user;
            session["user_id"] = user.id;
            flash.message = "Welcome ${user}"
            redirect(controller: "Home", action: "dashboard");
        } else {
            println("InCOrrect User :: going to redirect .... ")
            flash.message = "Please Enter the Correct Credentials"
            redirect(controller: "login", action: "index");
        }


    }


    def register() {


        MultipartFile uploadedFile = params['photo']
        if (!uploadedFile.empty) {
            println "Class: ${uploadedFile.class}"
            println "Name: ${uploadedFile.name}"
            println "OriginalFileName: ${uploadedFile.originalFilename}"
            println "Size: ${uploadedFile.size}"
            println "ContentType: ${uploadedFile.contentType}"

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
            println("sesion name :::: " + session["user"])
            println("COrrect User :: going to redirect .... ")
            redirect(url: '/')
        } else {
            println("InCOrrect User :: going to redirect .... ")
            user.errors.each {
                println it
            }
            redirect(controller: 'login', action: 'index')
        }
    }

    def logout() {
        session.invalidate()
        redirect(url: "/")
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







