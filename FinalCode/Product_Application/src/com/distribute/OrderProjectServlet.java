package com.distribute;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.user.DBconn;

/**
 * Servlet implementation class OrderProjectServlet
 */
@WebServlet("/OrderProjectServlet")
public class OrderProjectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderProjectServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		System.out.println("ID=>" + id);
		try {
			Connection con = (Connection) DBconn.conn();
			String sql = "SELECT pdf_path FROM agro_contract_full WHERE id=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, id);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                String fileName = "Invoice_"+ System.currentTimeMillis() + ".pdf";
                byte[] pdfBytes = rs.getBytes("pdf_path");

                response.setContentType("application/pdf");
                response.setHeader("Content-Disposition",
                        "attachment; filename=" + fileName);

                ServletOutputStream out = response.getOutputStream();
                out.write(pdfBytes);
                out.flush();
                out.close();
            }
			} 
		 catch (SQLException e) {

			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter pw = response.getWriter();
		HttpSession session = request.getSession(false);
		String id = request.getParameter("id");
		String product_No = request.getParameter("product_No");
		String Investment_Amount = request.getParameter("qty");
String Distribute_Email_ID=(String)session.getAttribute("Cuserid");
String Distribute_Cusername=(String)session.getAttribute("Cusername");
String Distribute_Mobile_No=(String)session.getAttribute("Cmobile");
String Farmer_user="";
		try {
			Connection con = DBconn.conn();
			Statement st1 = (Statement) con.createStatement();
			Statement st = (Statement) con.createStatement();
			String query = "select * from product_info where MID='" + id
					+ "'";
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			if (rs.next()) {
				String productName=rs.getString("productName");
				String Farmer_Email_ID=rs.getString("Farmer_Email_ID");
				String Farmer_Mobile_No=rs.getString("Farmer_Mobile_No");
				String query1 = "select * from registertbl where Uemail='" + Farmer_Email_ID
						+ "'";
				ResultSet rs1 = st1.executeQuery(query1);
				if (rs1.next()) 
				{
					Farmer_user=rs1.getString("Uusername");
				}
				st.executeUpdate("insert into investment_contract_db(project_id,farmer_name,farmer_email_id,farmer_mobile_no,product_name,investor_name,investor_email_id,investor_mobile_no,Investment_Amount) values ('"
						+ product_No
						+ "','"+Farmer_user+"','"+Farmer_Email_ID+"','"+Farmer_Mobile_No+"','"
						+ productName
						+ "','"
						+ Distribute_Cusername
						+ "','"
						+ Distribute_Email_ID
						+ "','"
						+ Distribute_Mobile_No
						+ "','"
						+ Investment_Amount
						+ "')");


			}
		} catch (Exception e) {
			System.out.println(e);
		}
		pw.println("<html><script>alert('Order Product Save Successfully');</script><body>");
		pw.println("");
		pw.println("</body></html>");
		response.sendRedirect("OrderShow.jsp?Order");
	}

}
