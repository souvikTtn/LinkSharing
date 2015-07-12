
<div class="panel panel-default">
    <!-- Default panel contents -->
    <div class="panel-heading">
    Users:"${topic.name}"

    </div>

    <!-- List group -->

    <ul class="list-group">
    <g:each in="${users}"var="user">
        <li class="list-group-item">

            <div class="row">
                <div class="col-md-3"><div >
                    <g:link controller="user"  action="userPublicProfile" params="[userId:user.id]">
                        <g:if test="${user.photo}">
                            <img  class="img-circle " alt="BlankImage"src="${resource(dir:'home', file:fieldValue(bean:user, field:'photo'))}" width="100" height="100"/>
                        </g:if>
                        <g:else>
                            <g:img dir="images" class="img-responsive" file="userDefault.png" width="100" height="100"/>

                        </g:else>
                    </g:link>
                </div>

                </div>

                <div class="col-md-9" style="font-size:19px;font-weight: bolder;">
                    <div class="row" >
                        <div class="col-md-12"><h1>${user.firstName} ${user.lastName}</h1></div>

                    </div>
                    <div class="row">
                        <div class="col-md-12">@${user.username}</div>
                    </div>
                    <div class="row">
                        <div class="col-md-6" style="">Subscriptions</div>
                        <div class="col-md-6">Topics</div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">${user.subscriptions.size()}</div>
                        <div class="col-md-6">${user.topics.size()}</div>
                    </div>

                </div>



            </div>



        </li>
    </g:each>

    </ul>
    <div class="panel-footer">

    </div>
</div>



%{--<% users.each{user-> %>--}%

%{--<div class="row" style="border: outset;">--}%
    %{--<div class="col-md-3"><div >--}%
        %{--<g:link controller="user"  action="userPublicProfile" params="[userId:user.id]">--}%
            %{--<g:if test="${user.photo}">--}%
                %{--<img  class="img-circle " alt="BlankImage"src="${resource(dir:'home', file:fieldValue(bean:user, field:'photo'))}" width="100" height="100"/>--}%
            %{--</g:if>--}%
            %{--<g:else>--}%
                %{--<g:img dir="images" class="img-responsive" file="userDefault.png" width="100" height="100"/>--}%

            %{--</g:else>--}%
        %{--</g:link>--}%
    %{--</div>--}%

    %{--</div>--}%

    %{--<div class="col-md-9" style="font-size:19px;font-weight: bolder;">--}%
        %{--<div class="row" >--}%
            %{--<div class="col-md-12"><h1>${user.firstName} ${user.lastName}</h1></div>--}%

        %{--</div>--}%
        %{--<div class="row">--}%
            %{--<div class="col-md-12">@${user.username}</div>--}%
        %{--</div>--}%
        %{--<div class="row">--}%
            %{--<div class="col-md-6" style="">Subscriptions</div>--}%
            %{--<div class="col-md-6">Topics</div>--}%
        %{--</div>--}%
        %{--<div class="row">--}%
            %{--<div class="col-md-6">${user.subscriptions.size()}</div>--}%
            %{--<div class="col-md-6">${user.topics.size()}</div>--}%
        %{--</div>--}%

    %{--</div>--}%



%{--</div>--}%
%{--<% }%>--}%
