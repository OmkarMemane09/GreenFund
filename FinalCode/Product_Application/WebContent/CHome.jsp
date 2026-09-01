<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>GreenFund - Distributor Dashboard</title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
  <style>
    body { background: #f0f4f0; }
    .sidebar { min-height: calc(100vh - 66px); background: #1a4a7a; }
    .sidebar .nav-link { color: rgba(255,255,255,0.85); border-radius: 8px; margin-bottom:4px; }
    .sidebar .nav-link:hover, .sidebar .nav-link.active { background: rgba(255,255,255,0.2); color: #fff; }
    .stat-card { border-radius: 12px; border: none; box-shadow: 0 4px 16px rgba(0,0,0,0.08); }
    footer { background: #1a1a2e; }
  </style>
</head>
<body>
<% if(request.getParameter("succ")!=null){ out.println("<script>alert('Login Successful!')</script>"); } %>

<nav class="navbar navbar-expand-lg" style="background:#1a4a7a;">
  <div class="container-fluid px-3">
    <a class="navbar-brand text-white fw-bold" href="CHome.jsp"><i class="bi bi-briefcase me-2"></i>GreenFund</a>
    <span class="navbar-text text-white-50 small d-none d-md-block"><i class="bi bi-diagram-3 me-1"></i>Distributor Panel</span>
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

<div class="container-fluid">
  <div class="row">
    <div class="col-md-2 sidebar py-4 px-3 d-none d-md-block">
      <p class="text-white-50 small text-uppercase fw-bold px-2 mb-2">Menu</p>
      <nav class="nav flex-column">
        <a class="nav-link active" href="CHome.jsp"><i class="bi bi-house-door me-2"></i>Dashboard</a>
        <a class="nav-link" href="D_RatingShow_Page.jsp"><i class="bi bi-clipboard-check me-2"></i>Orders</a>
        <a class="nav-link text-white" href="D_RatingProject.jsp"><i class="bi bi-chat-dots me-1"></i>Add Rating</a></li>
        <a class="nav-link" href="Distribute_UserPayBillDataShow.jsp"><i class="bi bi-receipt me-2"></i>Pay Bill Data</a>
        <a class="nav-link" href="DistUpdateProduct.jsp"><i class="bi bi-chat-dots me-2"></i>Chat Bot</a>
         <a class="nav-link" href="D_ProgressProject.jsp"><i class="bi bi-chat-dots me-2"></i>Progress Project</a>
        <hr style="border-color:rgba(255,255,255,0.2)">
        <a class="nav-link text-warning" href="LoginPage.jsp?logout"><i class="bi bi-box-arrow-right me-2"></i>Logout</a>
      </nav>
    </div>
    <div class="col-md-10 py-4 px-4">
      <h4 class="fw-bold mb-1 text-primary"><i class="bi bi-grid me-2"></i>Distributor Dashboard</h4>
      <p class="text-muted small mb-4">Welcome back! Manage your orders, contracts and payments.</p>
      <div class="row g-4 mb-4">
        <div class="col-sm-6 col-xl-4">
          <div class="card stat-card p-3" style="border-left:5px solid #3498db;">
            <div class="d-flex align-items-center">
              <div class="rounded-circle d-flex align-items-center justify-content-center me-3" style="width:48px;height:48px;background:#e3f2fd;">
                <i class="bi bi-clipboard-check text-primary fs-4"></i>
              </div>
              <div><p class="mb-0 text-muted small">Farmer</p><h5 class="fw-bold mb-0">Profile</h5></div>
            </div>
            <a href="D_RatingShow_Page.jsp" class="btn btn-sm btn-outline-primary mt-3 w-100">View &rarr;</a>
          </div>
        </div>
        <div class="col-sm-6 col-xl-4">
          <div class="card stat-card p-3" style="border-left:5px solid #2ecc71;">
            <div class="d-flex align-items-center">
              <div class="rounded-circle d-flex align-items-center justify-content-center me-3" style="width:48px;height:48px;background:#e8f5e9;">
                <i class="bi bi-receipt text-success fs-4"></i>
              </div>
              <div><p class="mb-0 text-muted small">Bills</p><h5 class="fw-bold mb-0">Pay Bill Data</h5></div>
            </div>
            <a href="Distribute_UserPayBillDataShow.jsp" class="btn btn-sm btn-outline-success mt-3 w-100">View &rarr;</a>
          </div>
        </div>
        <div class="col-sm-6 col-xl-4">
          <div class="card stat-card p-3" style="border-left:5px solid #f39c12;">
            <div class="d-flex align-items-center">
              <div class="rounded-circle d-flex align-items-center justify-content-center me-3" style="width:48px;height:48px;background:#fff8e1;">
                <i class="bi bi-chat-dots text-warning fs-4"></i>
              </div>
              <div><p class="mb-0 text-muted small">AI</p><h5 class="fw-bold mb-0">Chat Bot</h5></div>
            </div>
            <a href="DistUpdateProduct.jsp" class="btn btn-sm btn-outline-warning mt-3 w-100">Open &rarr;</a>
          </div>
        </div>
         <div class="col-sm-6 col-xl-4">
          <div class="card stat-card p-3" style="border-left:5px solid #f312d5;">
            <div class="d-flex align-items-center">
              <div class="rounded-circle d-flex align-items-center justify-content-center me-3" style="width:48px;height:48px;background:#fff8e1;">
                <i class="bi bi-chat-dots text-warning fs-4"></i>
              </div>
              <div><p class="mb-0 text-muted small">Farmer Product</p><h5 class="fw-bold mb-0">Progress View</h5></div>
            </div>
            <a href="D_ProgressProject.jsp" class="btn btn-sm btn-outline-warning mt-3 w-100">Open &rarr;</a>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<footer class="text-center text-white py-3 mt-4">
  <div class="container">
    <small>Copyright &copy; <script>document.write(new Date().getFullYear());</script> FarmInvest &mdash; Farmer Investor Contract System</small>
  </div>
</footer>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
