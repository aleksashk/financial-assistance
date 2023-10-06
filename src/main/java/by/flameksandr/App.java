package by.flameksandr;

import java.sql.*;

public class App {
    public static void main(String[] args) throws SQLException {
        String email = "user1@example.com";
        String password = "password";

        Connection con = DriverManager.getConnection(
                "jdbc:postgresql://localhost:5432/finance_assistance",
                "postgres",
                "password"
        );

        Statement statement = con.createStatement();
        ResultSet rs = statement.executeQuery("select * from user_service");
        while (rs.next()) {
//            System.out.println(rs.getLong("id") + ", " +
//                    rs.getString("email") + ", " +
//                    rs.getString("password"));
        }
        PreparedStatement ps = con.prepareStatement("select * from user_service where email=? and password=?");
        ps.setString(1, email);
        ps.setString(2, password);
        rs = ps.executeQuery();
        if(rs.next()){
            System.out.println("Hello " + rs.getString("email"));
        }else {
            System.out.println("Access denied!!!!");
        }
        statement.close();
        con.close();

    }
}
