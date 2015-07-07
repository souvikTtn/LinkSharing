package linksharing

import org.springframework.web.multipart.MultipartFile

class DocumentResourceController {
    def userService

    def create(){
        User user=session["user"];
        List<Topic> subscribedTopics=userService.userSubscribedTopic(user)
        [subscribedTopics:subscribedTopics]

    }

    def save() {

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
                flash.message= "Resource  document created succfuly "
            }
        } else {
            flash.documentResource=documentResource

        }
        redirect( controller: 'documentResource',action: 'create')


    }

    def downLoadDocoument(String filePath) {

        def file = new File("/home/umesh/LinkSharing/web-app/home/umesh.jpg");
        //<-- you'll probably want to pass in the file name dynamically with the 'params' map

        if (file.exists()) {

            // response.setContentType("application/jpg")
            response.setHeader("Content-disposition", "attachment;filename=${file.getName()}")

            response.outputStream << file.newInputStream()
        } else {
            render "file does not exist"
        }


    }

    def editDocumentResource(){

        DocumentResource documentResource=DocumentResource.findById(params.rid);
        User user = session["user"]
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
        documentResource.description = params["description"]




        if( documentResource.validate()){
            documentResource.save(flush: true,failOnError: true)
            println documentResource.properties
            flash.message="succesfuly updated"


        }else {
            flash.resource=documentResource;


        }
        redirect(controller: 'resource',action:'showPost',params: [rid:params.rid])


    }


}
