<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.user.*"%>

<!DOCTYPE html>

<html>

<head>

<title>Farmer Ratings</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">

<style>
body {
	background: #f5f5f5;
}

.card {
	border: none;
	border-radius: 15px;
	box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.1);
}

.star {
	color: gold;
	font-size: 20px;
}
</style>

</head>

<body>

	<div class="container py-5">

		<div class="card">

			<div class="card-header bg-success text-white">

				<h3>Farmer Average Ratings</h3>

			</div>

			<div class="card-body">

				<table class="table table-bordered table-hover">

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

						<td><a href="D_FarmerReviewDetails.jsp?farmer=<%=farmer%>"
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

</body>

</html>