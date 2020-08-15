package com.bhavya.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.bhavya.DBconnection.DBConnect;
import com.bhavya.model.Customer;

public class LoginDaoClass implements LoginDao{
	Connection con = null;
	PreparedStatement preparedStatement = null;
	ResultSet resultSet = null;
	
	
	public String authenticate(Customer loginaccountiee) {
		String query="select * from customers where acc_no=? and password=?";
		try {
			con=DBConnect.openConnection();
			//System.out.println(loginaccountiee.getUsername()+" "+loginaccountiee.getPassword());
			preparedStatement=con.prepareStatement(query);
			System.out.println("1");
			preparedStatement.setString(1, loginaccountiee.getAcc_no());
			preparedStatement.setString(2,loginaccountiee.getPassword());
			System.out.println("2");
			resultSet=preparedStatement.executeQuery();
			System.out.println("2");
			if(resultSet.next()) {
				System.out.println("done..");
				return "true";
			}
			else {
				return "false";
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			System.out.println("db");

		}

		return "error";
		
	}
	public ArrayList<Customer> retrieve(String acc_no) {
		ArrayList<Customer> cust =null;
		String query="select acc_no,address,annual_income,email,family_mem,first_name,gender,last_name,occupation,password,phone_no,username from bank.customers where acc_no=?";
		try {
			con=DBConnect.openConnection();
			preparedStatement=con.prepareStatement(query);
			System.out.println("1");
			preparedStatement.setString(1,acc_no);
			System.out.println("2");
			 cust=new ArrayList<Customer>();
			resultSet=preparedStatement.executeQuery();
			System.out.println("2");
			if(resultSet.next()) {
				//System.out.println("dao"+resultSet.getString("acc_no"));
				Customer obj=new Customer();
				obj.setAcc_no(""+resultSet.getString("acc_no"));
				System.out.println(resultSet.getString("acc_no").getClass().getName());
				obj.setAddress(""+resultSet.getString("address"));
				obj.setAnnual_income(""+resultSet.getString("annual_income"));
				obj.setEmail(""+resultSet.getString("email"));
				obj.setFamily_mem(""+resultSet.getString("family_mem"));
				obj.setFirst_name(""+resultSet.getString("first_name"));
				obj.setGender(""+resultSet.getString("gender"));
				obj.setLast_name(""+resultSet.getString("last_name"));
				obj.setOccupation(""+resultSet.getString("occupation"));
				obj.setPassword(""+resultSet.getString("password"));
				obj.setPhone_no(""+resultSet.getString("phone_no"));
				obj.setUsername(""+resultSet.getString("username"));
				
				cust.add(obj);
				
				System.out.println(cust);
				for(Customer c:cust) {
					System.out.println(c.getAcc_no());
				}
		
				
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
			System.out.println("db");

		}

		//System.out.println("nooooo");
		return cust;
		
	}
	
	
	public ArrayList<String> getLoans(String acc_no) {
		ArrayList<String> loans =null;
		String query="select type_of_loan from bank.loan where acc_no=?";
		try {
			con=DBConnect.openConnection();
			preparedStatement=con.prepareStatement(query);
			//System.out.println("1");
			preparedStatement.setString(1,acc_no);
			//System.out.println("2");
			 loans=new ArrayList<String>();
			resultSet=preparedStatement.executeQuery();
			System.out.println("2");
			while(resultSet.next()) {
				//System.out.println("dao"+resultSet.getString("acc_no"));
				String s=new String();
				s=(resultSet.getString("type_of_loan"));
				loans.add(s);
			}
			/*for(String c:loans) {
				System.out.println("l"+c);
			}*/
			
		}
		catch(Exception e) {
			e.printStackTrace();
			System.out.println("db");

		}

		//System.out.println("nooooo");
		return loans;
		
	}

	
}

