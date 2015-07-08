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
                    <div class="row">
                        <div class="col-md-12">

                            <div class="row" style="margin-top: 2px;margin-bottom: 2px; ; border: outset;background-color: skyblue;" >
                                <div class="col-md-12" >
                                    <div class="row">
                                        <div class ="col-md-12" style="background-color: transparent;border: double;">
                                            <h1>Topic :"${topic.name}"</h1>
                                        </div>
                                    </div>


                                    <div class="row" >
                                        <div class="col-md-3">
                                            <div >
                                                <g:link controller="user"  action="userPublicProfile" params="[userId:topic.user.id]">
                                                    <g:if test="${topic.user.photo}">
                                                        <img  class="img-circle " alt="BlankImage"src="${resource(dir:'home', file:fieldValue(bean:topic.user, field:'photo'))}" width="80" height="80"/>
                                                    </g:if>
                                                    <g:else>
                                                        <g:img dir="images" class="img-responsive" file="userDefault.png" width="80" height="80"/>

                                                    </g:else>
                                                </g:link>
                                            </div>



                                        </div>
                                        <div class="col-md-9" >

                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="topicName">
                                                        <h3> <g:link controller="topic" action="topicShow" params='[tid:"${topic.id}"]'>${topic.name}</g:link></h3></div>
                                                </div>
                                                <div class="topic_editDiv" hidden="hidden">
                                                    <g:form controller="topic" action="editTopic">
                                                        <input type="text" name="topicName" value="${topic.name}"/> <g:hiddenField name="tid" value="${topic.id}"/> &nbsp;<input class="btn btn-info" type="submit" value="save"/><input class="btn btn-info" type="button" value="cancel"/>
                                                    </g:form>


                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="row">

                                                        <div class="col-md-4">  <g:link controller="user" action="userPublicProfile" params="[userId:topic.user.id]">@${topic.user.username}</g:link></div>
                                                        <div class="col-md-4"> Subscription</div>
                                                        <div class="col-md-4">Post</div>

                                                    </div>
                                                    <div class="row">
                                                        <% if (session["user_id"]) { %>

                                                        <div class="col-md-4">
                                                            <%   if(Subscription.countByUserAndTopic(user,topic)==1)  {   %>
                                                            <%   if(topic.user.id!= user.id)  {   %>

                                                            <g:link controller="subscription" action="unSubcribeTopic" params="[tid: topic.id]">unsubscribe</g:link>

                                                            <%  }   %>
                                                            <%  }else {   %>
                                                            <g:link controller="subscription" action="subscribeTopic" params="[tid: topic.id]">Subscribe</g:link>

                                                            <%  }  %>



                                                        </div>
                                                        <%  }  %>

                                                        <div class="col-md-4"> ${topic.subscriptions.size()}</div>
                                                        <div class="col-md-4">${topic.resources.size()}</div>

                                                    </div>

                                                </div>
                                            </div>



                                        </div>
                                    </div>

                                    <%   if(Subscription.countByUserAndTopic(user,topic)==1)  {   %>
                                    <div class="row">

                                        <div class="col-md-3">
                                            <div class="dropdown">
                                                <button class="btn btn-default dropdown-toggle" type="button" id="menu1" data-toggle="dropdown">Seriousness
                                                    <span class="caret"></span></button>
                                                <ul class="dropdown-menu" role="menu" aria-labelledby="menu1">
                                                    <li role="presentation"><a role="menuitem" tabindex="-1" href="${createLink(controller: "subscription",action: "changeSeriousness",params:[tid:topic.id,seriousness:"SERIOUS"])}">Serious</a></li>
                                                    <li role="presentation"><a role="menuitem" tabindex="-1" href="${createLink(controller: "subscription",action: "changeSeriousness",params:[tid:topic.id,seriousness: "VERY_SERIOUS"])}">Very Serious</a></li>
                                                    <li role="presentation"><a role="menuitem" tabindex="-1" href="${createLink(controller: "subscription",action: "changeSeriousness",params:[tid:topic.id,seriousness: "CASUAL"])}">Casual</a></li>


                                                </ul>
                                            </div>
                                        </div>

                                        <div class="col-md-2"><input class="btn btn-info" type="submit" value="invite"/></div>
                                        <% if(user.admin==true || topic.user.id ==session["user_id"]){      %>
                                        <div class="col-md-3">

                                            <div class="dropdown">
                                                <button class="btn btn-default dropdown-toggle" type="button" id="menu1" data-toggle="dropdown">Visibility
                                                    <span class="caret"></span></button>
                                                <ul class="dropdown-menu" role="menu" aria-labelledby="menu1">
                                                    <li role="presentation"><a role="menuitem" tabindex="-1" href="${createLink(controller: "topic",action: "changeVisibility",params:[tid:topic.id,visibility:"PUBLIC"])}">PUBLIC</a></li>
                                                    <li role="presentation"><a role="menuitem" tabindex="-1" href="${createLink(controller: "topic",action: "changeVisibility",params:[tid:topic.id,visibility:"PRIVATE"])}">PRIVATE</a></li>

                                                </ul>
                                            </div>

                                        </div>

                                        <div class="col-md-2"><input  type="submit"  class="editTopic" value="edit"/></div>
                                        <div class="col-md-2"><a href="${createLink(controller: "topic",action: "deleteTopic",params:[tid:topic.id])}" class="btn btn-info" role="button">Delete</a></div>
                                        <% } %>
                                    </div>



                                    <% } %>

                                </div>
                            </div>



                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                          <div class="row">
                              <div class="col-md-12" style="border: outset;font-weight: bold;font-size: 20px;margin-top: 15px; ">

                                  users:"${topic.name}"
                              </div>

                          </div>
                            <div class="row">
                                <div class="col-md-12" style="border: outset; ">

                                    <g:render template="topicUser" model="[users:topicUsers]"/>
                                </div>




                            </div>









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






