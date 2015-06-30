<%--
  Created by IntelliJ IDEA.
  User: umesh
  Date: 25/6/15
  Time: 9:21 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="login"/>
    <title></title>
</head>

<body>

    <div class="row">
        <div class="col-md-12">


            <div><g:link  class="btn btn-primary btn-lg active" role="button" controller="login" action="index">Go Back To homePage</g:link>
            <g:if test="$flash.message">
            ${flash.message}
            </g:if>
            </div>
            <div class="row">
                <div class="col-md-3"></div>
                <div class="col-md-6">
            <table class="table">
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
            <td colspan="2"><input class="btn btn-info" type="submit" value="submit"/></td>
            </tr>
            </g:form>
            </tbody>



            </table>
            </div>


                <div class="col-md-3"></div>
            </div>

        </div>


    </div>






</body>
</html>