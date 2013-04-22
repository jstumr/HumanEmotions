package uni.project.action;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.Hashtable;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



/**
 * Servlet implementation class SaveTeil1DataAction
 */
@WebServlet("/SaveVideoData")
public class SaveVideoDataAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	Connection con = null;
    public SaveVideoDataAction() {
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
		Hashtable<String, String> ques_ans= new Hashtable<String, String>();
		String key = "";			
		try{
			String dbUrl = "jdbc:mysql://localhost:3306/dbexperiment";
			String dbClass = "com.mysql.jdbc.Driver";
			con = null;
			Class.forName(dbClass);
			con = DriverManager.getConnection(dbUrl,"root","adminadmin");
			
			String sql="INSERT INTO t_uservideoans(sessionId, optionsetNo, questionNo, selected_option) VALUES(?,2,?,?)";
			PreparedStatement pst =con.prepareStatement(sql);
			
			while(enumParam.hasMoreElements())
			{
				 key = enumParam.nextElement();
				String value = request.getParameter(key);
				if(key.equals("submit"))
				{
					System.out.println ("SaveVideoData >> " + key + " exceptional case " );
					continue;
					
				}
				System.out.println (key + " : " + value);
				ques_ans.put(key, value);
				
				pst.setString(1, sessionId);
				pst.setInt(2, Integer.parseInt(key));
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
		con=null;
		int startQuesNo = Integer.parseInt(request.getSession().getAttribute("startQuesNo").toString());
		ArrayList questions = (ArrayList)request.getSession().getAttribute("vedioQuestions");
		if(startQuesNo >= questions.size() )
		{
			request.getRequestDispatcher("dankeVideo.jsp").forward(request, response);
		}
		else{
			request.getRequestDispatcher("videoQuestions.jsp").forward(request, response);
		}
		
	}

}
