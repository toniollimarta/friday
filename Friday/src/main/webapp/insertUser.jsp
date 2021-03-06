<!--
    Friday - Shopping List Manager
    Copyright (C) 2018-2019 Tommaso Bosetti, Sebastiano Chiari, Leonardo Remondini, Marta Toniolli
-->

<%@ page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="shortcut icon" type="image/png" href="images/favicon.png">

        <title>Friday - Registrati</title>

        <!-- Google font -->
        <link href="https://fonts.googleapis.com/css?family=Hind:400,700" rel="stylesheet">

        <!-- Bootstrap -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

        <!-- Font Awesome Icon -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">

        <!-- Custom stlylesheet -->
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
                        <h3>Registrati</h3>
                        <form method="POST" action="insertUserServlet" enctype="application/x-www-form-urlencoded">
                            <c:set var="errorEmail" value="${requestScope.errorEmail}"></c:set>
                            <c:set var="errorPassword" value="${requestScope.errorPassword}"></c:set>
                            <c:set var="errorCheckEmail" value="${requestScope.errorCheckPassword}"></c:set>
                            <div>
                                <div class="form-group">
                                    <label for="Name">Nome <strong>*</strong></label>
                                    <input name="name" type="text" class="form-control" id="name" placeholder="Mario" value="${requestScope.name}"  required="true">
                                </div>
                            </div>
                            <div>
                                <div class="form-group">
                                    <label for="Surname">Cognome <strong>*</strong></label>
                                    <input name="surname" type="text" class="form-control" id="surname" placeholder="Rossi" value="${requestScope.surname}" required="true">
                                </div>
                            </div>
                            <div>
                                <div class="form-group">
                                    <input type="hidden" name="typeError" value="null">
                                </div>
                                <div class="form-group">
                                    <input type="hidden" name="registerForm" value="insertUser.jsp">
                                </div>
                            </div>

                            <div class="row form-group">
                                <div class="col">
                                    <c:if test="${errorEmail eq null}">
                                        <label for="Email">Email <strong>*</strong> </label>
                                        <input name="email" type="text" class="form-control" id="email" placeholder="mario.rossi@esempio.it" required="true" aria-describedby="emailHelp" value="${requestScope.email}" required="true">
                                    </c:if>
                                    <c:if test="${errorEmail eq 'alreadyExistEmail'}">
                                        <label for="Email">Email <strong>*</strong></label>
                                        <input name="email" type="text" class="form-control is-invalid security-form" id="email" placeholder="mario.rossi@esempio.it" required="true" aria-describedby="emailHelp" value="${requestScope.email}" required="true">
                                        <div class="invalid-feedback">
                                            ATTENZIONE! L'email inserita è già utilizzata. Scegli un'altra email oppure esegui il login se sei già registrato.
                                        </div>
                                    </c:if>
                                    <c:if test="${errorEmail eq 'emailError'}">
                                        <label for="Email">Email <strong>*</strong></label>
                                        <input name="email" type="text" class="form-control is-invalid security-form" id="email" placeholder="mario.rossi@esempio.it" required="true" aria-describedby="emailHelp" value="${requestScope.email}" required="true">
                                        <div class="invalid-feedback">
                                            ATTENZIONE! L'email inserita non è del formato corretto.
                                        </div>
                                    </c:if>

                                </div>
                            </div>
                            <div class="form-group">
                                <c:if test="${errorPassword eq null}">
                                    <label for="password">Password <strong>*</strong></label>
                                    <input name="password" type="password" class="form-control security-form johnCena" id="password" required="true" aria-describedby="passwordHelpInline"  required="true">

                                    <p class="footer-info"><small>La password deve essere composta da almeno 6 caratteri, di cui almeno una maiuscola e da un numero o un carattere speciale</small></p>
                                </c:if>
                                <c:if test="${errorPassword eq 'errorPassword'}">
                                    <label for="password">Password <strong>*</strong></label>
                                    <input name="password" type="password" class="form-control is-invalid security-form johnCena" id="password" required="true" required="true">
                                    <div class="invalid-feedback">
                                        ATTENZIONE! La password non rispetta i parametri richiesti. Ricordati di inserire almeno 6 caratteri, di cui almeno una lettere maiuscola e almeno un numero o un carattere speciale.
                                    </div>
                                </c:if>
                            </div>
                            <div class="form-group">
                                <c:if test="${errorCheckPassword eq null}">
                                    <label for="password1">Conferma password <strong>*</strong></label>
                                    <input name ="password1" type="password" class="form-control security-form johnCena" id="password1" require="true" aria-describedby="passwordHelpInline" required="true">
                                </c:if>
                                <c:if test="${errorCheckPassword eq 'errorCheckPassword'}">
                                    <label for="password1">Conferma password <strong>*</strong></label>
                                    <input name ="password1" type="password" class="form-control is-invalid security-form johnCena" id="password1" require="true" required="true">
                                    <div class="invalid-feedback">
                                        ATTENZIONE! Le password non coincidono. Perfavore, inserisci nuovamente la tua password e fai attenzione nel riscriverla uguale la seconda volta.
                                    </div>
                                </c:if>
                                <div class="form-check mb-3">
                                    <input class="form-check-input" type="checkbox" onclick="revealPsw()" id="showInput">
                                    <label class="form-check-label" for="showInput">Mostra password</label>
                                </div>
                            </div>


                            <div class="row">
                                <div class="col-sm">
                                    <label for="Avatar">Avatar</label>
                                    <input name ="avatar" type="file" accept=".jpg, .jpeg, .png" id="avatar">
                                </div>
                            </div>
                            <div class="row mt-2">
                                <div class="col-sm">
                                    <div class="form-group form-check">
                                        <input type="checkbox" class="form-check-input" id="exampleCheck1" required="true">
                                        <label class="form-check-label" for="exampleCheck1">
                                            <small> Dichiaro di aver preso visione e di accettare integralmente la nostra <a href="#" class="text-link">informativa sulla privacy</a> <strong>*</strong></small>
                                        </label>
                                    </div>
                                    <small><strong> I campi contrassegnati con * sono obbligatori. </strong></small>
                                </div>
                            </div>
                            <div class="row mt-2">
                                <div class="col-sm-6">
                                    <button type="button" onclick="goBack()" class="btn displayCenter login-btn">Annulla</button>
                                </div>
                                <div class="col-sm-6">
                                    <button type="submit" class="btn displayCenter login-btn">Registrati</button>
                                </div>
                            </div>
                            <p class="mt-4">Hai già un account Friday? <a href="login.jsp" class="text-link">Accedi</a></p>
                        </form>
                    </div>
                </div>

            </div>

        </div>

        <!-- secondary footer -->
        <jsp:include page="jsp/components/secondary-footer.jsp" />

        <!-- JS Bootstrap -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

        <!-- personal JS -->
        <script type="text/javascript" src="js/main.js"></script>

    </body>

</html>
