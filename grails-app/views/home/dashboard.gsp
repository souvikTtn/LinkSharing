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
                      <g:render template="userTop5Subsciption" model="[subscriptionsTop5Topic:subscriptionsTop5Topic]" ></g:render>

                  </div>
              </div>


          </div>
          <div class="col-md-6">
              <div class="row">
                  <div class="col-md-12">
                      <g:render template="userInbox" model="[inboxlist:inboxlist]" />-

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







    <div class="createTopic" id="createTopic"  style="float:right;z-index: 500;background-color:#f5f5f5; right: 0px;border:solid thick ;border-radius: 25px;height:200px;width:450px;margin-bottom: 10px;">
        <g:render template="createTopic" />
    </div>


    <div class="createDocumentRes" id="createDocumentRes"  style="float:right;z-index: 500;background-color:#f5f5f5; right: 0px;border:solid thick ;border-radius: 25px;height:310px;width:450px;margin-top:auto">
        <g:render template="createDoucememntResource" model="[usertopics:usertopics]" />
    </div>
    <div class="createLinkRes" id="createLinkRes"  style="float:right;z-index: 500;background-color:#f5f5f5; right: 0px;border:solid thick ;border-radius: 25px;height:310px;width:450px;margin-top:auto;">
        <g:render template="createLinkResource" model="[usertopics:usertopics]" />
    </div>










