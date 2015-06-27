<%--
  Created by IntelliJ IDEA.
  User: umesh
  Date: 25/6/15
  Time: 9:21 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="linksharing"/>
    <title></title>
</head>

<body>

    <div><g:link controller="login" action="index">Go Back To homePage</g:link>
        <g:if test="$flash.message">
            ${flash.message}
        </g:if>

    </div>
    <div>
        <table>
            <thead>
            <tr>
                <th colspan="2">Recover password</th>
            </tr>
            </thead>
            <tbody>
            <g:form controller="login" action="recoverPassword">
            <tr>
                <td>Email:</td>
                <td><input type="email" name="email" placeholder="Enter Your Registered email"/></td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" value="submit"/></td>
            </tr>
            </g:form>
            </tbody>



        </table>


    </div>

</body>
</html>