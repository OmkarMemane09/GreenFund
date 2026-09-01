<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>GreenFund - Chat Bot</title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
  <style>
    body{background:#f0f4f0;} footer{background:#1a1a2e;}
    .chat-window { height: 350px; overflow-y: auto; background: #fff; border-radius: 8px; }
    .chat-msg-bot { background:#e8f5e9; border-radius:12px 12px 12px 0; max-width:75%; }
    .chat-msg-user { background:#1a7a2a; color:#fff; border-radius:12px 12px 0 12px; max-width:75%; }
  </style>
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
</head>
<body>
<nav class="navbar navbar-expand-lg" style="background:#1a4a7a;">
  <div class="container-fluid px-3">
    <a class="navbar-brand text-white fw-bold" href="CHome.jsp"><i class="bi bi-briefcase me-2"></i>GreenFund</a>
    <button class="navbar-toggler border-white" type="button" data-bs-toggle="collapse" data-bs-target="#navMenu">
      <span class="navbar-toggler-icon" style="filter:invert(1)"></span>
    </button>
    <div class="collapse navbar-collapse" id="navMenu">
      <ul class="navbar-nav ms-auto">
        <jsp:include page="distmenu.jsp"></jsp:include>
      </ul>
    </div>
  </div>
</nav>
<div class="container py-4">
  <div class="row justify-content-center">
    <div class="col-md-8 col-lg-6">
      <div class="card border-0 shadow-sm rounded-3">
        <div class="card-header text-white py-3" style="background:linear-gradient(135deg,#1a4a7a,#3498db);border-radius:12px 12px 0 0;">
          <h5 class="mb-0 fw-bold"><i class="bi bi-chat-dots me-2"></i>FarmInvest Chat Bot</h5>
          <small class="opacity-75">Ask about contracts, prices, and more</small>
        </div>
        <div class="card-body p-3">
          <div class="chat-window p-3 mb-3" id="chatWindow">
            <div class="d-flex mb-3">
              <div class="chat-msg-bot p-3 small">
                <i class="bi bi-robot me-2 text-success"></i>Hello! I'm the FarmInvest assistant. How can I help you today? You can ask about contract status, product prices, or investment queries.
             <div id="chatContainer" class="chat-container">
					
				<br>
       <!--  <div id="chatContainer"></div> -->
   
</div>
              </div>
            </div>
          </div>
          
         <!--  <form action="ChatBot" method="post" id="chatForm"> -->
            <div class="input-group">
              <input type="text" class="form-control" name="message" id="userInput" placeholder="Type your question..." required>
              <button type="submit" class="btn btn-primary" onclick="sendMessage()"><i class="bi bi-send"></i></button>
           <button class="btn btn-outline-secondary" onclick="clearChat()"><i class="bi bi-x-circle me-1"></i>Clear</button>
			
            </div>
         <!--  </form> -->
        </div>
      </div>
    </div>
  </div>
</div>
<footer class="text-center text-white py-3 mt-4">
  <div class="container"><small>Copyright &copy; <script>document.write(new Date().getFullYear());</script> FarmInvest</small></div>
</footer>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
