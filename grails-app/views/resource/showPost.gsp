<%--
  Created by IntelliJ IDEA.
  User: umesh
  Date: 25/6/15
  Time: 1:39 AM
--%>



<%@ page import="linksharing.*;" %>

<html>
<head>
    <meta name="layout" content="linksharing"/>
    <title>Linsharinng Web Application</title>
    <style type="text/css">
    .rating {
        float: left;
    }

    /* :not(:checked) is a filter, so that browsers that don’t support :checked don’t
       follow these rules. Every browser that supports :checked also supports :not(), so
       it doesn’t make the test unnecessarily selective */
    .rating:not(:checked) > input {
        position: absolute;
        top: -9999px;
        clip: rect(0, 0, 0, 0);
    }

    .rating:not(:checked) > label {
        float: right;
        width: 1em;
        padding: 0 .1em;
        overflow: hidden;
        white-space: nowrap;
        cursor: pointer;
        font-size: 200%;
        line-height: 1.2;
        color: #ddd;
        text-shadow: 1px 1px #bbb, 2px 2px #666, .1em .1em .2em rgba(0, 0, 0, .5);
    }

    .rating:not(:checked) > label:before {
        content: '★ ';
    }

    .rating > input:checked ~ label {
        color: #f70;
        text-shadow: 1px 1px #c60, 2px 2px #940, .1em .1em .2em rgba(0, 0, 0, .5);
    }

    .rating:not(:checked) > label:hover,
    .rating:not(:checked) > label:hover ~ label {
        color: gold;
        text-shadow: 1px 1px goldenrod, 2px 2px #B57340, .1em .1em .2em rgba(0, 0, 0, .5);
    }

    .rating > input:checked + label:hover,
    .rating > input:checked + label:hover ~ label,
    .rating > input:checked ~ label:hover,
    .rating > input:checked ~ label:hover ~ label,
    .rating > label:hover ~ input:checked ~ label {
        color: #ea0;
        text-shadow: 1px 1px goldenrod, 2px 2px #B57340, .1em .1em .2em rgba(0, 0, 0, .5);
    }

    .rating > label:active {
        position: relative;
        top: 2px;
        left: 2px;
    }

    </style>

</head>

