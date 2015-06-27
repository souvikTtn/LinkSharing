<%--
  Created by IntelliJ IDEA.
  User: umesh
  Date: 25/6/15
  Time: 4:41 PM
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="linksharing.User; linksharing.*;linksharing.Topic; linksharing.Resource;linksharing.Subscription;" %>
<html>
<head>
    <g:applyLayout name="linksharing"/>

    <title></title>
</head>

<body>
<div style="width: 40%;float: left;">

    <div>
        <g:render template="/home/userInformationDiv" model="[user:user,usersubscription:userSubscriptions,usertopics:topicList]" />
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
            <% topicList.each {Topic topic-> %>

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
                                    <g:link controller="home" action="dashboard">unsubscribe&nbsp;&nbsp;</g:link>
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
                                    <select name="visibility"><option value="${linksharing.Visibility.PUBLIC}">Public</option><option value="${linksharing.Visibility.PRIVATE}">Private</option> </select>
                                </div>

                            </div>
                        </div>

                    </div>
                </th>
            </tr>
            <% }%>

            </tbody>
            %{--<g:paginate total="${total}" max="3" params="[q:params.q]"/>--}%
        </table>

    </div>

    </div>

<div style="height: 50%;width: 50%; float: right">
    <div>
        <g:if test="${params["msg"]}">
            <li> ${params["msg"]}</li>
        </g:if>
    </div>

    <div style="border:solid thick;float:left" >
        <g:uploadForm action="updateProfile" controller="profile" method="post">

            <table >
                <caption> Profile</caption>
                <tr>
                    <td>First Name:*</td><td><g:textField name="firstName" value="${user.firstName}"/></td>
                </tr>
                <tr>
                    <td>Last Name:*</td><td><g:textField name="lastName" value="${user.lastName}"/></td>
                </tr>
                <tr>
                    <td>User Name:*</td><td><g:textField name="username" value="${user.username}"/></td>
                </tr>
                <tr>
                    <td>Image:</td><td><g:field type="file" name="photo"/></td>
                </tr>
                <tr>
                    <td colspan="2"><g:submitButton name="update"/></td>
                </tr>
            </table>
        </g:uploadForm>

    </div>

    <div style="border:solid thick;float:left;" >
        <g:form url="[controller:'profile',action:'updatePassword']">
            <table >
                <caption>ChangePassword</caption>
                <tr>
                    <td>Password:</td><td><g:field type="password" name="password"/></td>
                </tr>
                <tr>
                    <td>Confirm Password:</td><td><g:field type="password" name="confirmPassword" /></td>
                </tr>
                <tr>

                    <td><g:submitButton name="update"/></td>

                </tr>

            </table>
        </g:form>

    </div>



</div>


</body>
</html>