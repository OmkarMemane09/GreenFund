package com.user;

import java.awt.AlphaComposite;
import java.awt.Color;
import java.awt.Font;
import java.awt.FontMetrics;
import java.awt.Graphics2D;
import java.awt.RenderingHints;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.imageio.ImageIO;

public class DBconn {

	public static String filpath="D:\\BE GREENFUND\\";
	public static String stopwordspath=filpath+"stopwords.txt";
	public static String Stemmingpath=filpath+"Stemming.txt";
	public static String mainpath="D:\\BE GREENFUND\\";
	public static Connection conn() throws ClassNotFoundException, SQLException {
		Connection con;
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection(
				"jdbc:mysql://localhost:3307/2026_product_db", "root",
				"admin");

		return con;
	}

	public static int productcheck(String productno) {
		int msg = 0;
		Connection con;
		try {
			con = DBconn.conn();

			Statement st = (Statement) con.createStatement();
			ResultSet rs;
			String str = "select * from product_info where Product_No='"
					+ productno + "'";
			rs = ((java.sql.Statement) st).executeQuery(str);
			if (rs.next()) {
				msg=2;
			} else {
				msg=1;
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return msg;
	}

	public static void Frsign_process(String fr)
	{
		try {
			int width = 300;
			int height = 100;

			BufferedImage img = new BufferedImage(width, height, BufferedImage.TYPE_INT_ARGB);
			Graphics2D g2d = img.createGraphics();

			// Smooth rendering
			g2d.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);

			// Transparent background
			g2d.setComposite(AlphaComposite.Clear);
			g2d.fillRect(0, 0, width, height);
			g2d.setComposite(AlphaComposite.Src);

			//Signature style font (important)
			Font font = new Font("Segoe Script", Font.ITALIC, 28);
			g2d.setFont(font);

			// Color (black or blue looks real)
			g2d.setColor(Color.BLACK);

			// 👉 Draw signature (centered)
			FontMetrics fm = g2d.getFontMetrics();
			int x = 10;
			int y = (height - fm.getHeight()) / 2 + fm.getAscent();

			g2d.drawString(AgroCalculator.farmerName, x, y);

			g2d.dispose();

			// Save image
			//String signPath = "G:\\BE2025-2026\\Market\\investor_sign.png";
			ImageIO.write(img, "png", new File(fr));
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	public static void Insign_process(String in)
	{
		try {
			int width = 300;
			int height = 100;

			BufferedImage img = new BufferedImage(width, height, BufferedImage.TYPE_INT_ARGB);
			Graphics2D g2d = img.createGraphics();

			// Smooth rendering
			g2d.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);

			// Transparent background
			g2d.setComposite(AlphaComposite.Clear);
			g2d.fillRect(0, 0, width, height);
			g2d.setComposite(AlphaComposite.Src);

			//Signature style font (important)
			Font font = new Font("Segoe Script", Font.ITALIC, 28);
			g2d.setFont(font);

			// Color (black or blue looks real)
			g2d.setColor(Color.BLACK);

			// 👉 Draw signature (centered)
			FontMetrics fm = g2d.getFontMetrics();
			int x = 10;
			int y = (height - fm.getHeight()) / 2 + fm.getAscent();

			g2d.drawString(AgroCalculator.investorName, x, y);

			g2d.dispose();

			// Save image
			//String signPath = "G:\\BE2025-2026\\Market\\investor_sign.png";
			ImageIO.write(img, "png", new File(in));
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	public static void main(String args[]) throws IOException {
		
        Date mDate = new Date();
        DateFormat date = new SimpleDateFormat("dd/MM/yyyy");
        DateFormat time = new SimpleDateFormat("hh:mm:ss a");
        System.out.println("Date: " + date.format(mDate));
        System.out.println("Time: " + time.format(mDate));
	}
}
