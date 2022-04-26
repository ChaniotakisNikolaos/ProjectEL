<%@ page import="projectel.projectel.Login" %>
<%--
Created by IntelliJ IDEA.
User: user
Date: 18/4/2022
Time: 2:14 μ.μ.
To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>quiz | SINP </title>
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="../css/quiz_style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
    <!----------------------------------------- Start of navbar ------------------------------------------>
    <nav class="navbar">
        <div class="wrapper">
            <div class="icon a menu-btn">
                <a><i class="fa fa-list-ul"></i></a>
            </div>
            <div class="logo">
                ΒΕΜΠΛΗΧΑ
            </div>
            <ul class="menu-list">
                <li>
                    <div class="icon cancel-btn">
                        <i class="fa fa-close"></i>
                    </div>
                </li>
                <li><a href="../index.jsp">Αρχική</a></li>
                <li>
                    <div class="dropdown">
                        <a  class="../jsp/chapters.jsp" href="../jsp/chapters.jsp">Κεφάλαια Μαθηματικών</a>
                        <div class="dropdown-content">
                            <a href="../jsp/sub-chapters/chapter01.jsp">Πρόσθεση και Αφαίρεση</a>
                            <a href="../jsp/sub-chapters/chapter02.jsp">Πολλαπλασιασμός στους φυσικούς αριθμούς</a>
                            <a href="../jsp/sub-chapters/chapter03.jsp">Κριτήρια διαιρετότητας</a>
                            <a href="../jsp/sub-chapters/chapter04.jsp">Διαίρεση στους φυσικούς</a>
                        </div>
                    </div>
                </li>

                <li>
                    <div class="dropdown">
                        <a class="current" href="tests.jsp">Έλεγξε τις γνώσεις σου!</a>
                        <div class="dropdown-content" style="width:100%;">
                            <a href="quiz.jsp">Τεστ: Πρόσθεση και Αφαίρεση</a>
                            <a href="quiz.jsp">Τεστ: Πολλαπλασιασμός στους φυσικούς</a>
                            <a href="quiz.jsp">Τεστ: Κριτήρια διαιρετότητας</a>
                            <a href="quiz.jsp">Τεστ: Διαίρεση στους φυσικούς</a>
                            <a href="quiz.jsp">Τεστ: Επαναληπτικό</a>
                        </div>
                    </div>
                </li>
                <li><a href="../jsp/statistics.jsp">Στατιστικά</a></li>
            </ul>

            <div class="logout">
                <a href="<%=Login.isLoggedIn(session)?"logout-servlet":"login.jsp"%>">
                    <i class="fa fa-user-circle" ></i><%=Login.isLoggedIn(session)?"Αποσύνδεση":"Σύνδεση"%>
                </a>
            </div>

        </div>
    </nav>
    <!--------- Start: Js navbar ---------->
    <script src="../js/app.js"></script>
    <script>
        navbar.classList.add("sticky");
    </script>
    <!---------- End: Js navbar ----------->
    <!---------------------------------------- Close of navbar ------------------------------------------->
    <h1>Τέσταρε τις γνώσεις σου !</h1>
    <div class="quiz-container">
        <div id="quiz"></div>
    </div>
    <br>
    <button id="previous">Προηγούμενη ερώτηση</button>
    <button id="next">Επόμενη ερώτηση</button>
    <button id="submit">Καταχώρηση απαντήσεων</button>
    <div id="results"></div>
    <script src="../js/quiz.js"></script>
</body>
</html>
