package linksharing

class User {

    String email
    String username
    String password
    String confirmPassword
    String firstName
    String lastName
    String photo
    boolean admin = false
    boolean active = false
    Date dateCreated
    Date lastUpdated
    static transients = ['confirmPassword']
    static hasMany = [topics: Topic, subscriptions: Subscription, readingItems: ReadingItem, resourceRatings: ResourceRating]

    static constraints = {

        photo(nullable: true, blank: true)
        email(email: true, blank: false, unique: true)
        confirmPassword password: true
        password(password: true, blank: false, nullable: false,
                validator: { password, obj ->
                    if (password != obj.confirmPassword) {
                        return ["password do not match"]

                    }

                }
        )
        confirmPassword bindable: true
    }

    String toString() {
        firstName + " " + lastName
    }


}
