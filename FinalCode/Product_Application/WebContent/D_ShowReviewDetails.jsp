<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.user.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>GreenFund - Distributor Dashboard</title>
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

.sidebar {
	min-height: calc(100vh - 66px);
	background: #1a4a7a;
}

.sidebar .nav-link {
	color: rgba(255, 255, 255, 0.85);
	border-radius: 8px;
	margin-bottom: 4px;
}

.sidebar .nav-link:hover, .sidebar .nav-link.active {
	background: rgba(255, 255, 255, 0.2);
	color: #fff;
}

.stat-card {
	border-radius: 12px;
	border: none;
	box-shadow: 0 4px 16px rgba(0, 0, 0, 0.08);
}

footer {
	background: #1a1a2e;
}
</style>
<style>
body {
	background: #f4f6f9;
}

.card {
	border: none;
	border-radius: 18px;
	background: #fff;
	box-shadow: 0 4px 15px rgba(0, 0, 0, 0.08);
	margin-bottom: 20px;
	transition: 0.3s ease;
	overflow: hidden;
}

.card:hover {
	transform: translateY(-5px);
	box-shadow: 0 8px 25px rgba(0, 0, 0, 0.15);
}

.star {
	color: gold;
	font-size: 22px;
}

.review {
	background: #f8f9fa;
	padding: 10px;
	border-radius: 10px;
}
</style>
</head>
<body>
	<%
		if (request.getParameter("succ") != null) {
			out.println("<script>alert('Login Successful!')</script>");
		}
	%>

	<nav class="navbar navbar-expand-lg" style="background: #1a4a7a;">
		<div class="container-fluid px-3">
			<a class="navbar-brand text-white fw-bold" href="CHome.jsp"><i
				class="bi bi-briefcase me-2"></i>GreenFund</a> <span
				class="navbar-text text-white-50 small d-none d-md-block"><i
				class="bi bi-diagram-3 me-1"></i>Distributor Panel</span>
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

	<div class="container-fluid">
		<div class="row">
			<div class="col-md-2 sidebar py-4 px-3 d-none d-md-block">
				<p class="text-white-50 small text-uppercase fw-bold px-2 mb-2">Menu</p>
				<nav class="nav flex-column">
					<a class="nav-link active" href="CHome.jsp"><i
						class="bi bi-house-door me-2"></i>Dashboard</a> <a class="nav-link"
						href="OrderShow.jsp"><i class="bi bi-clipboard-check me-2"></i>Orders</a>
					<li class="nav-item"><a class="nav-link text-white"
						href="D_RatingProject.jsp"><i class="bi bi-chat-dots me-1"></i>Add
							Rating</a></li> <a class="nav-link"
						href="Distribute_UserPayBillDataShow.jsp"><i
						class="bi bi-receipt me-2"></i>Pay Bill Data</a> <a class="nav-link"
						href="DistUpdateProduct.jsp"><i class="bi bi-chat-dots me-2"></i>Chat
						Bot</a>
					<hr style="border-color: rgba(255, 255, 255, 0.2)">
					<a class="nav-link text-warning" href="LoginPage.jsp?logout"><i
						class="bi bi-box-arrow-right me-2"></i>Logout</a>
				</nav>
			</div>
			<div class="col-md-10 py-4 px-4">
				<h4 class="fw-bold mb-1 text-primary">
					<i class="bi bi-grid me-2"></i>Distributor Dashboard
				</h4>
				<p class="text-muted small mb-4">Welcome back! Manage your
					orders, contracts and payments.</p>
				<div class="row">

					<%
						String farmer = request.getParameter("farmer");

						try {

							Connection con = DBconn.conn();

							PreparedStatement ps = con.prepareStatement(

							"select * from farmer_ratings where farmer_id=? order by id desc"

							);

							ps.setString(1, farmer);

							ResultSet rs = ps.executeQuery();

							while (rs.next()) {

								int rating = rs.getInt("rating");
					%>

					<div class="col-md-4 mb-4">

						<div class="card h-100">

							<div class="card-body">

								<h5 class="fw-bold text-primary">

									<i class="bi bi-person-circle"></i>

									<%=rs.getString("farmer_id")%>

								</h5>

								<p class="mb-1">

									<b>Investor :</b>

									<%=rs.getString("investor_id")%>

								</p>

								<div class="star mb-2">

									<%
										for (int i = 1; i <= rating; i++) {

													out.print("&#9733;");

												}
									%>

									(<%=rating%>/5)

								</div>

								<div class="review">

									<%
										String msg = rs.getString("review");

												if (msg.length() > 60) {

													out.print(msg.substring(0, 60) + "...");

												} else {

													out.print(msg);

												}
									%>

								</div>

								<br> <a
									href="D_RatingShow_Page.jsp"
									class="btn btn-primary btn-sm w-100"> View Full Review </a>

							</div>

						</div>

					</div>

					<%
						}

						} catch (Exception e) {

							e.printStackTrace();

						}
					%>

				</div>
			</div>
		</div>

		<footer class="text-center text-white py-3 mt-4">
			<div class="container">
				<small>Copyright &copy; <script>
					document.write(new Date().getFullYear());
				</script> FarmInvest &mdash; Farmer Investor Contract System
				</small>
			</div>
		</footer>
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
