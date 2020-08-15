package com.bhavya.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.bhavya.DBconnection.DBConnect;
import com.bhavya.model.Customer;
import com.bhavya.model.Loan;
import com.bhavya.model.Status;
import com.mysql.jdbc.exceptions.MySQLIntegrityConstraintViolationException;

public class InfoDaoClass implements InfoDao{
	Connection con = null;
	PreparedStatement preparedStatement = null;
	ResultSet resultSet = null;
	String acc=null;

	

	@Override
	public String collectData(Status s,String acc,String[] loans,String[] clear) {
		// TODO Auto-generated method stub
		
		
		String query="insert into bank.status values(?,?,?,?,?,?,?)";

		//String qu ="select acc_no from bank.customers where username=?";
		
		
		try {
			con=DBConnect.openConnection();
			/*preparedStatement=con.prepareStatement(qu);
			preparedStatement.setString(1, a);
			resultSet=preparedStatement.executeQuery();
			
			while(resultSet.next()) {
				acc=resultSet.getString("acc_no");
				System.out.println(acc);
			}*/
			
			if(s.getWant().equals("yes")) {
				
				String q2="update bank.loan set apply_for_moratonium=? where acc_no=? and type_of_loan=?";
				String q3="update bank.loan set settle_loan=? where acc_no=? and type_of_loan=?";
				
			for(int i=0;i<loans.length;i++) {
			preparedStatement=con.prepareStatement(q2);
			preparedStatement.setString(1, s.getWant());
			preparedStatement.setString(2,acc);
			preparedStatement.setString(3,loans[i]);
			preparedStatement.executeUpdate();
			}
			
			System.out.println("Settle"+s.getSettle());
			if((s.getSettle()).equals("yes")) {
				for(int i=0;i<clear.length;i++) {
					System.out.println("updating");
					preparedStatement=con.prepareStatement(q3);
					preparedStatement.setString(1, s.getSettle());
					preparedStatement.setString(2,acc);
					preparedStatement.setString(3,clear[i]);
					preparedStatement.executeUpdate();
					
					}
				
			}
			}
			
			preparedStatement=con.prepareStatement(query);
			
			preparedStatement.setString(1, acc);
			
			preparedStatement.setString(2, s.getWant());
			preparedStatement.setString(3,s.getEco());
			preparedStatement.setString(4, s.getHealth());
			preparedStatement.setString(5, s.getMental_health());
			preparedStatement.setString(6,s.getExtra_loan());
			preparedStatement.setString(7, s.getReason());
			
			System.out.println(acc+s.getWant());
			preparedStatement.executeUpdate();
			
		
		}
		catch(MySQLIntegrityConstraintViolationException e)
		{
			return "already";
		}
		catch(Exception e) {
			e.printStackTrace();
			System.out.println("db");

		}
		
		return "true";
				
	}



	@Override
	public ArrayList<Loan> updateLoanTable(String acc_no) {
		ArrayList<Loan> loan =null;
		String query="select * from bank.loan where acc_no=?";
		try {
			con=DBConnect.openConnection();
			preparedStatement=con.prepareStatement(query);
			//System.out.println("1");
			preparedStatement.setString(1,acc_no);
			//System.out.println("2");
			 loan=new ArrayList<Loan>();
			resultSet=preparedStatement.executeQuery();
			System.out.println("2");
			while(resultSet.next()) {
				Loan obj=new Loan();
				obj.setAcc_no(resultSet.getString("acc_no"));
				obj.setAmount_paid(resultSet.getString("amount_paid"));
				obj.setApply_for_moratonium(resultSet.getString("apply_for_moratonium"));
				obj.setLoan_amount(resultSet.getString("loan_amount"));
				obj.setLoan_id(resultSet.getString("loan_id"));
				obj.setSettle_loan(resultSet.getString("settle_loan"));
				obj.setTerm_period(resultSet.getString("term_period"));
				obj.setType_of_loan(resultSet.getString("type_of_loan"));
				loan.add(obj);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			System.out.println("db");

		}

		//System.out.println("nooooo");
		return loan;
		
		}
	



	@Override
	public ArrayList<Status> updateStatusTable(String acc_no) {
		ArrayList<Status> status =null;
		String query="select * from bank.status where acc_id=?";
		try {
			con=DBConnect.openConnection();
			preparedStatement=con.prepareStatement(query);
			//System.out.println("1");
			preparedStatement.setString(1,acc_no);
			//System.out.println("2");
			status=new ArrayList<Status>();
			resultSet=preparedStatement.executeQuery();
			System.out.println("2");
			while(resultSet.next()) {
				Status s=new Status();
				s.setAcc_id(resultSet.getString("acc_id"));
				s.setEco(resultSet.getString("eco"));
				s.setExtra_loan(resultSet.getString("extra_loan"));
				s.setHealth(resultSet.getString("health"));
				s.setMental_health(resultSet.getString("mental_health"));
				s.setReason(resultSet.getString("reason"));
				s.setWant(resultSet.getString("want"));
				status.add(s);
		
	}
		}
			catch(Exception e) {
				e.printStackTrace();
				System.out.println("db");

			}

			//System.out.println("nooooo");
			return status;


}
}
