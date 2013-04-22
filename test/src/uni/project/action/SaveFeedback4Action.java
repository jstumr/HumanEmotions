package uni.project.action;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.Enumeration;
import java.util.Hashtable;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SaveUserDetailsAction
 */


@WebServlet("/SaveFeedback4")
public class SaveFeedback4Action extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection con = null;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SaveFeedback4Action() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Enumeration<String> enumParam = request.getParameterNames();
		String sessionId = request.getSession().getId();
		Hashtable<String, String> ques_ans= new Hashtable<String, String>();
		String key = "";			
		try{
			String dbUrl = "jdbc:mysql://localhost:3306/dbexperiment";
			String dbClass = "com.mysql.jdbc.Driver";
			con = null;
			Class.forName(dbClass);
			con = DriverManager.getConnection(dbUrl,"root","adminadmin");
			
			String sql="INSERT INTO t_userfeedback4 (session_id, question , user_ans ) VALUES (?,?,?)";
			PreparedStatement pst =con.prepareStatement(sql);
			
			while(enumParam.hasMoreElements())
			{
				 key = enumParam.nextElement();
				String value = request.getParameter(key);
				if(key.equals("submit"))
				{
					System.out.println ("feedback4_saving >> " + key + " exceptional case " );
					continue;
					
				}
				System.out.println ( "SaveFeedback4Action :: " + key + " : " + value);
				ques_ans.put(key, value);
				
				pst.setString(1, sessionId);
				pst.setString(2, key);
				pst.setString(3, value);
				pst.addBatch();				
			}
			pst.executeBatch();
			con.close();
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		request.getRequestDispatcher("videoReadyOld.jsp").forward(request, response);
	}

}
