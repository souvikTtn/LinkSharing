package linksharing
import linksharing.scr.groovy.*

class Topic {
String name
Visibility visibility
Date dateCreated
Date lastUpdated
static belongsTo=[user:User]
static hasMany=[resource:Resource,subscription:Subscription] 


    static constraints = {
        visibility blank:false,nullable:false
        name unique:'user'
    }

}
