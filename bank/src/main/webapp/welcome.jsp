<%@page import="java.util.ArrayList"%> 
<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<%@page import="com.bhavya.model.Customer" %>
<html>
<html lang="en">
	<head>

		<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,700" rel="stylesheet">

    <title>ABC Bank</title>

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">


    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="assets/css/fontawesome.css">
    <link rel="stylesheet" href="assets/css/tooplate-main.css">
    <link rel="stylesheet" href="assets/css/owl.css">



		<!--JavaScript and CSS -->
		<script src="jquery.min.js"></script>
		<script src="conditional1.js"></script>		
		<link rel="stylesheet" href="bootstrap-iso.css" /> <!-- https://formden.com/blog/isolate-bootstrap -->

		<style>
body {font-family: Arial, Helvetica, sans-serif;}
* {box-sizing: border-box;}

/* Button used to open the contact form - fixed at the bottom of the page */
.open-button {
  background-color: #555;
  color: white;
  padding: 16px 20px;
  border: none;
  cursor: pointer;
  opacity: 0.8;
  position: fixed;
  bottom: 23px;
  right: 28px;
  width: 280px;
}

/* The popup form - hidden by default */
.form-popup {
  display: none;
  position: fixed;
  bottom: 0;
  right: 15px;
  border: 3px solid #f1f1f1;
  z-index: 9;
}

/* Add styles to the form container */
.form-container {
  max-width: 300px;
  padding: 10px;
  background-color: white;
}

/* Full-width input fields */
.form-container input[type=text], .form-container input[type=password] {
  width: 100%;
  padding: 15px;
  margin: 5px 0 22px 0;
  border: none;
  background: #f1f1f1;
}

/* When the inputs get focus, do something */
.form-container input[type=text]:focus, .form-container input[type=password]:focus {
  background-color: #ddd;
  outline: none;
}

/* Set a style for the submit/login button */
.form-container .btn {
  background-color: #4CAF50;
  color: white;
  padding: 16px 20px;
  border: none;
  cursor: pointer;
  width: 100%;
  margin-bottom:10px;
  opacity: 0.8;
}

/* Add a red background color to the cancel button */
.form-container .cancel {
  background-color: red;
}

/* Add some hover effects to buttons */
.form-container .btn:hover, .open-button:hover {
  opacity: 1;
}

.button {
  background-color: white;
  border: none;
  color: white;
  padding: 16px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  transition-duration: 0.4s;
  cursor: pointer;
  border-radius: 30px;
}

.button2 {
  background-color: white; 
  color: black; 
  border: 2px solid #008CBA;
  
}

.button2:hover {
  background-color: #008CBA;
  color: white;
  border-radius: 30px;
  
}


</style>

	</head>
	<body>
	
	
	<%
  response.setHeader("Cache-Control","no-cache");
  response.setHeader("Cache-Control","no-store");
  response.setHeader("Pragma","no-cache");
  response.setDateHeader ("Expires", 0);

  if(session.getAttribute("username")==null)
      response.sendRedirect("index.jsp");

  %> 

		 <!-- Pre Header -->
    <div id="pre-header">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <span>Please do not share your banking credentials (OTP, Login, Card details, etc.). Also do not click on any unknown links received in SMS/e-mail for updating banking related information. Please do not share your device screen. Bank Executive will never ask you for these banking details. Call ABC Bank Customer Care immediately to inform any suspicious transaction related to your Bank Accounts.

</span>
          </div>
        </div>
      </div>
    </div>

<% 
String uname=session.getAttribute("username").toString(); 
%> 
    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark static-top">
      <div class="container">
        <a class="navbar-brand" href="#"><img src="assets/images/header-logo.png" alt=""></a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item active">
              <a class="nav-link" href="welcome.html"><c:forEach items="${customers}" var="c">${c.username}</c:forEach>'s Profile
              <span class="sr-only">(current)</span>
                </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#.html">Products
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#.html">Schemes</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#.html">FAQ</a>
            </li>

            <li class="nav-item">
              <a class="nav-link" href="LogoutController">Logout</a>
            
            </li>
          </ul>
        </div>
      </div>
    </nav>

     <!-- Page Content -->
    <!-- Banner Starts Here -->
    <div class="banner">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <div class="caption">
              <h2>Welcome <c:forEach items="${customers}" var="c">${c.username}</c:forEach></h2>
              <div class="line-dec"></div>
              <p>Hi <c:forEach items="${customers}" var="c">${c.username}</c:forEach>.
              ABC Bank welcomes you.</p>
              <div class="main-button">
                <a href="#">Get Started</a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- Banner Ends Here -->

    <!-- Featured Starts Here -->

	<c:forEach items="${sessionScope.customers}" var="c">
    <div class="featured-items">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <div class="section-heading">
              <div class="line-dec"></div>
              <h1>My Profile</h1>
            </div>
          </div>

    <table class="table table-striped">
