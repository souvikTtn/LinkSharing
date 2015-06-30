package linksharing

import linksharing.*
import org.codehaus.groovy.grails.web.context.ServletContextHolder
import org.springframework.web.multipart.MultipartFile
import grails.transaction.Transactional

@Transactional
class UserService {

    def serviceMethod() {

    }

    User currentUser(String uid) {

        return User.get(uid)

    }


    def recentResources() {

        List<Resource> rlist = Resource.createCriteria().list(sort: 'lastUpdated', order: 'desc', max: 5, offset: 0) {
            'topic' {
                eq('visibility', Visibility.PUBLIC)
            }
        }
        return rlist;

    }

    def topPosts() {

        List<ResourceRating> rr = ResourceRating.createCriteria().list() {
            projections {
                groupProperty 'resource'
                sum('score', 'sumscore')
            }
            'resource' {
                'topic' {
                    eq('visibility', Visibility.PUBLIC)
                }
            }
            order('sumscore', 'desc')
            maxResults(5)

        }


        List<Resource> topPost = rr.collect { it.first() }
        return topPost
    }


    def String uploadFile(MultipartFile file,
                          String name, String destinationDirectory) {
        def servletContext = ServletContextHolder.servletContext
        def storagePath = servletContext.getRealPath(destinationDirectory)
// Create storage path directory if it does not exist
        def storagePathDirectory = new File(storagePath)
        if (!storagePathDirectory.exists()) {
            print "CREATING DIRECTORY ${storagePath}: "
            if (storagePathDirectory.mkdirs()) {
                println "SUCCESS"
            } else {
                println "FAILED"
            }
        }
// Store file
        if (!file.isEmpty()) {
            file.transferTo(new File("${storagePath}/${name}"))
            println "Saved file: ${storagePath}/${name}"
            return "${storagePath}/${name}"
        } else {
            println "File ${file.inspect()} was empty!"
            return null
        }
    }


}
