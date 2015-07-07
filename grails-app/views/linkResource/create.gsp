<%--
  Created by IntelliJ IDEA.
  User: umesh
  Date: 7/7/15
  Time: 7:36 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="linksharing"/>
    <title></title>
</head>

<body>
<%@ page import="linksharing.*;" %>

<div class ="row" id="createLinkPost">
    <div class ="col-md-3"></div>

    <div class ="col-md-6">
        <%if(flash?.message){%>
        <li>${flash.message}</li>
        <% }%>

        <%if(flash?.linkResource){%>
        <g:renderErrors bean="${flash.linkResource}" />
        <% }%>


        <g:form url="[controller:'LinkResource',action:'save']">
            <div class="form-group">
                <label for="url">Link:</label>
                <input type="text"  name="url" class="form-control" id="url">
            </div>
            <div class="form-group">
                <label for="Description">Description:</label>
                <textarea class="form-control" name="description" rows="4" id="description"></textarea>
            </div>
            <div class="form-group">
                <label for="topic">Topic:</label>

                <g:select name="topicId" style="width:175px"
                          from="${subscribedTopics}"
                          optionKey="id"
                          optionValue="name"/>

            </div>

            <input name="b1" type="submit" value="Share" /></p>
        </g:form>


    </div>
    <div class ="col-md-3"></div>

</div>

</body>
</html>