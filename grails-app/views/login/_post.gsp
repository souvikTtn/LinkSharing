%{--<div>--}%
%{--<table>--}%
    %{--<tr>--}%
        %{--<td rowspan="4" >--}%
            %{--<g:if test="${post.creator.photo}">--}%
            %{--<img style="border: 4px groove black" alt="BlankImage"src="${resource(dir:'home', file:fieldValue(bean:post.creator, field:'photo'))}" width="80" height="100"/>--}%
            %{--</g:if>--}%
            %{--<g:else>--}%
               %{--<g:img dir="images" file="userDefault.png"width="100" height="100"/>--}%

            %{--</g:else>--}%
        %{--</td>--}%
        %{--<td>--}%
           %{--<g:link controller="home" action="dashboard"> ${post.creator.username} </g:link>--}%
        %{--</td>--}%
        %{--<td>--}%
            %{--${post.lastUpdated}--}%
        %{--</td>--}%
        %{--<td><g:link controller="home" action="dashboard"> ${post.topic}</g:link>--}%
        %{--</td>--}%

    %{--</tr>--}%
    %{--<tr>--}%
        %{--<td colspan="3" >--}%
            %{--${post.description}--}%
        %{--</td>--}%

    %{--</tr>--}%
    %{--<tr>--}%
        %{--<td colspan="2">twitter,facebook</td>--}%
        %{--<td><g:link controller="home" action="dashboard"> viewPost</g:link>--}%
    %{--</tr>--}%
%{--</table>--}%


%{--</div>--}%


<div style="border: double; ">
    <div style="float: left">
     <g:link controller="user" action="userPublicProfile" params="[userId:post.creator.id]">
        <g:if test="${post.creator.photo}">
            <img style="border: 4px groove black" alt="BlankImage"src="${resource(dir:'home', file:fieldValue(bean:post.creator, field:'photo'))}" width="80" height="100"/>
        </g:if>
        <g:else>
            <g:img dir="images" file="userDefault.png"width="80" height="80"/>

        </g:else>
     </g:link>
    </div>


    <div style="float:inherit">

        <g:link controller="user" action="userPublicProfile" params="[userId:post.creator.id]"> ${post.creator.username} </g:link>
        &nbsp;&nbsp;&nbsp;
        ${post.lastUpdated}
        &nbsp;&nbsp;&nbsp;
        <g:link controller="topic" action="topicShow" params="[tid:post.topic.id]"> ${post.topic}</g:link>

    </div>
    <br>
    <div>
        ${post.description}
    </div>
        <div>
            <g:img dir="/linksharing/assets" file="fb.jpeg"  alt="fb"  width="25"/>&nbsp; <g:img dir="/linksharing/assets" file="twitter_ico.png" alt="twitter"  width="25"/>&nbsp; <g:img dir="/linksharing/assets" file="gPlus.png"  alt="gplus"  width="25"/> &nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;<td><g:link controller="resource" action="showPost" params='[rid:"${post.id}"]'>ViewPost</g:link>
    </div>


</div>