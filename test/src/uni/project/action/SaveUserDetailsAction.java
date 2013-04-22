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


@WebServlet("/SaveUserDetails")
public class SaveUserDetailsAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection con = null;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SaveUserDetailsAction() {
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
		String testType= request.getSession().getAttribute("testType").toString();
		String teilnehmerNummer = request.getSession().getAttribute("teilnehmerNummer").toString();
		Hashtable<String, String> ques_ans= new Hashtable<String, String>();
						
		try{
			String dbUrl = "jdbc:mysql://localhost:3306/dbexperiment";
			String dbClass = "com.mysql.jdbc.Driver";
			con = null;
			Class.forName(dbClass);
			con = DriverManager.getConnection(dbUrl,"root","adminadmin");
			
			String sql="INSERT INTO t_userDetails(age, birthland, gender, ger_expr, mothertongue_ger, nationality, semester, " +
					"session_id, study_course, testType, user_number) VALUES (?,?,?,?,?,?,?,?,?,?,?);";
			PreparedStatement pst =con.prepareStatement(sql);
			
			while(enumParam.hasMoreElements())
			{
				String key = enumParam.nextElement();
				String value = request.getParameter(key);
				System.out.println (key + " : " + value);
				ques_ans.put(key, value);
			}
			
			request.getSession().setAttribute("userAge", ques_ans.get("age"));
			
			pst.setString(1, ques_ans.get("age"));
			pst.setString(2, ques_ans.get("birthland"));
			pst.setString(3, ques_ans.get("gender"));
			pst.setString(4, ques_ans.get("ger_expr"));
			pst.setString(5, ques_ans.get("muttersprache"));
			pst.setString(6, ques_ans.get("nation"));
			pst.setString(7, ques_ans.get("semester"));
			pst.setString(8, sessionId);
			pst.setString(9, ques_ans.get("studium"));
			pst.setString(10, testType);
			pst.setString(11, teilnehmerNummer);
			if(pst.execute())
			{ System.out.println("SaveUserDetailsAction: Success!!");}
			con.close();
			con = null;
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
			con = null;
		}
		request.getRequestDispatcher("teil1end.jsp").forward(request, response);
	}

}
