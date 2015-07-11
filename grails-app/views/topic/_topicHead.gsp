
<%@ page import="linksharing.*" %>
<% User user = session["user"] %>
<div class="panel panel-default">
    <!-- Default panel contents -->
    <div class="panel-heading">
        <div class="row">
            <div class="col-md-12"><h1>Topic :"${topic.name}"</h1></div>


        </div>
    </div>

    <ul class="list-group">



        <li class="list-group-item">

            <div class="row">
                <div class="rowBlock">

                    <div class="row">
                        <div class="col-md-3">
                            <div>
                                <g:link controller="user" action="userPublicProfile"
                                        params="[userId: topic.user.id]">
                                    <g:if test="${topic.user.photo}">
                                        <img class="img-circle " alt="BlankImage"
                                             src="${resource(dir: 'home', file: fieldValue(bean: topic.user, field: 'photo'))}"
                                             width="80" height="80"/>
                                    </g:if>
                                    <g:else>
                                        <g:img dir="images" class="img-responsive" file="userDefault.png"
                                               width="80" height="80"/>

                                    </g:else>
                                </g:link>
                            </div>

                        </div>

                        <div class="col-md-9">

                            <div class="row">
                                <div class="col-md-12">
                                    <div>
                                        <h3><a class="topicName"
                                               href="${createLink(controller: "topic", action: "topicShow", params: [tid: topic.id])}">${topic.name}</a>
                                        </h3>
                                    </div>
                                </div>

                                <div class="topic_editDiv" hidden="hidden">
                                    <g:form class="topicEditForm">
                                        <input type="text" name="topicName" value="${topic.name}"
                                               required/> <g:hiddenField name="tid"
                                                                         value="${topic.id}"/> &nbsp;<input
                                            class="btn btn-info" type="submit" value="save"/><input
                                            class="cancelEditTopic" type="button" value="cancel"/>
                                    </g:form>

                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-12">
                                    <div class="row">

                                        <div class="col-md-4"><g:link controller="user"
                                                                      action="userPublicProfile"
                                                                      params="[userId: topic.user.id]">@${topic.user.username}</g:link></div>

                                        <div class="col-md-4">Subscription</div>

                                        <div class="col-md-4">Post</div>

                                    </div>

                                    <div class="row">

                                        <div class="col-md-4">
                                            <div class="changeSubscriptionDiv">

                                                <g:if test="${(Subscription.countByUserAndTopic(user, topic) == 1)}">

                                                    <g:if test="${(topic.user.id != user.id)}">
                                                        <a class="unsubscribe" href="${
                                                            createLink(controller: "subscription", action: "subscrineAndUnsubscribe", params: [tid: topic.id])}"
                                                           onclick="return false">Unsubscribe</a>

                                                    </g:if>
                                                </g:if>
                                                <g:else>


                                                    <a class="subscribe" href="${
                                                        createLink(controller: "subscription", action: "subscrineAndUnsubscribe", params: [tid: topic.id])}"
                                                       onclick="return false">Subscribe</a>


                                                </g:else>
                                            </div>

                                        </div>

                                        <div class="col-md-4">${topic.subscriptions.size()}</div>

                                        <div class="col-md-4">${topic.resources.size()}</div>

                                    </div>

                                </div>
                            </div>

                        </div>
                    </div>

                    <% def sub = Subscription.findByUserAndTopic(user, topic);%>

                    <g:if test="${sub}">

                        <div class="row">
                            <div class="topicOption">

                                <div class="col-md-4">
                                    <g:select
                                            onchange="seriousnessChange(value,'${topic.id}')"
                                            value="${sub.seriousness}"
                                            name="seriousness"
                                            from="${linksharing.Seriousness}"/>

                                </div>

                                <div class="col-md-1"><a href="${
                                    createLink(controller: 'home', action: 'invitation', params: [topicId: topic.id])}"><span
                                        class="glyphicon glyphicon-envelope" aria-hidden="true"
                                        style="font-size: 25px"></span></a></div>

                                <g:if test="${(user.admin == true || topic.user.id == session["user_id"])}">



                                    <div class="col-md-3">
                                        <g:select
                                                onchange="visibilityChange(value,'${topic.id}')"
                                                value="${topic.visibility}"
                                                name="visibility"
                                                from="${linksharing.Visibility}"/>

                                    </div>

                                    <div class="col-md-2"><a href="" onclick="return false" class="editTopic"><span
                                            class="glyphicon glyphicon-edit" aria-hidden="true"
                                            style="font-size: 25px"></span></a></div>

                                    <div class="col-md-2"><a href="${
                                        createLink(controller: "topic", action: "deleteTopic", params: [tid: topic.id])}"
                                                             class="deleteTopic" onclick="return false"
                                                             role="button"><span class="glyphicon glyphicon-trash"
                                                                                 aria-hidden="true"
                                                                                 style="font-size: 25px"></span></a>
                                    </div>
                                </g:if>

                            </div>
                        </div>
                    </g:if>




                </div>
            </div>

        </li>



    </ul>


    <div class="panel-footer"></div>
</div>





