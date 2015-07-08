<%@ page import="linksharing.*"%>
<% User user =session["user"]%>


<div>
    <div class="row">
        <div class="col-md-12">
            <div class="row"  style="margin-top: 10px ;border:outset ;" >
                <div class="col-md-6"> <div style="font-size: 18px;font-weight: bold">Subcription</div></div>
                <div class="col-md-6">
                       <g:link controller="subscription" action="userSubscription" params="[uid:user.id]">view All</g:link>
                </div>
            </div>

            <div class="row">

                <div class="col-md-12" >

                    <% subscriptionsTop5Topic.each {Topic topic ->  %>


                   <div class="row" style="margin-top: 2px;margin-bottom: 2px; ; border: outset;" >
                    <div class="col-md-12" >



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

                                        <div class="col-md-4">
                                            <%   if(Subscription.countByUserAndTopic(user,topic)==1)  {   %>
                                                    <%   if(topic.user.id!= user.id)  {   %>

                                            <g:link controller="subscription" action="unSubcribeTopic" params="[tid: topic.id]">unsubscribe</g:link>

                                                        <%  }   %>
                                            <%  }else {   %>
                                            <g:link controller="subscription" action="subscribeTopic" params="[tid: topic.id]">Subscribe</g:link>

                                            <%  }  %>



                                        </div>

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








                    <% } %>
                </div>



            </div>



        </div>


    </div>
</div>




<script>
    $(document).ready(function(){
        $(".editTopic").click(function(){
            $(".topic_editDiv").toggle();
        });
    });
</script>













