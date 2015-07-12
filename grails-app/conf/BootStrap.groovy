import linksharing.*


class BootStrap {

    def init = { servletContext ->

        createUsers()
        createTopics()

        createSubcriptions()
        createResources()
        // createReadingItems()
        createRatings()


    }


    void createUsers() {
        User user = new User(firstName: "umesh", email: "umeshk820@gmail.com", photo: "umesh.jpg", username: "umeshk820", password: "123", confirmPassword: "123", lastName: "kumar", admin: true);

        saveObject(user);
         user = new User(firstName: "ram", email: "rampegu1988@gmail.com", photo: "ram.jpg", username: "rampegu", password: "ram@123", confirmPassword: "ram@123", lastName: "pegu");
        saveObject(user);
        user = new User(firstName: "ram", email: "rampegu19882@gmail.com",  username: "rampegu", password: "ram@123", confirmPassword: "ram@123", lastName: "pegu");
        saveObject(user);
        user = new User(firstName: "ram", email: "rampegu19883@gmail.com",  username: "rampegu", password: "ram@123", confirmPassword: "ram@123", lastName: "pegu");
        saveObject(user);
        user = new User(firstName: "ram", email: "rampegu19884@gmail.com",  username: "rampegu", password: "ram@123", confirmPassword: "ram@123", lastName: "pegu");
        saveObject(user);
        user = new User(firstName: "ram", email: "rampegu19885@gmail.com",  username: "rampegu", password: "ram@123", confirmPassword: "ram@123", lastName: "pegu");
        saveObject(user);
        user = new User(firstName: "ram", email: "rampegu19886@gmail.com", username: "rampegu", password: "ram@123", confirmPassword: "ram@123", lastName: "pegu");
        saveObject(user);
        user = new User(firstName: "ram", email: "rampegu19887@gmail.com", username: "rampegu", password: "ram@123", confirmPassword: "ram@123", lastName: "pegu");
        saveObject(user);
        user = new User(firstName: "ram", email: "rampegu198asd88@gmail.com", username: "rampegu", password: "ram@123", confirmPassword: "ram@123", lastName: "pegu");
        saveObject(user);
        user = new User(firstName: "ram", email: "rampegu198asd89@gmail.com",  username: "rampegu", password: "ram@123", confirmPassword: "ram@123", lastName: "pegu");
        saveObject(user);
        user = new User(firstName: "ram", email: "rampegu19889asd@gmail.com",  username: "rampegu", password: "ram@123", confirmPassword: "ram@123", lastName: "pegu");
        saveObject(user);
        user = new User(firstName: "ram", email: "rampegu19889@gmail.com",  username: "rampegu", password: "ram@123", confirmPassword: "ram@123", lastName: "pegu");
        saveObject(user);
        user = new User(firstName: "ram", email: "rampegu1988asdf9@gmail.com",  username: "rampegu", password: "ram@123", confirmPassword: "ram@123", lastName: "pegu");
        saveObject(user);
        user = new User(firstName: "ram", email: "rampegu19889asdf@gmail.com",  username: "rampegu", password: "ram@123", confirmPassword: "ram@123", lastName: "pegu");
        saveObject(user);
        user = new User(firstName: "ram", email: "rampegu19asdf889@gmail.com",  username: "rampegu", password: "ram@123", confirmPassword: "ram@123", lastName: "pegu");
        saveObject(user);

    }


    void createTopics() {

        List users = User.list();
        users.each { user ->
            5.times {
                Topic topic = new Topic(name: "Topic ${it + 1}", visibility: Visibility.PUBLIC)
                user.addToTopics(topic)
                // user.addToSubscriptions(new Subscription(topic: topic, seriousness: Seriousness.SERIOUS))
                saveObject(user);

            }

        }
    }


    void createResources() {

        List topics = Topic.list();
        topics.eachWithIndex { topic, index ->

            User user = User.findById(index % 2 + 1)

//            topic.addToResources(
//                    new LinkResource(creator: user, description: "link tiitle${index + 1}	descripion", url: "https://grails.github.io/grails-doc/link${index + 1}")
//            )
//            saveObject(topic);
//
//
//            topic.addToResources(
//                    new DocumentResource(creator: user, description: " document tiitle${index + 1}descripion", filePath: "//filepath/grails.github.io/grails-doc/link${index + 1}")
//            )
//
//            saveObject(topic);

            Resource documentResource = new DocumentResource(creator: user, topic: topic, description: " document tiitle${index + 1}descripion", filePath: "//filepath/grails.github.io/grails-doc/link${index + 1}")
            saveObject(documentResource)
            List<Subscription> subscriptionList = Subscription.findAllByTopic(topic)
            subscriptionList.each {

                    ReadingItem readingItem = new ReadingItem(isRead: false, user: it.user, resource: documentResource)
                    saveObject(readingItem)



            }

            Resource linkResource=new LinkResource(creator: user, topic: topic, description: "link tiitle${index + 1}	descripion", url: "https://grails.github.io/grails-doc/link${index + 1}")
            saveObject(linkResource)
            subscriptionList.each {

                    ReadingItem readingItem = new ReadingItem(isRead: false, user: it.user, resource: linkResource)
                    saveObject(readingItem)



            }

        }
    }


        void createReadingItems() {

            int size = Resource.list().size();
            User.list().each { user ->
                Random random = new Random()
                //println Resource.get(Math.abs(random.nextInt() % size))
                user.addToReadingItems(new ReadingItem(resource: Resource.get(Math.abs(random.nextInt() % size)), isRead: true))
                user.addToReadingItems(new ReadingItem(resource: Resource.get(Math.abs(random.nextInt() % size)), isRead: true))
                user.addToReadingItems(new ReadingItem(resource: Resource.get(Math.abs(random.nextInt() % size)), isRead: true))
                saveObject(user);

            }

        }

        void createSubcriptions() {

            User.list().each { user ->
                Topic.list().each { topic ->


                    user.addToSubscriptions(new Subscription(topic: topic, seriousness: Seriousness.SERIOUS))
                    saveObject(user);

                }


            }


        }

        void createRatings() {


            List<Resource> resoucelist = Resource.list();
            User.list().each { u ->
                resoucelist.eachWithIndex { r, index ->
                    ResourceRating rr = new ResourceRating(user: u, resource: r, score: 1 + index % 5)
                    rr.save(failOnError: true)

                }
            }


        }


        void saveObject(Object object) {
            if (object.hasErrors() || !object.save(flush: true)) {
                object.errors.allErrors.each {
                    println "Errror ${it}"
                }
            }
        }


        def destroy = {
        }
    }

