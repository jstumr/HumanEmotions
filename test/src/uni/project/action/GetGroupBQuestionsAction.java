package uni.project.action;

import java.io.IOException;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.Connection;

import uni.project.data.QuestionBean;

/**
 * Servlet implementation class GetGroupBQuestionsAction
 */
@WebServlet("/GetGroupBQuestionsAction")
public class GetGroupBQuestionsAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetGroupBQuestionsAction() {
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
	 Connection con = null;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<QuestionBean> questionsArray = new ArrayList<QuestionBean>();
		try{
			System.out.println("questions before  get connection");
			String dbUrl = "jdbc:mysql://localhost:3306/dbexperiment";
			String dbClass = "com.mysql.jdbc.Driver";
			con = null;
			
				Class.forName(dbClass);
				con =DriverManager.getConnection(dbUrl,"root","adminadmin");
			
//			System.out.println("questions got connection");
			Statement s =con.createStatement();
			String sql="select * from t_groupbquestions";
			ResultSet rs=s.executeQuery(sql);
			//System.out.println("questions data fechted");
			while(rs.next())
			{
				//System.out.println(rs.getString("question"));
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
				
		
        System.out.println("Session created : "+ request.getSession().getId());
		System.out.println("testType : "+ request.getSession().getAttribute("testType"));
		request.getSession().setAttribute("startQuesNo", "0");
		
		request.getSession().setAttribute("questionsGroupB", questionsArray);
		request.getRequestDispatcher("questiongroupB.jsp").forward(request, response);
	}

}
