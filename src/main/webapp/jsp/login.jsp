<%@ page import="projectel.projectel.Login" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 18/4/2022
  Time: 4:57 μ.μ.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="el">
<head>
    <meta charset="UTF-8">
    <title>Μαθηματικά Ε - ΒΕΜΠΛΗΧΑ</title>
    <style>
        body {
            background-image: url('../assets/simple_background5.png');
            background-attachment: fixed;
            background-size: 100% 100%;
            font-family: Arial, Helvetica, sans-serif;
        }

        form {
            background: rgba(200, 129, 90, 0.3);
            position: absolute;
            border: 2px solid #f1f1f1;
            top: 18%;
            left: 8%;
            width: 33%;
        }

        input[type=text], input[type=password] {
            width: 100%;
            padding: 12px 20px;
            margin: 2px 0;
            display: inline-block;
            border: 1px solid #ccc;
            box-sizing: border-box;
        }

        .button1 {
            background-color:rgb(131, 79, 120);
            padding: 8px 16px;/*μέγεθος κουμπιού*/
            font-size: 16px; /*μέγεθος γραμμάτων*/
            width: 25%;
            color: white;
            position:absolute;
            left:38%;
            bottom:1px;
        }
        button {
            background-color: rgb(44, 121, 165);
            color: white;
            padding: 14px 20px;
            margin: 2px 0;
            border: none;
            cursor: pointer;
            width: 100%;
        }
        a, a:visited {
            color: inherit;
        }

        button:hover {
            opacity: 0.8;
        }
        .img-container {
            text-align: center;
            margin: 2px 0 0 0;
        }

        img.avatar {
            width: 15%;
            border-radius: 50%;
        }

        .container {
            padding: 8px;
        }
        @media (max-width: 680px){
            form {
                width: 80%;
            }
        }
        @media (max-height: 490px){
            form {
                width: 80%;
            }
            .img-container {
                display: none;
            }
        }

    </style>
</head>
<body>
<!--
<div style = "position:absolute; left:18%; bottom:82%">
    <h1  style="color:rgb(44, 121, 165); font-size:70px;">Ας αρχίσουμε να μαθαίνουμε!</h1>
</div>
-->
<form action="" method="post">
    <div class="container">
        <div class="img-container">
            <img src="../assets/cat_glasses.jpg" alt="Avatar" class="avatar">
        </div>

        <label for="email"><b>Email χρήστη</b></label>
        <input type="text" placeholder="Εισαγωγή email χρήστη" name="email" id="email" required maxlength="100">
        <br>
        <label for="password"><b>Κωδικός</b></label>
        <input type="password" placeholder="Εισαγωγή κωδικού" name="password" id="password" required maxlength="32">
        <br>
        <%
            request.setCharacterEncoding("UTF-8");
            if ("POST".equalsIgnoreCase(request.getMethod())){
                String userId = Login.checkCredentials(request.getParameter("email"),request.getParameter("password"));
                if (userId != null){
                    session.setAttribute("userId",userId);
                    response.sendRedirect("../index.jsp");
                }else{
                    out.println("<FONT COLOR=\"#ff0000\">Λάθος στοιχεία</FONT><br>");
                }
            }
        %>
        <button type="submit">Σύνδεση</button>
        <br>
        <div style="text-align: center;">Ή</div>
        Εάν είναι η πρώτη σου φορά εδώ, πάτα το παρακάτω κουμπί για να δημιουργήσεις έναν λογαριασμό!
        <button type="button" onclick="location.href='newAccount.jsp'">Δημιουργία Λογαριασμού</button>
    </div>

</form>
<!--<a href="#" style="color:rgb(44, 121, 165);position:fixed; left:36%; bottom:0%;"><h1><-Γύρνα πίσω στην αρχική</h1></a>-->

<button class="button1" type="button">Γύρνα πίσω στην αρχική</button>

</body>
</html>
