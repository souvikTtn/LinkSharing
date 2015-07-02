<div >
<div class="row">
    <div class="col-md-5"><div >
        <g:link controller="user"  action="userPublicProfile" params="[userId:user.id]">
            <g:if test="${user.photo}">
                <img  class="img-circle " alt="BlankImage"src="${resource(dir:'home', file:fieldValue(bean:user, field:'photo'))}" width="200" height="200"/>
            </g:if>
            <g:else>
                <g:img dir="images" class="img-responsive" file="userDefault.png" width="150" height="150"/>

            </g:else>
        </g:link>
    </div>

    </div>

    <div class="col-md-7" style="font-size:19px;font-weight: bolder;">
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
            <div class="col-md-6">${totalUserSubscription}</div>
            <div class="col-md-6">${totalUserCreatedTopic}</div>
        </div>

    </div>



</div>
</div>

