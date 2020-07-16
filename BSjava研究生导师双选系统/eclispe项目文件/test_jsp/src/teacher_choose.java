

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
 * Servlet implementation class teacher_choose
 */
@WebServlet("/teacher_choose")
public class teacher_choose extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public teacher_choose() {
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
		
		String teacher_name=request.getParameter("teacher_name");
		String chooses[]=request.getParameterValues("teacherchoose");
		String teacher_choose_result="";
		
		String change_database_result="";
		
		//完成选择后跳转到登录界面
		turn_to_url=localUrl+"test_jsp/login.jsp";
		teacher_choose_result="successfully chosen! we are going to return to login page!";
		
		//start to insert teacher choose info into database
		database_var dbv = new database_var();
		String JDBC_DRIVER = dbv.getJdbcDriver();  
	    String DB_URL = dbv.getDbUrl();
	    String USER = dbv.getUser();
	    String PASS = dbv.getPass();
	    
	    //*****test parameters*****
	    String test_sql="";
	    //****************
	    
	    Connection conn =null;
		Statement stmt = null;
		try{
            
	         Class.forName(JDBC_DRIVER);
	         conn = DriverManager.getConnection(DB_URL,USER,PASS);
	         stmt = conn.createStatement();
	         String sql;
	         sql = "SELECT * FROM student_choose_info";
	         ResultSet rs = stmt.executeQuery(sql);

	         while(rs.next()){
	        	 
	        	 String temp_stu_id=rs.getString("studentid");
	        	 String first_choose=rs.getString("firstchoose");
	        	 String second_choose=rs.getString("secondchoose");
	        	 String third_choose=rs.getString("thirdchoose");
	        	 
	             for(int i=0;i<chooses.length;i++)
	             {
	                if(chooses[i].contentEquals(temp_stu_id))
	                {
	                	String choose_position="";
	                	if(first_choose.contentEquals(teacher_name))
	                	{
	                		choose_position="is_teacher_choose";
	                	}
	                	if(second_choose.contentEquals(teacher_name))
	                	{
	                		choose_position="is_teacher_choose_2";
	                	}
	                	if(third_choose.contentEquals(teacher_name))
	                	{
	                		choose_position="is_teacher_choose_3";
	                	}
	                	//UPDATE student_choose_info SET is_teacher_choose = '导师选择：已选择' WHERE studentid = '1';

	                	String temp_sql="";
	                	String set= "导师选择：已选择";
	                	temp_sql="UPDATE student_choose_info SET "+choose_position+" = '"+set+"' WHERE studentid = '"+temp_stu_id+"'";
	                	//test_sql=temp_sql;
	                	PreparedStatement pstmt=conn.prepareStatement(temp_sql);
	                	int n=pstmt.executeUpdate();
	                	if(n==1){ 
	                		change_database_result="change data successe!";}
	            		else{
	            			change_database_result="change data wrong!";}
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
	out.println("<html>");
	out.println("<head>");
	out.println(" <title>choose teacher result</title>");
	out.println("<meta http-equiv=\"refresh\" content=\"1;url="+turn_to_url+"\">");
	out.println("</head>");
	out.println("<body>");
	out.println("<font size=2>");
	out.println(" wait 1 seconds to goto new page... "+"<br>");
	out.println("*****************"+"<br>");
	out.println(teacher_choose_result+"<br>");
	out.println(change_database_result+"<br>");
	//out.println(test_sql+"<br>");
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
