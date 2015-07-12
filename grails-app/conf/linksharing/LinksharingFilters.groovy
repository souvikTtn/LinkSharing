package linksharing

class LinksharingFilters {

    def filters = {
        restrictLogin(controller: 'login|assets|console|topic|user|resource|search', action: '*', invert: true) {
            before = {


                if (!session['user_id']) {
                    redirect(controller: 'login', action: 'index')

                    flash.message = "Please log-in to the system"
                    return false
                }
            }


        }

        topic(controller: 'topic',action: "*", actionExclude: "topicShow") {
            before = {


                if (!session['user_id']) {
                    redirect(controller: 'login', action: 'index')

                    flash.message = "Please log-in to the system"
                    return false
                }
            }
        }
        resource(controller: 'resource',action: "*", actionExclude: "showPost") {
            before = {


                if (!session['user_id']) {
                    redirect(controller: 'login', action: 'index')

                    flash.message = "Please log-in to the system"
                    return false
                }
            }
        }

        user2(controller: "user",action:"*",actionExclude: "filterResourcesOnPublicTopic|userPublicProfile") {
            before = {
                if (!session['user_id']) {
                    redirect(controller: 'login', action: 'index')

                    flash.message = "Please log-in to the system"
                    return false
                }

            }
        }
    }
}


