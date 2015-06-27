package linksharing

import org.springframework.web.multipart.MultipartFile

class DocumentResourceController {
    def userService

    def createUserDocumentResource() {

        DocumentResource documentResource = new DocumentResource()
        User user = session["user"]
        Topic topic = Topic.get(params["topicId"])

        MultipartFile uploadedFile = params['file']
        if (!uploadedFile.empty) {
            println "Class: ${uploadedFile.class}"
            println "Name: ${uploadedFile.name}"
            println "OriginalFileName: ${uploadedFile.originalFilename}"
            println "Size: ${uploadedFile.size}"
            println "ContentType: ${uploadedFile.contentType}"

            def status = userService.uploadFile(uploadedFile, user.id + uploadedFile.originalFilename, "/documentResource")
            println("File Stat :- " + status)
        }

        String fileName = user.id + uploadedFile.originalFilename
        documentResource.filePath = fileName;
        documentResource.creator = user
        documentResource.topic = topic
        documentResource.description = params["description"]

        if (documentResource.validate()) {
            documentResource.save()
            List<Subscription> subscriptionList = Subscription.findAllByTopic(topic)
            subscriptionList.each {
                if (user.id != it.user.id) {
                    ReadingItem readingItem = new ReadingItem(isRead: false, user: it.user, resource: documentResource)
                    readingItem.save()
                }
                render "Resource  document created succfuly + $params"
            }
        } else {
            render documentResource.errors

        }


    }
}
