package linksharing

class SearchController {
    def userService
    def searchService

    def globalSearch(String searchKey) {
        User user = session["user"]

        //List<Resource> searchResult = searchService.globalSearch(user,searchKey,5,0)
        List<Resource> searchResult




        if (user?.admin == true ) {

            searchResult = Resource.createCriteria().list([max:5,offset:0]) {
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
            searchResult = Resource.createCriteria().list([max:5,offset:0]) {
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

     render view:"globalSearch",model: [searchResult:searchResult,searchKey:searchKey,tredingTopics:tredingTopics,totalSearchResult:searchResult.totalCount]
    }






    def filterSearch () {
        params.max = params.max ?: 5
        println params
        List<Resource> searchResult = []
        String searchKey=params.searchKey

        User user = session["user"]
        if (user?.admin == true ) {

            searchResult = Resource.createCriteria().list([max:params.max,offset:params.offset]) {
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
            searchResult = Resource.createCriteria().list([max:params.max,offset:params.offset]) {
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

        render(template: 'searchResult', model: [searchResult: searchResult,totalSearchResult:searchResult.totalCount])
    }

}
