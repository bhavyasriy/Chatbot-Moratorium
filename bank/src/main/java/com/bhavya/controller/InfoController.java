package com.bhavya.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bhavya.dao.InfoDao;
import com.bhavya.dao.InfoDaoClass;
import com.bhavya.model.Customer;
import com.bhavya.model.Loan;
import com.bhavya.model.Status;

/**
 * Servlet implementation class InfoController
 */
@WebServlet("/info")
public class InfoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
      private InfoDao dao=null;
    /**
     * @see HttpServlet#HttpServlet
     */
    public InfoController() {
        
        // TODO Auto-generated constructor stub
    	dao=new InfoDaoClass();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// TODO Auto-generated method stub
		
		System.out.println("In controller");
		
		String acc_no=request.getSession().getAttribute("username").toString();
		Status s=new Status();
		Loan loan=new Loan();
		
		s.setWant(request.getParameter("r_want"));
		String loans1[]=request.getParameterValues("r_select_loan");
		String clear[] = request.getParameterValues("r_clear_loan");
		s.setSettle(request.getParameter("r_settle_loan"));
		s.setEco(request.getParameter("r_eco"));
		s.setHealth(request.getParameter("r_health"));
		s.setMental_health(request.getParameter("mental_health"));
		s.setExtra_loan(request.getParameter("extra_loan"));
		s.setReason(request.getParameter("reason"));
		//s.set (request.getParameterValues("r_select_loan"));
		
		//RequestDispatcher dispatcher=request.getRequestDispatcher("/register.jsp");
		//dispatcher.forward(request, response);
		System.out.println(request.getParameter("r_eco"));
		
		String result=dao.collectData(s,acc_no,loans1,clear);
		System.out.println(result);
		if(result.equals("true") || result.equals("already")) {
			
			
			System.out.println("con");
		
			HttpSession session =request.getSession();
			

			ArrayList<Loan> loans_list=dao.updateLoanTable(acc_no);
			
			System.out.println("con");
			session.setAttribute("loans_list",loans_list);
			//session.setAttribute("customers", request.getSession());
			for(Loan l:loans_list) {
				System.out.println("#"+l.getType_of_loan());
			}
			
			

			ArrayList<Status> status=dao.updateStatusTable(acc_no);

			session.setAttribute("status",status);
			
			System.out.println("connected");
			
			RequestDispatcher dispatcher=request.getRequestDispatcher("/welcome.jsp");
			dispatcher.forward(request, response);
			
			//response.sendRedirect("welcome.jsp");
		}
		
		
		if(result.equals("error")) {
			response.sendRedirect("register?status=error");
		}
		
		
	}

}