<tbody>
        
        <tr>
                <th>Account Number</th>
                <td>${c.acc_no}</td>
        </tr>
        <tr>
                <th>First Name</th>
                <td>${c.first_name}</td>
            
            </tr>
            <tr>
              <th>Last Name</th>
                <td>${c.last_name}</td>
            </tr>  
            <tr>
              <th>Username</th>
                <td>${c.username}</td>
            </tr>            
        <tr>
              <th>Gender</th>
                <td>${c.gender}</td>
            </tr>            
        <tr>
              <th>Email</th>
                <td>${c.email}</td>
            </tr>            
        <tr>
              <th>Phone Number</th>
                <td>${c.phone_no}</td>
            </tr>            
        <tr>
              <th>Occupation</th>
                <td>${c.occupation}</td>
            </tr>            
        <tr>
              <th>Annual Income</th>
                <td>${c.annual_income}</td>
            </tr>            
        <tr>
              <th>Family members</th>
                <td>${c.family_mem}</td>
            </tr> 
                    
        <tr>
              <th>Address</th>
                <td>${c.address}</td>
            </tr>            
                        
             
                    </tbody>
                   
    </table>
    </div>
    </div>
    </div>
    </c:forEach>
    
    
        
        <!--<c:forEach items="${sessionScope.status}" var="w">
        <c:set var="apply" value="${w.want}" />
        </c:forEach>
        
        <c:if test="${apply=='no'}">
 <c:out value="You are eligible for voting!"/>
</c:if>
<c:if test="${apply=='yes'}">
 <c:out value="You are not eligible for voting!"/>
</c:if>-->
        
    

<div class="hidden" id="loan_table">
    <div class="featured-items">
      <div class="container">
        <div class="row">
    <div class="col-md-12">
            <div class="section-heading">
          
    <div class="line-dec"></div>
    <h1>Loan Details</h1>
  </div>
</div>
    <table class="table table-striped">
              <thead>
            <tr>
                <th>Type of Loan</th>
                <th>Apply for Moratorium</th>
                <th>Clear the loan now</th>
            </tr>
        </thead>
        <tbody>
       
       
       <c:forEach items="${loans_list}" var="l">
       <tr>
       <td>
       ${l.type_of_loan}
       </td>
       
       <td>
       	${l.apply_for_moratonium}
       </td>
       
       <td>
       ${l.settle_loan}
       </td>
       </tr>
       </c:forEach>
    	
        
        
        </tbody>
    </table>
  </div>
</div>
</div>
</div>


 <c:forEach items="${sessionScope.status}" var="s">
<div class="featured-items">
      <div class="container">
        <div class="row">
    <div class="col-md-12">
            <div class="section-heading">
          
    <div class="line-dec"></div>
    <h1>Status</h1>
  </div>
</div>
    
    <table class="table table-striped">
              
        <tbody>
       
            <tr>
                <th>Apply for Moratorium</th>
                <td>${s.want}</td>
            </tr>
            <tr>
                <th>Physical Health</th>
                <td>${s.health}</td>
            
            </tr>
            <tr>
              <th>Mental Health</th>
                <td>${s.mental_health}</td>
            </tr>  
            <tr>
              <th>Economical status</th>
                <td>${s.eco}</td>
            </tr>            
        <tr>
              <th>Want extra loan</th>
                <td>${s.extra_loan}</td>
            </tr>            
        <tr>
              <th>Reason to apply for Moratorium</th>
                <td>${s.reason}</td>
            </tr>            
                
             
        </tbody>
        
    </table>

  </div>
