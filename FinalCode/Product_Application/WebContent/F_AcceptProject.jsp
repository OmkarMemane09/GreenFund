<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.user.*"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>GreenFund - Accept Contract</title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
  <style>
    body { background: #f0f4f0; }
    footer { background: #1a1a2e; }
    .contract-img { width: 100%; height: 260px; object-fit: cover; border-radius: 12px; }
  </style>
</head>
<body>
<% if(request.getParameter("Update")!=null){ out.println("<script>alert('Status Updated Successfully!')</script>"); } %>

<nav class="navbar navbar-expand-lg" style="background:#1a7a2a;">
  <div class="container-fluid px-3">
    <a class="navbar-brand text-white fw-bold" href="AdminHome.jsp"><i class="bi bi-seedling me-2"></i>GreenFund</a>
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

<div class="container py-4">
  <nav aria-label="breadcrumb" class="mb-3">
    <ol class="breadcrumb">
      <li class="breadcrumb-item"><a href="AdminHome.jsp">Home</a></li>
      <li class="breadcrumb-item"><a href="DistributeDataShow.jsp">Contract List</a></li>
      <li class="breadcrumb-item active">Accept Contract</li>
    </ol>
  </nav>

  <div class="row g-4">
    <div class="col-md-5">
      <img src="images/M1.jpg" alt="Farm Product" class="contract-img shadow">
      <div class="card border-0 shadow-sm mt-3 p-3 rounded-3">
        <h6 class="text-muted text-uppercase small fw-bold mb-2">Contract Info</h6>
        <p class="mb-1 small"><i class="bi bi-shield-check text-success me-2"></i>Secure blockchain-backed contract</p>
        <p class="mb-0 small"><i class="bi bi-clock-history text-warning me-2"></i>Verify details before accepting</p>
      </div>
    </div>
    <div class="col-md-7">
      <div class="card border-0 shadow-sm rounded-3">
        <div class="card-header text-white py-3" style="background:linear-gradient(135deg,#1a7a2a,#2ecc71); border-radius:12px 12px 0 0;">
          <h5 class="mb-0 fw-bold"><i class="bi bi-file-earmark-check me-2"></i>Accept Investment Contract</h5>
        </div>
        <div class="card-body p-4">
<%
try {
  String mid = request.getParameter("id");
  String query = "select * from investment_contract_db where id='" + mid + "'";
  Connection conn = DBconn.conn();
  Statement stmt = conn.createStatement();
  ResultSet rs = stmt.executeQuery(query);
  if (rs.next()) {
%>
          <form action="Accept" method="post">
            <input type="hidden" name="id" value="<%=mid%>">
            <input type="hidden" name="product_No" value="<%=rs.getString(2)%>">
            <div class="mb-3">
              <label class="form-label fw-semibold text-muted small text-uppercase">Product Name</label>
              <div class="form-control bg-light fw-bold text-dark"><%=rs.getString(6)%></div>
            </div>
            <div class="mb-3">
              <label class="form-label fw-semibold">Total Farmer Quantity (kg)</label>
              <div class="input-group">
                <span class="input-group-text"><i class="bi bi-boxes"></i></span>
                <input type="text" class="form-control" name="qty" placeholder="Enter quantity" required pattern="^[1-9]\d*(\.\d+)?$">
              </div>
            </div>
            <div class="mb-4">
              <label class="form-label fw-semibold">New Price per KG (&#8377;)</label>
              <div class="input-group">
                <span class="input-group-text"><i class="bi bi-currency-rupee"></i></span>
                <input type="text" class="form-control" name="price_per_kg" placeholder="Enter price per KG">
              </div>
            </div>
            <div class="d-flex gap-2">
              <button type="submit" class="btn btn-success flex-grow-1"><i class="bi bi-check-circle me-2"></i>Accept Contract</button>
              <button type="reset" class="btn btn-outline-secondary"><i class="bi bi-arrow-counterclockwise me-1"></i>Reset</button>
            </div>
          </form>
<% } } catch (Exception e) { e.printStackTrace(); } %>
        </div>
      </div>
    </div>
  </div>
</div>

<footer class="text-center text-white py-3 mt-4">
  <div class="container">
    <small>Copyright &copy; <script>document.write(new Date().getFullYear());</script> FarmInvest</small>
  </div>
</footer>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
