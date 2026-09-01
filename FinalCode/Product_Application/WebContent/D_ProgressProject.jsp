<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="java.sql.*"%>
<%@ page import="com.user.*"%>
<%@ page import="java.sql.Connection"%>

<!DOCTYPE html>

<html lang="en">

<head>

<title>GreenFund - Farmer Rating</title>

<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

<style>
.rating {
	display: flex;
	flex-direction: row-reverse;
	justify-content: flex-end;
}

.rating input {
	display: none;
}

.rating label {
	font-size: 40px;
	color: #ccc;
	cursor: pointer;
	padding: 5px;
}

.rating label:hover, .rating label:hover ~ label {
	color: gold;
}

.rating input:checked ~ label {
	color: gold;
}
</style>



</head>

<body>

	<%
		if (request.getParameter("Update") != null) {
			out.println("<script>alert('Rating Submitted Successfully!')</script>");
		}
		else if (request.getParameter("msg") != null) 
		{
			out.println("<script>alert('Product Progress No Available')</script>");
		}
	%>

	<nav class="navbar navbar-expand-lg" style="background: #1a4a7a;">

		<div class="container-fluid px-3">

			<a class="navbar-brand text-white fw-bold" href="CHome.jsp"> <i
				class="bi bi-tree-fill me-2"></i> GreenFund

			</a>

			<button class="navbar-toggler border-white" type="button"
				data-bs-toggle="collapse" data-bs-target="#navMenu">

				<span class="navbar-toggler-icon" style="filter: invert(1)"></span>

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

				<li class="breadcrumb-item"><a href="OrderShow.jsp">Orders</a>

				</li>

				<li class="breadcrumb-item active">Farmer Progress</li>

			</ol>

		</nav>

		<div class="row g-4">

			<div class="col-md-5">

				<img src="images/M1.jpg" alt="Farm Product"
					class="img-fluid rounded-3 shadow w-100"
					style="height: 260px; object-fit: cover;">

				<div class="alert alert-info mt-3 small">

					<i class="bi bi-info-circle me-2"></i> Please give genuine feedback
					based on your investment experience.

				</div>

			</div>

			<div class="col-md-7">

				<div class="card border-0 shadow-sm">

					<div class="card-header text-white py-3"
						style="background: linear-gradient(135deg, #1a4a7a, #3498db);">

						<h5 class="mb-0 fw-bold">

							<i class="bi bi-star-fill me-2"></i> Farmer Progress

						</h5>

					</div>

					<div class="card-body p-4">

						<form action="D_ShowProgressProject.jsp" method="post">

							<dl class="row mb-3">

								<dt class="col-5 text-muted small">Select Product ID</dt>

								<dd class="col-7">

									<select class="form-select" name="status" required>

										<option value="">Select Product ID</option>

										<%
											try {

												String query = "select DISTINCT project_id,product_name from investment_contract_db where Status_Info='Accept_Request'";

												Connection conn = DBconn.conn();

												Statement stmt = conn.createStatement();

												ResultSet rs = stmt.executeQuery(query);

												while (rs.next()) {
										%>

										<option value="<%=rs.getString(1)%>">

											<%=rs.getString(1)%>

										</option>

										<%
											}
										%>

									</select>

								</dd>
							</dl>

							<div class="d-flex gap-2">

								<button type="submit" class="btn btn-success flex-grow-1">

									<i class="bi bi-star-fill me-2"></i> Show Progress

								</button>


							</div>

							<%
								} catch (Exception e) {

									e.printStackTrace();

								}
							%>

						</form>

					</div>

				</div>

			</div>

		</div>

	</div>

	<footer class="text-center text-white py-3 mt-4">

		<div class="container">

			<small> Copyright &copy; <script>
				document.write(new Date().getFullYear());
			</script> GreenFund Smart Farming

			</small>

		</div>

	</footer>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>

</html>