%{--<div style="width: 40%;float: left;">--}%



    %{--<div style="float:left;border:solid thick ;border-radius: 25px;height:250px;width:450px;margin-bottom: 2px">--}%

        %{--<table align="left" border="1" cellpadding="1" cellspacing="1" style="width:450px ;height: 250px">--}%
            %{--<thead>--}%
            %{--<tr>--}%
                %{--<th colspan="2" scope="row">--}%
                    %{--<div style=" padding: 5px 10px;">Topic : ${topic.name}</div>--}%
                %{--</th>--}%
            %{--</tr>--}%
            %{--</thead>--}%
            %{--<tbody>--}%
            %{--<tr>--}%
                %{--<th scope="row" style="text-align: left;">--}%
                    %{--<div>--}%

                        %{--<div style="float: left; width: 290px;">--}%
                            %{--<div>--}%
                                %{--<div style="float:inherit;">--}%

                                    %{--<p>${topic.name} (${topic.visibility})</p>--}%
                                    %{--<p>@${topic.user}</p>--}%
                                %{--</div>--}%

                                %{--<div style="float: left;">--}%
                                    %{--<g:if test="${showToSubscribe}">--}%
                                        %{--<g:link controller="home" action="dashboard">subscribe&nbsp;&nbsp;</g:link>--}%
                                    %{--</g:if>--}%
                                    %{--<g:else>--}%
                                        %{--<g:link controller="home" action="dashboard">Unsubscribe&nbsp;&nbsp;</g:link>--}%
                                    %{--</g:else>--}%
                                %{--</div>--}%
                                %{--<div style="float: left;">--}%

                                    %{--<p>Subscription</p>--}%
                                    %{--<p>${topic.subscriptions.size()}</p>--}%
                                %{--</div>--}%
                                %{--<div style="float: right">--}%
                                    %{--<p>Posts</p>--}%
                                    %{--<p>${topicResources.size()}</p>--}%
                                %{--</div>--}%
                                %{--<div style="float:inherit;">--}%
                                    %{--<select name="seriousness"><option value="Serious">Serious</option><option value="VerySerious">VerySerious</option> </select>--}%

                                %{--</div>--}%

                            %{--</div>--}%
                        %{--</div>--}%

                    %{--</div>--}%
                %{--</th>--}%
            %{--</tr>--}%


            %{--</tbody>--}%
        %{--</table>--}%

    %{--</div>--}%
    %{--<div style="float:left;border:solid thick ;border-radius: 25px;height:250px;width:450px;margin-bottom: 2px">--}%

        %{--<table align="left" border="1" cellpadding="1" cellspacing="1" style="width:450px ;height: 250px">--}%
            %{--<thead>--}%
            %{--<tr>--}%
                %{--<th colspan="2" scope="row">--}%
                    %{--<div style=" padding: 5px 10px;">Users :"${topic.name}"</div>--}%
                %{--</th>--}%
            %{--</tr>--}%
            %{--</thead>--}%
            %{--<tbody>--}%
            %{--<tr>--}%
                %{--<th scope="row" style="text-align: left;">--}%
                    %{--<div>--}%

                        %{--<div style="float: left; width: 300px;">--}%
                            %{--<div>--}%
                                %{--<div style="float:left;align-items: center">--}%
                                    %{--<g:each in="${topicUsers}" var="user">--}%

                                        %{--<g:render template="/user/userInformationDiv" model="[user:user]" />--}%
                                    %{--</g:each>--}%

                                %{--</div>--}%

                            %{--</div>--}%
                        %{--</div>--}%

                    %{--</div>--}%
                %{--</th>--}%
            %{--</tr>--}%


            %{--</tbody>--}%
        %{--</table>--}%

    %{--</div>--}%


%{--</div>--}%

%{--<div style="border:solid thick ;float:right;border-radius: 25px;height:auto;width:460px;overflow:scroll">--}%
    %{--<g:render template="showPosts"  model="[topic:topic,topicResources:topicResources,total:topicResources.size()]" />---}%
%{--</div>--}%