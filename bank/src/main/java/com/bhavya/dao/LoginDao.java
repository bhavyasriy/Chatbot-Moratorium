package com.bhavya.dao;

import java.util.ArrayList;

import com.bhavya.model.Customer;

public interface LoginDao {
	public String authenticate(Customer loginaccountiee);
	public ArrayList<Customer> retrieve(String username);

	public ArrayList<String> getLoans(String acc_no);

}
