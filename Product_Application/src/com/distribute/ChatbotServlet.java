package com.distribute;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.user.DBconn;

/**
 * Servlet implementation class ChatbotServlet
 */
@WebServlet("/ChatbotServlet")
public class ChatbotServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChatbotServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	private String getBotReplys(String userInput) {
		 StringBuilder result = new StringBuilder();
		try {
		       
		        Connection conn = DBconn.conn();

		        // Fetch data from the database based on user input
		        Statement stmt = conn.createStatement();
		        String sql = "SELECT * FROM tblchatbot WHERE CID = '" + userInput + "'";
		        ResultSet rs = stmt.executeQuery(sql);
		
		        // Process the results (you can format the output as needed)
		       
		        if(rs.next()) {
		            result.append(rs.getString("responses"));
		        }

		        // Close resources
		        rs.close();
		        stmt.close();
		        conn.close();
		       
		    } catch (SQLException | ClassNotFoundException e) {
		        
		    }
		 return result.toString();
 }
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String message = request.getParameter("message");
		String id=Similarity.chatbotprocess(message);
       String reply = getBotReplys(id);
       System.out.println(reply);
       response.setContentType("text/plain");
       response.setCharacterEncoding("UTF-8");
       response.getWriter().write(reply);
	}


}
