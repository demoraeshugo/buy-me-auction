<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<link rel="stylesheet" href="style.css">
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Fredoka+One&display=swap" rel="stylesheet">
	<title>Sell Page</title>
</head>

				<script>
				function change(obj) {

				    var selectBox = obj;
				    var selected = selectBox.options[selectBox.selectedIndex].value;
				    var itemSubCat = document.getElementById("itemSubCat");
				    var subCatLabel = document.getElementById("subCatLabel");
				    
				    subCatLabel.style.display = 'block'

				    if(selected === 'Computers'){
				    	itemSubCat.style.display = "block";
				    }
				    else{
				    	itemSubCat.style.display = "none";
				    }
				}
				</script>
<body>
	<h2 class="homepageHeader">Sell Page</h2>
	
	<%
	Statement st;
	Connection con;
    try {
    	
        Class.forName("com.mysql.jdbc.Driver");
        con=(Connection)DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/buy-me-auction","root","root");
        st=con.createStatement();
        String username = (String)request.getSession().getAttribute("USERNAME");
        PreparedStatement preparedStatement = null;
        String strQuery = "SELECT * FROM auctions a" 
        		+ " JOIN lists_auction l ON a.auction_id = l.listed_auction_auction_id"
        		+ " JOIN items_in_auctions ia ON ia.ref_auction_id = a.auction_id"
        		+ " JOIN items i ON i.item_id = ia.ref_item_in_auction_id"
        		+ " WHERE l.listed_auction_username= ?";
        preparedStatement = con.prepareStatement(strQuery);
        preparedStatement.setString(1,username);
        ResultSet rs = preparedStatement.executeQuery();
    %>
    <table border=1 align=center style="text-align:center">
      <thead>
          <tr>
             <th>Item Name</th>
             <th>Item Description</th>
             <th>Closing Date</th>
             <th>Closing Time</th>
             <th>Minimum Sell Price</th>
             <th>Current Bid Price</th>
          </tr>
      </thead>
      <tbody>
        <%while(rs.next())
        {
            %>
            <tr>
                <td><%=rs.getString("item_name") %></td>
                <td><%=rs.getString("item_desc") %></td>
                <td><%=rs.getDate("end_datetime") %></td>
                <td><%=rs.getTime("end_datetime") %></td>
                <td><%=rs.getInt("min_price") %></td>
                <td><%=rs.getInt("curr_bid") %></td>
            </tr>
            <%}%>
           </tbody>
        </table><br>
    <%
    } catch(Exception e){
        out.print(e.getMessage());%><br><%
    } 
    %>

	<h2 class="homepageHeader">List New Auction</h2>	
		<form method="post" action="newAuction.jsp" class="portal">
		
		<table class="nameTable">
			<tr>
				<td>
				<label class="firstNameTextCreateAcc">Item Category</label>
				<select class="countryAddressFieldCreateAccount" name="itemCategory" required onchange="change(this)">
						<option disabled selected value> -- select an option -- </option>
						<option value="Computers">Computers</option>
				</select>
				</td>
				<td>
				<label class="firstNameTextCreateAcc" id='subCatLabel' style='display: none'>Item Sub Category</label>
				<select class="countryAddressFieldCreateAccount" id='itemSubCat' name="computerSubCategories" style='display: none' required>
						<option disabled selected value> -- select an option -- </option>
						<option value="Laptops">Laptops</option>
						<option value="Desktops">Desktops</option>
						<option value="Performance">Performance</option>
				</select>
				</td>
			</tr>
			<tr>
				<td>
					<label class="dobTextCreateAcc">Item Name</label>
					<input type="text" name="auctionItemName" class="dobFieldCreateAccount" required>
				</td>
				<td>
					<label class="dobTextCreateAcc">Item Description</label>
					<input type="text" name="auctionItemDesc" class="dobFieldCreateAccount" required>
				</td>
			</tr>
			<tr>
				<td>
					<label class="dobTextCreateAcc">Auction Short Description</label>
					<input type="text" name="auctionShortDesc" class="dobFieldCreateAccount" required>
				</td>
				<td>
					<label class="dobTextCreateAcc">Auction Long Description</label>
					<input type="text" name="auctionLongDesc" class="dobFieldCreateAccount" required>
				</td>
			</tr>
			<tr>
				<td>
					<label class="dobTextCreateAcc">Auction Closing Date</label>
					<input type="date" name="auctionClosingDate" class="dobFieldCreateAccount" required>
				</td>
				<td>
					<label class="dobTextCreateAcc">Auction Closing Time</label>
					<input type="time" name="auctionClosingTime" class="dobFieldCreateAccount" required>
				</td>
			</tr>
			<tr>
				<td>
					<label class="dobTextCreateAcc">Start Price</label>
					<input type="number" step="0.01" name="auctionInitPrice" class="dobFieldCreateAccount" required>
				</td>
				<td>
					<label class="dobTextCreateAcc">Minimum Sell Price</label>
					<input type="number" step="0.01" name="auctionMinSellPrice" class="dobFieldCreateAccount" required>
				</td>
				<td>
					<label class="dobTextCreateAcc">Bid Increment</label>
					<input type="number" step="0.01" name="auctionBidIncrement" class="dobFieldCreateAccount" required>
				</td>
			</tr>
		</table>
		
		<input type="submit" value="List Item" class="createAccButton"> 
		</form>
</body>
</html>