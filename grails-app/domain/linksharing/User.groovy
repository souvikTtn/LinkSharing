package linksharing

class User {

String email
String username
String password
String passwordConfirm /*want to make it as transient but it's effect it was not visible on scaffold so temporaly i have 				persisted it to database for validation.*/ 
String firstName
String lastName
byte[] photo
boolean admin=false
boolean active=false
Date dateCreated
Date lastUpdated

static hasMany=[topics:Topic,subscriptions:Subscription,readingItems:ReadingItem,resourceRatings:ResourceRating]

    static constraints = {
           
	photo (nullable:true)
	   email(email: true,blank:false,unique:true)
	passwordConfirm password:true
	password (password:true,blank: false, nullable: false, validator: {password, obj ->
      def password2 = obj.passwordConfirm
      password2 == password ? true : ['invalid.matchingpasswords']
    })
  }

String  toString()
{
return firstName+" "+lastName
}


}