</div>
</div>
  </c:forEach>  



    <div class="featured-items">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <div class="section-heading">
              <div class="line-dec"></div>
              <h1>Offers For You</h1>
            </div>
          </div>
          <div class="col-md-12">
            <div class="owl-carousel owl-theme">
              <a href="single-product.html">
                <div class="featured-item">
                  <img src="assets/images/item-01.jpg" alt="Item 1">
                  <h4>10% Cashback</h4>
                  <h6>on Payments with ABC Card</h6>
                </div>
              </a>
              <a href="single-product.html">
                <div class="featured-item">
                  <img src="assets/images/item-02.jpg" alt="Item 2">
                  <h4>Savings Assured</h4>
                  <h6>on Credit Deposit</h6>
                </div>
              </a>
              <a href="single-product.html">
                <div class="featured-item">
                  <img src="assets/images/item-03.jpg" alt="Item 3">
                  <h4>Big Basket offer</h4>
                  <h6>on Payments with ABC Card</h6>
                </div>
              </a>
              <a href="single-product.html">
                <div class="featured-item">
                  <img src="assets/images/item-04.jpg" alt="Item 4">
                  <h4>Zomato offer</h4>
                  <h6>Stay home and save 10% on Zomato with ABC Card </h6>
                </div>
              </a>
              <!--<a href="single-product.html">
                <div class="featured-item">
                  <img src="assets/images/item-05.jpg" alt="Item 5">
                  <h4>Morbi aliquet</h4>
                  <h6>$55.00</h6>
                </div>
              </a>
              <a href="single-product.html">
                <div class="featured-item">
                  <img src="assets/images/item-06.jpg" alt="Item 6">
                  <h4>Urna ac diam</h4>
                  <h6>$65.00</h6>
                </div>
              </a>
              <a href="single-product.html">
                <div class="featured-item">
                  <img src="assets/images/item-04.jpg" alt="Item 7">
                  <h4>Proin eget imperdiet</h4>
                  <h6>$75.00</h6>
                </div>
              </a>
              <a href="single-product.html">
                <div class="featured-item">
                  <img src="assets/images/item-05.jpg" alt="Item 8">
                  <h4>Nullam risus nisl</h4>
                  <h6>$85.00</h6>
                </div>
              </a>
              <a href="single-product.html">
                <div class="featured-item">
                  <img src="assets/images/item-06.jpg" alt="Item 9">
                  <h4>Cras tempus</h4>
                  <h6>$95.00</h6>
                </div>
              </a>-->
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- Featred Ends Here -->


    <!-- Subscribe Form Starts Here -->
    <div class="subscribe-form">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <div class="section-heading">
              <div class="line-dec"></div>
              <h1>Subscribe on ABC Bank now!</h1>
            </div>
          </div>
          <div class="col-md-8 offset-md-2">
            <div class="main-content">
              <p>Be the first one to know about offers and schemes in ABC Bank</p>
              <div class="container">
                <form id="subscribe" action="" method="get">
                  <div class="row">
                    <div class="col-md-7">
                      <fieldset>
                        <input name="email" type="text" class="form-control" id="email" 
                        onfocus="if(this.value == 'Your Email...') { this.value = ''; }" 
                      onBlur="if(this.value == '') { this.value = 'Your Email...';}"
                      value="Your Email..." required="">
                      </fieldset>
                    </div>
                    <div class="col-md-5">
                      <fieldset>
                        <button type="submit" id="form-submit" class="button">Subscribe Now!</button>
                      </fieldset>
                    </div>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- Subscribe Form Ends Here -->

   
    <!-- Footer Starts Here -->
    <div class="footer">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <div class="logo">
              <img src="assets/images/header-logo.png" alt="">
            </div>
          </div>
          <div class="col-md-12">
            <div class="footer-menu">
              <ul>
                <li><a href="#">Home</a></li>
                <li><a href="#">Help</a></li>
                <li><a href="#">Privacy Policy</a></li>
                <li><a href="#">How It Works ?</a></li>
                <li><a href="#">Contact Us</a></li>
              </ul>
            </div>
          </div>
          <div class="col-md-12">
            <div class="social-icons">
              <ul>
                <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                <li><a href="#"><i class="fa fa-rss"></i></a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- Footer Ends Here -->


    <!-- Sub Footer Starts Here -->
    <div class="sub-footer">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <div class="copyright-text">
              <p>Copyright &copy; 2020 ABC Bank 
                
                </p>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- Sub Footer Ends Here -->

        <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>


    <!-- Additional Scripts -->
    <script src="assets/js/custom.js"></script>
    <script src="assets/js/owl.js"></script>


    <script language = "text/Javascript"> 
      cleared[0] = cleared[1] = cleared[2] = 0; //set a cleared flag for each field
      function clearField(t){                   //declaring the array outside of the
      if(! cleared[t.id]){                      // function makes it static and global
          cleared[t.id] = 1;  // you could use true and false, but that's more typing
          t.value='';         // with more chance of typos
          t.style.color='#fff';
          }
      }
    </script>




		<button id="close_chat" class="open-button" onclick="openForm(this)">Ask Mat</button>
	
