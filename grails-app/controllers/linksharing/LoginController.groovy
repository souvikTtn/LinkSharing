package linksharing

class LoginController {

	def index(){}

	def loginHandler(){

	String email=params.get("email");
	String password=params.get("password")
	User user=User.findByEmail(email);

	if(user?.password==password){
     	session["user"]=user.firstName;
     	session["user_id"]=user.id;
      	redirect (controller:"Home",action:"dashboard");
	}
	else{
          redirect (controller:"login",action:"index");
	}


	}


}
