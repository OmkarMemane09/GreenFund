<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page import="java.sql.*"%>
<%@ page import="com.user.*"%>

<!DOCTYPE html>

<html>

<head>

<title>Project Progress</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">

<style>
body {
	background: #f5f5f5;
}

.card {
	border: none;
	border-radius: 18px;
	box-shadow: 0 4px 15px rgba(0, 0, 0, 0.08);
	margin-bottom: 20px;
}

.timeline {
	border-left: 4px solid #198754;
	padding-left: 20px;
}
</style>

</head>

<body>

	<div class="container py-5">

		<h2 class="mb-4 text-success">Weekly Farming Progress</h2>

		<div class="timeline">

			<%
			String id=request.getParameter("status");
				try {

					Connection con = DBconn.conn();

					PreparedStatement ps = con.prepareStatement(

					"select * from project_progress where project_id='"+id+"'order by id desc"

					);

					ResultSet rs = ps.executeQuery();

					if(rs.next()) {

						int growth = rs.getInt("growth_percent");
			%>

			<div class="card">

				<div class="card-body">
					<b>Week Working</b><br>
					<h4 class="text-primary">

						<%=rs.getString("week_no")%>

					</h4>
					<b>Progress Title</b><br>
					<h4 class="text-primary">

						<%=rs.getString("progress_title")%>

					</h4>


						<b>Farmer Email ID :</b><br>
					<h4 class="text-primary">
						<%=rs.getString("farmer_email")%>
					</h4>
					
					<b>Growth Progress Bar</b><br>
					<div class="progress mb-3">

						<div class="progress-bar
bg-success" style="width:<%=growth%>%">

							<%=growth%>% Growth

						</div>

					</div>


					<b>Product Image:</b><br> <img
						src="pic.jsp?id=<%=rs.getString(1)%>" height="100px" width="90px">

				</div>

			</div>

			<%
				}
					else
					{
						
						response.sendRedirect("D_ProgressProject.jsp?msg=failed");
						
					}

				} catch (Exception e) {

					e.printStackTrace();

				}
			%>

		</div>

	</div>

</body>

</html>