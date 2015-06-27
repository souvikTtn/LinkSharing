package linksharing

class Resource {
    User creator
    String description
    Date dateCreated
    Date lastUpdated

    static hasMany = [readingItems: ReadingItem, resourceRatings: ResourceRating]
    static belongsTo = [topic: Topic]


    static mapping = {
        tablePerHierarchy false
    }

    static constraints = {


        description(size: 1..1024)


    }


}
