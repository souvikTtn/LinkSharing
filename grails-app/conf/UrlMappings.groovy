class UrlMappings {

	static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }
         "/"(controller:"home",action: "index");
        //"/"(view:"/index")
        "500"(view:'/error')
	}
}
