<%--
  Created by IntelliJ IDEA.
  User: umesh
  Date: 23/6/15
  Time: 5:52 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="linksharing.User; linksharing.Topic; linksharing.Resource;linksharing.Subscription;" %>
<html>
<head>
    <g:applyLayout name="linksharing"/>

    <title></title>
</head>

<body>
<div style="width: 40%;float: left;">

<div>
    <g:render template="userInformationDiv" model="[user:user]" />
</div>

    <div style="float:left;border:solid thick ;border-radius: 25px;height:500px;width:450px;overflow:scroll;margin-bottom: 2px">

        <table align="left" border="1" cellpadding="1" cellspacing="1" style="width:450px ;height: 500px">
            <thead>
            <tr>
                <th colspan="2" scope="row">
                    <div style=" padding: 5px 10px;">Topics</div>
                </th>
            </tr>
            </thead>
            <tbody>
            <% userTopic.each {Topic topic-> %>

            <tr>
                <th scope="row" style="text-align: left;">
                    <div>

                        <div style="float: left; width: 290px;">
                            <div>
                                <div style="float:inherit;">

                                    <p> <g:link controller="topic" action="topicShow" params="[tid:topic.id]"> ${topic.name}</g:link></p>
                                    <p>@${topic.user}</p>
                                </div>

                                <div style="float: left;">
                                    <g:link controller="home" action="dashboard">subscribe&nbsp;&nbsp;</g:link>
                                </div>
                                <div style="float: left;">

                                    <p>Subscription</p>
                                    <p>${topic.subscriptions.size()}</p>
                                </div>
                                <div style="float: right">
                                    <p>Posts</p>
                                    <p>${topic.resources.size()}</p>
                                </div>
                                <div style="float:inherit;">
                                    <select name="seriousness"><option value="Serious">Serious</option><option value="VerySerious">VerySerious</option> </select>

                                </div>

                            </div>
                        </div>

                    </div>
                </th>
            </tr>
            <% }%>

            </tbody>
        </table>

    </div>



   </div>
<div style="border:solid thick ;float:right;border-radius: 25px;height:auto;width:460px;overflow:scroll">
    <%List<Resource> ls= resourceonPublicTopic;
    %>
    <table align="left" border="1" cellpadding="1" cellspacing="1" style="width:450px;">
        <thead>
        <tr>
            <th colspan="2" scope="row">
                <div style=" padding: 5px 10px;">Posts </div>
            </th>
        </tr>
        </thead>
        <tbody>
        <%ls.each {
        %>
        <tr>
            <th scope="row" style="text-align: left;">
                <div>

                    <div style="margin-left: 120px; font-size: inherit;">
                        <p> <span style="float: left"> <g:link controller="topic" action="topicShow" params='[tid:"${it.topic.id}"]'>${it.topic.name}</g:link></span><br />
                        </br>
                        ${it.description} </p>
                    </div>
                    <div>
                        <p><g:img dir="/linksharing/assets" file="fb.jpeg"  alt="fb"  width="25"/>&nbsp; <g:img dir="/linksharing/assets" file="twitter_ico.png" alt="twitter"  width="25"/>&nbsp; <g:img dir="/linksharing/assets" file="gPlus.png"  alt="gplus"  width="25"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span style="font-size:9px;"><span style="color: rgb(0, 0, 255);"><u>Download</u></span></span> <span style="font-size:9px;"><span style="color: rgb(0, 0, 255);"><u>ViewFullSite</u></span></span> <span style="font-size:9px;"><span style="color: rgb(0, 0, 255);"><u>MarkAsRead</u></span></span> <span style="font-size:9px;"><span style="color: rgb(0, 0, 255);"><u><g:link controller="resource" action="showPost" params='[rid:"${it.id}"]'>ViewPost</g:link></u></span></span></p>
                    </div>
                </div>
            </th>
        </tr>
        <% }%>


        </tbody>
        %{--<g:paginate total="${total}" max="3" params="[q:params.q]"/>--}%
    </table>
</div>
</body>
</html>