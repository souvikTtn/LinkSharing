

<%@ page import="linksharing.*;" %>


<div class ="row" id="createTopic">
    <div class ="col-md-12">
        <g:form name="myForm"  url="[controller: 'topic', action: 'save',]">
            <div class="form-group">
                <label for="topic">Topic Name:</label>
                <input type="text"  name="name" class="form-control" id="tname">
            </div>
            <div class="form-group">
                <label for="visibility">Visibility:</label>
                <select name="visibility" id="visibility">
                    <option value="PUBLIC">Public</option>
                    <option value="PRIVATE">Private</option>
                </select>

            </div>


            <input name="topicSave" id="topicSave" type="submit" value="create" />
        </g:form>


    </div>

</div>

