package linksharing

class SearchController {
    def userService

    def globalSearch(String searchKey) {

        List<Resource> searchResult = []

        User user = session["user"]
        if (user.admin == true ) {

            searchResult = Resource.createCriteria().list {
                or {
                    ilike("description", "%${searchKey}%")
                    ilike("url", "%${searchKey}%")
                    'topic' {
                        ilike("name", "%${searchKey}%")
                    }
                }

            }
        }
        else if( searchKey){
            searchResult = Resource.createCriteria().list {
                or {
                    ilike("description", "%${searchKey}%")
                    ilike("url", "%${searchKey}%")
                    'topic' {
                        ilike("name", "%${searchKey}%")
                    }
                }
                'topic'{
                    eq('visibility',Visibility.PUBLIC)
                }

            }

        }else{

            searchResult = []
        }

        // trending topics
        List<Topic> tredingTopics=userService.trendingTopics()

     render view:"globalSearch",model: [searchResult:searchResult,searchKey:searchKey,tredingTopics:tredingTopics]
    }

}
