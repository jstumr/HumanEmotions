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
@WebServlet("/SaveTeil1Data")
public class SaveTeil1DataAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	Connection con = null;
    public SaveTeil1DataAction() {
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
			
			String sql="INSERT INTO t_userteil1ans(sessionId, optionsetNo, questionNo, selected_option) VALUES(?,1,?,?)";
			PreparedStatement pst =con.prepareStatement(sql);
			
			while(enumParam.hasMoreElements())
			{
				 key = enumParam.nextElement();
				String value = request.getParameter(key);
				if(key.equals("submit"))
				{
					System.out.println (key + " exceptional case " );
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
			
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		int startQuesNo = Integer.parseInt(request.getSession().getAttribute("startQuesNo").toString());
		ArrayList questions = (ArrayList)request.getSession().getAttribute("questions");
		if(startQuesNo >= questions.size() )
		{
			request.getRequestDispatcher("userdetails.jsp").forward(request, response);
		}
		else{
			request.getRequestDispatcher("questions.jsp").forward(request, response);
		}
		
	}

}
