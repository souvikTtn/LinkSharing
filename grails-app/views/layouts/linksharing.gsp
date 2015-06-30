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
<div id="grailsLogo" role="banner">
    %{--<asset:image src="skin/social_media_banner.jpg" alt="LinksharingApp..."/>--}%
    <span style="font-size: xx-large">Linksharing Application
    </span>


    <div style="float: right; margin-top: 0px;">
        <%
            if(session["user_id"]!=null)
            {
                User user=session["user"]

        %>
        <div style="float: right;" >

            <div style="position: relative;float: right">




                <span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>
                &nbsp;

                <span class="glyphicon glyphicon-paperclip" aria-hidden="true"></span>

                &nbsp;

                <span class="glyphicon glyphicon-file" aria-hidden="true"></span>

                &nbsp;

                <span class="glyphicon glyphicon-text-width" aria-hidden="true"></span>








                <img src="/home/${user.photo}" name="submit" type="image"style="height: 25px ;width: 20px;padding: 0px"/> ${user.username}

                <input id="dropSubmit" name="dropSubmit" type="button" style="height: 20px ;width: 20px;padding: 0px">

                <div class="dropOption"  style="position:absolute;width: 100%;height:200px">
                    <g:link controller="profile" action="editProfile" name="userProfile"><span style="border:solid;width:50px;float:left;clear: right">Profile</span></g:link>
                    <g:if test="${user.admin==true}">
                        <g:link controller="user" action="allUserList"> <span style="border: solid;float: left;;width:50px;clear: left">Users</span></g:link>
                        <span style="border: solid;float: left;width:50px;clear: left">Topic</span>

                        <span style="border: solid;float: left;width:50px;clear: left">Posts</span>
                    </g:if>
                    <g:link controller="login" action="logout" name="logoutAc"><span style="border: solid;width:50px;float: left;clear: left">Logout</span></g:link>
                </div>

            </div>
        </div>
        <%}%>
        <div style="float: right">
            <form id="search-form" name="search" action="" method="get">
                <input type="text" placeholder="Search" name="" class="placeholder" style=" height: 30px;">
                <input  name="submit" type="submit" value="submit" style="float:right; height: 25px ;width: 70px;padding: 0px">
            </form>
        </div>
    </div>
























</div>

<g:layoutBody/>
<div class="footer" role="contentinfo"></div>
<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
</body>
</html>



<script type="text/javascript">
    $(function() {
        $('#dropSubmit').click(function() {
            $('.dropOption').toggle(1000);
            return false;
        });

    });

</script>