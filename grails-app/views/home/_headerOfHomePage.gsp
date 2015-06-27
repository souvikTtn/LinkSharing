<%@ page import=" linksharing.User" %>

<div style="background: url('/linksharing/assets/social_media_banner.jpg'); border: solid thick ;align-self: auto;height: 150px;">
    <div style="float: right; margin-top: 0px;">
        <%
            if(session["user_id"]!=null)
            {
                User user=session["user"]

        %>
        <div style="float: right;" >

            <div style="position: relative;float: right">




                    <span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>
            &nbsp;

                    <span class="glyphicon glyphicon-paperclip" aria-hidden="true"></span>

            &nbsp;

                    <span class="glyphicon glyphicon-file" aria-hidden="true"></span>

            &nbsp;

                    <span class="glyphicon glyphicon-text-width" aria-hidden="true"></span>








                <img src="/home/${user.photo}" name="submit" type="image"style="height: 25px ;width: 20px;padding: 0px"/> ${user.username}
                <input id="dropSubmit" name="dropSubmit" type="button" style="height: 20px ;width: 20px;padding: 0px">
                <div class="dropOption"  style="position: absolute;width: 100%">
                    <g:link controller="profile" action="editProfile" name="userProfile"><span style="border:solid;width:50px;float: right;clear: left">Profile</span></g:link>
                   <g:if test="${user.admin==true}">
                    <span style="border: solid;float: right;;width:50px;clear: right">Users</span>
                    <span style="border: solid;float: right;width:50px;clear: right">Topic</span>

                    <span style="border: solid;float: right;width:50px;clear: right">Posts</span>
                   </g:if>
                    <g:link controller="login" action="logout" name="logoutAc"><span style="border: solid;width:50px;float: right;clear: right">Logout</span></g:link>
                </div>
            </div>
        </div>
        <%}%>
        <div style="float: right">
            <form id="search-form" name="search" action="" method="get">
                <input type="text" placeholder="Search" name="" class="placeholder" style=" height: 30px;">
                <input  name="submit" type="submit" value="submit" style="float:right; height: 25px ;width: 70px;padding: 0px">
            </form>
        </div>
    </div>
    <div style="float: left;clear : right;width: auto;">
    </br>
        <b style="font-size: 50px;font-family:'Times New Roman';">LinkSharing Web AppLication</b>
    </div>
</div>



<script type="text/javascript">
    $(function() {
        $('#dropSubmit').click(function() {
            $('.dropOption').toggle(1000);
            return false;
        });

    });

</script>
