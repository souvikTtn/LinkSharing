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

                        <nav class="navbar navbar-inverse">
                            <div class="container-fluid">
                                <div class="navbar-header">
                                    <button type="button" class="navbar-toggle" data-toggle="collapse"
                                            data-target="#myNavbar">
                                        <span class="icon-bar"></span>
                                        <span class="icon-bar"></span>
                                        <span class="icon-bar"></span>

                                    </button>
                                    <a class="navbar-brand" href="${createLink(controller: "home",action: "index")}">Sharing Hub</a>
                                </div>

                                <div class="collapse navbar-collapse" id="myNavbar">

                                    <ul class="nav navbar-nav">
                                        <li class="active"><a href="${createLink(controller: "home",action: "index")}" data-toggle="modal"
                                                              title="Home" style="text-decoration: none"><span
                                                    class="glyphicon glyphicon-home" style="font-size: 30px "/></a></li>



                                        <g:if test="${session["user_id"]}">
                                            <li><g:link controller="home" action="dashboard">DashBoard</g:link></li>

                                        </g:if>



                                    </ul>

                                        <g:form controller="search" action="globalSearch"
                                                    class="navbar-form navbar-left" role="search">
                                            <div class="form-group">
                                                <input type="text" name="searchKey" class="form-control"
                                                       placeholder="Search"/>
                                            </div>
                                            <button type="submit" class="btn btn-default">Search</button>
                                        </g:form>


                                <g:if test="${session["user_id"]}">
                                    <% User user = session["user"] %>



                                    <ul class="nav navbar-nav navbar-right">



                                        <li>

                                            <a href="" onclick="createTopic();
                                            return false" data-toggle="modal" title="create Topic"
                                               style="text-decoration: none">
                                                <span class="glyphicon glyphicon-comment" style="font-size: 30px "/>
                                            </a>
                                        </li>
                                        <li>

                                            <a href="" onclick="sendInvitation();
                                            return false" data-toggle="modal" title="Send invitation"
                                               style="text-decoration: none">
                                                <span class="glyphicon glyphicon-envelope" style="font-size: 30px"/>
                                            </a>
                                        </li>
                                        <li>

                                            <a href="" onclick="createLinkResource();
                                            return false" data-toggle="modal" title="Share Link"
                                               style="text-decoration: none">
                                                <span class="glyphicon glyphicon-link" style="font-size: 30px "/>
                                            </a>
                                        </li>
                                        <li>

                                            <a href="" onclick="createDocumentResource();
                                            return false" data-toggle="modal" title="Share Document"
                                               style="text-decoration: none">
                                                <span class="glyphicon glyphicon-file" style="font-size: 30px "/>
                                            </a>
                                        </li>




                                        <li class="dropdown">
                                            <a class="dropdown-toggle" data-toggle="dropdown" href="#"><span
                                                    class="glyphicon glyphicon-user" style="font-size: 30px "/><span
                                                    class="glyphicon glyphicon-arrow-down" style="font-size: 20px "/>
                                            </a>
                                            <ul class="dropdown-menu">
                                                <li><g:link controller="profile" action="editProfile"
                                                            name="userProfile">Profile</g:link></li>
                                                <g:if test="${user.admin == true}">
                                                    <li><g:link controller="user"
                                                                action="allUserList">Users</g:link></li>
                                                    <li><a href="#">Posts</a></li>
                                                    <li><a href="#">Topics</a></li>
                                                </g:if>
                                                <li><g:link controller="login" action="logout"
                                                            name="logoutAc">Log out</g:link></li>
                                            </ul>
                                        </li>
                                    </ul>

                                </g:if>
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

                        All Rights Reserved. Developed and maintained by Intelligrape.

                    </div>
                </div>

            </div>

        </div>

    </div>

</div>


<script type="text/javascript">
    $(document).ready(function () {
        $('.editTopic').on('click', function () {
            console.log($(this));
            $(this).closest('.rowBlock').find('.topic_editDiv').slideToggle()
        });

        $('.cancelEditTopic').on('click', function () {
            console.log($(this));
            $(this).closest('.rowBlock').find('.topic_editDiv').hide()
        });

        $('.readUnread').on('click', function () {


            var url = $(this).attr('href');
            var elem = $(this)
            $.ajax({
                url: url,
                dataType: 'text',

                success: function (data) {
                    alert("you have changed the status of Post")
                    elem.text(data)
                },
                error: function (request, status, error) {
                    alert(error)
                }

            });


        });


        $('.topicEditForm').on('submit', function () {

            var elem = $(this)
            var data = elem.serialize();

            $.ajax({
                url: "${createLink(controller:"topic" ,action:"editTopic" )}",
                dataType: 'text',
                data: data,
                method: 'post',

                success: function (data) {

                    elem.closest('.rowBlock').find('.topicName').text(data);
                    elem.parent().hide();
                    alert("topic edited succesfully");


                },
                error: function (request, status, error) {
                    alert(error)
                }


            });

            return false;


        });


        $('.deleteTopic').on('click', function () {


            var url = $(this).attr('href');
            var elem = $(this)
            $.ajax({
                url: url,
                dataType: 'text',

                success: function (data) {


                    elem.closest('.rowBlock').slideUp(1000, function () {
                        $(this).remove();
                        alert("topic deleted suucefully")
                    });


                },
                error: function (request, status, error) {
                    alert("topic is already deleted")
                }

            });


        });


        $('.subsUnsubs').on('click', function () {

            var elem = $(this)
            var url = elem.attr('href')
            $.ajax({
                url: url,
                dataType: "text",
                success: function (data) {
                    elem.text(data)
                    if (data == "Subscribe") {


                        elem.closest('.rowBlock').find(".topicOption").hide();
                        alert("you have succesfully unsubcribe the topic")

                    } else {

                        elem.closest('.rowBlock').find(".topicOption").show();
                        alert("you have succesfully subscribe the topic")
                    }


                },
                error: function (request, status, error) {
                    alert(error)
                }


            });


        });


    });


    var visibilityChange = function (value, topicid) {
        var dataJson = {
            visibility: value,
            tid: topicid

        };

        $.ajax({
            type: "POST",
            url: "${createLink(controller: 'topic',action: 'changeVisibility')}",
            dataType: "text",
            success: function (msg) {
                alert(msg)
            },

            data: dataJson
        });

    };


    var seriousnessChange = function (value, topicid) {
        var dataJson = {
            seriousness: value,
            tid: topicid

        };

        $.ajax({
            type: "POST",
            url: "${createLink(controller: 'subscription',action: 'changeSeriousness')}",
            dataType: "text",
            success: function (msg) {
                alert(msg)
            },

            data: dataJson
        });

    };


    var createLinkResource = function () {
        window.open("${g.createLink(controller: 'linkResource', action: 'create')}", '', 'width=500,height=400');

    }
    var createDocumentResource = function () {
        window.open("${g.createLink(controller: 'documentResource', action: 'create')}", '', 'width=500,height=400');

    }
    var createTopic = function () {
        window.open("${g.createLink(controller: 'topic', action: 'create')}", '', 'width=500,height=400');

    }
    var sendInvitation = function () {
        window.open("${g.createLink(controller: 'home', action: 'invitation')}", '', 'width=500,height=400');

    }
    var exit = function () {
        window.close()
    }
</script>

</body>
</html>



































