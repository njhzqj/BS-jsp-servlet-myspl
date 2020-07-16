

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test_jsp.*;

/**
 * Servlet implementation class login
 * @param <Stirng>
 */
@WebServlet("/login")
public class login<Stirng> extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
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
		PrintWriter out=response.getWriter();
		
		String college="";
		
		String time="";
		
		local_url lul=new local_url();
		String localUrl=lul.getUrl();
		String turn_to_url = "";
		String login_result="";
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
	                String sql_college = rs.getString("college");
	                
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
	                			college=sql_college;
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
		if(is_login_success==true)
		{
			if(userType.contentEquals("student"))
			{
				boolean is_time_right=false;
				//判断是否在时间限制内
				
				Date now = new Date(); 
				SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");//可以方便地修改日期格式 

				String hehe = dateFormat.format( now ); 
				System.out.println(hehe); 

				Calendar c = Calendar.getInstance();
				 

				int year = c.get(Calendar.YEAR); 
				int month = c.get(Calendar.MONTH); 
				int date = c.get(Calendar.DATE); 
				int hour = c.get(Calendar.HOUR_OF_DAY); 
				int minute = c.get(Calendar.MINUTE); 
				int second = c.get(Calendar.SECOND); 
				
				time=hehe;
				
				String start="";
				String end="";
				
				//到数据库中获取允许的时间信息
				try{
				    
				     Class.forName(JDBC_DRIVER);
				     conn = DriverManager.getConnection(DB_URL,USER,PASS);
				     stmt = conn.createStatement();
				     
				     String sql1;
				     sql1="SELECT * FROM time_limit";
				     ResultSet rs = stmt.executeQuery(sql1);
				     
				     boolean find=false;
				     while(rs.next())
				     {
				    	 start=rs.getString("start_time");
				    	 end=rs.getString("end_time");
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
				//然后处理字符串,FOR EXAMPLE "2020-06-22T18:59:59"
				int start_year=Integer.parseInt(start.substring(0,4));
				int start_month=Integer.parseInt(start.substring(5, 7));
				int start_date=Integer.parseInt(start.substring(8, 10));
				int start_hour=Integer.parseInt(start.substring(11, 13));
				int start_minute=Integer.parseInt(start.substring(14,16));
				int start_second=Integer.parseInt(start.substring(17,19));
				
				int end_year=Integer.parseInt(end.substring(0,4));
				int end_month=Integer.parseInt(end.substring(5, 7));
				int end_date=Integer.parseInt(end.substring(8, 10));
				int end_hour=Integer.parseInt(end.substring(11, 13));
				int end_minute=Integer.parseInt(end.substring(14,16));
				int end_second=Integer.parseInt(end.substring(17,19));
				
				System.out.println(start_year);
				System.out.println(start_month);
				System.out.println(start_date);
				System.out.println(start_hour);
				System.out.println(start_minute);
				System.out.println(start_second);
				
				System.out.println(end_year);
				System.out.println(end_month);
				System.out.println(end_date);
				System.out.println(end_hour);
				System.out.println(end_minute);
				System.out.println(end_second);
				
				//比较(此处仅比较了日期以下的(年份和月份没有比较)
				if(date<end_date&&date>start_date)
				{
					is_time_right=true;
				}
				if(date==end_date&&date!=start_date)
				{
					if(hour<end_hour)
					{
						is_time_right=true;
					}
					if(hour==end_hour)
					{
						if(minute<end_minute)
						{
						    is_time_right=true;
						}
						if(minute==end_minute)
						{
							if(second<end_second)
							{
								 is_time_right=true;
							}
						}
					}
					
				}
				if(date==start_date&&date!=end_date)
				{
					if(hour>start_hour)
					{
						is_time_right=true;
					}
					if(hour==start_hour)
					{
						if(minute>start_minute)
						{
						    is_time_right=true;
						}
						if(minute==start_minute)
						{
							if(second>start_second)
							{
								 is_time_right=true;
							}
						}
					}
				}
				if(date==start_date&&date==end_date)
				{
					if(hour>start_hour&&hour<end_hour)
					{
						is_time_right=true;
					}
					if(hour==start_hour&&hour!=end_hour)
					{
						if(minute>start_minute)
						{
						    is_time_right=true;
						}
						if(minute==start_minute)
						{
							if(second>start_second)
							{
								 is_time_right=true;
							}
						}
					}
					if(hour!=start_hour&&hour==end_hour)
					{
						if(minute<end_minute)
						{
						    is_time_right=true;
						}
						if(minute==end_minute)
						{
							if(second<end_second)
							{
								 is_time_right=true;
							}
						}
					}
					if(hour==start_hour&&hour==end_hour)
					{
						if(minute>start_minute&&minute<end_minute)
						{
							is_time_right=true;
						}
						if(minute==start_minute&&minute!=end_minute)
						{
							if(second>start_second)
							{
								is_time_right=true;
							}
						}
						if(minute!=start_minute&&minute==end_minute)
						{
							if(second<end_second)
							{
								is_time_right=true;
							}
						}
						if(minute==start_minute&&minute==end_minute)
						{
							if(second<end_second&&second>start_second)
							{
								is_time_right=true;
							}
						}
					}
				}
				
				if(is_time_right)
				{
				turn_to_url=localUrl+"test_jsp/student_choose_teacher.jsp?student_Name="+name;
				login_result="successfully login!";
				}
				else
				{
					turn_to_url=localUrl+"test_jsp/login.jsp";
					login_result="not right time!";
				}
			}
			if(userType.contentEquals("teacher"))
			{
				turn_to_url=localUrl+"test_jsp/teacher_choose.jsp?teacher_name="+name;
				login_result="successfully login!";
			}
			if(userType.contentEquals("cadmin"))//collegeAdmin
			{
				turn_to_url=localUrl+"test_jsp/college_admin.jsp?admin_name="+name+"&college_name="+college;
				login_result="successfully login!";
			}
			if(userType.contentEquals("iadmin"))//instituteAdmin
			{
				turn_to_url=localUrl+"test_jsp/ins_admin.jsp?admin_name="+name+"&college_name="+college;
				login_result="successfully login!";
			}
		}
		else
		{
			turn_to_url=localUrl+"test_jsp/login.jsp";
			login_result="wrong user name or password or usertype! plz try again!";
		}
		
		out.println("<html>");
		out.println("<head>");
		out.println(" <title>login_result</title>");
		out.println("<meta http-equiv=\"refresh\" content=\"1;url="+turn_to_url+"\">");
		out.println("</head>");
		out.println("<body>");
		out.println("<font size=2>");
		//out.println(name);
		out.println(" wait 1 seconds to goto new page... "+"<br>");
		out.println("*****************"+"<br>");
		out.println(login_result+"<br>");
		out.println(time+"<br>");
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
