<%--
  Created by IntelliJ IDEA.
  User: umesh
  Date: 17/6/15
  Time: 8:35 PM
--%>


<html>
<head>
    <meta name="layout" content="linksharing"/>
    <title>Linsharinng Web Application</title>


</head>

<body>
<div class="container">
<div class="row">
    <div class="col-md-12">

      <div class="row">

          <div class="col-md-6">
                <div class="row">
                    <div class="col-md-12">
                    <g:render template="userInfoPage" model="[user:user,totalUserSubscription:totalUserSubscription,totalUserCreatedTopic:totalUserCreatedTopic]" />

                    </div>
                </div>
              <div class="row">
                  <div class="col-md-12">
                      <g:render template="userTop5Subsciption" model="[subscriptionsTop5Topic:subscriptionsTop5Topic]" />

                  </div>
                  %{--<div class="col-md-12">--}%
                      %{--<g:render template="createLinkPost" model="[subscribedTopics:usertopics]" />--}%

                  %{--</div>--}%
                  %{--<div class="col-md-12">--}%
                      %{--<g:render template="createDocumentPost" model="[subscribedTopics:usertopics]" />--}%

                  %{--</div>--}%
                  %{--<div class="col-md-12">--}%
                      %{--<g:render template="createTopic" />--}%

                  %{--</div>--}%
              </div>


          </div>
          <div class="col-md-6">
              <div class="row">
                  <div class="col-md-12">
                      <div id="userInboxResultDiv">
                      <g:render template="userInbox" model="[inboxlist:inboxlist]" />-
                      </div>
                  </div>
              </div>
              <div class="row">
                  <div class="col-md-12">
                      <g:render template="5trendingTopics" model="[tredingTopics:tredingTopics]" />

                  </div>
              </div>


          </div>

      </div>


    </div>
</div>

</div>
</body>
</html>















