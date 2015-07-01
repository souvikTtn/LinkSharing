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
    <meta name="layout" content="login"/>
    <title>Linsharinng Web Application</title>

</head>

<body>
<div class="container">
<div class ="row">
    <div class="col-md-6">

    <div class="row">
        <div class="col-md-12">
            <div style="background-color:powderblue">
                <h1 style="background-color:#ffa8c7">Latest posts on appliction...</h1>
            <g:each in="${ recentResources}" var="recentRes">
            <g:render template="post" model="[post:recentRes]"/>

            </g:each>

            </div>

        </div>
    </div>

        <div class="row">
            <div class="col-md-12">

                <div style="background-color:powderblue">
                <h1 style="background-color:#ffa8c7">Top posts on appliction...</h1>
                <g:each in="${ topPosts}" var="recentRes">
                <g:render template="post" model="[post:recentRes]"/>

                </g:each>

                </div>

            </div>
        </div>






    </div>


    <div class="col-md-6 ">
        <div class="row">

            <div class="col-md-12">
                <div  style="margin: 10px">

                    <g:form url="[controller:'login',action:'loginHandler']" role="form">
                        <h2 class="form-signin-heading">Please sign in</h2>
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

        </div>




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


        <div class="row">
            <div class="col-md-12">
                <g:renderErrors bean="${flash["user"]}" as="list"/>


            </div>
        </div>

        <div class="row">

            <div class="col-md-12">

                <div  style="margin: 10px;">
                    <div class="row"><h2 style="align-text: center;">Sign up</h2>
                    </div>

                    <g:uploadForm action="register" controller="login" method="post" role="form">
                        <div class="form-group">
                            <label for="firstname" class="col-md-4">
                                First Name:
                            </label>
                            <div class="col-md-8">
                                <input type="text" name="firstName" class="form-control" id="firstname" placeholder="Enter First Name">
                            </div>


                        </div>

                        <div class="form-group">
                            <label for="lastname" class="col-md-4">
                                Last Name:
                            </label>
                            <div class="col-md-8">
                                <input type="text" class="form-control" name="lastName" id="lastname" placeholder="Enter Last Name">
                            </div>


                        </div>
                        <div class="form-group">
                            <label for="username" class="col-md-4">
                                Username:
                            </label>
                            <div class="col-md-8">
                                <input type="text" class="form-control" name="username" id="username" placeholder="Enter username">
                            </div>


                        </div>

                        <div class="form-group">
                            <label for="emailaddress" class="col-md-4">
                                Email address:
                            </label>
                            <div class="col-md-8">
                                <input type="email" name="email" class="form-control" id="emailaddress" placeholder="Enter email address">
                                <p class="help-block">
                                    Example: yourname@domain.com
                                </p>
                            </div>


                        </div>

                        <div class="form-group">
                            <label for="password" class="col-md-4">
                                Password:
                            </label>
                            <div class="col-md-8">
                                <input type="password" class="form-control" name="password" id="password" placeholder="Enter Password">
                                <p class="help-block">
                                    Min: 6 characters
                                </p>
                            </div>


                        </div>




                        <div class="form-group">
                            <label for="uploadimage" class="col-md-4">
                                Upload Image:
                            </label>
                            <div class="col-md-8">
                                <input type="file" name="photo" >
                                <p class="help-block">
                                    Allowed formats: jpeg, jpg, gif, png
                                </p>
                            </div>


                        </div>



                        <div class="row">
                            <div class="col-md-4">
                            </div>
                            <div class="col-md-8">
                                <button type="submit" class="btn btn-info">
                                    Register
                                </button>
                            </div>
                        </div>
                    </g:uploadForm>
                </div>


            </div>

        </div>

    </div>

</div>

</div>

</body>
</html>





