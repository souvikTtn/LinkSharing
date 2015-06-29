<%--
  Created by IntelliJ IDEA.
  User: umesh
  Date: 13/6/15
  Time: 4:46 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="linksharing.User;" %>

<html>
<head>
    <meta name="layout" content="login"/>
    <title>Linsharinng Web Application</title>

</head>

<body>
<div class="body">



 <div style="border:solid thick;float:left;padding: 0% ;height:30%;width: 40%; overflow: scroll">
   <div><header>Recent Shares</header></div>
     <g:each in="${ recentResources}" var="recentRes">
         <g:render template="post" model="[post:recentRes]"/>

     </g:each>

 </div>




<div style="height: 50%;width: 50%; float: right">
    <div>
        <g:if test="${flash.message}">
            <li>${flash.message}</li>

        </g:if>
    </div>
    <div style="border:solid thick;float:left;" >
        <g:form url="[controller:'login',action:'loginHandler']">
        <table >
            <caption>SignIn</caption>
            <tr>
                <td> Email:</td><td> <g:field type="email" name="email"/> </td>
            </tr>
            <tr>
                <td>Password:</td><td><g:field type="password" name="password"/></td>
            </tr>
             <tr>
                 <td><g:link controller="login" action="forgotPassword">Forgot Password</g:link></td>
                 <td><g:submitButton name="submit"/></td>

             </tr>

        </table>
        </g:form>

    </div>


    <div style="border:solid thick;float:left; " >
        %{--<div>--}%
            %{--<g:renderErrors bean="" as="list" />--}%


        %{--</div>--}%
        <g:uploadForm action="register" controller="login" method="post">

        <table >
            <caption> SingnUp</caption>
            <tr>
                <td>First Name:</td><td><g:textField name="firstName"/></td>
            </tr>
            <tr>
                <td>Last Name:</td><td><g:textField name="lastName"/></td>
            </tr>
            <tr>
                <td>User Name:</td><td><g:textField name="username"/></td>
            </tr>
            <tr>
                <td> Email:</td><td> <g:field type="email" name="email"/> </td>
            </tr>
            <tr>
                <td>Password:</td><td><g:field type="password" name="password"/></td>
            </tr>
            <tr>
                <td>Confirm Password:</td><td><g:field type="password" name="confirmPassword" /></td>
            </tr>
            <tr>
                <td>Image:</td><td><g:field type="file" name="photo"/></td>
            </tr>
            <tr>
                <td colspan="2"><g:submitButton name="submit"/></td>
            </tr>
        </table>
        </g:uploadForm>

    </div>
</div>


    <div style="border:solid thick;float:left;padding: 0% ;height:30%;width: 40%; overflow: scroll">
        <div><header>Top Posts</header></div>
        <g:each in="${ topPost}" var="recentRes">
            <g:render template="post" model="[post:recentRes]"/>

        </g:each>

    </div>



</div>

</body>
</html>
