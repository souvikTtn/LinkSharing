package linksharing

import linksharing.*
import org.codehaus.groovy.grails.web.context.ServletContextHolder
import org.springframework.web.multipart.MultipartFile
import grails.transaction.Transactional

@Transactional
class UserService {

    def serviceMethod() {

    }



    User currentUser(Integer uid) {

        return User.findById(uid)

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




    def userSubscribedTopic(User user){
        List<Topic> subscribedTopic=Subscription.createCriteria().list {

            projections{
                property('topic')
            }
            eq('user',user)

        }
        return  subscribedTopic


    }

  def top5SubscribedTopic(User user){

      List<Topic> subscriptions = Subscription.createCriteria().list{
          projections{
              property('topic')
          }
          eq('user',user)
          'topic'{
              'resources'{
                  order('lastUpdated','desc')
              }

          }


      }.unique()


      List<Topic> subscriptionsTop5Topic=(subscriptions.size()<5)?subscriptions:subscriptions.subList(0,5)


     return subscriptionsTop5Topic

  }

    def trendingTopics(){

        def a = Resource.createCriteria().list(max: 5, offset: 0) {
            projections {
                groupProperty('topic')
                rowCount("a")

            }

            'topic' {
                eq('visibility', Visibility.PUBLIC)


            }

            order("a", "desc")
        }



        List<Topic> trendingTopics = a.collect { it.first() }
        return  trendingTopics
    }


    def userSubscriptions(User user){

         List<Subscription > usersubscriptions = Subscription.findAllByUser(user);
        return   usersubscriptions

    }

    def userSubscriptionsCount(User user){
        return Subscription.countByUser(user);

    }

    def userTopics(User user){

        return Topic.findAllByUser(user)

    }
    def userTopicsCount(User user){

        return Topic.countByUser(user)

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
