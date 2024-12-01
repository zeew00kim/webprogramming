package webprogramming;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class WebDAO {
    private final String jdbcURL = "jdbc:mysql://localhost:3306/webprogramming?useSSL=false&serverTimezone=UTC";
    private final String dbUser = "root";
    private final String dbPassword = "root";

    // 아이디 중복 확인 메서드
    public boolean isDuplicateId(String userName) {
        String sql = "SELECT COUNT(*) FROM user WHERE user_name = ?";
        try (Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
             PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setString(1, userName);
            try (ResultSet rs = pstmt.executeQuery()) {
                return rs.next() && rs.getInt(1) > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    // 비밀번호 중복 확인 메서드
    public boolean isDuplicatePassword(String userPassword) {
        String sql = "SELECT COUNT(*) FROM user WHERE user_password = ?";
        try (Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
             PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setString(1, userPassword);
            try (ResultSet rs = pstmt.executeQuery()) {
                return rs.next() && rs.getInt(1) > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    // 회원가입 메서드
    public boolean insertUser(String userName, String userPassword, int gender) {
        String sql = "INSERT INTO user (user_name, user_password, gender) VALUES (?, ?, ?)";
        try (Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
             PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setString(1, userName);
            pstmt.setString(2, userPassword);
            pstmt.setInt(3, gender);
            return pstmt.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
