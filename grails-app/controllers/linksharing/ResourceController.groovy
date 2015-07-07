package linksharing

class ResourceController {
    def userService

    def showPost(String rid) {


        Resource resource = Resource.findById(rid)
        Integer ratedUserCount = ResourceRating.countByResource(resource)
        boolean showToEditAndDelete = false
        if (session["user"]) {
            User user = session["user"]

            if (resource.creator.id == user.id || user.admin == true) {
                showToEditAndDelete = true
            }

        }

        if(session["user_id"]){
            request.setAttribute("trendingTopics",userService.trendingTopics())
            println request.getAttribute("trendingTopics")*.id
        }



        [post: resource, ratedUserCount: ratedUserCount, showToEditAndDelete: showToEditAndDelete]


    }


    def deleteResource(String rid){
        Resource resource=Resource.findById(rid)
        resource.delete(flush:true)


    }

    def test(){

        User user =session["user"];
        def subscribedTopics=userService.userTopics(user)
        render(template: "/home/createLinkPost" ,Model: [subscribedTopics:subscribedTopics])

    }

}
