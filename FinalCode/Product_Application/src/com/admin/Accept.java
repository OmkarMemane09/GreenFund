package com.admin;

import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.user.AgroCalculator;
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

		// RequestDispatcher rd = request.getRequestDispatcher("/DataShow.jsp");
		// rd.include(request, response);

	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		
		String qty=request.getParameter("qty");
		String price_per=request.getParameter("price_per_kg");
		//String Profit=request.getParameter("Profit");
		String product_No=request.getParameter("product_No");
		PrintWriter pw = response.getWriter();
		 double investment_amount = 0;
		 double old_price = 0;
		try {
			Connection con = (Connection) DBconn.conn();
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery("select * from investment_contract_db where id='" + id + "'");
			if(rs.next())
			{
				 investment_amount = rs.getDouble("Investment_Amount");
				 AgroCalculator.farmerName =rs.getString("farmer_name");
				 AgroCalculator.farmerEmail =rs.getString("farmer_email_id");
				 AgroCalculator.farmerMobile =rs.getString("farmer_mobile_no");
				 AgroCalculator. investorName =rs.getString("investor_name");
				 AgroCalculator.investorEmail =rs.getString("investor_email_id");
				 AgroCalculator.investorMobile =rs.getString("investor_mobile_no");
				 AgroCalculator.ProductName=rs.getString("product_name");
				 AgroCalculator.ProductNo=rs.getString("project_id");
				 
			}
			//
			Statement st2=con.createStatement();
			ResultSet rs2=st2.executeQuery("select * from product_info where Product_No='" + product_No + "'");
			if(rs2.next())
			{
				old_price = rs2.getDouble("Price");
			}
			double price_per_kg = Double.valueOf(price_per);
	        double total_farmer_qty = Double.valueOf(qty);
	      //  double Profit_per=Double.valueOf(Profit)/100;
	        System.out.println("investment_amount=>" + investment_amount+",price_per_kg=>"+price_per_kg+",total_farmer_qty=>"+total_farmer_qty);
			AgroCalculator.Contract_process(investment_amount,price_per_kg,total_farmer_qty,old_price);//Profit_per,old_price);
			String msg = "Accept_Request";
			Statement stRegister101 = con.createStatement();
				stRegister101
						.executeUpdate("update investment_contract_db set Status_Info='"
								+ msg
								+ "' where id='" + id + "'");

				
				
				pw.println("<html><script>alert('Status Update Successfully');</script><body>");
				pw.println("");
				pw.println("</body></html>");
				response.sendRedirect("DistributeDataShow.jsp?Update");
			

		} catch (ClassNotFoundException e) {

			e.printStackTrace();
		} catch (SQLException e) {

			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
