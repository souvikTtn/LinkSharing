package linksharing

class ResourceRatingController {


    def rateResource(String rid, int score) {

        Resource resource = Resource.findById(rid);
        User user = session["user"];
        if (user) {
            int flag = ResourceRating.countByUserAndResource(user, resource);
            println flag;
            if (flag != 0) {
                return false;
            } else {
                ResourceRating rr = new ResourceRating(user: user, resource: resource, score: score);
                if (rr.validate()) {

                    rr.save(failOnError: true, flush: true)
                    int noOfUserRated = ResourceRating.countByResource(resource)
                    render noOfUserRated;
                }

            }


        } else {
            return false
        }

    }

}
