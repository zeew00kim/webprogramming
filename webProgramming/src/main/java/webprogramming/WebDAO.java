package webprogramming;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class WebDAO {
    private final String jdbcURL = "jdbc:mysql://localhost:3306/webprogramming?useSSL=false&serverTimezone=UTC";
    private final String dbUser = "root";
    private final String dbPassword = "root";

    public String getJdbcURL() {
        return jdbcURL;
    }

    public String getDbUser() {
        return dbUser;
    }

    public String getDbPassword() {
        return dbPassword;
    }

    public boolean isValidUser(String userName, String userPassword) {
        String sql = "SELECT COUNT(*) FROM user WHERE user_name = ? AND user_password = ?";
        try (Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
             PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setString(1, userName);
            pstmt.setString(2, userPassword);
            try (ResultSet rs = pstmt.executeQuery()) {
                return rs.next() && rs.getInt(1) > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
