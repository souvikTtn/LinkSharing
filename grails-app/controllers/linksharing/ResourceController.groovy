package linksharing

class ResourceController {

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


        [resource: resource, ratedUserCount: ratedUserCount, showToEditAndDelete: showToEditAndDelete]


    }
}
