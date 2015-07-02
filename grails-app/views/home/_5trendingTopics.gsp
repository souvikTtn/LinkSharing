<%@ page import="linksharing.*"%>
<% User user =session["user"]%>


<div>
    <div class="row">
        <div class="col-md-12">
            <div class="row"  style="margin-top: 10px ;border:outset ;" >
                <div class="col-md-12"> <div style="font-size: 18px;font-weight: bold">Trending Topics</div></div>

            </div>

            <div class="row">

                <div class="col-md-12" >

                    <% tredingTopics.each {Topic topic ->  %>


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
                                        <div topic="topic_edit">
                                            <form>
                                                <input type="text" value="${topic.name}"/>&nbsp;<input class="btn btn-info" type="submit" value="save"/><input class="btn btn-info" type="submit" value="cancel"/>
                                            </form>


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

                                                    <g:link controller="user" action="userPublicProfile" params="[userId:topic.user.id]">unsubscribe</g:link>

                                                            <%  }   %>
                                                    <%  }else {   %>
                                                    <g:link controller="user" action="userPublicProfile" params="[userId:topic.user.id]">Subscribe</g:link>

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
                                    <div>
                                        <select class="form-control" name="seriousness">
                                            <option >Serious</option>
                                            <option>VersySerious</option>
                                            <option>Casual</option>

                                        </select>
                                    </div>
                                </div>

                                <div class="col-md-2"><input class="btn btn-info" type="submit" value="invite"/></div>
                                <% if(user.admin==true || topic.user.id ==session["user_id"]){      %>
                                <div class="col-md-3">
                                    <div>
                                        <select class="form-control" name="visibility">
                                            <option >PUBLIC</option>
                                            <option>PRIVATE</option>
                                        </select>
                                    </div>



                                </div>

                                <div class="col-md-2"><input class="btn btn-info" type="submit" value="edit"/></div>
                                <div class="col-md-2"><input class="btn btn-info" type="submit" value="delete"/></div>
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





