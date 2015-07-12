<%--
  Created by IntelliJ IDEA.
  User: umesh
  Date: 7/7/15
  Time: 8:01 PM
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

        <%if( flash?.documentResource){%>
        <g:renderErrors bean="${ flash.documentResource}" />
        <% }%>
        <h1>Share Document Post</h1>

        <g:uploadForm url="[controller:'documentResource',action:'save']">
            <div class="form-group">
                <label for="file">File:</label>
                <input type="file"  name="file" class="form-control" id="file" required>
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
        </g:uploadForm>


    </div>
    <div class ="col-md-3"></div>

</div>

</body>
</html>