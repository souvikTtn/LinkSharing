<%--
  Created by IntelliJ IDEA.
  User: umesh
  Date: 13/6/15
  Time: 4:46 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="link_sharing.*" %>
<html>
<head>
    <title>Linsharinng Web Application</title>
</head>

<body>
<div class="body">



 <div style="border:solid thick;float:left; ">

     <table>
         <caption>Recent Shares</caption>
	<thead>
	 <th> Tittle</th>
	 <th> Creator</th>
	 <th> Topic</th>	
	</thead>
	<tbody>
         <g:each in="${ recentResources}" var="recentRes">
         <tr>
             <td>${recentRes.title}</td>
             <td>${recentRes.creator.toString()}</td>
             <td>${recentRes.topic.name}</td>

         </tr>


         </g:each>
	</tbody>
     </table>

 </div>


    <div style="border:solid thick;float:right;width:300px;" >
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
                 <td><g:link action="index" controller="login">Forgot Password</g:link></td><td><g:submitButton name="submit"/></td>

             </tr>

        </table>
        </g:form>

    </div>

	
    <div style="border:solid thick;float:right;width:300px">
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
                <td>User Name:</td><td><g:textField name="userName"/></td>
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


<%-- 

     <div style="border:solid thick;" >
            <g:form url="[controller:'login',action:'loginHandler']">
                <table>
                    <tr><td>Email:</td><td><input  name="email" type="email"/></td></tr>
                    <tr><td>Password :</td><td><input  name="password" type="password"/></td></tr>
                    <tr><td><a href="">Forgot Password</a> </td><td ><input value="Login" type="submit"/></td></tr>
                </table>
            </g:form>
   </div>


<div style="border:solid thick ;" >
    <g:uploadForm action="register" method="post">
        <table>
            <tr><td>First Name:</td><td><input  name="firstName" type="text"/></td></tr>
            <tr><td>Last Name:</td><td><input  name="lastName" type="text"/></td></tr>
            <tr><td>Username:</td><td><input  name="username" type="text"/></td></tr>
            <tr><td>Email:</td><td><input  name="email" type="email"/></td></tr>
            <tr><td>Password :</td><td><input  name="password" type="password"/></td></tr>
            <tr><td>Confirm Password:</td><td><input  name="confirmPassword" type="password"/></td></tr>
            <tr><td>Image:</td><td><input  name="photo" type="file"/></td></tr>
            <tr><td colspan="2"><input value="Register" type="submit"/></td></tr>
        </table>
    </g:uploadForm>
</div>

--%>



</div>

</body>
</html>
