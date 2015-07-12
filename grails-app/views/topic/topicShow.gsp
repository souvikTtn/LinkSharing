<%--
  Created by IntelliJ IDEA.
  User: umesh
  Date: 24/6/15
  Time: 4:16 PM


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

            <div class="row">

                <div class="col-md-6">
                    <g:render template="topicHead"/>




                    <div class="row">
                        <div class="col-md-12">

                            <g:render template="topicUser" model="[users:topicUsers,topic: topic]"/>
                        </div>
                    </div>



                </div>
                <div class="col-md-6">
                    <div class="row">
                        <div class="col-md-12">


                            <g:render template="topicResources" model="[resources:topicResources,topic:topic]"/>


                        </div>
                    </div>



                </div>

            </div>


        </div>
    </div>

</div>
</body>
</html>




