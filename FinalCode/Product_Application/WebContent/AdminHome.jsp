<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>GreenFund - Farmer Dashboard</title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
  <style>
    body { background: #f0f4f0; }
    .sidebar { min-height: calc(100vh - 66px); background: #1a7a2a; }
    .sidebar .nav-link { color: rgba(255,255,255,0.85); border-radius: 8px; margin-bottom:4px; }
    .sidebar .nav-link:hover, .sidebar .nav-link.active { background: rgba(255,255,255,0.2); color: #fff; }
    .stat-card { border-radius: 12px; border: none; box-shadow: 0 4px 16px rgba(0,0,0,0.08); }
    footer { background: #1a1a2e; }
  </style>
</head>
<body>
<% if(request.getParameter("succ")!=null){ out.println("<script>alert('Login Successful!')</script>"); } %>

<nav class="navbar navbar-expand-lg" style="background:#1a7a2a;">
  <div class="container-fluid px-3">
    <a class="navbar-brand text-white fw-bold" href="AdminHome.jsp"><i class="bi bi-seedling me-2"></i>GreenFund</a>
    <span class="navbar-text text-white-50 small d-none d-md-block"><i class="bi bi-person-badge me-1"></i>Farmer Panel</span>
    <button class="navbar-toggler border-white" type="button" data-bs-toggle="collapse" data-bs-target="#navMenu">
      <span class="navbar-toggler-icon" style="filter:invert(1)"></span>
    </button>
    <div class="collapse navbar-collapse" id="navMenu">
      <ul class="navbar-nav ms-auto">
        <jsp:include page="adminmenu.jsp"></jsp:include>
      </ul>
    </div>
  </div>
</nav>

<div class="container-fluid">
  <div class="row">
    <div class="col-md-2 sidebar py-4 px-3 d-none d-md-block">
      <p class="text-white-50 small text-uppercase fw-bold px-2 mb-2">Menu</p>
      <nav class="nav flex-column">
        <a class="nav-link active" href="AdminHome.jsp"><i class="bi bi-house-door me-2"></i>Dashboard</a>
        <a class="nav-link" href="Admin_updateProduct.jsp"><i class="bi bi-plus-circle me-2"></i>Add Product</a>
        <a class="nav-link" href="DistributeDataShow.jsp"><i class="bi bi-table me-2"></i>Distribute Data</a>
       <!--  <a class="nav-link" href="Admin_updateProduct.jsp"><i class="bi bi-pencil-square me-2"></i>Update Product</a> -->
        <a class="nav-link" href="F_DistributeDataShow.jsp"><i class="bi bi-bar-chart me-2"></i>Data Show</a>
        <hr style="border-color:rgba(255,255,255,0.2)">
        <a class="nav-link text-warning" href="LoginPage.jsp?logout"><i class="bi bi-box-arrow-right me-2"></i>Logout</a>
      </nav>
    </div>
    <div class="col-md-10 py-4 px-4">
      <div class="d-flex align-items-center mb-4">
        <div>
          <h4 class="fw-bold mb-0 text-success"><i class="bi bi-grid me-2"></i>Farmer Dashboard</h4>
          <p class="text-muted small mb-0">Welcome back! Manage your products and contracts.</p>
        </div>
      </div>
      <div class="row g-4 mb-4">
        <div class="col-sm-6 col-xl-3">
          <div class="card stat-card p-3" style="border-left:5px solid #2ecc71;">
            <div class="d-flex align-items-center">
              <div class="rounded-circle d-flex align-items-center justify-content-center me-3" style="width:48px;height:48px;background:#e8f5e9;">
                <i class="bi bi-box-seam text-success fs-4"></i>
              </div>
              <div><p class="mb-0 text-muted small">Products</p><h5 class="fw-bold mb-0">My Products</h5></div>
            </div>
            <a href="UpdateProduct.jsp" class="btn btn-sm btn-outline-success mt-3 w-100">View &rarr;</a>
          </div>
        </div>
        <div class="col-sm-6 col-xl-3">
          <div class="card stat-card p-3" style="border-left:5px solid #3498db;">
            <div class="d-flex align-items-center">
              <div class="rounded-circle d-flex align-items-center justify-content-center me-3" style="width:48px;height:48px;background:#e3f2fd;">
                <i class="bi bi-people text-primary fs-4"></i>
              </div>
              <div><p class="mb-0 text-muted small">Investors</p><h5 class="fw-bold mb-0">Contracts</h5></div>
            </div>
            <a href="DistributeDataShow.jsp" class="btn btn-sm btn-outline-primary mt-3 w-100">View &rarr;</a>
          </div>
        </div>
        <div class="col-sm-6 col-xl-3">
          <div class="card stat-card p-3" style="border-left:5px solid #f39c12;">
            <div class="d-flex align-items-center">
              <div class="rounded-circle d-flex align-items-center justify-content-center me-3" style="width:48px;height:48px;background:#fff8e1;">
                <i class="bi bi-graph-up text-warning fs-4"></i>
              </div>
              <div><p class="mb-0 text-muted small">Analytics</p><h5 class="fw-bold mb-0">Data Show</h5></div>
            </div>
            <a href="F_DistributeDataShow.jsp" class="btn btn-sm btn-outline-warning mt-3 w-100">View &rarr;</a>
          </div>
        </div>
        <div class="col-sm-6 col-xl-3">
          <div class="card stat-card p-3" style="border-left:5px solid #9b59b6;">
            <div class="d-flex align-items-center">
              <div class="rounded-circle d-flex align-items-center justify-content-center me-3" style="width:48px;height:48px;background:#f3e5f5;">
                <i class="bi bi-pencil-square" style="color:#9b59b6;font-size:1.5rem;"></i>
              </div>
              <div><p class="mb-0 text-muted small">Products</p><h5 class="fw-bold mb-0">Progress</h5></div>
            </div>
            <a href="AddProgressProduct.jsp" class="btn btn-sm mt-3 w-100" style="border-color:#9b59b6;color:#9b59b6;">View &rarr;</a>
          </div>
        </div>
      </div>
      <div class="card border-0 shadow-sm rounded-3 p-4">
        <h5 class="fw-bold text-success"><i class="bi bi-info-circle me-2"></i>System Overview</h5>
        <p class="text-muted mb-0">Use the left sidebar or top menu to navigate. As a <strong>Farmer</strong>, you can add/update products, view investor contracts, and manage distributions.</p>
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
