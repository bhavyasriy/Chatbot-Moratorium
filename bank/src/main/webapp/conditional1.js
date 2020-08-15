
$( document ).ready(function() {

		//Wrappers for all fields
		var select_loan=$('#live_form #select_loan');
		var reason=$('#live_form #reason');
		var settle_loan=$('#live_form #settle_loan');
		var clear_loan= $('#live_form #clear_loan');
		var question=$('#live_form #question');
		//var extra_loan_yes=$('#live_form #question #extra_loan_yes');
		var all=select_loan.add(settle_loan).add(clear_loan).add(question);

		$( "#want_yes" ).click(function() {
			all.addClass('hidden'); 
			$( "#want_yes" ).attr("disabled", true);
			$( "#want_no" ).attr("disabled", true);

			 $("#r_want_yes").prop("checked", true);//radio
			
			 select_loan.removeClass('hidden');
		});

		$( "#want_no" ).click(function() {
			all.addClass('hidden'); 
			$( "#want_yes" ).attr("disabled", true);
			$( "#want_no" ).attr("disabled", true);
			 $("#r_want_no").prop("checked", true);//radio	
			 question.removeClass('hidden');
		});
		
		
		$( "#Gold" ).click(function() {
			//all.addClass('hidden'); 
			settle_loan.removeClass('hidden');
			$("#r_select_2").prop("checked", true);//radio
			
		});
		$( "#Car" ).click(function() {
			//all.addClass('hidden'); 
			settle_loan.removeClass('hidden');
			$("#r_select_3").prop("checked", true);//radio
			
		});
		$( "#House" ).click(function() {
			//all.addClass('hidden'); 
			settle_loan.removeClass('hidden');
			$("#r_select_1").prop("checked", true);//radio
			
		});
		$( "#settle_loan_yes" ).click(function() {
			//all.addClass('hidden'); 
		
			clear_loan.removeClass('hidden');
			$("#r_settle_loan_yes").prop("checked", true);//radio
			
		});
		$( "#settle_loan_no" ).click(function() {
			//all.addClass('hidden');
			 reason.removeClass('hidden'); 
			question.removeClass('hidden');
			$("#r_settle_loan_no").prop("checked", true);//radio
			
		});
		$( "#House1" ).click(function() {
			
			//all.addClass('hidden');
			 reason.removeClass('hidden'); 
			question.removeClass('hidden');
			$("#r_clear_1").prop("checked", true);//radio
			
		});
		$( "#Gold1" ).click(function() {
			//all.addClass('hidden'); 
			 reason.removeClass('hidden');
			question.removeClass('hidden');
			$("#r_clear_2").prop("checked", true);//radio
			
		});
		$( "#Car1" ).click(function() {
			//all.addClass('hidden'); 
			 reason.removeClass('hidden');
			question.removeClass('hidden');
			console.log("HIIII");
			$("#r_clear_3").prop("checked", true);//radio
			
		});
		$( "#eco0" ).click(function() {
			$( "#eco0" ).attr("disabled", true);
			$( "#eco25" ).attr("disabled", true);
			$( "#eco50" ).attr("disabled", true);
			$( "#eco75" ).attr("disabled", true);
			$( "#eco100" ).attr("disabled", true);
			 $("#r_eco0").prop("checked", true);//radio

		});
		$( "#eco25" ).click(function() {
			$( "#eco0" ).attr("disabled", true);
			$( "#eco25" ).attr("disabled", true);
			$( "#eco50" ).attr("disabled", true);
			$( "#eco75" ).attr("disabled", true);
			$( "#eco100" ).attr("disabled", true);
			 $("#r_eco25").prop("checked", true);//radio

		});
		$( "#eco50" ).click(function() {
			$( "#eco0" ).attr("disabled", true);
			$( "#eco25" ).attr("disabled", true);
			$( "#eco50" ).attr("disabled", true);
			$( "#eco75" ).attr("disabled", true);
			$( "#eco100" ).attr("disabled", true);
			 $("#r_eco50").prop("checked", true);//radio

		});
		$( "#eco75" ).click(function() {
			$( "#eco0" ).attr("disabled", true);
			$( "#eco25" ).attr("disabled", true);
			$( "#eco50" ).attr("disabled", true);
			$( "#eco75" ).attr("disabled", true);
			$( "#eco100" ).attr("disabled", true);
			 $("#rno").prop("checked", true);//radio

		});
		$( "#eco100" ).click(function() {
			$( "#eco0" ).attr("disabled", true);
			$( "#eco25" ).attr("disabled", true);
			$( "#eco50" ).attr("disabled", true);
			$( "#eco75" ).attr("disabled", true);
			$( "#eco100" ).attr("disabled", true);
			 $("#r_eco100").prop("checked", true);//radio

		});
		$( "#healthy" ).click(function() {
			$( "#healthy" ).attr("disabled", true);
			$( "#affected" ).attr("disabled", true);
			$( "#serious" ).attr("disabled", true);
			 $("#r_healthy").prop("checked", true);//radio

		});
		$( "#affected" ).click(function() {
			$( "#healthy" ).attr("disabled", true);
			$( "#affected" ).attr("disabled", true);
			$( "#serious" ).attr("disabled", true);
			 $("#r_affected").prop("checked", true);//radio

		});
		$( "#serious" ).click(function() {
			$( "#healthy" ).attr("disabled", true);
			$( "#affected" ).attr("disabled", true);
			$( "#serious" ).attr("disabled", true);
			 $("#r_serious").prop("checked", true);//radio

		});
		$( "#mental_healthy" ).click(function() {
			$( "#mental_healthy" ).attr("disabled", true);
			$( "#stressed" ).attr("disabled", true);
			
			 $("#r_mental_healthy").prop("checked", true);//radio

		});
		$( "#stressed" ).click(function() {
			$( "#mental_healthy" ).attr("disabled", true);
			$( "#stressed" ).attr("disabled", true);
			
			 $("#r_stressed").prop("checked", true);//radio

		});
		$( "#extra_yes" ).click(function() {
			$( "#extra_yes" ).attr("disabled", true);
			$( "#extra_no" ).attr("disabled", true);
			
			 $("#r_extra_yes").prop("checked", true);//radio
			 
			 document.querySelector("input[type='submit']").click();
			 //extra_loan_yes.removeClass('hidden');

		});
		$( "#extra_no" ).click(function() {
			$( "#extra_yes" ).attr("disabled", true);
			$( "#extra_no" ).attr("disabled", true);
			
			 $("#r_extra_no").prop("checked", true);//radio

			document.querySelector("input[type='submit']").click();
		});
		

});
