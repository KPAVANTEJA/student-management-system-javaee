/**
 * 
 */
function validateForm(){
	let rollNo =
	document.getElementsByName("rollNo")[0].value.trim();

	let firstName =
	document.getElementsByName("firstName")[0].value.trim();

	let email =
	document.getElementsByName("email")[0].value.trim();
	
	let phone =
		document.getElementsByName("phone")[0].value.trim();
	
	if(rollNo === ""){

	    alert("Roll Number is required");

	    return false;

	}
	
	if(firstName === ""){

	    alert("First Name is required");

	    return false;

	}
	
	const emailPattern = /^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$/;
	
	if(!emailPattern.test(email)){

	    alert("Enter a valid email");

	    return false;

	}
	const phonePattern = /^[0-9]{10}$/;
	
	if(!phonePattern.test(phone)){

		    alert("Invalid Phone number");

		    return false;

		}
		
	return true;
	
}