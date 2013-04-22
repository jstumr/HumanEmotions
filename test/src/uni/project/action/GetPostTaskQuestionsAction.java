package uni.project.action;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import uni.project.data.QuestionBean;


/**
 * Servlet implementation class getTeil1QuestionsAction
 */
@WebServlet("/GetPostTaskQuestions")
public class GetPostTaskQuestionsAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetPostTaskQuestionsAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
   // DBConnection dbCon = null;
    Connection con = null;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("GetPostTaskQuestionsAction inside do post");
		ArrayList<QuestionBean> questionsArray = new ArrayList<QuestionBean>();
		try{
			System.out.println("GetPostTaskQuestionsAction questions before  get connection");
			String dbUrl = "jdbc:mysql://localhost:3306/dbexperiment";
			String dbClass = "com.mysql.jdbc.Driver";
			con = null;
			
				Class.forName(dbClass);
				con =DriverManager.getConnection(dbUrl,"root","adminadmin");
			
//			System.out.println("questions got connection");
			Statement s =con.createStatement();
			String sql="select * from t_videoquestions";
			ResultSet rs=s.executeQuery(sql);
			//System.out.println("questions data fechted");
			while(rs.next())
			{
				System.out.println("t_videoquestions >> " +rs.getString("question"));
				QuestionBean qb = new QuestionBean();
				qb.setQuesId(rs.getInt("id"));
				qb.setQues(rs.getString("question"));
				qb.setOptionType(rs.getString("optionset"));
				questionsArray.add(qb);
					
			}
			con.close();
			con = null;
		}
		catch(Exception e) 
		{			
			e.printStackTrace();
			con = null;
		}
				
		request.getSession().setAttribute("startQuesNo", 0);
		
        System.out.println("GetPostTaskQuestionsAction Session created : "+ request.getSession().getId());
		System.out.println("GetPostTaskQuestionsAction testType : "+ request.getSession().getAttribute("testType"));
		
		request.getSession().setAttribute("vedioQuestions", questionsArray);
		request.getRequestDispatcher("videoQuestions.jsp").forward(request, response);
	}

}
