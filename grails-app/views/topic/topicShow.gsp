<%--
  Created by IntelliJ IDEA.
  User: umesh
  Date: 24/6/15
  Time: 4:16 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="linksharing.User; linksharing.Topic; linksharing.Resource;linksharing.Subscription;" %>
<html>
<head>
    <g:applyLayout name="linksharing" ></g:applyLayout>
    <title></title>
</head>

<body>


<div style="width: 40%;float: left;">



    <div style="float:left;border:solid thick ;border-radius: 25px;height:250px;width:450px;margin-bottom: 2px">

        <table align="left" border="1" cellpadding="1" cellspacing="1" style="width:450px ;height: 250px">
            <thead>
            <tr>
                <th colspan="2" scope="row">
                    <div style=" padding: 5px 10px;">Topic : ${topic.name}</div>
                </th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <th scope="row" style="text-align: left;">
                    <div>

                        <div style="float: left; width: 290px;">
                            <div>
                                <div style="float:inherit;">

                                    <p>${topic.name} (${topic.visibility})</p>
                                    <p>@${topic.user}</p>
                                </div>

                                <div style="float: left;">
                                    <g:if test="${showToSubscribe}">
                                    <g:link controller="home" action="dashboard">subscribe&nbsp;&nbsp;</g:link>
                                    </g:if>
                                    <g:else>
                                        <g:link controller="home" action="dashboard">Unsubscribe&nbsp;&nbsp;</g:link>
                                    </g:else>
                                </div>
                                <div style="float: left;">

                                    <p>Subscription</p>
                                    <p>${topic.subscriptions.size()}</p>
                                </div>
                                <div style="float: right">
                                    <p>Posts</p>
                                    <p>${topicResources.size()}</p>
                                </div>
                                <div style="float:inherit;">
                                    <select name="seriousness"><option value="Serious">Serious</option><option value="VerySerious">VerySerious</option> </select>

                                </div>

                            </div>
                        </div>

                    </div>
                </th>
            </tr>


            </tbody>
        </table>

    </div>
    <div style="float:left;border:solid thick ;border-radius: 25px;height:250px;width:450px;margin-bottom: 2px">

        <table align="left" border="1" cellpadding="1" cellspacing="1" style="width:450px ;height: 250px">
            <thead>
            <tr>
                <th colspan="2" scope="row">
                    <div style=" padding: 5px 10px;">Users :"${topic.name}"</div>
                </th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <th scope="row" style="text-align: left;">
                    <div>

                        <div style="float: left; width: 300px;">
                            <div>
                                <div style="float:left;align-items: center">
                                    <g:each in="${topicUsers}" var="user">

                                        <g:render template="/user/userInformationDiv" model="[user:user]" />
                                    </g:each>

                                </div>

                            </div>
                        </div>

                    </div>
                </th>
            </tr>


            </tbody>
        </table>

    </div>


</div>

<div style="border:solid thick ;float:right;border-radius: 25px;height:auto;width:460px;overflow:scroll">
    <g:render template="showPosts"  model="[topic:topic,topicResources:topicResources,total:topicResources.size()]" />-
</div>


</body>
</html>