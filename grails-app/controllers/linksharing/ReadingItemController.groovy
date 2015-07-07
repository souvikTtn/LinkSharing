package linksharing

class ReadingItemController {

    def markAsRead(String rid) {


        def user_id = session["user_id"]

        int status = ReadingItem.executeUpdate("delete ReadingItem rI  where rI.user.id=:uId and rI.resource.id=:rId",
                [uId: user_id, rId: rid.toLong()])
        if (status != 0) {
            redirect(controller: "home", action: "dashboard")
        } else {

            render "failure"
        }


    }
}
