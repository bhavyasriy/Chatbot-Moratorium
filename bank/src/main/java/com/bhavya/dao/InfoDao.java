package com.bhavya.dao;


import java.util.ArrayList;

import com.bhavya.model.Loan;
import com.bhavya.model.Status;

public interface InfoDao {
	public String collectData(Status s,String u,String[] loans,String[] clear);
	public ArrayList<Loan> updateLoanTable(String acc_no);
	public ArrayList<Status> updateStatusTable(String acc_no);


}
