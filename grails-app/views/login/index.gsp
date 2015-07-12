<%--
  Created by IntelliJ IDEA.
  User: umesh
  Date: 13/6/15
  Time: 4:46 PM
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

    <div class="row">
        <div class="col-md-12">

            <div class="panel panel-default">
                <!-- Default panel contents -->
                <div class="panel-heading">Latest Post On Application</div>


                <!-- List group -->
                <ul class="list-group">
                  <g:each in="${ recentResources}" var="recentRes">
                    <li class="list-group-item">
                        <g:render template="post" model="[post:recentRes]"/>


                    </li>
                    </g:each>

                </ul>
            </div>


        </div>
    </div>

        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-default">
                    <!-- Default panel contents -->
                    <div class="panel-heading">Top posts on appliction</div>


                    <!-- List group -->
                    <ul class="list-group">
                        <g:each in="${ topPosts}" var="recentRes">
                            <li class="list-group-item">
                                <g:render template="post" model="[post:recentRes]"/>


                            </li>
                        </g:each>

                    </ul>
                </div>



            </div>
        </div>






    </div>


    <div class="col-md-6 ">


        <div class="row">

            <div class="col-md-12">

                <div class="panel panel-default">
                    <!-- Default panel contents -->
                    <div class="panel-heading"><h2 class="form-signin-heading">Please sign in</h2></div>
                    <div class="panel-body">
                        <div>

                            <g:form url="[controller:'login',action:'loginHandler']" role="form">

                                <label for="inputEmail" class="sr-only">Email address</label>
                                <input type="email" name="email" id="inputEmail" class="form-control" placeholder="Email address" required autofocus>
                                <label for="inputPassword" class="sr-only">Password</label>
                                <input type="password" name="password" id="inputPassword" class="form-control" placeholder="Password" required>
                                <g:link controller="login" class="alert-link" action="forgotPassword">Forgot Password</g:link>
                                &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
                                <button type="submit" class="btn btn-info ">
                                    signIn
                                </button>
                            </g:form>

                        </div>

                    </div>
                    <div class="panel-footer">
                        <div class="row">
                            <div class="col-md-12">
                                <g:if test="${flash["message"]}">
                                    <div class="alert alert-warning">
                                        <a href="#" class="close" data-dismiss="alert">&times;</a>
                                        <strong>Warning!</strong> ${flash.message + "  "}
                                    </div>


                                </g:if>


                            </div>

                        </div>


                    </div>

                </div>





            </div>

        </div>








        <div class="row">

            <div class="col-md-12">

                <div class="panel panel-default">
                    <!-- Default panel contents -->
                    <div class="panel-heading"><h2 >Sign up</h2></div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-md-12">
                                <g:renderErrors bean="${flash["user"]}" as="list"/>


                            </div>
                        </div>



                        <div  style="margin: 10px;">
                            <div class="row">
                            </div>

                            <g:uploadForm action="register" controller="login" method="post" role="form">
                                <div class="form-group">
                                    <label for="firstname" >
                                        First Name:
                                    </label>

                                    <input type="text" name="firstName" class="form-control" id="firstname" placeholder="Enter First Name">



                                </div>

                                <div class="form-group">
                                    <label for="lastname" >
                                        Last Name:
                                    </label>

                                    <input type="text" class="form-control" name="lastName" id="lastname" placeholder="Enter Last Name">



                                </div>
                                <div class="form-group">
                                    <label for="username" >
                                        Username:
                                    </label>

                                    <input type="text" class="form-control" name="username" id="username" placeholder="Enter username">



                                </div>

                                <div class="form-group">
                                    <label for="emailaddress" >
                                        Email address:
                                    </label>
                                    <div >
                                        <input type="email" name="email" class="form-control" id="emailaddress" placeholder="Enter email address">
                                        <p class="help-block">
                                            Example: yourname@domain.com
                                        </p>
                                    </div>


                                </div>

                                <div class="form-group">
                                    <label for="password" >
                                        Password:
                                    </label>
                                    <div >
                                        <input type="password" class="form-control" name="password" id="password" placeholder="Enter Password">
                                        <p class="help-block">
                                            Min: 6 characters
                                        </p>
                                    </div>


                                </div>

                                <div class="form-group">
                                    <label for="confirmPassword" >
                                        Confirm Password:
                                    </label>
                                    <div >
                                        <input type="password" class="form-control" name="confirmPassword" id="confirmPassword" placeholder="confirm password">
                                        <p class="help-block">
                                            Should be same as password
                                        </p>
                                    </div>


                                </div>



                                <div class="form-group">
                                    <label for="uploadimage" >
                                        Upload Image:
                                    </label>
                                    <div >
                                        <input type="file" name="photo" >
                                        <p class="help-block">
                                            Allowed formats: jpeg, jpg, gif, png
                                        </p>
                                    </div>


                                </div>



                                <div class="row">
                                    <div class="col-md-4">
                                        <button type="submit" class="btn btn-info">
                                            Register
                                        </button>
                                    </div>
                                    <div class="col-md-8">

                                    </div>
                                </div>
                            </g:uploadForm>
                        </div>

                    </div>


                </div>







            </div>

        </div>

    </div>

</div>

</div>

</body>
</html>





