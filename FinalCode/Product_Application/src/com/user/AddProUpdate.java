package com.user;

//import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//
//import com.qrcode.Create_QR;
import javax.servlet.http.HttpSession;

@WebServlet("/AddProUpdate")
public class AddProUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AddProUpdate() {
		super();

	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String emailid = request.getParameter("status");
		String rating = request.getParameter("star");
		int r = Integer.parseInt(rating);
		if (r == 5) {
			rating = "1";
		} else if (r == 4) {
			rating = "2";

		} else if (r == 3) {
			rating = "3";
		} else if (r == 2) {
			rating = "4";
		} else if (r == 1) {
			rating = "5";
		}
		String Descriptionname=request.getParameter("Descriptionname");
		HttpSession session = request.getSession(false);
		String Distribute_Email_ID=(String)session.getAttribute("Cuserid");
		String Distribute_Cusername=(String)session.getAttribute("Cusername");
		String Distribute_Mobile_No=(String)session.getAttribute("Cmobile");
		try {
			Connection con = DBconn.conn();
			Statement st = (Statement) con.createStatement();
			st.executeUpdate("insert into farmer_ratings(farmer_id,investor_id,rating,review) values "
						+ "('"
						+ emailid
						+ "','"
						+ Distribute_Email_ID
						+ "','"
						+ rating
						+ "','"
						+ Descriptionname
						+ "')");

			
			PrintWriter pw=response.getWriter();
			 pw.println("<script> alert('Update Rating Successfuly');</script>");
		} catch (Exception e) {
			System.out.println(e);
		}
		response.sendRedirect("D_RatingProject.jsp");
	}

}
