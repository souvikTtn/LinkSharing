package linksharing

import grails.transaction.Transactional

@Transactional
class SearchService {


    def globalSearch(User user,String searchKey,Integer max,Integer offset) {

        List<Resource> searchResult = []


        if (user.admin == true ) {

            searchResult = Resource.createCriteria().list([max:max,offset:offset]) {
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
            searchResult = Resource.createCriteria().list([max:max,offset:offset]) {
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
        return searchResult


    }



}
