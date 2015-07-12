<%--
  Created by IntelliJ IDEA.
  User: umesh
  Date: 25/6/15
  Time: 4:41 PM
--%>





<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="linksharing.*;" %>

<html>
<head>
    <meta name="layout" content="linksharing"/>
    <title>Linsharinng Web Application</title>

</head>

<body>
<div class="container">
    <div class ="row">
        <div class="col-md-6">
            <div class ="row">
                <div class="col-md-12">
                    <g:render template="/home/userInfoPage" model="[user:user,totalUserSubscription:userSubscriptionCount,totalUserCreatedTopic:userTopicCount]"/>
                </div>

            </div>
            <div class ="row">
                <div class="col-md-12">
                    <g:render template="userTopics" model="[topics:topicList]"/>

                </div>

            </div>


        </div>
        <div class="col-md-6" style="font-weight: bold;font-size: 16px;">
            <div class="panel panel-default">
                <!-- Default panel contents -->
                <div class="panel-heading">Profile</div>
                <div class="panel-body">
                    <div class ="row">

                    <div class="col-md-12">



                    <g:uploadForm action="updateProfile" controller="profile" method="post">

                    <table  class="table">

                    <tr>
                    <td>First Name:*</td><td><input type="text" name="firstName" value="${user.firstName}" required/></td>
                    </tr>
                    <tr>
                    <td>Last Name:*</td><td><input type="text" name="lastName" value="${user.lastName}" required /></td>
                    </tr>
                    <tr>
                    <td>User Name:*</td><td><input type="text" name="username" value="${user.username}" required /></td>
                    </tr>
                    <tr>
                    <td>Image:</td><td><g:field type="file" name="photo"/></td>
                    </tr>
                    <tr>
                    <td colspan="2" style="align-items: center"><g:submitButton name="update"/></td>
                    </tr>
                    </table>
                    </g:uploadForm>




                    </div>


                    </div>

                </div>


            </div>
            <div class="row">
                <div class="col-md-12">
                    <div>
                        ${params.msg}
                    </div>
                </div>
            </div>

            <div class="panel panel-default">
                <!-- Default panel contents -->
                <div class="panel-heading">ChangePassword</div>

                <g:form url="[controller:'profile',action:'updatePassword']">
                    <table class="table">

                        <tr>
                            <td>Password:</td><td><input type="password" name="password" required/></td>
                        </tr>
                        <tr>
                            <td>Confirm Password:</td><td><input type="password" name="confirmPassword" required/></td>
                        </tr>
                        <tr>

                            <td><g:submitButton name="update"/></td>

                        </tr>

                    </table>
                </g:form>
            </div>




        </div>

    </div>

</div>

</body>
</html>




