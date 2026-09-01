<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>GreenFund - Register</title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
  <style>
    body { background: #f0f4f0; }
    .register-card { border-radius: 16px; box-shadow: 0 8px 32px rgba(0,128,0,0.12); }
    footer { background: #1a1a2e; }
  </style>
</head>
<body>
<% if(request.getParameter("invalid")!=null){ out.println("<script>alert('Invalid input — please check your details!')</script>"); } %>

<nav class="navbar navbar-expand-lg" style="background:#1a7a2a;">
  <div class="container">
    <a class="navbar-brand text-white fw-bold" href="index.jsp"><i class="bi bi-seedling me-2"></i>GreenFund</a>
    <button class="navbar-toggler border-white" type="button" data-bs-toggle="collapse" data-bs-target="#navMenu">
      <span class="navbar-toggler-icon" style="filter:invert(1)"></span>
    </button>
    <div class="collapse navbar-collapse" id="navMenu">
      <ul class="navbar-nav ms-auto">
        <li class="nav-item"><a class="nav-link text-warning fw-semibold" href="RegisterPage.jsp"><i class="bi bi-person-plus me-1"></i>Register</a></li>
        <li class="nav-item"><a class="nav-link text-white" href="LoginPage.jsp"><i class="bi bi-box-arrow-in-right me-1"></i>Login</a></li>
      </ul>
    </div>
  </div>
</nav>

<div class="container py-5">
  <div class="row justify-content-center">
    <div class="col-md-8 col-lg-6">
      <div class="card register-card border-0">
        <div class="card-header text-white text-center py-4" style="background:linear-gradient(135deg,#1a7a2a,#2ecc71); border-radius:16px 16px 0 0;">
          <i class="bi bi-person-plus-fill" style="font-size:3rem;"></i>
          <h4 class="mt-2 mb-0 fw-bold">Create Account</h4>
          <small class="opacity-75">Join the FarmInvest network</small>
        </div>
        <div class="card-body p-4 p-md-5">
          <form action="AddRegister" method="post">
            <div class="mb-3">
              <label class="form-label fw-semibold">Select Role</label>
              <select class="form-select" name="roll" required>
                <option value="" selected disabled>-- Select Role --</option>
                <option value="User">Farmer</option>
                <option value="Distribute">Distributor / Investor</option>
              </select>
            </div>
            <div class="mb-3">
              <label class="form-label fw-semibold">Full Name</label>
              <div class="input-group">
                <span class="input-group-text"><i class="bi bi-person"></i></span>
                <input type="text" class="form-control" name="username" placeholder="Your full name" required>
              </div>
            </div>
            <div class="mb-3">
              <label class="form-label fw-semibold">Email Address</label>
              <div class="input-group">
                <span class="input-group-text"><i class="bi bi-envelope"></i></span>
                <input type="email" class="form-control" name="email" placeholder="yourmail@example.com" required>
              </div>
            </div>
            <div class="mb-3">
              <label class="form-label fw-semibold">Mobile Number</label>
              <div class="input-group">
                <span class="input-group-text"><i class="bi bi-phone"></i></span>
                <input type="text" class="form-control" name="MbNo" placeholder="10-digit mobile" required>
              </div>
            </div>
            <div class="mb-3">
              <label class="form-label fw-semibold">Address</label>
              <textarea class="form-control" name="address" rows="2" placeholder="Your address"></textarea>
            </div>
            <div class="mb-4">
              <label class="form-label fw-semibold">Password</label>
              <div class="input-group">
                <span class="input-group-text"><i class="bi bi-key"></i></span>
                <input type="password" class="form-control" name="password" placeholder="Choose a strong password" required>
              </div>
            </div>
            <div class="d-grid gap-2">
              <button type="submit" class="btn btn-success btn-lg"><i class="bi bi-check-circle me-2"></i>Register</button>
              <a href="LoginPage.jsp" class="btn btn-outline-secondary">Already registered? Login</a>
            </div>
          </form>
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