<body>
<div class="container">
    <div class="row">
        <div class="col-md-6" style="border: outset">

            <div class="row">

                <div class="col-md-3">
                    <div>
                        <g:link controller="user" action="userPublicProfile" params="[userId: post.creator.id]">
                            <g:if test="${post.creator.photo}">
                                <img class="img-circle " alt="BlankImage"
                                     src="${resource(dir: 'home', file: fieldValue(bean: post.creator, field: 'photo'))}"
                                     width="80" height="80"/>
                            </g:if>
                            <g:else>
                                <g:img dir="images" class="img-responsive" file="userDefault.png" width="80"
                                       height="80"/>

                            </g:else>
                        </g:link>
                    </div>

                </div>

                <div class="col-md-9">

                    <div class="row">

                        <div class="col-md-6" style="font-size: 18px;font-weight: bolder;"><g:link controller="user"
                                                                                                   action="userPublicProfile"
                                                                                                   params="[userId: post.creator.id]">${post.creator}</g:link></div>

                        <div class="col-md-6" style="text-align: right"><g:link controller="topic" action="topicShow"
                                                                                params="[tid: post.topic.id]">${post.topic}</g:link></div>

                    </div>

                    <div class="row">

                        <div class="col-md-6"><g:link controller="user" action="userPublicProfile"
                                                      params="[userId: post.creator.id]">@${post.creator.username}</g:link></div>

                        <div class="col-md-6" style="text-align: right">${post.dateCreated}</div>

                    </div>

                    <div class="row">

                        <div class="col-md-12">
                            <div class="rating">
                                <g:hiddenField name="avg" id="avgRate" value="3"/>
                                <g:hiddenField name="user" id="userExist" value="${session["user_id"]}"/>

                                <input type="radio" id="star5" name="rating" value="5"
                                       onclick="rate(value, '${post.id}')"/><label for="star5"
                                                                                   title="Rocks!">5 stars</label>
                                <input type="radio" id="star4" name="rating" value="4"
                                       onclick="rate(value, '${post.id}')"/><label for="star4"
                                                                                   title="Pretty good">4 stars</label>
                                <input type="radio" id="star3" name="rating" value="3"
                                       onclick="rate(value, '${post.id}')"/><label for="star3"
                                                                                   title="Meh">3 stars</label>
                                <input type="radio" id="star2" name="rating" value="2"
                                       onclick="rate(value, '${post.id}')"/><label for="star2"
                                                                                   title="Kinda bad">2 stars</label>
                                <input type="radio" id="star1" name="rating" value="1"
                                       onclick="rate(value, '${post.id}')"/><label for="star1"
                                                                                   title="Sucks big time">1 star</label>

                            </div>

                            <div>&nbsp;&nbsp;<span class="glyphicon glyphicon-user" aria-hidden="true"
                                                   style="font-size: 30px "></span><span
                                    style="font-size: 30px;font-weight: bold;" id="userCount">${ratedUserCount}</span>
                            </div>

                        </div>

                    </div>

                    <div class="row">

                        <div class="col-md-12">${post.description}</div>

                    </div>

                </div>

            </div>

            <div class="row" style="margin-top: 1px;">
                <div class="col-md-5"><div class="col-md-12" style="align-items: center"><g:img
                        dir="/linksharing/assets" file="fb.jpeg" alt="fb" width="30"/><g:img dir="/linksharing/assets"
                                                                                             file="twitter_ico.png"
                                                                                             alt="twitter"
                                                                                             width="30"/>&nbsp; <g:img
                        dir="/linksharing/assets" file="gPlus.png" alt="gplus" width="30"/></div></div>

                <div class="col-md-4">
                    <g:if test="${showToEditAndDelete}">
                        <input type="button" id="editPost" value="edit"/>
                    %{--<a href="${createLink(controller: "resource",action: "editResource",params: [rid:post.id])}">Edit</a>--}%
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="${createLink(controller: "resource", action: "deleteResource", params: [rid: post.id])}">Delete</a>
                    </g:if>
                </div>

                <div class="col-md-3">
                    <g:if test="${post.instanceOf(DocumentResource)}"><g:link controller="documentResource"
                                                                              action="downLoadDocoument"
                                                                              params="[filePath: post.creator.photo]">Download</g:link></g:if>
                    <g:else><a href="${post.url}">ViewFullSite</a></g:else>

                </div>

            </div>

            <div class="row" style="margin-top: 1px;">
                <div class="col-md-12">
                    <% if (flash.message) { %>
                    <li>${flash.message}</li>
                    <% } %>
                    <% if (flash.resource) { %>
                    <g:renderErrors bean="${flash.resource}"/>
                    <% } %>

                </div>

            </div>



            <g:if test="${post.instanceOf(DocumentResource)}">
                <div class="row" hidden="hidden" id="editPostDiv">
                    <div class="col-md-12">
                        <g:uploadForm url="[controller: 'documentResource', action: 'editDocumentResource']">
                            <div class="form-group">
                                <label for="file">File:</label>
                                <input type="file" name="file" class="form-control" id="file" value="${post.filePath}"/>
                            </div>

                            <div class="form-group">
                                <label for="Description">Description:</label>
                                <textarea class="form-control" name="description" rows="4"
                                          id="description">${post.description}</textarea>
                            </div>

                            <g:hiddenField name="rid" value="${post.id}"/>
                            <input name="b1" type="submit" value="update"/></p>
                        </g:uploadForm>

                    </div>

                </div>

            </g:if>
            <g:else>
                <div class="row" hidden="hidden" id="editPostDiv">
                    <div class="col-md-12">
                        <g:form url="[controller: 'linkResource', action: 'editLinkResource']">
                            <div class="form-group">
                                <label for="url">Link:</label>
                                <input type="text" name="url" class="form-control" id="url" value="${post.url}"/>
                            </div>

                            <div class="form-group">
                                <label for="Description">Description:</label>
                                <textarea class="form-control" name="description" rows="4"
                                          id="description">${post.description}</textarea>
                            </div>
                            <g:hiddenField name="rid" value="${post.id}"/>


                            <input name="b1" type="submit" value="update"/></p>
                        </g:form>

                    </div>

                </div>

            </g:else>

        </div>

        <div class="col-md-6">

            <% if (session["user_id"]) {
                def topics = request.getAttribute("trendingTopics")
            %>
            <g:render template="/home/5trendingTopics" model="[tredingTopics: topics]"/>

            <% } else { %>
            <g:link controller="home" class="btn-link" action="index">Login in to Rate This Resource</g:link>

            <% } %>

        </div>

    </div>

</div>

<script>

    $(document).ready(function () {
        $("#editPost").on('click', function () {
            $("#editPostDiv").slideToggle(1000);
        });

        var avg = $('#avgRate').val();

        $("input[name='rating'][value='3']").prop('checked', true);


    });

    var rate = function (value, rid) {
        var userExist = $("#userExist").val();
        if (userExist) {
            var data = {
                score: value,
                rid: rid
            };

            $.ajax({
                url: "${createLink(controller:"resourceRating",action: "rateResource")}",
                data: data,
                dataType: "text",
                method: "post",
                success: function (res) {

                    $('#userCount').text(res);
                    alert("you have succefully rated" + res);
                }


            });
        }
        else {
            alert("please login to rate this resource");
        }


    };

</script>

</body>
</html>
