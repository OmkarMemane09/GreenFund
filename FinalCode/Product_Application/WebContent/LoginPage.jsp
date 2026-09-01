<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>GreenFund - Login</title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
  <style>
    body { background: #f0f4f0; }
    .navbar-brand { font-weight: 700; font-size: 1.4rem; }
    .login-card { border-radius: 16px; box-shadow: 0 8px 32px rgba(0,128,0,0.12); }
    .login-hero { background: linear-gradient(135deg, #1a7a2a 0%, #2ecc71 100%); border-radius: 16px 0 0 16px; }
    footer { background: #1a1a2e; }
  </style>
</head>
<body>
<%
if(request.getParameter("logout")!=null){ session.invalidate(); Thread.sleep(1000); out.println("<script>alert('Logged out successfully!')</script>"); }
if(request.getParameter("Done")!=null){ out.println("<script>alert('Profile Added Successfully!')</script>"); }
else if(request.getParameter("invalid")!=null){ out.println("<script>alert('Invalid Login Credentials!')</script>"); }
else if(request.getParameter("succ")!=null){ out.println("<script>alert('Registered Successfully!')</script>"); }
%>

<nav class="navbar navbar-expand-lg" style="background:#1a7a2a;">
  <div class="container">
    <a class="navbar-brand text-white" href="index.jsp"><i class="bi bi-seedling me-2"></i>GreenFund</a>
    <button class="navbar-toggler border-white" type="button" data-bs-toggle="collapse" data-bs-target="#navMenu">
      <span class="navbar-toggler-icon" style="filter:invert(1)"></span>
    </button>
    <div class="collapse navbar-collapse" id="navMenu">
      <ul class="navbar-nav ms-auto">
        <li class="nav-item"><a class="nav-link text-white" href="RegisterPage.jsp"><i class="bi bi-person-plus me-1"></i>Register</a></li>
        <li class="nav-item"><a class="nav-link text-warning fw-semibold" href="LoginPage.jsp"><i class="bi bi-box-arrow-in-right me-1"></i>Login</a></li>
      </ul>
    </div>
  </div>
</nav>

<div class="container py-5">
  <div class="row justify-content-center">
    <div class="col-md-9 col-lg-8">
      <div class="card login-card border-0 overflow-hidden">
        <div class="row g-0">
          <div class="col-md-5 login-hero d-flex flex-column justify-content-center align-items-center p-4 text-white text-center">
            <i class="bi bi-shield-lock" style="font-size:4rem;"></i>
            <h4 class="mt-3 fw-bold">Welcome Back!</h4>
            <p class="small mt-2 opacity-75">Login to manage your farm contracts and investments securely.</p>
          </div>
          <div class="col-md-7 p-4 p-md-5">
            <h4 class="fw-bold mb-1 text-success"><i class="bi bi-box-arrow-in-right me-2"></i>Login</h4>
            <p class="text-muted small mb-4">Enter your credentials to continue</p>
            <form action="AddLogin" method="post">
              <div class="mb-3">
                <label class="form-label fw-semibold">Select Role</label>
                <select class="form-select" name="roll" required>
                  <option value="" selected disabled>-- Select Role --</option>
                  <option value="Admin">Farmer</option>
                  <option value="Distribute">Distributor / Investor</option>
                </select>
              </div>
              <div class="mb-3">
                <label class="form-label fw-semibold">Email Address</label>
                <div class="input-group">
                  <span class="input-group-text"><i class="bi bi-envelope"></i></span>
                  <input type="email" class="form-control" name="email" placeholder="yourmail@example.com" required>
                </div>
              </div>
              <div class="mb-4">
                <label class="form-label fw-semibold">Password</label>
                <div class="input-group">
                  <span class="input-group-text"><i class="bi bi-key"></i></span>
                  <input type="password" class="form-control" name="password" placeholder="Enter password" required>
                </div>
              </div>
              <div class="d-grid gap-2">
                <button type="submit" class="btn btn-success btn-lg"><i class="bi bi-box-arrow-in-right me-2"></i>Login</button>
                <a href="RegisterPage.jsp" class="btn btn-outline-secondary">New here? Register</a>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<footer class="text-center text-white py-3 mt-auto">
  <div class="container">
    <small>Copyright &copy; <script>document.write(new Date().getFullYear());</script> FarmInvest &mdash; Farmer Investor Contract System</small>
  </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
