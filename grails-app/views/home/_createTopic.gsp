
<%@ page contentType="text/html;charset=UTF-8" %>
<g:form name="myForm"  url="[controller: 'topic', action: 'createTopic',]">
    &nbsp;&nbsp;Create Topic

    <hr />
    <div >
    <p>Name * : <input name="name" id="tname" type="text"/></p>
    <p>&nbsp;</p>
    <p>Visibility * : <select name="visibility" id="visibility">
    <option value="PUBLIC">Public</option>
    <option value="PRIVATE">Private</option>
    </select></p>
    <p><input name="topicSave" id="topicSave" type="submit" value="create" /></p>
</g:form>
