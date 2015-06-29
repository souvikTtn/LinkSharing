<%--
  Created by IntelliJ IDEA.
  User: umesh
  Date: 28/6/15
  Time: 3:12 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="linksharing.*" %>
<html>
<head>
    <g:applyLayout name="linksharing"/>
    <title></title>
</head>

<body>
<div>
    <g:if test="${flash.message}">
        <li>${flash.message}</li>
    </g:if>
</div>
<div class="table table-striped">
    <table class="table">
        <caption style="font-size: larger;" >Users &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;

            <div class="dropdown">
                <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">All Users
                    <span class="caret"></span></button>
                <ul class="dropdown-menu">
                    <li><g:link controller="user" action="allUserList" >All User</g:link></li>
                    <li><g:link controller="user" action="showActiveUser"  params="[userSelectionActive:true]">Active</g:link></li>
                    <li><g:link controller="user" action="showDeactiveUser"  params="[userSelectionActive:false]" >Deactive</g:link></li>
                </ul>
            </div>


        </caption>
        <thead>
        <tr>
            <th>id</th>
            <th>Username</th>
            <th>Email</th>
            <th>FirstName</th>
            <th>LastName</th>
            <th>Active</th>
            <th>Manage</th>
        </tr>
        </thead>
        <tbody>
        <g:each in="${users}" var="user">
        <tr>
            <td>${user.id}</td>
            <td>${user.username}</td>
            <td>${user.email}</td>
            <td>${user.firstName}</td>
            <td>${user.lastName}</td>
            <g:if test="${user.active}">
            <td>Yes</td>

                <td><g:link controller="user" action="manageUser" params="[id:user.id,active:false]" class="btn btn-info" role="button">Deactivate</g:link> </td>
            </g:if>
            <g:else>

            <td>NO</td>
                <td><g:link controller="user" action="manageUser" params="[id:user.id,active:true]" class="btn btn-info" role="button">Activate</g:link> </td>
            </g:else>

        </tr>
        </g:each>
        </tbody>
    </table>

</div>



</body>
</html>