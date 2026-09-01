<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@page import="com.user.*"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>GreenFund - View Contract</title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
  <style>body{background:#f0f4f0;} footer{background:#1a1a2e;}</style>
</head>
<body>
<% if(request.getParameter("Update")!=null){ out.println("<script>alert('Status Updated Successfully!')</script>"); } %>

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
  <nav aria-label="breadcrumb" class="mb-3">
    <ol class="breadcrumb">
      <li class="breadcrumb-item"><a href="CHome.jsp">Home</a></li>
      <li class="breadcrumb-item"><a href="OrderShow.jsp">Orders</a></li>
      <li class="breadcrumb-item active">Contract Detail</li>
    </ol>
  </nav>

  <div class="row g-4">
    <div class="col-md-5">
      <img src="images/M1.jpg" alt="Farm Product" class="img-fluid rounded-3 shadow w-100" style="height:240px;object-fit:cover;">
      <div class="alert alert-info mt-3 small"><i class="bi bi-info-circle me-2"></i>Review all details carefully before confirming.</div>
    </div>
    <div class="col-md-7">
      <div class="card border-0 shadow-sm rounded-3">
        <div class="card-header text-white py-3" style="background:linear-gradient(135deg,#1a4a7a,#3498db);border-radius:12px 12px 0 0;">
          <h5 class="mb-0 fw-bold"><i class="bi bi-file-earmark-text me-2"></i>Contract Details</h5>
        </div>
        <div class="card-body p-4">
        <form action="OrderProjectServlet" method="post"
						class="form-block form-bold form-mb-20 form-h-35 form-brdr-b-grey pr-50 pr-sm-0">
<%
try {
  String mid = request.getParameter("id");
  String query = "select * from product_info where MID='" + mid
			+ "'";
  Connection conn = DBconn.conn();
  Statement stmt = conn.createStatement();
  ResultSet rs = stmt.executeQuery(query);
  if (rs.next()) {
%>
<input type="hidden" name="id"
									value=<%=mid%> readonly="readonly" />
									<input type="hidden" name="product_No"
									value=<%=rs.getString(9)%> readonly="readonly" />
          <dl class="row mb-3">
            <dt class="col-5 text-muted small">Product Name</dt>
            <dd class="col-7 fw-bold"><%=rs.getString(2)%></dd>
            <dt class="col-5 text-muted small">Project ID</dt>
            <dd class="col-7"><code><%=rs.getString(1)%></code></dd>
            <dt class="col-5 text-muted small">CompanyName</dt>
            <dd class="col-7"><%=rs.getString(3)%></dd>
                 <dt class="col-5 text-muted small">Qty Allocated</dt>
            <dd class="col-7"><%=rs.getString(8) != null ? rs.getString(8)+" kg" : "Pending"%></dd>
            <dt class="col-5 text-muted small">Price/KG</dt>
            <dd class="col-7"><%=rs.getString(6) != null ? "&#8377;"+rs.getString(6) : "Pending"%></dd>
            <dt class="col-5 text-muted small">Investment Amount</dt>
            <dd class="col-7"><input type="text" class="form-control" name="qty" placeholder="Enter Amount"
									required="required" pattern="^[1-9]\d*(\.\d+)?$" /></dd>
               </dl>
               <div class="d-flex gap-2">
              <button type="submit" class="btn btn-success flex-grow-1"><i class="bi bi-plus-circle me-2"></i>Order</button>
              <button type="reset" class="btn btn-outline-secondary"><i class="bi bi-x-circle me-1"></i>Clear</button>
            </div>
<% } } catch(Exception e){ e.printStackTrace(); } %>
</form>
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
