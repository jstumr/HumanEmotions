package uni.project.action;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Timestamp;
import java.sql.*;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



/**
 * Servlet implementation class SaveTeil1DataAction
 */
@WebServlet("/SaveTeil2Data")
public class SaveTeil2DataAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	Connection con = null;
    public SaveTeil2DataAction() {
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
		
		String sessionId = request.getSession().getId();
		int currentImg = Integer.parseInt(request.getSession().getAttribute("currentImg").toString());
		ArrayList quesImg = (ArrayList)request.getSession().getAttribute("imgPath_teil2"); 
		Object[] imgPaths =  quesImg.toArray();
		
		try{
			int answer=0;
			int result=0;
			String dbUrl = "jdbc:mysql://localhost:3306/dbexperiment";
			String dbClass = "com.mysql.jdbc.Driver";
			con = null;
			Class.forName(dbClass);
			con = DriverManager.getConnection(dbUrl,"root","adminadmin");
			
			// Check the answer of user about 
			String checksql = "SELECT ans_image FROM t_imagequestions where image_path = '"+ imgPaths[currentImg].toString() + "'";
			Statement checkstmt = con.createStatement();
			ResultSet checkres = checkstmt.executeQuery(checksql);
			if(checkres.next())
				answer = checkres.getInt("ans_image");
			
			if(answer==Integer.parseInt(request.getParameter("number")))
				result = 1;
				else
				result = 0;
			
			String sql="INSERT INTO t_userteil2ans(ques_img, session_id, user_ans, result_ans) VALUES(?,?,?,?)";
			PreparedStatement pst =con.prepareStatement(sql);
			pst.setString(1, ""+ imgPaths[currentImg]);
			pst.setString(2, sessionId);
			pst.setString(3, request.getParameter("number"));
			pst.setInt(4, result);
			pst.execute();
			con.close();
			
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
			con = null;
		}
		
//		final boolean timerFlag;
//		 System.out.println("SaveTeil2DataAction Task scheduler check.");
//			if(request.getSession().getAttribute("timerCreated").toString().equals("NO"))
//			{
//				 System.out.println("SaveTeil2DataAction Task scheduling..........");
//				final Timer  timer = new Timer();
//				timer.schedule(new TimerTask() {
//					
//					@Override
//					 public void run() {
//					      System.out.println("SaveTeil2DataAction Time's up!");
//					      timerFlag = true;
//					      timer.cancel();
//					    }
//				}, 5 * 60000);
//				
//				request.getSession().setAttribute("timerCreated", "YES");
//				 System.out.println("SaveTeil2DataAction Task scheduled.");	
//			}
			
		Timestamp startTime = (Timestamp) request.getSession().getAttribute("teil2StartTime");
//		System.out.println("startTime " + startTime);
//		System.out.println("startTime " + startTime.getTime());
		
		java.util.Date today = new java.util.Date();
		Timestamp now = new java.sql.Timestamp(today.getTime());
//		System.out.println("now " + now);
//		System.out.println("now " + now.getTime());
		
		long diffInTime = (now.getTime() - startTime.getTime())/1000;
		
		
		
		int minutes = 1; //restriction of xx minutes
		
		
		long milisec = minutes * 60; 
		System.out.println("now - startTime " + diffInTime);
		currentImg++;
		
		if(currentImg >= quesImg.size() || diffInTime >= milisec )
		{
			request.getRequestDispatcher("teil2end.jsp").forward(request, response);
		}
		else{
			request.getSession().setAttribute("currentImg", currentImg);
			request.getRequestDispatcher("maintaskQuestions.jsp").forward(request, response);
		}
		
	}

}
