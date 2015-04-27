package linksharing

class Resource {
User creater
String title
String description
Date dateCreated
Date lastUpdated


static belongsTo=[topic:Topic]


    static mapping = {
        tablePerHierarchy false
    }

 static constraints = {

        title (unique:'topic')
	description ( size:1..1024) 
	creater nullable:true,blank:true
	
    }

String toString()
{
return description;
}
    

}
