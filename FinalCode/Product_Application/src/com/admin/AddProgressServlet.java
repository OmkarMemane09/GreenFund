package com.admin;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.util.Random;

import com.user.DBconn;
/**
 * Servlet implementation class AddProgressServlet
 */
@WebServlet("/AddProgressServlet")

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
maxFileSize = 1024 * 1024 * 10, // 10MB
maxRequestSize = 1024 * 1024 * 50)
public class AddProgressServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddProgressServlet() {
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
		PrintWriter pw = response.getWriter();
		try {

			String project_id = request.getParameter("project_id");

			String farmer_email = request.getParameter("farmer_email");

			String week_no = request.getParameter("week_no");

			String progress_message = request.getParameter("progress_message");

			String growth_percent = request.getParameter("growth_percent");
			Part artfile = request.getPart("image");
			InputStream artinputStream = artfile.getInputStream();
			Connection con = DBconn.conn();

			PreparedStatement ps = con
					.prepareStatement(

					"insert into project_progress(project_id,farmer_email,week_no,progress_title,growth_percent,Project_Image) values(?,?,?,?,?,?)"

					);

			ps.setString(1, project_id);

			ps.setString(2, farmer_email);

			ps.setString(3, week_no);
			ps.setString(4, progress_message);

			ps.setString(5, growth_percent);
			ps.setBlob(6, artinputStream);

			int i = ps.executeUpdate();

			if (i > 0) {

				pw.println("<html><script>alert('product Progress Save Successfully');</script><body>");
				pw.println("");
				pw.println("</body></html>");
				response.sendRedirect("AddProgressProduct.jsp?msg=success");

			} else {

				pw.println("<html><script>alert('product Progress Not Save Successfully');</script><body>");
				pw.println("");
				pw.println("</body></html>");
				response.sendRedirect("AddProgressProduct.jsp?msg=failed");

			}

		} catch (Exception e) {

			e.printStackTrace();

		}
	}

}
