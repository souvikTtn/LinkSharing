<div style="border-style: solid;margin-bottom: 2px;float:left;clear:right;width:450px;length:50px;">
    <div style="margin:10px 10px 10px 10px ">
        <div style="float: left ; align-content:center">
            &nbsp;&nbsp; &nbsp;&nbsp;
            <g:if test="${user.photo}">
                <img style="border: 4px groove black" alt="BlankImage"src="${resource(dir:'home', file:fieldValue(bean:user, field:'photo'))}" width="120" height="120"/>
            </g:if>
            <g:else>
                <g:img dir="images" file="userDefault.png"width="120" height="120"/>

            </g:else>
        </div>
        <div style="width: 300px;margin-left: 150px">
            <span style="font-size: xx-large"> ${user.firstName} ${user.lastName}</span>
        </div>
        <div style="margin-left: 150px">
            <p >@${user.username}</p>
        </div>
        <p>&nbsp; &nbsp; &nbsp; &nbsp;</p>
        <p>&nbsp; &nbsp; &nbsp;&nbsp;Subscription&nbsp;&nbsp;&nbsp;&nbsp; Topics</p>
        <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ${usersubscription.size()} &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; ${usertopics.size()}&nbsp;</p>
        <p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</p>
    </div>
</div>
