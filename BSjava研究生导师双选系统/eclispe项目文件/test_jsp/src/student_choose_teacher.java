

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test_jsp.*;

/**
 * Servlet implementation class student_choose_teacher
 */
@WebServlet("/student_choose_teacher")
public class student_choose_teacher extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public student_choose_teacher() {
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
		String student_choose_result="";
		
		String stunum=request.getParameter("stunum");
		String name=request.getParameter("name");
		String major=request.getParameter("major");
		String chooses[]=request.getParameterValues("teacherchoose");
		if(chooses.length!=3)
		{
			turn_to_url=localUrl+"test_jsp/student_choose_teacher.jsp?student_Name="+name;
			student_choose_result="you should not choose more or less than three choices";
		}
		else
		{
			turn_to_url=localUrl+"test_jsp/login.jsp";
			student_choose_result="successfully chosen! we are going to return to login page!";
			//start to insert student choose info into database
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
		         sql = "INSERT into student_choose_info values('"+stunum+"','"+name+"','"+chooses[0]+"','"+chooses[1]+"','"+chooses[2]+"','导师选择：未选择','导师选择：未选择','导师选择：未选择','"+major+"')";
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
		}
		out.println("<html>");
		out.println("<head>");
		out.println(" <title>choose teacher result</title>");
		out.println("<meta http-equiv=\"refresh\" content=\"1;url="+turn_to_url+"\">");
		out.println("</head>");
		out.println("<body>");
		out.println("<font size=2>");
		out.println(" wait 1 seconds to goto new page... "+"<br>");
		out.println("*****************"+"<br>");
		out.println(student_choose_result+"<br>");
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
