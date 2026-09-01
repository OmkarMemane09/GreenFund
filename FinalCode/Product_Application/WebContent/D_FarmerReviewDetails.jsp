<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.user.*"%>

<!DOCTYPE html>

<html>

<head>

<title>Full Reviews</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">

<style>
body {
	background: #f4f6f9;
}

.card {
	border: none;
	border-radius: 15px;
	box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.1);
	margin-bottom: 20px;
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

	<div class="container py-5">

		<h2 class="mb-4">Farmer Full Reviews</h2>

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

		<div class="card">

			<div class="card-body">

				<h5>

					Farmer :

					<%=rs.getString("farmer_id")%>

				</h5>

				<p>

					Investor : <b> <%=rs.getString("investor_id")%>

					</b>

				</p>

				<div class="star">

					<%
						for (int i = 1; i <= rating; i++) {

									out.print("&#9733;");

								}
					%>

					(<%=rating%>/5)

				</div>

				<br>

				<div class="review">

					<%=rs.getString("review")%>

				</div>

			</div>

		</div>

		<%
			}

			} catch (Exception e) {

				e.printStackTrace();

			}
		%>

		<a href="FarmerRatingAverage.jsp" class="btn btn-success"> Back </a>

	</div>

</body>

</html>