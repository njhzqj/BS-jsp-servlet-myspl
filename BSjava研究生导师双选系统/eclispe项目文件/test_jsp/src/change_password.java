

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test_jsp.database_var;
import test_jsp.local_url;

/**
 * Servlet implementation class change_password
 */
@WebServlet("/change_password")
public class change_password extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public change_password() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		database_var dbv = new database_var();
		String JDBC_DRIVER = dbv.getJdbcDriver();  
	    String DB_URL = dbv.getDbUrl();
	    String USER = dbv.getUser();
	    String PASS = dbv.getPass();
		
		Connection conn =null;
		Statement stmt = null;
		
		response.setContentType("text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		String name=request.getParameter("userName");
		String password=request.getParameter("password");
		String userType=request.getParameter("userType");
		String new_password=request.getParameter("new_password");
		PrintWriter out=response.getWriter();
		
		String college="";
		
		local_url lul=new local_url();
		String localUrl=lul.getUrl();
		String turn_to_url = "";
		
		String change_database_result="change data wrong!";
		String change_password_result="";
		boolean is_login_success=false;
		
		try{
            
	         Class.forName(JDBC_DRIVER);
	         conn = DriverManager.getConnection(DB_URL,USER,PASS);
	         stmt = conn.createStatement();
	         String sql;
	         sql = "SELECT username, password, usertype,college FROM userinfo";
	         ResultSet rs = stmt.executeQuery(sql);

	         while(rs.next()){
	                String sql_name  = rs.getString("username");
	                String sql_pass = rs.getString("password");
	                String sql_type = rs.getString("usertype");
	                
	                //String sql_college = rs.getString("college");
	                
	                //out.println(sql_name+" ");
	                //out.println(sql_pass+" ");
	                //out.println(sql_type+"<br>");
	                if(name.contentEquals(sql_name))
	                {
	                	if(password.contentEquals(sql_pass))
	                	{
	                		if(userType.contentEquals(sql_type))
	                			{
	                			is_login_success=true;
	                			}
	                	}
	                }
	         }
	    rs.close();
	    stmt.close();
	    conn.close();
	    } 
		catch(SQLException se) {
	           
	            se.printStackTrace();
	    } 
		catch(Exception e) {
	            
	            e.printStackTrace();
	    }
		finally{
	            
	            try{
	                if(stmt!=null)
	                stmt.close();
	            }catch(SQLException se2){
	            }
	            try{
	                if(conn!=null)
	                conn.close();
	            }catch(SQLException se){
	                se.printStackTrace();
	            }
	    }
		//如果用户信息正确的话，那么就更新密码，并回到登陆界面
		if(is_login_success==true)
		{
			change_password_result="successfully changed password! please login again!";
			turn_to_url=localUrl+"test_jsp/login.jsp";
			
			
			try{
	            
            Class.forName(JDBC_DRIVER);
		    conn = DriverManager.getConnection(DB_URL,USER,PASS);
		    stmt = conn.createStatement();
		    String temp_sql="";
            temp_sql="UPDATE userinfo SET password = '"+new_password+"' WHERE username = '"+name+"'";
            PreparedStatement pstmt=conn.prepareStatement(temp_sql);
            int n=pstmt.executeUpdate();
            if(n==1){ 
             	change_database_result="change data successe!";}
         	else{
         		change_database_result="change data wrong!";}
		    
		    stmt.close();
		    conn.close();
		    } 
			catch(SQLException se) {
		           
		            se.printStackTrace();
		    } 
			catch(Exception e) {
		            
		            e.printStackTrace();
		    }
			finally{
		            
		            try{
		                if(stmt!=null)
		                stmt.close();
		            }catch(SQLException se2){
		            }
		            try{
		                if(conn!=null)
		                conn.close();
		            }catch(SQLException se){
		                se.printStackTrace();
		            }
		    }
			
			
		}
		//如果信息不正确，那么提示有错误信息并回到修改密码界面
		else
		{
			change_password_result="can not login! please try again";
			turn_to_url=localUrl+"test_jsp/change_password.jsp";
			
		}
		
		out.println("<html>");
		out.println("<head>");
		out.println(" <title>login_result</title>");
		out.println("<meta http-equiv=\"refresh\" content=\"1;url="+turn_to_url+"\">");
		out.println("</head>");
		out.println("<body>");
		out.println("<font size=2>");
		//out.println(name);
		out.println(" wait 2 seconds to goto new page... "+"<br>");
		out.println("*****************"+"<br>");
		out.println(change_password_result+"<br>");
		out.println("</font>");
		out.println("</body>");
		out.println("</html>");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
