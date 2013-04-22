package uni.project.action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class SessionStartAction
 */
@WebServlet("/SessionStartAction")
public class SessionStartAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SessionStartAction() {
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
		
		HttpSession hsession = request.getSession(true);
		
		if (!hsession.isNew()) {
			hsession.invalidate();
			hsession = request.getSession();
		}
		
        System.out.println("Session created : "+ hsession.getId());
		String testType = request.getParameter("testType");
		String teilnehmerNummer = request.getParameter("teilnehmerNummer");
		System.out.println("testType : "+ testType);
		hsession.setAttribute("testType", testType);
		
		System.out.println("teilnehmerNummer : "+ teilnehmerNummer);
		hsession.setAttribute("teilnehmerNummer", teilnehmerNummer);
		request.getRequestDispatcher("welcome.jsp").forward(request, response);
		
	}

}











