package webprogramming;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class WebDAO {
    public static void main(String[] args) {
        String jdbcURL = "jdbc:mysql://localhost:3306/webprogramming?useSSL=false&serverTimezone=UTC";
        String dbUser = "root";
        String dbPassword = "root";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
            System.out.println("Connected to the database!");

            System.out.println("\n--- User Table ---");
            String userSql = "SELECT * FROM user";
            Statement userStatement = connection.createStatement();
            ResultSet userResultSet = userStatement.executeQuery(userSql);

            while (userResultSet.next()) {
                int userId = userResultSet.getInt("user_id");
                String userName = userResultSet.getString("user_name");
                String userPassword = userResultSet.getString("user_password");
                int gender = userResultSet.getInt("gender");
                String genderText = (gender == 1) ? "남성" : "여성";

                System.out.printf("ID: %d, Name: %s, Password: %s, Gender: %s\n", userId, userName, userPassword, genderText);
            }

            System.out.println("\n--- Product Table ---");
            String productSql = "SELECT * FROM product";
            Statement productStatement = connection.createStatement();
            ResultSet productResultSet = productStatement.executeQuery(productSql);

            while (productResultSet.next()) {
                int productId = productResultSet.getInt("product_id");
                String productName = productResultSet.getString("product_name");
                int salePrice = productResultSet.getInt("sale_price");
                int shippingCharge = productResultSet.getInt("shipping_charge");

                System.out.printf("Product ID: %d, Name: %s, Sale Price: %d, Shipping Charge: %d\n",
                        productId, productName, salePrice, shippingCharge);
            }

            userResultSet.close();
            userStatement.close();
            productResultSet.close();
            productStatement.close();
            connection.close();
            System.out.println("Database connection closed.");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
