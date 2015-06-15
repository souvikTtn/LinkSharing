package linksharing

class LoginController {

    def index() {
        List<Resource> rlist=Resource.list([sort:'lastUpdated',order: "desc",max: 5])
	
        [recentResources:rlist]
    }

    def loginHandler() {

        String email = params.get("email");
        String password = params.get("password")
        User user = User.findByEmail(email);

        if (user?.password == password) {
            session["user"] = user.firstName;
            session["user_id"] = user.id;
            redirect(controller: "Home", action: "dashboard");
        } else {
            redirect(controller: "login", action: "index");
        }


    }

    def register() {
        User user = new User(params);
        if (!user.validate()) {
            render " has error ${params} "
            render "${user}"
        } else {
            user.save();
            render "${user}"

        }

    }


}
