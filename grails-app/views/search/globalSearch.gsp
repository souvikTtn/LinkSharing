<%--
  Created by IntelliJ IDEA.
  User: umesh
  Date: 8/7/15
  Time: 12:16 PM
--%>
<%@ page import="linksharing.*"%>
<% User user =session["user"]%>
<html>
<head>
    <meta name="layout" content="linksharing"/>
    <title>Linsharinng Web Application</title>


</head>

<body>
<div class="container">
    <div class="row">
        <div class="col-md-6">
            <div class="row">
                <div class="col-md-12">
                    <g:render template="/home/5trendingTopics" model="[tredingTopics:tredingTopics]"/>
                </div>

            </div>

            %{--<div class="row">--}%
                %{--<div class="col-md-12">--}%

                    %{--<g:render template="userTopics" model="[topics:userTopic]"/>--}%

                %{--</div>--}%

            %{--</div>--}%
        </div>

        <div class="col-md-6" >
            <div id="filteredSearchDiv">

            <g:render template="searchResult" model="[searchResult:searchResult,searchKey:searchKey,totalSearchResult:totalSearchResult]"/>
            </div>
        </div>



    </div>

</div>
</body>
</html>
