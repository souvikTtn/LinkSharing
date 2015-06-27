<%--
  Created by IntelliJ IDEA.
  User: umesh
  Date: 17/6/15
  Time: 8:35 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="linksharing.User; linksharing.Topic; linksharing.Resource;linksharing.Subscription;" %>
<html>
<head>
<head>
    <g:applyLayout name="linksharing"/>



    <title></title>


</head>
<body>

<div style="width: 40%;float: left;">
    <div>
        <g:render template="userInformationDiv" model="[user:user,usersubscription:usersubscriptions,usertopics:usertopics]" />
    </div


    <div style="float:left;border:solid thick ;border-radius: 25px;height:250px;width:450px;overflow:scroll;margin-bottom: 2px">
        <g:render template="Subscriptions" model="[subscriptionTop5:subscriptionTop5]" ></g:render>
    </div>




    <div style="border:solid thick ;float:right;border-radius: 25px;height:auto;width:460px;overflow:scroll">
        <g:render template="inbox" model="[inboxlist:inboxlist]" />-
    </div>


    <div style="border:solid thick ;clear:left;float:left;border-radius: 25px;height:250px;width:450px;margin-bottom: 2px">
        <g:render template="trendingTopics" model="[tredingTopics:tredingTopics]" />

    </div>



<div class="createTopic" id="createTopic"  style="float:right;z-index: 500;background-color:#f5f5f5; right: 0px;border:solid thick ;border-radius: 25px;height:200px;width:450px;margin-bottom: 10px;">
<g:render template="createTopic" />
</div>

<div class="createDocumentRes" id="createDocumentRes"  style="float:right;z-index: 500;background-color:#f5f5f5; right: 0px;border:solid thick ;border-radius: 25px;height:310px;width:450px;margin-top:auto">
    <g:render template="createDoucememntResource" model="[usertopics:usertopics]" />
</div>
<div class="createLinkRes" id="createLinkRes"  style="float:right;z-index: 500;background-color:#f5f5f5; right: 0px;border:solid thick ;border-radius: 25px;height:310px;width:450px;margin-top:auto;">
    <g:render template="createLinkResource" model="[usertopics:usertopics]" />
</div>






</div>


</body>
</html>
