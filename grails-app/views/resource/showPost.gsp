<%--
  Created by IntelliJ IDEA.
  User: umesh
  Date: 25/6/15
  Time: 1:39 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="linksharing.User; linksharing.Topic; linksharing.Resource;linksharing.Subscription;linksharing.DocumentResource" %>
<html>
<head>
    <g:applyLayout name="linksharing" ></g:applyLayout>
    <title></title>
</head>

<body>

<div style="border:solid thick ;float:left;border-radius: 25px;height:auto;width:600px;">
    <table align="left" border="1" cellpadding="1" cellspacing="1" style="width:600px;">
        <thead>
        </thead>
        <tbody>
        <tr>
            <th scope="row" style="text-align: left;">
                <div>
                    <div style="float: left;">
                        &nbsp;&nbsp;
                        <g:link controller="user" action="userPublicProfile" params="[userId:resource.creator.id]"> <g:if test="${resource.creator.photo}">
                        <img style="border: 4px groove black" alt="BlankImage"src="${resource(dir:'home', file:fieldValue(bean:resource.creator, field:'photo'))}" width="80" height="100"/>
                    </g:if>
                        <g:else>
                            <g:img dir="images" file="userDefault.png" width="100" height="100"/>

                        </g:else>
                    </g:link>
                    </div>
                    <div style="margin-left: 120px; font-size: inherit;">
                  <g:link controller="user" action="userPublicProfile" params="[userId:resource.creator.id]"> ${resource.creator.firstName} ${resource.creator.lastName} </g:link> &nbsp; ${resource.lastUpdated}  <span style="float: right"> <g:link controller="topic" action="topicShow" params='[tid:"${resource.topic.id}"]'>${resource.topic.name}</g:link></span><br />
                    &nbsp;<g:link controller="user" action="userPublicProfile" params="[userId:resource.creator.id]">@${resource.creator.username}</g:link> <span style="float: right"> RateResource<select name="rate" > <option value="1">1</option><option value="2">2</option> </select> Number Of User Rated:${ratedUserCount} </span></p>
                    </br>
                        ${resource.description}
                    </div>
                    <div>
                        <p><g:img dir="/linksharing/assets" file="fb.jpeg"  alt="fb"  width="25"/>&nbsp; <g:img dir="/linksharing/assets" file="twitter_ico.png" alt="twitter"  width="25"/>&nbsp; <g:img dir="/linksharing/assets" file="gPlus.png"  alt="gplus"  width="25"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <g:if test="${showToEditAndDelete}">
                                <span style="font-size:14px;"><span style="color: rgb(0, 0, 255);"><u>Edit</u></span></span>
                                <span style="font-size:14px;"><span style="color: rgb(0, 0, 255);"><u>Delete</u></span></span>
                            </g:if>
                            <g:if test="${resource.instanceOf(DocumentResource)}">

                                <span style="font-size:14px;"><span style="color: rgb(0, 0, 255);"> <u>Download</u></span></span>
                            </g:if>
                            <g:else>
                            <span style="font-size:14px;"><span style="color: rgb(0, 0, 255);"><u>ViewFullSite</u></span></span>
                            </g:else>

                            %{--<span style="font-size:14px;"><span style="color: rgb(0, 0, 255);"><u>MarkAsRead</u></span></span>--}%
                            %{--<span style="font-size:14px;"><span style="color: rgb(0, 0, 255);"><u><g:link controller="resource" action="showPost" params='[rid:"${resource.id}"]'>ViewPost</g:link></u></span></span>--}%
                        </p>
                    </div>
                </div>
            </th>
        </tr>



        </tbody>
    </table>

</div>
</body>


</html>