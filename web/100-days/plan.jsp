<%-- 
    Document   : plan
    Created on : 14 Jun, 2019, 4:40:19 PM
    Author     : Senet
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>100 Days Programme</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/prettyPhoto.css" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
    <link href="css/main.css" rel="stylesheet">
    <link rel="shortcut icon" href="images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">
    </head>
   <body>
    <!--/header-->
    <div id="title" class="emerald">
        <div class="container">
        </br>
            <div class="row">
                <div class="col-sm-3">
                </div>
                
                <div class="col-sm-6">
                    <h1>
                        100 Days Programme</h1>
                    <p>
                        Data Entry Form Agri- Natural Resources in the Country</p>
                </div>

            </div>
        </div>
    </div>

    </br>
    <div id="contact-page" class="container">
        <div class="row">
            <div class="col-sm-12">
                <div class="status alert alert-success" style="display: none">
                </div>
                <form id="main-contact-form" class="contact-form" name="contact-form" method="post"
                action="sendemail.php" role="form">
                <div class="row">
                    <div class="col-sm-3">
                    </div>
                    <div class="col-sm-5">
                        <h4>
                            Data Entry Form Agri- Natural Resources in the Country</h4>

                        <div class="form-group">
                            <b>State</b>
                            <select class="form-control" name="State">
                                <option value="UP">Uttar Pradesh</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <b>District</b>
                            <select class="form-control" name="District">
                                <option value="District"></option>
                            </select>
                        </div>
                        <div class="form-group">
                            <b>2 Digit Code (Agri- Natural Resources)</b>
                            <select class="form-control" name="2 Digit Code">
                                <option value="2 Digit Code"></option>
                            </select>
                        </div>
                        <div class="form-group">
                            <b>4 Digit Code (Agri- Natural Resources)</b>
                            <select class="form-control" name="4 Digit Code">
                                <option value="4 Digit Code"></option>
                            </select>
                        </div>
                        <div class="form-group">
                            <b>5 Digit Code (Agri- Natural Resources)</b>
                            <select class="form-control" name="4 Digit Code">
                                <option value="4 Digit Code"></option>
                            </select>
                        </div>

                        <div class="form-group">
                        <button type="submit" class="btn btn-primary btn-lg">
                            Submit</button>
                    </div>
                    </div>
                    
                </div>
                <div class="col-sm-2">
                </div>
            </div>
            </form>
        </div>

    </div>
   
   <footer id="footer" class="midnight-blue">
        <div class="container">
            <div class="row">
                
                
            </div>
        </div>
    </footer>
   
    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/main.js"></script>
</body>
</html>
