package com.profit;
import java.io.FileOutputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.*;
import java.util.List;

import com.itextpdf.text.*;
import com.itextpdf.text.pdf.*;
import com.user.AgroCalculator;
import com.user.DBconn;
public class ContractPDF {
	
	public static void Contract_process(
	        List<Investor> investors,
	        double price_per_kg,
	        double total_farmer_qty,
	        double old_price
	) {
	    try {

	        generatePDF(
	                AgroCalculator.ProductName,
	                AgroCalculator.ProductNo,
	                AgroCalculator.farmerName,
	                investors,
	                price_per_kg,
	                old_price,
	                total_farmer_qty
	        );

	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}
	public static void main(String[] args) {

String id = "1";
		
		String qty="100";
		String price_per="200";
		//String Profit=request.getParameter("Profit");
		String product_No="app6036";
		 double investment_amount = 0;
		 double old_price = 0;
		 ArrayList<Investor> investors = new ArrayList<>();

		 try {
		     Connection con = DBconn.conn();
		     Statement st = con.createStatement();

		     ResultSet rs = st.executeQuery(
		         "select * from investment_contract_db where project_id='" + product_No + "'"
		     );

		     while (rs.next()) {

		         investors.add(new Investor(
		             rs.getString("investor_name"),
		             rs.getDouble("Investment_Amount")
		         ));

		         AgroCalculator.farmerName = rs.getString("farmer_name");
		         AgroCalculator.ProductName = rs.getString("product_name");
		         AgroCalculator.ProductNo = rs.getString("project_id");
		     }

		     // OLD PRICE
		     Statement st2 = con.createStatement();
		     ResultSet rs2 = st2.executeQuery(
		         "select * from product_info where Product_No='" + product_No + "'"
		     );

		     if (rs2.next()) {
		         old_price = rs2.getDouble("Price");
		     }

		     double price_per_kg = Double.valueOf(price_per);
		     double total_farmer_qty = Double.valueOf(qty);

		     ContractPDF.Contract_process(
		         investors,
		         price_per_kg,
		         total_farmer_qty,
		         old_price
		     );

		 } catch (Exception e) {
		     e.printStackTrace();
		 }
    }

    public static void generatePDF(
            String productName,
            String productNo,
            String farmerName,
            List<Investor> investors,
            double newPrice,
            double oldPrice,
            double totalQty
    ) throws Exception {

        Document doc = new Document();
        PdfWriter.getInstance(doc, new FileOutputStream("G:\\BE2025-2026\\Market\\Contract.pdf"));

        doc.open();

        // Title
        Font titleFont = new Font(Font.FontFamily.HELVETICA, 18, Font.BOLD);
        Paragraph title = new Paragraph("FARMER INVESTMENT CONTRACT", titleFont);
        title.setAlignment(Element.ALIGN_CENTER);
        doc.add(title);

        doc.add(new Paragraph("\n"));

        // Product Details
        doc.add(new Paragraph("Product Details"));
        doc.add(new Paragraph("Product Name: " + productName));
        doc.add(new Paragraph("Product No: " + productNo));
        doc.add(new Paragraph("Old Price: ₹" + oldPrice));
        doc.add(new Paragraph("New Price: ₹" + newPrice));

        doc.add(new Paragraph("\nFarmer: " + farmerName));

        // Total Investment
        double totalInvestment = 0;
        for (Investor inv : investors) {
            totalInvestment += inv.amount;
        }

        // Profit Calculation
        double totalSales = totalQty * newPrice;
        double cost = totalQty * oldPrice;
        double totalProfit = totalSales - cost;

        System.out.println("Profit Calculation");
        System.out.println("totalSales"+totalSales);
        System.out.println("cost"+cost);
        System.out.println("totalProfit"+totalProfit);
        
        
        doc.add(new Paragraph("\nTotal Quantity: " + totalQty + " KG"));
        doc.add(new Paragraph("Total Investment: ₹" + totalInvestment));
        doc.add(new Paragraph("Total Profit: ₹" + totalProfit));

        // Investor Table
        doc.add(new Paragraph("\nInvestor Details\n"));

        PdfPTable table = new PdfPTable(4);
        table.setWidthPercentage(100);

        table.addCell("Investor");
        table.addCell("Investment");
        table.addCell("Share %");
        table.addCell("Profit");

        for (Investor inv : investors) {

            double ratio = inv.amount / totalInvestment;
            double percent = ratio * 100;
            double profit = totalProfit * ratio;

            table.addCell(inv.name);
            table.addCell("₹" + inv.amount);
            table.addCell(String.format("%.2f%%", percent));
            table.addCell("₹" + String.format("%.2f", profit));
        }

        doc.add(table);

        // Signature Images (OPTIONAL)
        try {
            Image investorSign = Image.getInstance("G:\\BE2025-2026\\Market\\investor_sign.png");
            investorSign.scaleToFit(100, 50);

            Image farmerSign = Image.getInstance("G:\\BE2025-2026\\Market\\sign.png");
            farmerSign.scaleToFit(100, 50);

            doc.add(new Paragraph("\n\nSignatures:\n"));

            PdfPTable signTable = new PdfPTable(2);
            signTable.setWidthPercentage(100);

            signTable.addCell(new Phrase("Investor Signature"));
            signTable.addCell(new Phrase("Farmer Signature"));

            signTable.addCell(investorSign);
            signTable.addCell(farmerSign);

            doc.add(signTable);

        } catch (Exception e) {
            doc.add(new Paragraph("\n(Signature images not found)"));
        }

        doc.close();

        System.out.println("PDF Created Successfully ✅");
    }
}
