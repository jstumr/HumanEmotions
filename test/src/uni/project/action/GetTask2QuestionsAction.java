package uni.project.action;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class GetTask2QuestionsAction
 */
@WebServlet("/GetTask2QuestionsAction")
public class GetTask2QuestionsAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetTask2QuestionsAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    Connection con = null;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("GetTask2QuestionsAction: inside do post");
		ArrayList<String> imgQuesArray = new ArrayList<String>();
		try{
			System.out.println("GetTask2QuestionsAction: before  get connection");
			String dbUrl = "jdbc:mysql://localhost:3306/dbexperiment";
			String dbClass = "com.mysql.jdbc.Driver";
			con = null;
			
				Class.forName(dbClass);
				con =DriverManager.getConnection(dbUrl,"root","adminadmin");
			
//			System.out.println("teil 2 questions got connection");
			Statement s =con.createStatement();
			String sql="select * from t_task2imageQuestions";
			ResultSet rs=s.executeQuery(sql);
			System.out.println("GetTask2QuestionsAction: task 2 questions data fechted");
			
			while(rs.next())
			{
				System.out.println("GetTask2QuestionsAction: " + rs.getString(1));
				imgQuesArray.add(rs.getString("image_path"));
					
			}
			con.close();
			con = null;
		}
		catch(Exception e) 
		{			
			e.printStackTrace();
			con = null;
		}				
		
        System.out.println("Session created GetTask2QuestionsAction : "+ request.getSession().getId());
		System.out.println("GetTask2QuestionsAction testType : "+ request.getSession().getAttribute("testType"));
		request.getSession().setAttribute("imgPath_task2", imgQuesArray);
		request.getSession().setAttribute("currentImg", 0);
		//request.getSession().setAttribute("timerCreated", "NO");
		request.getRequestDispatcher("task2maintaskQuestions.jsp").forward(request, response);
	}

}
