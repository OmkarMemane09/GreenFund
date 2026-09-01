<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@page import="com.user.*"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>GreenFund - Data View</title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/dataTables.bootstrap5.min.css">
  <style>body{background:#f0f4f0;} footer{background:#1a1a2e;}</style>
</head>
<body>
<% if(request.getParameter("Update")!=null){ out.println("<script>alert('Updated Successfully!')</script>"); } %>

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

<div class="container-fluid py-4 px-4">
  <div class="p-4 mb-4 text-white rounded-3 d-flex align-items-center" style="background:linear-gradient(135deg,#1a7a2a,#2ecc71);">
    <i class="bi bi-table fs-3 me-3"></i>
    <div><h4 class="fw-bold mb-0">View Information</h4><small class="opacity-75">All records from the contract database</small></div>
  </div>
  <div class="card border-0 shadow-sm rounded-3">
    <div class="card-body p-0">
      <div class="table-responsive">
        <table id="examples" class="table table-hover table-striped align-middle mb-0">
          <thead class="table-success">
            <tr>
              <th>#</th><th>Product Name</th><th>Project ID</th>
              <th>Investment Amount</th><th>Investor Name</th>
              <th>Investor Email</th><th>Investor Mobile</th><th>Status</th>
            </tr>
          </thead>
          <tbody>
<%
try {
  int i = 1;
  String query = "select * from investment_contract_db";
  Connection conn = DBconn.conn();
  Statement stmt = conn.createStatement();
  ResultSet rs = stmt.executeQuery(query);
  while(rs.next()) {
%>
            <tr>
              <td><span class="badge bg-secondary"><%=i++%></span></td>
              <td><strong><%=rs.getString(6)%></strong></td>
              <td><code><%=rs.getString(2)%></code></td>
              <td><span class="badge bg-success">&#8377;<%=rs.getString(10)%></span></td>
              <td><%=rs.getString(7)%></td>
              <td><%=rs.getString(8)%></td>
              <td><%=rs.getString(9)%></td>
              <td><a href="Accept?id=<%=rs.getString(1)%>" class="btn btn-sm btn-outline-primary">
                  <i class="bi bi-eye me-1"></i>View</a></td>
            </tr>
<% } } catch(Exception e){ e.printStackTrace(); } %>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</div>

<footer class="text-center text-white py-3 mt-4">
  <div class="container"><small>Copyright &copy; <script>document.write(new Date().getFullYear());</script> FarmInvest</small></div>
</footer>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.13.4/js/dataTables.bootstrap5.min.js"></script>
<script>$(document).ready(function(){ $('#examples').DataTable({ pagingType:'full_numbers' }); });</script>
</body>
</html>
