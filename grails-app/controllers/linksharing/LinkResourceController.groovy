package linksharing

class LinkResourceController {

    def createUserLinkResource() {


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
                render "link document created succfuly"
            }
        } else {
            render linkResource.errors

        }


    }

}
