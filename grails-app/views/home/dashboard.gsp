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
                    <g:if test="${flash?.welcome}">
                      <div class="alert alert-success">
                          <a class="close" data-dismiss="alert">×</a>
                          <strong>Welcome!</strong>${flash?.welcome}
                      </div>
                    </g:if>
                      <g:if test="${flash?.postDelete}">
                      <div class="alert alert-info">
                          <a class="close" data-dismiss="alert">×</a>
                          <strong>Info!</strong>${flash.postDelete}.
                      </div>
                      </g:if>

                  </div>
              </div>
                <div class="row">
                    <div class="col-md-12">
                    <g:render template="userInfoPage" model="[user:user,totalUserSubscription:totalUserSubscription,totalUserCreatedTopic:totalUserCreatedTopic]" />

                    </div>
                </div>
              <div class="row">
                  <div class="col-md-12">
                      <g:render template="userTop5Subsciption" model="[subscriptionsTop5Topic:subscriptionsTop5Topic]" />

                  </div>

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