<script>


	chatWindow = document.getElementById('chat-window'); 
var xH = chatWindow.scrollHeight; 
chatWindow.scrollTo(0, xH);


function openForm(_this) {
  document.getElementById("myForm").style.display = "block";
  _this.style.display = 'none';
}

function closeForm() {
  document.getElementById("myForm").style.display = "none";
  document.getElementById("close_chat").style.display="block";
}


function submitButtonStyle(_this) {
  _this.style.backgroundColor = "#008CBA";
  _this.style.color= "#FFFFFF";

}
</script>

		
		<div class="bootstrap-iso form-popup" id="myForm"  style="background:white;bottom:50px;">
			<div class="container-fluid">
				<div class="row">
					<div class="col-sm-06" id="chat-window" style="width: 300px;
  height: 400px; overflow:auto;">
						<form id="live_form" action="info" class="form-container" method="post">
							<div class="form-group" >

                <button type="button" class="btn cancel" onclick="closeForm()">Close</button>


								<!-- Radio buttons-->
								<div class="hidden">
								<input type="radio" name="r_want" id="r_want_yes" value="yes">
								<input type="radio" name="r_want" id="r_want_no" value="no">

								<input type="checkbox" name="r_select_loan" id="r_select_1" value="house">
								<input type="checkbox" name="r_select_loan" id="r_select_2" value="gold">
								<input type="checkbox" name="r_select_loan" id="r_select_3" value="car">


								<input type="radio" name="r_settle_loan" id="r_settle_loan_yes" value="yes">
								<input type="radio" name="r_settle_loan" id="r_settle_loan_no" value="no">

								<input type="checkbox" name="r_clear_loan" id="r_clear_1" value="house">
								<input type="checkbox" name="r_clear_loan" id="r_clear_2" value="gold">
								<input type="checkbox" name="r_clear_loan" id="r_clear_3" value="car">

								<input type="radio" name="r_eco" id="r_eco0" value="0" required="required">
								<input type="radio" name="r_eco" id="r_eco25" value="25">
								<input type="radio" name="r_eco" id="r_eco50" value="50">
								<input type="radio" name="r_eco" id="r_eco75" value="75">
								<input type="radio" name="r_eco" id="r_eco100" value="100">

								<input type="radio" name="r_health" id="r_healthy" value="healthy" required>
								<input type="radio" name="r_health" id="r_affected" value="affected">
								<input type="radio" name="r_health" id="r_serious" value="serious">

								<input type="radio" name="mental_health" id="r_mental_healthy" value="healthy">
								<input type="radio" name="mental_health" id="r_stressed" value="stressed">

								

								<input type="radio" name="extra_loan" id="r_extra_yes" value="yes">
								<input type="radio" name="extra_loan" id="r_extra_no" value="no">

								</div>
								
					<label class="control-label">
					   Hi! This is Mat, your personal digital assistant for filling the survey by ABC Bank. Let's get started!!!
					  </label>

					  <!-- <label class="control-label">
					   Do you want to apply for moratorium in this pandemic situation?
					  </label>-->
					  
					  <div class="">
					 
						 <button onclick="submitButtonStyle(this)" name="want" type="button" class="button button2 btn-sm" value="yes" id="want_yes">Apply for moratorium</button>
					
					   
					   
						 <button onclick="submitButtonStyle(this)" name="want" type="button" class="button button2 btn-sm" value="no" id="want_no">Continue with the same loan process</button>
					
					   </div>
					  
					 </div>



					  <div class="form-group hidden" id="select_loan">
					   <div>
						   <label class="control-label ">
						  	Select the loans you want to apply for moratorium?
						   </label>
						   <div>
						   
						   <c:forEach items="${loans}" var="l">
							<button onclick="submitButtonStyle(this)" id="${l}" type="button" class="button button2 btn-sm" value="${l} Loan"> ${l} Loan </button>
					
							</c:forEach>				
							</div>
					   </div>
					 </div>

					 <div class="form-group hidden" id="settle_loan">
					   <div>
						   <label class="control-label ">
						   Do you want to clear any loans right now?
						   </label>
						   <div>
						  
							<button onclick="submitButtonStyle(this)" name="settle_yes" id="settle_loan_yes" type="button" class="button button2 btn-sm"  value="yes">Yes</button>
							
				
							<button onclick="submitButtonStyle(this)" name="settle_no" id="settle_loan_no" type="button" class="button button2 btn-sm" value="no">No</button>
							
						   </div>
					   </div>
					 </div>


					 <div class="form-group hidden" id="clear_loan">
					   <div>
						   <label class="control-label ">
						  	Select the loans you want to clear now?
						   </label>
						   <div>
						   
						   <c:forEach items="${loans}" var="p">
							<button onclick="submitButtonStyle(this)" id="${p}1" type="button" class="button button2 btn-sm" value="${p}1 Loan" > ${p} Loan</button>
					
							</c:forEach>
							</div>
					   </div>
					 </div>
					 
					 
					 <div class="form-group hidden" id="reason">
					   <div>
					 		<div>

						   <label class="control-label ">
						   	Mention the reason why you want to apply for moratorim
						   </label>
						   <div>
						   
							<input id="reason" name="reason" type="text" class="form-control" />
							
					 		</div>
					 		<div>

						   <label class="control-label ">
						   	How many months will you take to recover?
						   </label>
						   <div>
						   
							<input name="recover" type="number" class="form-control" />
							
					 		</div>
					 		
					 	</div>
					 </div>
					</div>
					 

					 <div class="form-group hidden" id="question">
					 
						   <label class="control-label ">
						  	Questions for quick review... Answer them
						   </label>
						   
						   <label class="control-label ">
						   	How much % of salary is deducted compared to your previous salary?
						   </label>
						   
						   <div>
							<button onclick="submitButtonStyle(this)"  id="eco0" type="button" class="button button2 btn-sm" value="No Salary">No deduction</button>
					
							<button onclick="submitButtonStyle(this)" id="eco25" type="button" class="button button2 btn-sm" value="0%-25%">0%-25%</button>

							<button onclick="submitButtonStyle(this)" id="eco50" type="button" class="button button2 btn-sm" value="25%-50%">25%-50%</button>

							<button onclick="submitButtonStyle(this)" id="eco75" type="button" class="button button2 btn-sm" value="50%-75%">50%-75%</button>
						
							<button onclick="submitButtonStyle(this)" id="eco100" type="button" class="button button2 btn-sm" value="75%-100%">75%-100%</button>
            </div>
					
						   <label class="control-label ">
						   	Health Condition
						   </label>
						   
						   <div>
							<button onclick="submitButtonStyle(this)" id="healthy" type="button" class="button button2 btn-sm" value="Healthy">Healthy</button>
					
							<button onclick="submitButtonStyle(this)" id="affected" type="button" class="button button2 btn-sm" value="Affected by COVID-19">Affected by COVID-19</button>

							<button onclick="submitButtonStyle(this)" id="serious" type="button" class="button button2 btn-sm" value="Serious">Serious condition</button>
            </div>

						   <label class="control-label ">
						   	Mental Health
						   </label>
						   <div>
						   
							<button onclick="submitButtonStyle(this)" id="mental_healthy" type="button" class="button button2 btn-sm" value="Healthy">Healthy</button>
					
							<button onclick="submitButtonStyle(this)" id="stressed" type="button" class="button button2 btn-sm" value="Stressed">Stressed</button>
            </div>



						   <label class="control-label ">
						   	Do you want extra loan?
						   </label>
               <div>
	   
							<button onclick="submitButtonStyle(this)" id="extra_yes" type="button" class="button button2 btn-sm" value="Yes">Yes</button>
					
							<button onclick="submitButtonStyle(this)" id="extra_no" type="button" class="button button2 btn-sm" value="No">No</button>

								<a href="help.jsp" target="_blank"> Know more</a>	
                </div>					

			</div>
	

					<div class="form-group hidden">
					   <input class="btn btn-primary " id="save" name="submit" type="submit" value="submit" />
				
					 </div>
					     
					</form>
				</div>
			</div>
		</div>
	</div>
	<script>
		
</script>
</body>
</html>
