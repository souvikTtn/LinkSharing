
<%@ page import="linksharing.User; linksharing.Topic; linksharing.Resource;linksharing.Subscription;" %>
<%List<Resource> ls=inboxlist;
%>
<table align="left" border="1" cellpadding="1" cellspacing="1" style="width:450px;">
    <thead>
    <tr>
        <th colspan="2" scope="row">
            <div style=" padding: 5px 10px;">Inbox <span style="padding-left: 250px"> Unread : ${total}</span></div>
        </th>
    </tr>
    </thead>
    <tbody>
    <%ls.each {
    %>
    <tr>
        <th scope="row" style="text-align: left;">
            <div>
                <div style="float: left;">
                    &nbsp;&nbsp; <g:link controller="user" action="userPublicProfile" params="[userId:it.creator.id]"><g:if test="${it.creator.photo}">
                    <img style="border: 4px groove black" alt="BlankImage"src="${resource(dir:'home', file:fieldValue(bean:it.creator, field:'photo'))}" width="80" height="100"/>
                </g:if>
                    <g:else>
                        <g:img dir="images" file="userDefault.png" width="80" height="80"/>

                    </g:else></g:link>
                </div>
                <div style="margin-left: 120px; font-size: inherit;">
                    <p>${it.creator.firstName} ${it.creator.lastName} &nbsp; ${it.lastUpdated}  <span style="float: right"> <g:link controller="topic" action="topicShow" params='[tid:"${it.topic.id}"]'>${it.topic.name}</g:link></span><br />
                    &nbsp;<g:link controller="user" action="userPublicProfile" params="[userId:it.creator.id]">@${it.creator.username}</p></g:link>
                </br>
                    ${it.description} </p>
                </div>
                <div>
                    <p><g:img dir="/linksharing/assets" file="fb.jpeg"  alt="fb"  width="25"/>&nbsp; <g:img dir="/linksharing/assets" file="twitter_ico.png" alt="twitter"  width="25"/>&nbsp; <g:img dir="/linksharing/assets" file="gPlus.png"  alt="gplus"  width="25"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span style="font-size:9px;"><span style="color: rgb(0, 0, 255);"><u>Download</u></span></span> <span style="font-size:9px;"><span style="color: rgb(0, 0, 255);"><u>ViewFullSite</u></span></span> <span style="font-size:9px;"><span style="color: rgb(0, 0, 255);"><u>MarkAsRead</u></span></span> <span style="font-size:9px;"><span style="color: rgb(0, 0, 255);"><u><g:link controller="resource" action="showPost" params='[rid:"${it.id}"]'>ViewPost</g:link></u></span></span></p>
                </div>
            </div>
        </th>
    </tr>
    <% }%>


    </tbody>
    <g:paginate total="${total}" max="3" params="[q:params.q]"/>
</table>
