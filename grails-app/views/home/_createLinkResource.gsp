<%@ page import="linksharing.User; linksharing.Topic; linksharing.Resource;linksharing.Subscription;" %>
<%List<Topic> topicList= usertopics %>
<div>
%{--<form action="/abc" enctype="text/plain" id="share_link" method="get" name="Share Link" target="_self">Share Link</form>--}%
    <g:form url="[controller:'LinkResource',action:'createUserLinkResource']" method="get">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Share Link

        <hr />
        <div >
            <p>Link * : <input name="url" type="text" value="" /></p>
            <p>Desciption * :<textarea name="description"></textarea></p>
            <p>&nbsp;</p>
            <p>Topic * : <select name="topicId">
                <%topicList.each {%>
                <option value="${it.id}">${it.name}</option>
                <%}%>
            </select></p>
            <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input name="b1" type="submit" value="Share" /></p>
        </div>
    </g:form>
</div>