<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.Format"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.user.*"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE HTML>
<html lang="en">
<head>
	<title>Blockchain</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<meta charset="UTF-8">
	<link href="https://fonts.googleapis.com/css?family=Encode+Sans+Expanded:400,600,700" rel="stylesheet">
	<link href="plugin-frameworks/bootstrap.css" rel="stylesheet">
	<link href="fonts/ionicons.css" rel="stylesheet">
	<link href="common/styles.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="demo.css" />
	<script>
        function sendMessage() {
            var message = document.getElementById("userInput").value;
            document.getElementById("userInput").value = ""; // Clear input field
            addMessage("You", message);
            
            // Send user message to server
            var xhr = new XMLHttpRequest();
            xhr.onreadystatechange = function() {
                if (xhr.readyState === XMLHttpRequest.DONE) {
                    if (xhr.status === 200) {
                        var response = xhr.responseText;
                        addMessage("Bot", response);
                    } else {
                        addMessage("Bot", "Error: " + xhr.status);
                    }
                }
            };
            xhr.open("POST", "ChatbotServlet", true); // Replace "ChatbotServlet" with your servlet URL
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            xhr.send("message=" + encodeURIComponent(message));
        }

        function addMessage(sender, message) {
            var chatContainer = document.getElementById("chatContainer");
            var messageDiv = document.createElement("div");
            messageDiv.textContent = sender + ": " + message;
            chatContainer.appendChild(messageDiv);
        }
        function clearChat() {
            document.getElementById('chatContainer').innerHTML = '';
          }
    </script>
       <style>
        .chat-container {
            width: 1000px;
            height: 300px;
            border: 1px solid black;
            overflow: auto;
            padding: 10px;
        }
        .message {
            margin-bottom: 10px;
        }
        .user-message {
            color: blue;
        }
        .bot-message {
            color: green;
        }
    </style>
</head>
<body>
	<%
	if(request.getParameter("succ")!=null)
	{
	out.println("<script>alert('Congratulations....product Save Successfull...!')</script>");	
	}
   %>
	<header>		
		<div class="container">
			<a class="logo" href="#"><jsp:include page="titlepage.jsp"></jsp:include></a>
			<a class="menu-nav-icon" data-menu="#main-menu" href="#"><i class="ion-navicon"></i></a>
			<ul class="main-menu" id="main-menu">
				<jsp:include page="distmenu.jsp"></jsp:include>
			</ul>
			<div class="clearfix"></div>
		</div>
	</header>

	<section class="ptb-0">
	<div class="mb-30 brdr-ash-1 opacty-5"></div>
		<div class="container"><br><br><br>
		 <div class="row">
		  <div class="col-sm-12 col-md-8">
			<div class="row">			
			<h3 align="center"><b>View Chat Bot Information:</b></h3>
			<div >
					<div class="agileits_mail_grid_right1">
					<div id="chatContainer" class="chat-container">
					
				<br>
       <!--  <div id="chatContainer"></div> -->
   
</div>
<br>
			<label style="font-size: 12px;color: red;">Enter Question</label>
			<input type="text" id="userInput" style="width: 980px" placeholder="Type a message...">
			<br>
			<br>
    <button style="background: yellow;color: black;" class="button" onclick="sendMessage()">Send</button>	
					<button style="background: yellow;color: black;" class="button" onclick="clearChat()">Clear Chat</button>
			
				</div>
				</div>
			</div>
		</div>
				
				
			</div>
		</div>
	</section><br><br><br><br><br><br>
	
	<footer class="bg-191 color-ccc">
			<div class="brdr-ash-1 opacty-2"></div>
			<div class="oflow-hidden color-ash font-9 text-sm-center ptb-sm-5"><br>
			<p class="color-ash">
				Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="ion-heart" aria-hidden="true"></i> by <a href="#" target="_blank">Digital Certificate on Blockchain</a>
			</p><br>
			</div>
	</footer>
	<script src="plugin-frameworks/jquery-3.2.1.min.js"></script>	
	<script src="plugin-frameworks/tether.min.js"></script>	
	<script src="plugin-frameworks/bootstrap.js"></script>	
	<script src="common/scripts.js"></script>	
</body>
</html>
     