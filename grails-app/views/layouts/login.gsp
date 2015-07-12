<%--
  Created by IntelliJ IDEA.
  User: umesh
  Date: 29/6/15
  Time: 11:26 AM
--%>


<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title><g:layoutTitle default="Linksharing"/></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="${assetPath(src: 'favicon.ico')}" type="image/x-icon">
    <link rel="apple-touch-icon" href="${assetPath(src: 'apple-touch-icon.png')}">
    <link rel="apple-touch-icon" sizes="114x114" href="${assetPath(src: 'apple-touch-icon-retina.png')}">
    <asset:stylesheet src="application.css"/>
    <asset:javascript src="application.js"/>

    <g:layoutHead/>

</head>
<body>
<div class="container">
    <div class="row">

        <div class="col-md-12">

            <div class="row">
                <div class="col-md-12">
                    <div id="header">

                        <nav class="navbar navbar-inverse">
                            <div class="container-fluid">
                                <div class="navbar-header">
                                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                                        <span class="icon-bar"></span>
                                        <span class="icon-bar"></span>
                                        <span class="icon-bar"></span>
                                    </button>
                                    <a class="navbar-brand" href="${createLink(controller: "login",action: "index")}" >LinkSharing</a>
                                </div>
                                <div class="collapse navbar-collapse" id="myNavbar">
                                    <ul class="nav navbar-nav">
                                        <li class="active"><a href="${createLink(controller: "login",action: "index")}"  data-toggle="modal" title="Home" style="text-decoration: none"><span class="glyphicon glyphicon-home" style="font-size: 30px "/></a></li>


                                    </ul>
                                    <ul class="nav navbar-nav navbar-right">
                                        <li><g:form controller="search" action="globalSearch"
                                                    class="navbar-form navbar-left" role="search">
                                            <div class="form-group">
                                                <input type="text" name="searchKey" class="form-control"
                                                       placeholder="Search"/>
                                            </div>
                                            <button type="submit" class="btn btn-default">Search</button>
                                        </g:form>
                                        </li>
                                        </ul>


                                </div>
                            </div>
                        </nav>






                    </div>
                </div>

            </div>

            <div class="row">
                <div class="col-md-12">
                    <div  class="webpageData" style="background-color: white">

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



