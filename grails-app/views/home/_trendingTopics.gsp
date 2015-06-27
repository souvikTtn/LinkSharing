






<%@ page import="linksharing.User; linksharing.Topic; linksharing.Resource;linksharing.Subscription;" %>
<table align="left" border="1" cellpadding="1" cellspacing="1" style="width:450px ;height: 300px">
    <thead>
    <tr>
        <th colspan="2" scope="row">
            <div style=" padding: 5px 10px;">Treding Topics</div>
        </th>
    </tr>
    </thead>
    <tbody>
    <% tredingTopics.each {Topic topic-> %>


    <tr>
        <th scope="row" style="text-align: left;">
            <div>
                <div style="float: left">
                    <p>&nbsp;&nbsp;<g:link controller="user" action="userPublicProfile" params="[userId:topic.user.id]">
                        <g:if test="${topic.user.photo}">
                            <img style="border: 4px groove black" alt="BlankImage"src="${resource(dir:'home', file:fieldValue(bean:topic.user, field:'photo'))}" width="80" height="100"/>
                        </g:if>
                        <g:else>
                            <g:img dir="images" file="userDefault.png" width="100" height="100"/>

                        </g:else></g:link></p>
                </div>

                <div style="float: right; width: 290px;">
                    <div>
                        <div style="float:inherit;">

                            <p><g:link controller="topic" action="topicShow" params='[tid:"${topic.id}"]'>${topic.name}</g:link></p>
                            <p><g:link controller="user" action="userPublicProfile" params="[userId:topic.user.id]">@${topic.user}</g:link></p>
                        </div>

                        <div style="float: left;">
                            <g:link controller="home" action="dashboard">Unsubscribe&nbsp;&nbsp;</g:link>
                        </div>
                        <div style="float: left;">

                            <p>Subscription</p>
                            <p>${topic.subscriptions.size()}</p>
                        </div>
                        <div style="float: right">
                            <p>Posts</p>
                            <p>${topic.resources.size()}</p>
                        </div>
                        <div style="float:inherit;">
                            <select name="seriousness"><option value="Serious">Serious</option><option value="VerySerious">VerySerious</option> </select> <select name="visibility"><option value="PRIVATE">PRIVATE</option><option value="PUBLIC">PUBLIC</option>&nbsp;&nbsp; </select>&nbsp; <img alt="mail" height="23" src="/linksharing/home/message.jpeg" title="mail" width="23" />
                            %{--<img alt="mail" height="23" src="/linksharing/home/editPage.jpeg" title="mail" width="23" />--}%
                            %{--<img alt="mail" height="23" src="/linksharing/home/delete.jpeg" title="mail" width="23" />--}%
                        </div>
                    </div>
                </div>

            </div>
        </th>
    </tr>
    <% }%>

    </tbody>
</table>
