
<%@ page import="linksharing.*;" %>

<div class ="row" id="createDocumentPost">
    <div class ="col-md-12">
        <g:uploadForm url="[controller:'documentResource',action:'save']">
            <div class="form-group">
                <label for="file">Link:</label>
                <input type="file"  name="file" class="form-control" id="file required/">
            </div>
            <div class="form-group">
                <label for="Description">Description:</label>
                <textarea class="form-control" name="description" rows="4" id="description "></textarea>
            </div>
            <div class="form-group">
                <label for="topic">Topic:</label>

                <g:select name="topicId" style="width:175px"
                          from="${subscribedTopics}"
                          optionKey="id"
                          optionValue="name"/>

            </div>

            <input name="b1" type="submit" value="Share" /></p>
        </g:uploadForm>


    </div>

</div>




