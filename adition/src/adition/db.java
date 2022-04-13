package adition;

import java.sql.*;

public class db {
	public Connection getDB(){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName("oracle.jdbc.OracleDriver?");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
	

}
