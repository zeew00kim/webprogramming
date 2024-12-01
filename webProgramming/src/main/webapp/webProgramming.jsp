<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<meta name="viewport" content="width=device-width,initial-scale=1.0"/>

<h2>DB 연동 테스트</h2>

<%
  Connection conn = null;
  Statement stmt = null;
  ResultSet rs = null;

  try {
     String jdbcUrl = "jdbc:mysql://localhost:3306/webprogramming?useSSL=false&serverTimezone=UTC";
     String dbId = "root"; // MySQL 사용자 이름
     String dbPass = "root"; // MySQL 비밀번호
	
     // MySQL JDBC 드라이버 로드
     Class.forName("com.mysql.cj.jdbc.Driver");
	
     // 데이터베이스 연결
     conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
     out.println("<p>데이터베이스 연결 성공!</p>");

     // `user` 테이블 데이터 출력
     out.println("<h3>User Table</h3>");
     stmt = conn.createStatement();
     String userQuery = "SELECT user_id, user_name, user_password, gender FROM user";
     rs = stmt.executeQuery(userQuery);
     out.println("<table border='1'>");
     out.println("<tr><th>User ID</th><th>User Name</th><th>Password</th><th>Gender</th></tr>");
     while (rs.next()) {
         int userId = rs.getInt("user_id");
         String userName = rs.getString("user_name");
         String userPassword = rs.getString("user_password");
         String gender = (rs.getInt("gender") == 1) ? "Male" : "Female";

         out.println("<tr>");
         out.println("<td>" + userId + "</td>");
         out.println("<td>" + userName + "</td>");
         out.println("<td>" + userPassword + "</td>");
         out.println("<td>" + gender + "</td>");
         out.println("</tr>");
     }
     out.println("</table>");

     // `product` 테이블 데이터 출력
     out.println("<h3>Product Table</h3>");
     String productQuery = "SELECT product_id, product_name, sale_price, shipping_charge FROM product";
     rs = stmt.executeQuery(productQuery);
     out.println("<table border='1'>");
     out.println("<tr><th>Product ID</th><th>Product Name</th><th>Sale Price</th><th>Shipping Charge</th></tr>");
     while (rs.next()) {
         int productId = rs.getInt("product_id");
         String productName = rs.getString("product_name");
         int salePrice = rs.getInt("sale_price");
         int shippingCharge = rs.getInt("shipping_charge");

         out.println("<tr>");
         out.println("<td>" + productId + "</td>");
         out.println("<td>" + productName + "</td>");
         out.println("<td>" + salePrice + "</td>");
         out.println("<td>" + shippingCharge + "</td>");
         out.println("</tr>");
     }
     out.println("</table>");

     // `cart` 테이블 데이터 출력
     out.println("<h3>Cart Table</h3>");
     String cartQuery = "SELECT cart_id, user_id, product_id FROM cart";
     rs = stmt.executeQuery(cartQuery);
     out.println("<table border='1'>");
     out.println("<tr><th>Cart ID</th><th>User ID</th><th>Product ID</th></tr>");
     while (rs.next()) {
         int cartId = rs.getInt("cart_id");
         int userId = rs.getInt("user_id");
         int productId = rs.getInt("product_id");

         out.println("<tr>");
         out.println("<td>" + cartId + "</td>");
         out.println("<td>" + userId + "</td>");
         out.println("<td>" + productId + "</td>");
         out.println("</tr>");
     }
     out.println("</table>");

     // `buy` 테이블 데이터 출력
     out.println("<h3>Buy Table</h3>");
     String buyQuery = "SELECT buy_id, user_id, product_id FROM buy";
     rs = stmt.executeQuery(buyQuery);
     out.println("<table border='1'>");
     out.println("<tr><th>Buy ID</th><th>User ID</th><th>Product ID</th></tr>");
     while (rs.next()) {
         int buyId = rs.getInt("buy_id");
         int userId = rs.getInt("user_id");
         int productId = rs.getInt("product_id");

         out.println("<tr>");
         out.println("<td>" + buyId + "</td>");
         out.println("<td>" + userId + "</td>");
         out.println("<td>" + productId + "</td>");
         out.println("</tr>");
     }
     out.println("</table>");
     
  } catch (Exception e) { 
     out.println("<p>데이터베이스 연결 실패: " + e.getMessage() + "</p>");
     e.printStackTrace();
  } finally {
     // 연결 닫기
     if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
     if (stmt != null) try { stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
     if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
  }
%>
