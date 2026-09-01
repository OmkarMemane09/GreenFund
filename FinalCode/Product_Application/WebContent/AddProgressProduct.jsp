<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ page import="java.sql.*" %>
<%@page import="com.user.*"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>FarmInvest - Add Product</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css"
	rel="stylesheet">
<style>
body {
	background: #f0f4f0;
}

footer {
	background: #1a1a2e;
}
</style>
</head>
<body>
	<%
		if (request.getParameter("success") != null) {
			out.println("<script>alert('Product Progress Save Successfully')</script>");
		}
	%>
	<nav class="navbar navbar-expand-lg" style="background: #1a7a2a;">
		<div class="container-fluid px-3">
			<a class="navbar-brand text-white fw-bold" href="AdminHome.jsp"><i
				class="bi bi-seedling me-2"></i>FarmInvest</a>
			<button class="navbar-toggler border-white" type="button"
				data-bs-toggle="collapse" data-bs-target="#navMenu">
				<span class="navbar-toggler-icon" style="filter: invert(1)"></span>
			</button>
			<div class="collapse navbar-collapse" id="navMenu">
				<ul class="navbar-nav ms-auto">
					<jsp:include page="adminmenu.jsp"></jsp:include>
				</ul>
			</div>
		</div>
	</nav>

	<div class="container py-4">
		<div class="row justify-content-center">
			<div class="col-md-8 col-lg-6">
				<div class="card border-0 shadow-sm rounded-3">
					<div class="card-header text-white py-3"
						style="background: linear-gradient(135deg, #1a7a2a, #2ecc71); border-radius: 12px 12px 0 0;">
						<h5 class="mb-0 fw-bold">
							<i class="bi bi-plus-circle me-2"></i>Add New Product
						</h5>
					</div>
					<div class="card-body p-4">
					<form action="AddProgressServlet" method="post" enctype="multipart/form-data">
					<div class="mb-3">

								<label> Project ID </label>
								<select name="project_id"
									class="form-select" required>
									<option value="">Select Project ID</option>
								
					<%
					String emailid=(String)session.getAttribute("userid");
					String query = "select * from product_info where Farmer_Email_ID='"+emailid+"'";
					  Connection conn = DBconn.conn();
					  Statement stmt = conn.createStatement();
					  ResultSet rs = stmt.executeQuery(query);
					  while(rs.next()) {
											 
					  %>

									<option value="<%=rs.getString("Product_No")%>"><%=rs.getString("Product_No")%></option>
									<%} %>
									</select>
							</div>

							<div class="mb-3">

								<label> Farmer Email </label> <input type="email"
									name="farmer_email" class="form-control" value="<%=emailid %>" readonly="readonly" required>

							</div>


							<div class="mb-3">

								<label> Week No </label> 
								<select name="week_no"
									class="form-select" required>

									<option value="">Select Week</option>

									<option value="Week 1">Week 1</option>

									<option value="Week 2">Week 2</option>

									<option value="Week 3">Week 3</option>

									<option value="Week 4">Week 4</option>

									<option value="Week 5">Week 5</option>

									<option value="Week 6">Week 6</option>

									<option value="Week 7">Week 7</option>

									<option value="Week 8">Week 8</option>

									<option value="Week 9">Week 9</option>

									<option value="Week 10">Week 10</option>

									<option value="Week 11">Week 11</option>

									<option value="Week 12">Week 12</option>

								</select>

							</div>

							<div class="mb-3">

								<label> Progress Title </label> <select
									name="progress_message" class="form-select" required>

									<option value="">Select Progress Update</option>

									<option value="Seeds Planted Successfully">Seeds
										Planted Successfully</option>

									<option value="Watering Completed">Watering Completed

									</option>

									<option value="Fertilizer Added">Fertilizer Added</option>

									<option value="Healthy Crop Growth">Healthy Crop
										Growth</option>

									<option value="Crop Growth 20 Percent">Crop Growth 20
										Percent</option>

									<option value="Crop Growth 40 Percent">Crop Growth 40
										Percent</option>

									<option value="Crop Growth 60 Percent">Crop Growth 60
										Percent</option>

									<option value="Pest Control Applied">Pest Control
										Applied</option>

									<option value="Irrigation Process Completed">

										Irrigation Process Completed</option>

									<option value="Harvest Preparation Started">Harvest
										Preparation Started</option>

									<option value="Crop Ready For Harvest">Crop Ready For
										Harvest</option>

									<option value="Weather Condition Good">Weather
										Condition Good</option>

									<option value="Crop Quality Excellent">Crop Quality
										Excellent</option>

								</select>

							</div>

							<div class="mb-3">

								<label> Growth Percentage </label> <input type="number"
									name="growth_percent" class="form-control" placeholder="40"
									required>

							</div>

<div class="mb-3">

								<label> Project Image </label> <input type="file"
name="image"
class="form-control" required="required">

							</div>
							<button class="btn btn-success w-100">Upload Progress</button>

						</form>

					</div>
				</div>
			</div>
		</div>
	</div>

	<footer class="text-center text-white py-3 mt-4">
		<div class="container">
			<small>Copyright &copy; <script>
				document.write(new Date().getFullYear());
			</script> FarmInvest
			</small>
		</div>
	</footer>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
