<%--
  Created by IntelliJ IDEA.
  User: umesh
  Date: 7/7/15
  Time: 6:09 PM
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
        <div class="col-md-12">

            <div class ="row" id="createTopic">
                <div class ="col-md-3"></div>
                <div class ="col-md-6">
                    <%if(flash?.message){%>
                        <li>${flash.message}</li>
                    <% }%>

                    <%if(flash?.topic){%>
                    <g:renderErrors bean="${flash.topic}" />
                    <% }%>

                        <h1>Create Topic</h1>
                    <g:form name="myForm"  url="[controller: 'topic', action: 'save',]">
                        <div class="form-group">
                            <label for="topic">Topic Name:</label>
                            <input type="text"  name="name" class="form-control" id="tname">
                        </div>
                        <div class="form-group">
                            <label for="visibility">Visibility:</label>
                            <select name="visibility" id="visibility">
                                <option value="PUBLIC">Public</option>
                                <option value="PRIVATE">Private</option>
                            </select>

                        </div>


                        <input name="topicSave" id="topicSave" type="submit" value="create" />
                        <input name="topicSave" id="topicSave" type="button" value="cancel" onclick="exit()" />
                    </g:form>


                </div>
                <div class ="col-md-3"></div>

            </div>


        </div>
    </div>

</div>
</body>
</html>

