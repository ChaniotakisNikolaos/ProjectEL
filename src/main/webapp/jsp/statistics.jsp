<%@ page import="projectel.projectel.Statistics" %>
<%@ page import="projectel.projectel.Login" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Στατιστικά | SINP </title>
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="../css/statistics_style.css">
    <link rel="stylesheet" href="../css/popup.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<!-- when user is not logged in then an image will appear to tell him to login
    otherwise his grades will appear
-->
<body <%
        //if user is not logged then put background picture with dino
        if(!Login.isLoggedIn(session)) {%>
        style="
        background-image: url('../assets/ombredino3.png');
        background-size: cover;
        background-repeat: no-repeat;

        background-position: center;
"
        <%}%>>
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
                    <a href="chapters.jsp">Κεφάλαια Μαθηματικών</a>
                    <div class="dropdown-content">
                        <a href="sub-chapters/chapter01.jsp">Πρόσθεση και Αφαίρεση</a>
                        <a href="sub-chapters/chapter02.jsp">Πολλαπλασιασμός στους φυσικούς αριθμούς</a>
                        <a href="sub-chapters/chapter03.jsp">Κριτήρια διαιρετότητας</a>
                        <a href="sub-chapters/chapter04.jsp">Διαίρεση στους φυσικούς</a>
                    </div>
                </div>
            </li>

            <li>
                <div class="dropdown">
                    <a href="tests.jsp">Έλεγξε τις γνώσεις σου!</a>
                    <div class="dropdown-content" style="width:100%;">
                        <a href="testsChapter.jsp?chapter=1">Τεστ: Πρόσθεση και Αφαίρεση</a>
                        <a href="testsChapter.jsp?chapter=2">Τεστ: Πολλαπλασιασμός στους φυσικούς</a>
                        <a href="testsChapter.jsp?chapter=3">Τεστ: Κριτήρια διαιρετότητας</a>
                        <a href="testsChapter.jsp?chapter=4">Τεστ: Διαίρεση στους φυσικούς</a>
                        <a href="testsChapter.jsp?chapter=5">Τεστ: Επαναληπτικό</a>
                    </div>
                </div>
            </li>
            <li><a class="current" href="../jsp/statistics.jsp">Στατιστικά</a></li>
            <li><a href="../jsp/games.jsp">Παιχνίδια</a></li>
        </ul>
        <div class="logout">
            <a id="log" <%if(!Login.isLoggedIn(session)){%>href="login.jsp"<%}%>>
                <i class="fa fa-user-circle" ></i><%=Login.isLoggedIn(session)?"Αποσύνδεση":"Σύνδεση"%>
            </a>
        </div>

    </div>
</nav>
<script src="../js/app.js"></script>
<!-- The Modal for logout -->
<div id="myModal" class="modal">

    <!-- Modal content -->
    <div class="modal-content">
        <div class="modal-header">
            <span class="close">&times;</span>
            <h2>Είσαι σίγουρος;</h2>
        </div>
        <div class="modal-body">
            <p>Είσαι σίγουρος πως θες να αποσυνδεθείς;</p>
        </div>
        <div class="modal-footer">
            <button id="choice" class="button button2">Ναι, θέλω να φύγω.</button>
        </div>
    </div>

</div>
<!-- modal script -->
<script>
    <%if(Login.isLoggedIn(session)){%>
    // Get the modal
    let modal = document.getElementById("myModal");
    let choice = document.getElementById("choice");
    let log = document.getElementById("log");

    // Get the <span> element that closes the modal
    let span = document.getElementsByClassName("close")[0];

    // When the user clicks the button, open the modal
    log.onclick = function() {
        modal.style.display = "block";
        choice.onclick = function() {
            location.href ="../logout-servlet";
        }
    }
    // When the user clicks on <span> (x), close the modal
    span.onclick = function() {
        modal.style.display = "none";
    }
    // When the user clicks anywhere outside the modal, close it
    window.onclick = function(event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }
    <%}%>
