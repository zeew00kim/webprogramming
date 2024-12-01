//package webprogramming;
//
//import java.sql.Connection;
//import java.sql.DriverManager;
//import java.sql.ResultSet;
//import java.sql.Statement;
//
//public class DatabaseConnection {
//    public static void main(String[] args) {
//        String jdbcURL = "jdbc:mysql://localhost:3306/webprogramming?useSSL=false&serverTimezone=UTC";
//        String dbUser = "root";
//        String dbPassword = "root";
//
//        try {
//            Class.forName("com.mysql.cj.jdbc.Driver");
//            Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
//            System.out.println("Connected to the database!");
//
//            String sql = "SELECT * FROM webtemp";
//            Statement statement = connection.createStatement();
//            ResultSet resultSet = statement.executeQuery(sql);
//
//            while (resultSet.next()) {
//                int id = resultSet.getInt("id");
//                String name = resultSet.getString("name");
//                int age = resultSet.getInt("age");
//                if (Integer.toString(age) == "null") {
//                	System.out.printf("ID : %d, Name : %s, age : NULL\n", id, name);
//                } else {
//                	System.out.println("ID: " + id + ", Name: " + name + ", Age: " + age);
//                }
//            }
//
//            resultSet.close();
//            statement.close();
//            connection.close();
//            System.out.println("Database connection closed.");
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//    }
//}
