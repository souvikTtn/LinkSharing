package linksharing

class LinkResourceController {
def userService

    def create(){
        User user=session["user"];
        List<Topic> subscribedTopics=userService.userSubscribedTopic(user)
        [subscribedTopics:subscribedTopics]

    }

    def save() {


        LinkResource linkResource = new LinkResource(params)
        User user = session["user"]
        linkResource.creator = user
        Topic topic = Topic.get(params["topicId"])
        linkResource.topic = topic


        if (linkResource.validate()) {
            linkResource.save()
            List<Subscription> subscriptionList = Subscription.findAllByTopic(topic)
            subscriptionList.each {
                if (user.id != it.user.id) {
                    ReadingItem readingItem = new ReadingItem(isRead: false, user: it.user, resource: linkResource)
                    readingItem.save()
                }
              flash.message= "link document created succfuly"
            }
        } else {
            flash.linkResource=linkResource.errors

        }


        redirect(controller: 'linkResource',action: 'create')


    }

    def editLinkResource(){

       Resource resource=Resource.findById(params.rid);
        resource.properties=params
        if( resource.validate()){
            resource.save(flush: true,failOnError: true)
            println resource.properties
            flash.message="succesfuly updated"


        }else {
            flash.resource=resource;


        }
        redirect(controller: 'resource',action:'showPost',params: [rid:params.rid])


    }


}
