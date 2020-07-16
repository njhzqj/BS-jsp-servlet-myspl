package test_jsp;

public class database_var {
	static final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";  
    static final String DB_URL = "jdbc:mysql://localhost:3306/student_teacher?serverTimezone=UTC&characterEncoding=utf8&mysqlEncoding=utf8";
    static final String USER = "root";
    static final String PASS = "password";
	public static String getJdbcDriver() {
		return JDBC_DRIVER;
	}
	public static String getDbUrl() {
		return DB_URL;
	}
	public static String getUser() {
		return USER;
	}
	public static String getPass() {
		return PASS;
	}
    
    

}
