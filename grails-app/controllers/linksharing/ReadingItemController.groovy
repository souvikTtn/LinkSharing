package linksharing

class ReadingItemController {

    def markAsReadAndUnread(String rid) {


        User user = session["user"]
        Resource resource = Resource.findById(rid)
        ReadingItem readingItem = ReadingItem.findByUserAndResource(user,resource)

        if(readingItem.isRead==true)
        {
            readingItem.isRead=false
            readingItem.save(flush: true,failOnError: true)
            render "MarkAsRead"
        }
        else
        {
            readingItem.isRead=true
            readingItem.save(flush: true,failOnError: true)
            render "MarkAsUnread"

        }



    }
}
