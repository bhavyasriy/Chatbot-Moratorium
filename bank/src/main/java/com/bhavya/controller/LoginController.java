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

import com.bhavya.dao.LoginDao;
import com.bhavya.dao.LoginDaoClass;
import com.bhavya.model.Customer;

/**
 * Servlet implementation class LoginController
 */
@WebServlet("/login")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private LoginDao dao=null;
	
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginController() {
    	dao=new LoginDaoClass();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		RequestDispatcher dispatcher=request.getRequestDispatcher("/index.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Customer la=new Customer();
		la.setAcc_no(request.getParameter("acc_no"));
		la.setPassword(request.getParameter("password"));
		System.out.println(la.getAcc_no()+"\n"+la.getPassword());
		String result=dao.authenticate(la);
		if(result.equals("true")) {
			
			HttpSession session =request.getSession();
			session.setAttribute("username", request.getParameter("acc_no"));
			//session.setAttribute("acc_no",request.getParameter("acc_no"));
			ArrayList<Customer> customers=dao.retrieve(request.getParameter("acc_no"));
			ArrayList<String> loans=dao.getLoans(request.getParameter("acc_no"));
			for(Customer cc:customers) {
				System.out.println(cc.getAcc_no());
			}
			
			System.out.println("con");
			session.setAttribute("customers",customers);
			session.setAttribute("loans",loans);
			
			RequestDispatcher dispatcher1=request.getRequestDispatcher("/welcome.jsp");
			
			dispatcher1.forward(request, response);

			
				}
		
		if(result.equals("false")) {
			response.sendRedirect("login?status=false");
		}
		if(result.equals("error")) {
			response.sendRedirect("login?status=error");
		}
		
		}
	}



