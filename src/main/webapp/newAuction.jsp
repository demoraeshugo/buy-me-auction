<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*,java.util.UUID,java.sql.Timestamp"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
			<link rel="stylesheet" href="style.css">
			<link rel="preconnect" href="https://fonts.googleapis.com">
			<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
			<link href="https://fonts.googleapis.com/css2?family=Fredoka+One&display=swap" rel="stylesheet">
<title>New Auction</title>
</head>
<body>

	<% try {
		
		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();		

		//Create a SQL statement
		Statement stmt = con.createStatement();
		
		
		String itemCategory = request.getParameter("itemCategory");
		String auctionItemDesc = request.getParameter("auctionItemDesc");
		
		String auctionItemName = request.getParameter("auctionItemName");
		String itemSubCat = request.getParameter("itemSubCat");
		
		String auctionShortDesc = request.getParameter("auctionShortDesc");
		String auctionLongDesc = request.getParameter("auctionLongDesc");
		
		String auctionClosingDate = request.getParameter("auctionClosingDate");
		String auctionClosingTime = request.getParameter("auctionClosingTime");
		
		String auctionInitPrice = request.getParameter("auctionInitPrice");
		String auctionMinSellPrice = request.getParameter("auctionMinSellPrice");
		String auctionBidIncrement = request.getParameter("auctionBidIncrement");
		
		PreparedStatement prepStmt;
		
		String auction_id = UUID.randomUUID().toString();
		String item_id = UUID.randomUUID().toString();
		
		// CREATE IN ITEM TABLE
		String createItem = "INSERT INTO Items (item_id, item_desc, item_name)"
				+ " VALUES(?, ?, ?)";
		
		prepStmt = con.prepareStatement(createItem);
		prepStmt.setString(1, item_id);
		prepStmt.setString(2, auctionItemDesc);
		prepStmt.setString(3, auctionItemName);
		
		prepStmt.executeUpdate();
		// prepStmt.close();
		
		// CREATE IN AUCTION TABLE
		
		String createAuc = "INSERT INTO Auctions (auction_id, init_price, min_price, long_description, short_description, bid_increment, start_datetime, end_datetime)"
		+ " VALUES(?, ?, ?, ?, ?, ?, ?, ?)";
		
		prepStmt = con.prepareStatement(createAuc);
		
		prepStmt.setString(1, auction_id);
		prepStmt.setString(2, auctionInitPrice);
		prepStmt.setString(3, auctionMinSellPrice);
		prepStmt.setString(4, auctionLongDesc);
		prepStmt.setString(5, auctionShortDesc);
		prepStmt.setString(6, auctionBidIncrement);
		
		java.util.Date today = new java.util.Date();
		java.sql.Timestamp timestamp = new java.sql.Timestamp(today.getTime());
		
		prepStmt.setTimestamp(7, timestamp);
		prepStmt.setTimestamp(8, timestamp);
		
		prepStmt.executeUpdate();
		// prepStmt.close();
		
		// LINK AUCTION AND ITEM
		String createAucItemLink = "INSERT INTO Items_In_Auctions (ref_auction_id, ref_item_in_auction_id)"
		+ " VALUES(?, ?)";
		
		prepStmt = con.prepareStatement(createAucItemLink);
		
		prepStmt.setString(1, auction_id);
		prepStmt.setString(2, item_id);
		
		prepStmt.executeUpdate();
		// prepStmt.close();
		
		// LINK AUCTION AND SELLER
		
		String username = (String)request.getSession().getAttribute("USERNAME");

		String createAucSellerLink = "INSERT INTO Lists_Auction (listed_auction_username, listed_auction_auction_id)"
		+ " VALUES(?, ?)";
		
		prepStmt = con.prepareStatement(createAucSellerLink);
		
		prepStmt.setString(1, username);
		prepStmt.setString(2, auction_id);
		
		prepStmt.executeUpdate();
		prepStmt.close();
		
	%>
		<% 
			//close the connection.
			db.closeConnection(con);

			response.sendRedirect("SellPage.jsp");
			%>
		
		<%} catch (Exception e) {
			out.print(e);
		}%>

</body>
</html>