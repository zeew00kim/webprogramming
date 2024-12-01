package webprogramming;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

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

    // 사용자 인증 확인 메서드
    public boolean isValidUser(String userName, String userPassword) {
        String sql = "SELECT COUNT(*) FROM user WHERE user_name = ? AND user_password = ?";
        try (Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
             PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setString(1, userName);
            pstmt.setString(2, userPassword);
            try (ResultSet rs = pstmt.executeQuery()) {
                return rs.next() && rs.getInt(1) > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