</script>
<script>
    navbar.classList.add("sticky");
</script>

<%//if user is logged in then print graphs
    if (Login.isLoggedIn(session)){
%>
<div class="main-wrap">
    <!--
         left side will have the different links for the different chapters
         the current chapter will be blue
     -->
    <div class="left-side">
        <br><br><h3>Οι βαθμοί στα κεφάλαια σου:</h3>
        <a href="statistics.jsp" style="padding-left:3em; color: #5cafc6"><u>Όλα τα κεφάλαια</u></a>

        <a href="statisticsChapters.jsp?chapter=1" style="padding-left:3em;"><u>Πρόσθεση και αφαίρεση</u></a>
        <!-- <a href="statisticsChapters.jsp?chapter=1" style="display: none; padding-left:6em;" class="hiddenText1">Βαθμοί</a>-->
        <!--<a href="#" style="display: none; padding-left:6em;" class="hiddenText1">Βραβεία</a>-->
        <a href="statisticsChapters.jsp?chapter=2" style="padding-left:3em;"><u>Πολλαπλασιασμός</u></a>
        <a href="statisticsChapters.jsp?chapter=3" style="padding-left:3em;"><u>Κριτήρια διαιρετότητας</u></a>
        <a href="statisticsChapters.jsp?chapter=4" style="padding-left:3em;"><u>Διαίρεση</u></a>
        <a href="statisticsChapters.jsp?chapter=5" style="padding-left:3em;"><u>Επαναληπτικό</u></a>
    </div>
    <!--
        the right side will have a bar graph with the best grades
    -->
    <div class="right-side">
        <h2 style="color:#ef7f80;width:80%; text-align: center;">Οι καλύτεροι βαθμοί σου σε όλα τα κεφάλαια!</h2>
        <canvas id="myChart" style="width:70%;max-width:80%"></canvas>

        <script>
            let array =[];
            <%
                int i;
                request.setCharacterEncoding("UTF-8");
                int[] gradesChapters=new int[5];
                try{
                    for (i=1;i<=5;i++){
                        //String gradesChapters = Statistics.getMaxGrades(Integer.parseInt(request.getParameter("StudentId")),i);
                        String grades = Statistics.getMaxGrades(Integer.parseInt((String)session.getAttribute("userId")),i);
                        if(grades==null){
                            gradesChapters[i-1] = 0;
                        }else{
                            gradesChapters[i-1] = Integer.parseInt(grades);
                        }
                        out.print("array[" + (i-1) + "] = \"" + gradesChapters[i-1] + "\";");
                    }
                } catch (NumberFormatException e) {
                    response.sendRedirect("../html/error.html");
                }
            %>
            let xValues = ["Πρόσθεση και αφαίρεση", "Πολλαπλασιασμός", "Κριτήρια διαιρετότητας", "Διαίρεση","Επαναληπτικό"];
            let yValues = [array[0], array[1], array[2], array[3], array[4]];
            let barColors = ["red", "green", "blue", "orange", "pink"];

            new Chart("myChart", {
                type: "horizontalBar",
                data: {
                    labels: xValues,
                    datasets: [{
                        backgroundColor: barColors,
                        data: yValues
                    }]
                },
                options: {
                    legend: {display: false},
                    title: {
                        display: true,
                        //text: "Οι καλύτεροι βαθμοί σου σε όλα τα κεφάλαια!"
                    },
                    scales: {
                        xAxes: [{
                            ticks: {min: 0, max:10},
                            scaleLabel: {
                                display: true,
                                labelString: 'Βαθμός'
                            }
                        }]
                    }
                }
            });
        </script>
    </div>
</div>
<%}%>
<footer style="position: fixed; bottom: 0;">
    <hr>
    <h3>Επικοινωνία</h3>
    <p> <i class="fa fa-envelope-o"></i> Email: sinp@uniwa.gr<br>
        <i class="fa fa-phone"></i> Τηλ.: 211-401-0000</p>
</footer>
</body>
</html>

