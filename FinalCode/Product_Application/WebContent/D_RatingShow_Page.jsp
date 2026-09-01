<%@ page import="java.sql.*" %>
<%@page import="javax.sql.*" %>
<%@ page import="com.user.*" %>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>GreenFund - Orders</title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/dataTables.bootstrap5.min.css">
  <style>
    body { background: #f0f4f0; }
    footer { background: #1a1a2e; }
    .page-header { background: linear-gradient(135deg,#1a4a7a,#3498db); color: white; border-radius: 12px; }
  </style>
</head>
<body>
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

<div class="container-fluid py-4 px-4">
  <div class="page-header p-4 mb-4 d-flex align-items-center">
    <i class="bi bi-clipboard-check fs-3 me-3"></i>
    <div>
      <h4 class="fw-bold mb-0">Rating</h4>
      <small class="opacity-75">Manage and review incoming orders</small>
    </div>
  </div>

  <div class="card border-0 shadow-sm rounded-3">
    <div class="card-body p-0">
      <div class="table-responsive">
        <table id="examples" class="table table-hover table-striped align-middle mb-0">

					<tr>

						<th>Farmer</th>

						<th>Average Rating</th>

						<th>Total Reviews</th>

						<th>Action</th>

					</tr>

					<%
						try {

							Connection con = DBconn.conn();

							PreparedStatement ps = con
									.prepareStatement(

									"SELECT farmer_id, ROUND(AVG(rating),1) AS avg_rating, COUNT(*) total_reviews FROM farmer_ratings GROUP BY farmer_id"

									);

							ResultSet rs = ps.executeQuery();

							while (rs.next()) {

								String farmer = rs.getString("farmer_id");

								double avg = rs.getDouble("avg_rating");
					%>

					<tr>

						<td><%=farmer%></td>

						<td>
							<%
								for (int i = 1; i <= Math.round(avg); i++) {

											out.print("⭐");

										}
							%> (<%=avg%>/5)

						</td>

						<td><%=rs.getInt("total_reviews")%></td>

						<td>
                <a href="OrderShow.jsp?farmer=<%=farmer%>" class="btn btn-sm btn-outline-primary">
                  <i class="bi bi-eye me-1"></i>Order
                </a>|
              
						<a href="D_ShowReviewDetails.jsp?farmer=<%=farmer%>"
							class="btn btn-primary btn-sm"> View Full Reviews </a></td>

					</tr>

					<%
						}

						} catch (Exception e) {

							e.printStackTrace();

						}
					%>

				</table>
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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.13.4/js/dataTables.bootstrap5.min.js"></script>

</body>
</html>
