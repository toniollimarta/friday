<!--
    Friday - Shopping List Manager
    Copyright (C) 2018-2019 Tommaso Bosetti, Sebastiano Chiari, Leonardo Remondini, Marta Toniolli
-->

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

        <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
    	<link rel="shortcut icon" type="image/png" href="images/favicon.png">

        <title>Friday Accedi</title>

        <!-- Google font -->
        <link href="https://fonts.googleapis.com/css?family=Hind:400,700" rel="stylesheet">

        <!-- Bootstrap -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

        <!-- Font Awesome Icon -->
        <link rel="stylesheet" href="css/font-awesome.min.css">

        <!-- Personal stylesheet -->
        <link type="text/css" rel="stylesheet" href="css/style.css" />

    </head>

    <body>

        <div class="container">

            <!-- LOGO Friday -->
            <a href="indexServlet">
                <div class="logo-header">
                    <img class="displayCenter auto-size" src="images/friday_icon_colored.png" alt="logo">
                </div>
            </a>

            <div class="width-30 displayCenter">
                <div class="card">
                    <div class="card-body">
                        <h3>Accedi</h3>
                        <form  method="POST" action="loginServlet" enctype="application/x-www-form-urlencoded">
                            <div class="form-group">

                                <c:if test="${errorEmail eq null}">
                                    <div class="col-md mt-1 nav-col">
                                        <div class="row">
                                            <div class="col-md mt-1 nav-col">
                                                <label for="Email"> Indirizzo e-mail </label>
                                            </div>
                                        </div>
                                    </div>
                                    <input name="email" type="text" class="form-control" id="email"  required="true" aria-describedby="emailHelp" value="${requestScope.email}" required="true">
                                </c:if>


                            <c:if test="${errorEmail eq 'emailError'}">
                                <div class="col-md mt-1 nav-col">
                                    <div class="row">
                                        <div class="col-md mt-1 nav-col">
                                            <label for="Email"> Indirizzo e-mail </label>
                                        </div>
                                    </div>
                                </div>
                                <input name="email" type="text" class="form-control is-invalid" id="email"  required="true" aria-describedby="emailHelp"  required="true">
                                <div class="invalid-feedback">
                                    ATTENZIONE! Se non sei già presente su Friday registrati
                                </div>
                            </c:if>
                            </div>

                            <div class="form-group">

                                <c:if test="${errorPassword eq null}">
                                    <div class="col-md mt-1 nav-col">
                                        <div class="row">
                                            <div class="col-md mt-1 nav-col">
                                                <label for="exampleInputPassword1">Password</label>
                                            </div>
                                            <div class="col-ms mt-1 nav-col">
                                                <a href="#" class="text-link">
                                                    <p class="footer-info"><small>Hai dimenticato la password?</small></p>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    <input type="password" class="form-control security-form johnCena" name="password"  required="true">
                                </c:if>

                                <c:if test="${errorPassword eq 'errorPassword'}">
                                    <div class="col-md mt-1 nav-col">
                                        <div class="row">
                                            <div class="col-md mt-1 nav-col">
                                                <label for="exampleInputPassword1">Password</label>
                                            </div>
                                            <div class="col-ms mt-1 nav-col">
                                                <a href="#" class="text-link">
                                                    <p class="footer-info"><small>Hai dimenticato la password?</small></p>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    <input name="password" type="password" class="form-control is-invalid security-form johnCena" id="password" required="true"  required="true">
                                    <div class="invalid-feedback">
                                        ATTENZIONE! La password è errata.
                                    </div>
                                </c:if>

                            </div>
                            <div class="form-group form-check">
                                <div class="col-md mt-1 nav-col">
                                    <input class="form-check-input" type="checkbox" onclick="revealPsw()" id="showInput">
                                    <label class="form-check-label" for="showInput">Mostra password</label>
                                </div>
                            </div>


                            <div class="form-group form-check">
                                <div class="col-md mt-1 nav-col">
                                    <input name = "ricordami" type="checkbox" class="form-check-input" id="exampleCheck1">
                                    <label class="form-check-label" for="exampleCheck1">Ricordami</label>
                                </div>

                            </div>
                            <div class="row">
                                <div class="col-sm mt-1 mb-1">
                                    <button type="submit" class="btn displayCenter login-btn">Accedi</button>
                                </div>
                                <div class="col-sm mt-1 mb-1">
                                    <button type="button" onclick="goBack()" class="btn displayCenter login-btn">Annulla</button>
                                </div>
                            </div>

                            <div>
                                <div class="form-group">
                                    <input type="hidden" name="typeError" value="null">
                                </div>
                                <div class="form-group">
                                    <input type="hidden" name="registerForm" value="login.jsp">
                                </div>
                            </div>
                            <br>
                            <p>Sei nuovo su Friday? <a href="insertUser.jsp" class="text-link">Registrati</a></p>
                        </form>
                    </div>
                </div>

            </div>

        </div>

        <br>

        <!-- footer -->
        <jsp:include page="jsp/components/secondary-footer.jsp" />

        <!-- JS Bootstrap -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

        <!-- personal JS -->
        <script type="text/javascript" src="js/main.js"></script>

    </body>

</html>
