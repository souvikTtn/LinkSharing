

<%@ page import="linksharing.User; linksharing.Topic; linksharing.Resource;linksharing.Subscription;" %>

<%List<Topic> topicList=usertopics%>
<div>
<g:uploadForm url="[controller:'documentResource',action:'createUserDocumentResource']">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Share Document
 <hr/>
        <div>
            <p>Document * : <input name="file" type="file" value="" /></p>
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
    </g:uploadForm>
</div>
