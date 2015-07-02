<%--
  Created by IntelliJ IDEA.
  User: umesh
  Date: 18/6/15
  Time: 12:50 AM
--%>



<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
<%@ page import="linksharing.User; linksharing.Topic; linksharing.Resource;linksharing.Subscription;" %>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title><g:layoutTitle default="Grails"/></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="${assetPath(src: 'favicon.ico')}" type="image/x-icon">
    <link rel="apple-touch-icon" href="${assetPath(src: 'apple-touch-icon.png')}">
    <link rel="apple-touch-icon" sizes="114x114" href="${assetPath(src: 'apple-touch-icon-retina.png')}">

 %{--<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>--}%




    <asset:stylesheet src="application.css"/>
    <asset:javascript src="application.js"/>
    <g:layoutHead/>
</head>

<body>
<div class="container-fluid">
    <div class="row">

        <div class="col-md-12">

            <div class="row">
                <div class="col-md-12">
                    <div id="header">
                        %{--<h1>LinkSharing</h1>--}%





                        <nav class="navbar navbar-inverse">
                            <div class="container-fluid">
                                <div class="navbar-header">
                                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                                        <span class="icon-bar"></span>
                                        <span class="icon-bar"></span>
                                        <span class="icon-bar"></span>

                                    </button>
                                    <a class="navbar-brand" href="#">LinkSharing</a>
                                </div>
                                <div class="collapse navbar-collapse" id="myNavbar">

                                    <ul class="nav navbar-nav">
                                        <li class="active"><g:link controller="login" action="index">Home</g:link></li>
                                        <%
                                            if(session["user_id"]!=null)
                                            {

                                        %>
                                        <li ><g:link controller="home" action="dashboard">DashBoard</g:link></li>
                                        <% } %>

                                    </ul>
                                    <%
                                        if(session["user_id"]!=null)
                                        {
                                            User user=session["user"]

                                    %>



                                    <ul class="nav navbar-nav navbar-right">
                                        <li> <form class="navbar-form navbar-left" role="search">
                                            <div class="form-group">
                                                <input type="text" class="form-control" placeholder="Search">
                                            </div>
                                            <button type="submit" class="btn btn-default">Submit</button>
                                        </form>
                                        </li>

                                        <li><button type="button" class="btn btn-default btn-lg" aria-label="Left Align">
                                            Topic
                                        </button>
                                        </li>
                                        <li>

                                            <button type="button" class="btn btn-default btn-lg">
                                                Link Post
                                            </button>
                                        </li>
                                        <li>

                                            <button type="button" class="btn btn-default btn-lg">
                                                Docoument Post
                                            </button>
                                        </li>
                                        <li>

                                            <button type="button" class="btn btn-default btn-lg">
                                                Send Invitation
                                            </button>
                                        </li>

                                        <li class="dropdown">
                                            <a class="dropdown-toggle" data-toggle="dropdown" href="#"> <span class="caret"></span></a>
                                            <ul class="dropdown-menu">
                                                <li> <g:link controller="profile" action="editProfile" name="userProfile">Profile</g:link></li>
                                                <g:if test="${user.admin==true}">
                                                <li><g:link controller="user" action="allUserList">Users</g:link></li>
                                                <li><a href="#">Posts</a></li>
                                                <li><a href="#">Topics</a></li>
                                                </g:if>
                                                <li><g:link controller="login" action="logout" name="logoutAc"> Log out</g:link></li>
                                            </ul>
                                        </li>
                                    </ul>

                                    <% } %>
                                </div>
                            </div>
                        </nav>











                        %{--dfasdf--}%




                    </div>
                </div>

            </div>

            <div class="row">
                <div class="col-md-12">
                    <div>
                        <g:layoutBody/>
                    </div>
                </div>

            </div>



            <div class="row">
                <div class="col-md-12">
                    <div id="footer">
                        Copyright © intelligrape pvt ltd.

                    </div>
                </div>

            </div>



        </div>

    </div>

</div>




</body>
</html>



































