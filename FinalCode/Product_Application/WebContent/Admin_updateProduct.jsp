<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@page import="com.user.*"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>GreenFund - Manage Product</title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/dataTables.bootstrap5.min.css">
  <style>body{background:#f0f4f0;} footer{background:#1a1a2e;}</style>
</head>
<body>
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
  <div class="card border-0 shadow-sm rounded-3">
    <div class="card-header text-white py-3" style="background:linear-gradient(135deg,#1a7a2a,#2ecc71);border-radius:12px 12px 0 0;">
      <h5 class="mb-0 fw-bold"><i class="bi bi-pencil-square me-2"></i>Manage Product</h5>
    </div>
    <div class="card-body p-4">
      <form action="Addproduct" method="post">
        <div class="row g-3">
           <div class="col-md-6">
              <label class="form-label fw-semibold">Crop Name</label>
              <input type="text" class="form-control" name="productName" placeholder="e.g. Wheat, Rice, Cotton" required>
            </div>
             <div class="col-md-6">
              <label class="form-label fw-semibold">Company Name</label>
               <input type="text" class="form-control" name="companyname"  pattern="[A-Za-z].{1,}" placeholder="Company Name" title="Minimum Two  Characters  are Required For Company Name" required>
            </div>
              <div class="col-md-6">
              <label class="form-label fw-semibold">Description</label>
              <textarea class="form-control" name="Descriptionname" rows="3" placeholder="Product details, season, soil type, etc."></textarea>
            </div>
              <div class="col-md-6">
              <label class="form-label fw-semibold">MFG. Date</label>
               <input type="date" class="form-control" name="mfgdate"  required>
            </div>
             <div class="col-md-6">
              <label class="form-label fw-semibold">Quantity Available (kg)</label>
              <div class="input-group">
                <span class="input-group-text"><i class="bi bi-boxes"></i></span>
                <input type="number" class="form-control" name="qty" placeholder="Total quantity in kg" required min="1">
              </div>
            </div>
             <div class="col-md-6">
              <label class="form-label fw-semibold">Price per KG (&#8377;)</label>
              <div class="input-group">
                <span class="input-group-text"><i class="bi bi-currency-rupee"></i></span>
                <input type="text" class="form-control" name="price" placeholder="Price per kilogram">
              </div>
            </div>
             <div class="col-md-6">
              <label class="form-label fw-semibold">Expiry. Date</label>
               <input type="date" class="form-control" name="Expirydate"  required>
            </div>
           <div class="col-md-6">
              <label class="form-label fw-semibold">Land Area</label>
              <div class="input-group">
                <span class="input-group-text"></span>
                <input type="text" class="form-control" name="Land_Area" placeholder="Land Area">
              </div>
            </div>
            <div class="col-md-6">
              <label class="form-label fw-semibold">Required Investment</label>
              <div class="input-group">
                <span class="input-group-text"></span>
                <input type="text" class="form-control" name="Required_Investment" placeholder="Required Investment">
              </div>
            </div>
            <div class="d-flex gap-2">
              <button type="submit" class="btn btn-success flex-grow-1"><i class="bi bi-plus-circle me-2"></i>Add Product</button>
              <button type="reset" class="btn btn-outline-secondary"><i class="bi bi-x-circle me-1"></i>Clear</button>
            </div>
        </div>
      </form>
    </div>
  </div>
</div>
<footer class="text-center text-white py-3 mt-4">
  <div class="container"><small>Copyright &copy; <script>document.write(new Date().getFullYear());</script> FarmInvest</small></div>
</footer>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
