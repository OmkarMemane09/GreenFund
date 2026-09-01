package com.admin;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.user.DBconn;

/**
 * Servlet implementation class Accept
 */
@WebServlet("/Accept")
public class Accept extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Accept() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		System.out.println("ID=>" + id);
		String[] mid = id.split(",");
		PrintWriter pw = response.getWriter();
		try {
			Connection con = (Connection) DBconn.conn();
//			int flag = 0;
			String Order_Qty = "", Distribute_Email_ID = "";
			String msg = "Accept Request";
			Statement stRegister12 = (Statement) con.createStatement();
			ResultSet rsLogin12 = stRegister12
					.executeQuery("select * from product_info_order where D_Id='"
							+ mid[1] + "'");
			if (rsLogin12.next()) {
				Distribute_Email_ID = rsLogin12
						.getString("Distribute_Email_ID");
				Order_Qty = rsLogin12.getString("Order_Qty");
			}
			int oldqty = 0;
			String productName = "", DescriptionName = "", MFGDate = "", Price = "", ExpiryDate = "", product_No = "";
			Statement stRegister1 = (Statement) con.createStatement();
			ResultSet rsLogin1 = stRegister1
					.executeQuery("select * from product_info where MID='"
							+ mid[0] + "'");
			if (rsLogin1.next()) {
				productName = rsLogin1.getString("ProductName");
				rsLogin1.getString("CompanyName");
				DescriptionName = rsLogin1.getString("DescriptionName");
				MFGDate = rsLogin1.getString("MFGDate");
				Price = rsLogin1.getString("Price");
				ExpiryDate = rsLogin1.getString("ExpiryDate");
				product_No = rsLogin1.getString("Product_No");
				oldqty = rsLogin1.getInt("Qty");
			}

			double oldprice=Double.valueOf(Price);
			
			Statement st101 = con.createStatement();
			int oqty = Integer.parseInt(Order_Qty);
			
			System.out.println("O_QTY" + oqty + "\t Old Qty" + oldqty);
			if (oqty <= oldqty) {

				double Product_Price=oldprice*oqty;
				int totalqty = oldqty - oqty;
				st101.executeUpdate("update product_info set Qty='" + totalqty
						+ "' where MId='" + mid[0] + "'");
				Statement stRegister101 = con.createStatement();
//				String acc = "1";
				stRegister101
						.executeUpdate("update product_info_order set Status_Info='"
								+ msg
								+ "',Product_Price='"+Product_Price+"' where D_Id='"
								+ mid[1]
								+ "' and MId='" + mid[0] + "'");

				
				
				pw.println("<html><script>alert('Status Update Successfully');</script><body>");
				pw.println("");
				pw.println("</body></html>");
				response.sendRedirect("DistributeDataShow.jsp?Update");
			} else {
				pw.println("<html><script>alert('Out of stock');</script><body>");
				pw.println("");
				pw.println("</body></html>");
				response.sendRedirect("DistributeDataShow.jsp?stock");
			}

		} catch (ClassNotFoundException e) {

			e.printStackTrace();
		} catch (SQLException e) {

			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		// RequestDispatcher rd = request.getRequestDispatcher("/DataShow.jsp");
		// rd.include(request, response);

	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
