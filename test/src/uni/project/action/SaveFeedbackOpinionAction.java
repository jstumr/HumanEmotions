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


@WebServlet("/SaveFeedbackOpinion")
public class SaveFeedbackOpinionAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection con = null;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SaveFeedbackOpinionAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Enumeration<String> enumParam = request.getParameterNames();
		String sessionId = request.getSession().getId();
		
		
		try{
			String dbUrl = "jdbc:mysql://localhost:3306/dbexperiment";
			String dbClass = "com.mysql.jdbc.Driver";
			con = null;
			Class.forName(dbClass);
			con = DriverManager.getConnection(dbUrl,"root","adminadmin");
			
			String sql="INSERT INTO t_userfeedback4 (session_id, question , user_ans ) VALUES (?,'Meinung',?)";
			PreparedStatement pst =con.prepareStatement(sql);
			
			
				
				String value = request.getParameter("expr_feedback");
			
				System.out.println ( "SaveFeedbackOpinionAction :: expr_feedback : " + value);
							
				pst.setString(1, sessionId);
			
				pst.setString(2, value);
				pst.execute();
			con.close();
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		//request.getRequestDispatcher("watchVideo.jsp").forward(request, response);
		String testType= request.getSession().getAttribute("testType").toString();
		if(testType.equals("A"))
		request.getRequestDispatcher("task2Intro1.jsp").forward(request, response);
		else
		request.getRequestDispatcher("morequestionsIntro.jsp").forward(request, response);
			
	}

}
