package linksharing

class HomeController {



    def index() {
          if(session["user"]){
		redirect (action:"dashboard")
		}
	  else{
		redirect (controller:"Login", action:"index")	
	}
 }

    def dashboard(){
	render " you have successfully login and now you are in home page of your account ${session["user"]} with id 		${session["user_id"]}";
	
	}

}
