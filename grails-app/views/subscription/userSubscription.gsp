<%--
  Created by IntelliJ IDEA.
  User: umesh
  Date: 9/7/15
  Time: 12:06 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="linksharing"/>
    <title></title>
</head>

<body>

<div class="container">
<div class="row">
    <div class="col-md-6">
        <div id="userSubscriptionDiv">
            <g:render template="subscription" model="[userSubscribedTopic:userSubscribedTopic,totalSubcribtion:totalSubcribtion]"/>
        </div>
    </div>
    <div class="col-md-6">
        <div id="topicPostDiv">
          %{--<g:render template=""/>            --}%

        </div>

    </div>
</div>

</div>
</body>
</html>



