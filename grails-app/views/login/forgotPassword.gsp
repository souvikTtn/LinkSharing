<%--
  Created by IntelliJ IDEA.
  User: umesh
  Date: 25/6/15
  Time: 9:21 PM
--%>




<html>
<head>
    <meta name="layout" content="linksharing"/>
    <title>Linsharinng Web Application</title>

</head>

<body>
<div class="container">
    <div class="row">
    <div class="col-md-3">


    </div>
        <div class="col-md-6">

            <div class="panel panel-default">
                <!-- Default panel contents -->
                <div class="panel-heading">Recover Password</div>
                <div class="panel-body">
                    <g:if test="$flash.message">
                        ${flash.message}
                    </g:if>

                </div>



                <table class="table">
                    <thead>
                    <tr>
                        <th colspan="2">Recover password</th>
                    </tr>
                    </thead>
                    <tbody>
                    <g:form controller="login" action="recoverPassword">
                        <tr>
                            <td>Email:</td>
                            <td><input type="email" name="email" placeholder="Enter Your Registered email"/></td>
                        </tr>
                        <tr>
                            <td colspan="2"><input class="btn btn-info" type="submit" value="submit"/></td>
                        </tr>
                    </g:form>
                    </tbody>



                </table>

            </div>


        </div>
        <div class="col-md-3"></div>





        </div>
    </div>

 </body>
</html>

