<%@ page import="linksharing.* "%>

<div>
    <div class="row">
        <div class="col-md-12">
            <div class="row"  style="margin-top: 10px ;border:outset ;" >
                <div class="col-md-4"> <div style="font-size: 18px;font-weight: bold">Inbox(${total})</div></div>
                <div class="col-md-8">
                    <div>
                    <form>
                        <input type="text" placeholder="search"/>&nbsp;<input class="btn btn-info" type="submit" value="search"/>
                    </form>
                    </div>
                </div>
            </div>

            <div class="row">

                <div class="col-md-12" >

                  <% inboxlist.each {post ->  %>




                    <div class="row" style="margin: 1px ; border: outset;">
                        <div class="col-md-3">
                            <div >
                                <g:link controller="user"  action="userPublicProfile" params="[userId:post.creator.id]">
                                    <g:if test="${post.creator.photo}">
                                        <img  class="img-circle " alt="BlankImage"src="${resource(dir:'home', file:fieldValue(bean:post.creator, field:'photo'))}" width="80" height="80"/>
                                    </g:if>
                                    <g:else>
                                        <g:img dir="images" class="img-responsive" file="userDefault.png" width="80" height="80"/>

                                    </g:else>
                                </g:link>
                            </div>



                        </div>
                        <div class="col-md-9" >

                            <div class="row">

                                <div class="col-md-6"><g:link controller="user" action="userPublicProfile" params="[userId:post.creator.id]"> @${post.creator.username} </g:link></div>

                                <div class="col-md-6"><g:link controller="topic" action="topicShow" params="[tid:post.topic.id]"> ${post.topic}</g:link></div>

                            </div>
                            <div class="row">
                                <div class="col-md-12">${post.description}</div>
                            </div>
                            <div class="row">
                              <div class="col-md-4">
                                <g:if test="${post.instanceOf(DocumentResource)}">Download                                </g:if>
                                    <g:else><a href="${post.url}"> ViewFullSite</a> </g:else>


                                </div>
                                <div class="col-md-4"><g:link controller="home" action="dashboard" params='[rid:"${post.id}"]'>MarkAsRead</g:link></div>
                                <div class="col-md-4"> <g:link controller="resource" action="showPost" params='[rid:"${post.id}"]'>ViewPost</g:link></div>


                            </div>
                            <div class="row">
                                <div class="col-md-12" style="align-items: center"><g:img dir="/linksharing/assets" file="fb.jpeg"  alt="fb"  width="25"/><g:img dir="/linksharing/assets" file="twitter_ico.png" alt="twitter"  width="25"/>&nbsp; <g:img dir="/linksharing/assets" file="gPlus.png"  alt="gplus"  width="25"/></div>


                            </div>


                        </div>
                    </div>



                    <% } %>
                </div>



            </div>

            <div class="row">
                <div class="col-md-12" style="border: outset">
                    <g:paginate total="${total}" max="5" params="[q:params.q]"/>

                </div>
            </div>

        </div>


    </div>
</div>



