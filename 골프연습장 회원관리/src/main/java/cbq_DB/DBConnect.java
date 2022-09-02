package cbq_DB;
import java.sql.*;

public class DBConnect {
	public static Connection getConnection() throws Exception {
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String id = "system";
		String pw = "1234";
		
		Class.forName("oracle.jdbc.OracleDriver");
		Connection conn = DriverManager.getConnection
				(url, id, pw);
		
		return conn;
	}
}
