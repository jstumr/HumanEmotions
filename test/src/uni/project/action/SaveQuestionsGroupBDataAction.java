package uni.project.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SaveQuestionsGroupBDataAction
 */
@WebServlet("/SaveQuestionsGroupBDataAction")
public class SaveQuestionsGroupBDataAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SaveQuestionsGroupBDataAction() {
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
		int startQuesNo = Integer.parseInt(request.getSession().getAttribute("startQuesNo").toString());
		ArrayList questions = (ArrayList)request.getSession().getAttribute("questionsGroupB");
		if(startQuesNo >= questions.size() )
		{
			request.getRequestDispatcher("beforevideo.jsp").forward(request, response);
		}
		else{
			request.getRequestDispatcher("questiongroupB.jsp").forward(request, response);
		}
	}

}
