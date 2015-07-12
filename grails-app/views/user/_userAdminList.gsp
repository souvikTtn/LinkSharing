


    <table class="table">

        <thead>
        <tr>
            <util:remoteSortableColumn property="id" title="id"  update="filteredUserListDiv" action="filterUserList"/>
            <util:remoteSortableColumn property="username"  title="username" update="filteredUserListDiv" action="filterUserList"/>
            <util:remoteSortableColumn property="email"  title="email" update="filteredUserListDiv" action="filterUserList"/>
            <util:remoteSortableColumn property="firstName"   title="firstName" update="filteredUserListDiv" action="filterUserList"/>
            <util:remoteSortableColumn property="lastName"   title="lastName" update="filteredUserListDiv" action="filterUserList"/>
            <util:remoteSortableColumn property="active"  title="active" update="filteredUserListDiv" action="filterUserList"/>
            <th>Manage</th>
        </tr>
        </thead>
        <tbody >
        <g:each in="${users}"  var="user">
            <tr  >
                <td >${fieldValue(bean:user, field: "id")}</td>
                <td>${fieldValue(bean:user, field: "username")}</td>
                <td>${fieldValue(bean:user, field: "email")}</td>
                <td>${fieldValue(bean:user, field: "firstName")}</td>
                <td>${fieldValue(bean:user, field: "lastName")}</td>

                <g:if test="${user.active}">
                    <td>Yes</td>

                    <td><g:link controller="user" action="manageUser" params="[id:user.id,active:false]" class="btn btn-info" role="button">Deactivate</g:link> </td>
                </g:if>
                <g:else>

                    <td>NO</td>
                    <td><g:link controller="user" action="manageUser" params="[id:user.id,active:true]" class="btn btn-info" role="button">Activate</g:link> </td>
                </g:else>

            </tr>
        </g:each>
        </tbody>
    </table>



<div class="paginateButtons">
    <util:remotePaginate total="${total}" update="filteredUserListDiv" action="filterUserList" max="5" pageSizes="[5: '5 on Page',10:'10 on Page',15:'15 on Page']"  />
</div>