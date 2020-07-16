

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
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
 * Servlet implementation class add_college_admin
 */
@WebServlet("/add_college_admin")
public class add_college_admin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public add_college_admin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		response.setContentType("text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		PrintWriter out=response.getWriter();
		
		local_url lul=new local_url();
		String localUrl=lul.getUrl();
		String turn_to_url = "";
		String college_admin_add_result="";
		
		String name=request.getParameter("userName");
		String major=request.getParameter("college");
		String pass="admin";
		
		
		turn_to_url=localUrl+"test_jsp/add_college_admin.jsp";
		college_admin_add_result="successfully added!";
		//start to insert student info into database
		database_var dbv = new database_var();
		String JDBC_DRIVER = dbv.getJdbcDriver();  
		String DB_URL = dbv.getDbUrl();
		String USER = dbv.getUser();
		String PASS = dbv.getPass();
		    
		Connection conn =null;
		Statement stmt = null;
		try{
	            
		         Class.forName(JDBC_DRIVER);
		         conn = DriverManager.getConnection(DB_URL,USER,PASS);
		         stmt = conn.createStatement();
		         String sql;
		         sql = "INSERT into userinfo values('"+name+"','"+pass+"','cadmin','"+major+"')";
		         int rs = stmt.executeUpdate(sql);
		         
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
		
		out.println("<html>");
		out.println("<head>");
		out.println(" <title>add college admin result</title>");
		out.println("<meta http-equiv=\"refresh\" content=\"1;url="+turn_to_url+"\">");
		out.println("</head>");
		out.println("<body>");
		out.println("<font size=2>");
		out.println(" wait 1 seconds to goto new page... "+"<br>");
		out.println("*****************"+"<br>");
		out.println(college_admin_add_result+"<br>");
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
