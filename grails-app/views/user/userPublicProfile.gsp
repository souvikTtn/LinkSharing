<%--
  Created by IntelliJ IDEA.
  User: umesh
  Date: 23/6/15
  Time: 5:52 PM
--%>

<%@ page import="linksharing.*"%>
<% User user =session["user"]%>
<html>
<head>
    <meta name="layout" content="linksharing"/>
    <title>Linsharinng Web Application</title>


</head>

<body>
<div class="container">
    <div class="row">
      <div class="col-md-6">
          <div class="row">
              <div class="col-md-12">
                  <g:render template="/home/userInfoPage" model="[totalUserSubscription:userSubscriptionCount,totalUserCreatedTopic:userTopicCount]"/>
              </div>

          </div>

          <div class="row">
              <div class="col-md-12">

                  <g:render template="userTopics" model="[topics:userTopic]"/>

              </div>

          </div>
      </div>

        <div class="col-md-6" >
            <div id="resourceOnPublicDiv">
            <g:render template="userResources" model="[resourceonPublicTopic:resourceonPublicTopic]"/>
            </div>
        </div>



    </div>

</div>
</body>
</html>


