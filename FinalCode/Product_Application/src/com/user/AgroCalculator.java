package com.user;

import java.awt.AlphaComposite;
import java.awt.Color;
import java.awt.FontMetrics;
import java.awt.Graphics2D;
import java.awt.RenderingHints;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.imageio.ImageIO;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Image;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

public class AgroCalculator {

	public static String farmerName = "";
	public static String farmerEmail = "";
	public static String farmerMobile = "";

	public static String investorName = "";
	public static String investorEmail = "";
	public static String investorMobile = "";
	
	
	public static String ProductName = "";
	public static String ProductNo = "";
	public static void Contract_process(double investment_amount,
			double price_per_kg, double total_farmer_qty, double old_price) //double Profit,
	{
		try {

			

			// ===== INPUT =====
			// double investment_amount = 5000;
			// double price_per_kg = 1000;
			// double total_farmer_qty = 10;

			// ===== INVESTOR =====
			double investor_qty = investment_amount / price_per_kg;
			double investor_value = investor_qty * price_per_kg;

			// ===== FARMER =====
			double farmer_qty = total_farmer_qty - investor_qty;
			double farmer_value = farmer_qty * price_per_kg;

			// ===== PERCENT =====
			double qty_percent = (investor_qty / total_farmer_qty) * 100;

			double investor_percent = 0;

			if (qty_percent >= 1 && qty_percent <= 10) {
				investor_percent = 10;
			} else if (qty_percent > 10 && qty_percent <= 30) {
				investor_percent = 20;
			} else if (qty_percent > 30 && qty_percent <= 50) {
				investor_percent = 30;
			} else {
				investor_percent = 40;
			}

			double farmer_percent = 100 - investor_percent;

			// ===== SALES =====
			double total_sales = total_farmer_qty * price_per_kg;
			double Cost = old_price *total_farmer_qty ;
			double total_profit = total_sales-Cost; //* Profit;

			// ===== PROFIT =====
			double investor_profit = (total_profit * investor_percent) / 100;
			double farmer_profit = (total_profit * farmer_percent) / 100;

			// ===== FINAL RETURN =====
			double investor_total_return = investment_amount + investor_profit;

			// ===== OUTPUT =====
			System.out.println("===== FINAL RESULT =====");

			System.out.println("\n--- Investor ---");
			System.out.println("Investment:" + investment_amount);
			System.out.println("Price per KG:" + price_per_kg);
			System.out.println("Quantity: " + investor_qty + " KG");
			System.out.println("Value:" + investor_value);
			System.out.println("Profit %: " + investor_percent + "%");
			System.out.println("Profit Amount:" + investor_profit);
			System.out.println("Total Return (Investment + Profit):"
					+ investor_total_return);

			System.out.println("\n--- Farmer ---");
			System.out.println("Price per KG:" + price_per_kg);
			System.out.println("Quantity: " + farmer_qty + " KG");
			System.out.println("Value:" + farmer_value);
			System.out.println("Profit %: " + farmer_percent + "%");
			System.out.println("Profit Amount:" + farmer_profit);

			System.out.println("\n--- Overall ---");
			System.out.println("Total Production: " + total_farmer_qty + " KG");
			System.out.println("Total Sales:" + total_sales);
			System.out.println("Total Profit:" + total_profit);
			
			
			System.out.println("\n--- Old Price Overall ---");
			System.out.println("Total Production: " + total_farmer_qty + " KG");
			System.out.println("Old Price per KG:" + old_price);
			System.out.println("Total Sales:" + Cost);
			

			// ===== FILE PATH =====
		//	String folderPath = "G:/BE2025-2026/Market/";
			new File(DBconn.mainpath).mkdirs();

			String filePath = DBconn.mainpath + "Invoice_"
					+ System.currentTimeMillis() + ".pdf";

			Document doc = new Document();
			PdfWriter.getInstance(doc, new FileOutputStream(filePath));
			doc.open();

			// ===== COLORS =====
			BaseColor blue = new BaseColor(0, 102, 204);
			BaseColor light = new BaseColor(230, 240, 255);

			// ===== TITLE =====
			Font titleFont = new Font(Font.FontFamily.HELVETICA, 18, Font.BOLD,
					blue);
			Paragraph title = new Paragraph("FARMER - INVESTOR AGREEMENT",
					titleFont);
			title.setAlignment(Element.ALIGN_CENTER);
			doc.add(title);
			doc.add(new Paragraph("\n"));

			Date mDate = new Date();
	        DateFormat date = new SimpleDateFormat("dd/MM/yyyy");
	        DateFormat time = new SimpleDateFormat("hh:mm:ss a");
	        System.out.println("Date: " + date.format(mDate));
	        System.out.println("Time: " + time.format(mDate));
			// ===== USER TABLE =====
			PdfPTable info = new PdfPTable(2);
			info.setWidthPercentage(100);

			addHeader(info, "Farmer Details", blue);
			addHeader(info, "Investor Details", blue);

			addCell(info, "Name: " + farmerName);
			addCell(info, "Name: " + investorName);

			addCell(info, "Email: " + farmerEmail);
			addCell(info, "Email: " + investorEmail);

			addCell(info, "Mobile: " + farmerMobile);
			addCell(info, "Mobile: " + investorMobile);
			
			addCell(info, "Date: " + date.format(mDate));
			addCell(info, "Time: " + time.format(mDate));

			doc.add(info);
			doc.add(new Paragraph("\n"));

			// ===== INVESTOR SECTION =====
			doc.add(sectionTitle("Investor Details", blue));
//			doc.add(createTable(new String[][] {
//					{ "Investment", "â‚¹" + investment_amount },
//					{ "Price per KG", "â‚¹" + price_per_kg },
//					{ "Quantity", investor_qty + " KG" },
//					{ "Value", "â‚¹" + investor_value },
//					{ "Profit %", investor_percent + "%" },
//					{ "Profit Amount", "â‚¹" + investor_profit },
//					{ "Total Return", "â‚¹" + investor_total_return } }, light));
			doc.add(createTable(new String[][] {
					{ "Investment", "₹" + investment_amount },
					{ "Price per KG", "₹" + price_per_kg },
					{ "Quantity", investor_qty + " KG" },
					{ "Value", "₹" + investor_value },
					{ "Profit %", investor_percent + "%" },
					{ "Profit Amount", "₹" + investor_profit },
					{ "Total Return", "₹" + investor_total_return } }, light));

			// ===== FARMER SECTION =====
			doc.add(sectionTitle("Farmer Details", blue));
//			doc.add(createTable(new String[][] {
//					{ "Price per KG", "â‚¹" + price_per_kg },
//					{ "Quantity", farmer_qty + " KG" },
//					{ "Value", "â‚¹" + farmer_value },
//					{ "Profit %", farmer_percent + "%" },
//					{ "Profit Amount", "â‚¹" + farmer_profit } }, light));
			doc.add(createTable(new String[][] {
					{ "Price per KG", "₹" + price_per_kg },
					{ "Quantity", farmer_qty + " KG" },
					{ "Value", "₹" + farmer_value },
					{ "Profit %", farmer_percent + "%" },
					{ "Profit Amount", "₹" + farmer_profit } }, light));

			// ===== OVERALL SECTION =====
			doc.add(sectionTitle("Overall Summary", blue));
//			doc.add(createTable(new String[][] {
//					{ "Total Production", total_farmer_qty + " KG" },
//					{ "Total Sales", "â‚¹" + total_sales },
//					{ "Total Profit", "â‚¹" + total_profit } }, light));
			doc.add(createTable(new String[][] {
					{ "Total Production", total_farmer_qty + " KG" },
					{ "Total Sales", "₹" + total_sales },
					{ "Total Profit", "₹" + total_profit } }, light));
			
						
			doc.add(sectionTitle("Old Price Summary", blue));
//			doc.add(createTable(new String[][] {
//					{ "Total Production", total_farmer_qty + " KG" },
//					{ "Old Price per KG:", "â‚¹" + old_price },
//					{ "Total Sales Price", "â‚¹" + Cost } }, light));
			doc.add(createTable(new String[][] {
					{ "Total Production", total_farmer_qty + " KG" },
					{ "Old Price per KG:","₹"+old_price},
					{ "Total Sales Price", "₹" + Cost } }, light));

			// ===== SIGN =====
			
//			doc.add(new Paragraph("\n\n"));
//			doc.add(new Paragraph(
//					"Investor Signature: ________________________"));
//			doc.add(new Paragraph("\n"));
//			doc.add(new Paragraph("Farmer Signature: ________________________"));
			String in=DBconn.mainpath+investorName+".png";
			DBconn.Insign_process(in);
			String fr=DBconn.mainpath+farmerName+".png";
			DBconn.Frsign_process(fr);
			doc.add(new Paragraph("\n\n"));

			// Create table for proper alignment
			PdfPTable signTable = new PdfPTable(2);
			signTable.setWidthPercentage(100);

			// Signature labels
			PdfPCell cell1 = new PdfPCell(new Phrase("Farmer Signature"));
			PdfPCell cell2 = new PdfPCell(new Phrase("Investor Signature"));

			cell1.setBorder(Rectangle.NO_BORDER);
			cell2.setBorder(Rectangle.NO_BORDER);

			signTable.addCell(cell1);
			signTable.addCell(cell2);

			// Signature Images
			

			Image farmerSign = Image.getInstance(in);
			farmerSign.scaleAbsolute(150, 50);
			
			Image investorSign = Image.getInstance(fr);
			investorSign.scaleAbsolute(150, 50);

			PdfPCell imgCell1 = new PdfPCell(investorSign);
			PdfPCell imgCell2 = new PdfPCell(farmerSign);

			imgCell1.setBorder(Rectangle.NO_BORDER);
			imgCell2.setBorder(Rectangle.NO_BORDER);

			signTable.addCell(imgCell1);
			signTable.addCell(imgCell2);

			// ðŸ”¹ Underline (optional - looks professional)
			PdfPCell lineCell1 = new PdfPCell(new Phrase("______________________"));
			PdfPCell lineCell2 = new PdfPCell(new Phrase("______________________"));

			lineCell1.setBorder(Rectangle.NO_BORDER);
			lineCell2.setBorder(Rectangle.NO_BORDER);

			signTable.addCell(lineCell1);
			signTable.addCell(lineCell2);

			// ðŸ”¹ Add table to document
			doc.add(signTable);

			doc.close();

			System.out.println("PDF Generated: " + filePath);
			 File file = new File(filePath);
			FileInputStream fis = new FileInputStream(file);
			byte[] pdfBytes = new byte[(int) file.length()];
			fis.read(pdfBytes);
			// ===== SAVE TO DATABASE =====
			Connection con = DBconn.conn();
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery("select * from agro_contract_full where farmer_email='"+farmerEmail+"'and investor_email='"+investorEmail+"' and ProductNo='"+ProductNo+"'");
			if(rs.next())
			{
				String id=rs.getString("id");
				String sql = "UPDATE agro_contract_full SET investment = ?,price_per_kg=?,investor_qty =?, investor_value=?, investor_profit_percent=?, investor_profit=?, investor_return=?, farmer_qty=?, farmer_value=?, farmer_profit_percent=?, farmer_profit=?,total_production=?, total_sales=?, total_profit=?, pdf_path =? WHERE id = ? and farmer_email=? and investor_email=? and ProductNo=? ";
				PreparedStatement ps = con.prepareStatement(sql);
				ps.setDouble(1, investment_amount);
				ps.setDouble(2, price_per_kg);

				// ===== INVESTOR DATA =====
				ps.setDouble(3, investor_qty);
				ps.setDouble(4, investor_value);
				ps.setDouble(5, investor_percent);
				ps.setDouble(6, investor_profit);
				ps.setDouble(7, investor_total_return);

				// ===== FARMER DATA =====
				ps.setDouble(8, farmer_qty);
				ps.setDouble(9, farmer_value);
				ps.setDouble(10, farmer_percent);
				ps.setDouble(11, farmer_profit);

				// ===== OVERALL =====
				ps.setDouble(12, total_farmer_qty);
				ps.setDouble(13, total_sales);
				ps.setDouble(14, total_profit);

				// ===== PDF PATH =====
				//ps.setString(21, filePath);
				ps.setBytes(15, pdfBytes); 
			    
				ps.setString(16, id);
				ps.setString(17, farmerEmail);
				ps.setString(18, investorEmail);
				ps.setString(19, ProductNo);
			    
			    // Execute the update
			    int rowsAffected = ps.executeUpdate();
			    fis.close();

				file.delete();
				File file1 = new File(in);
				File file2 = new File(fr);
				file1.delete();
				file2.delete();
			    System.out.println("Rows updated: " + rowsAffected);
			}
			else{
						String sql = "INSERT INTO agro_contract_full("
			        + "farmer_name, farmer_email, farmer_mobile,"
			        + "investor_name, investor_email, investor_mobile,"
			        + "investment, price_per_kg,"
			        + "investor_qty, investor_value, investor_profit_percent, investor_profit, investor_return,"
			        + "farmer_qty, farmer_value, farmer_profit_percent, farmer_profit,"
			        + "total_production, total_sales, total_profit, pdf_path,ProductName,ProductNo,Old_Price"
			        + ") VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

			PreparedStatement ps = con.prepareStatement(sql);

			// ===== FARMER =====
			ps.setString(1, farmerName);
			ps.setString(2, farmerEmail);
			ps.setString(3, farmerMobile);

			// ===== INVESTOR =====
			ps.setString(4, investorName);
			ps.setString(5, investorEmail);
			ps.setString(6, investorMobile);

			// ===== INVESTMENT =====
			ps.setDouble(7, investment_amount);
			ps.setDouble(8, price_per_kg);

			// ===== INVESTOR DATA =====
			ps.setDouble(9, investor_qty);
			ps.setDouble(10, investor_value);
			ps.setDouble(11, investor_percent);
			ps.setDouble(12, investor_profit);
			ps.setDouble(13, investor_total_return);

			// ===== FARMER DATA =====
			ps.setDouble(14, farmer_qty);
			ps.setDouble(15, farmer_value);
			ps.setDouble(16, farmer_percent);
			ps.setDouble(17, farmer_profit);

			// ===== OVERALL =====
			ps.setDouble(18, total_farmer_qty);
			ps.setDouble(19, total_sales);
			ps.setDouble(20, total_profit);

			// ===== PDF PATH =====
			//ps.setString(21, filePath);
			ps.setBytes(21, pdfBytes); 
			ps.setString(22, ProductName);
			ps.setString(23, ProductNo);
			ps.setDouble(24, old_price);

			ps.executeUpdate();
			fis.close();

			file.delete();
			File file1 = new File(in);
			File file2 = new File(fr);
			file1.delete();
			file2.delete();
			System.out.println("FULL PDF DATA Saved in MySQL");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// ===== COMMON METHODS =====

	static Paragraph sectionTitle(String text, BaseColor color) {
		Font f = new Font(Font.FontFamily.HELVETICA, 14, Font.BOLD, color);
		Paragraph p = new Paragraph(text, f);
		p.setSpacingBefore(10);
		p.setSpacingAfter(5);
		return p;
	}

	static PdfPTable createTable(String[][] data, BaseColor bg) {
		PdfPTable table = new PdfPTable(2);
		table.setWidthPercentage(100);

		for (String[] row : data) {
			PdfPCell c1 = new PdfPCell(new Phrase(row[0]));
			PdfPCell c2 = new PdfPCell(new Phrase(row[1]));

			c1.setBackgroundColor(bg);
			c2.setBackgroundColor(bg);

			c1.setPadding(6);
			c2.setPadding(6);

			table.addCell(c1);
			table.addCell(c2);
		}
		return table;
	}

	static void addHeader(PdfPTable table, String text, BaseColor color) {
		PdfPCell cell = new PdfPCell(new Phrase(text));
		cell.setBackgroundColor(color);
		cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		cell.setPadding(8);
		table.addCell(cell);
	}

	static void addCell(PdfPTable table, String text) {
		PdfPCell cell = new PdfPCell(new Phrase(text));
		cell.setPadding(6);
		table.addCell(cell);
	}
	
}