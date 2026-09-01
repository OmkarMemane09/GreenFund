package com.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class AddRatingServlet
 */
@WebServlet("/AddRatingServlet")
public class AddRatingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddRatingServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		try {

			String emailid = request.getParameter("status");

			String rating = request.getParameter("star");

			String Descriptionname = request.getParameter("Descriptionname");

			/* CHECK NULL */

			if (rating == null) {

				response.sendRedirect("D_RatingProject.jsp?msg=PleaseSelectRating");

				return;

			}

			/* SESSION */

			HttpSession session = request.getSession(false);

			String Distribute_Email_ID = (String) session
					.getAttribute("Cuserid");

			/* DATABASE */

			Connection con = DBconn.conn();

			PreparedStatement ps = con
					.prepareStatement(

					"insert into farmer_ratings(farmer_id,investor_id,rating,review) values(?,?,?,?)"

					);

			ps.setString(1, emailid);

			ps.setString(2, Distribute_Email_ID);

			ps.setString(3, rating);

			ps.setString(4, Descriptionname);

			int i = ps.executeUpdate();

			if (i > 0) {

				response.sendRedirect("D_RatingProject.jsp?Update=Success");

			} else {

				response.sendRedirect("D_RatingProject.jsp?Update=Failed");

			}

		} catch (Exception e) {

			e.printStackTrace();

			response.sendRedirect("D_RatingProject.jsp?Update=Error");

		}

	}

}
