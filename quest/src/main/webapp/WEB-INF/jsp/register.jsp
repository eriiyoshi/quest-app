<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>

<html>
    <head>
        <title>Person Demographics</title>
    </head>
    
    <body>
        <div class="parent-flex-container">
            <div class="child-flex-container">
                    <c:if test="${msg ne null}">                        
                        <div class="alert">
                            <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span> 
                            <span>${msg}</span>
                        </div>
                    </c:if>
                <form action="/record/register" onsubmit="return validateForm()" method="POST">
                <div>
                    <div>
                    <table>
                  	<tr>
                            <td><label for="name"><b>Name</b><span> *</<span></label></td>
                            <td><input type="text" name="name" id="name" class="form-text" maxlength="25" required /></td>
                        </tr>
                        <tr>
                            <td><label for="name"><b>PPS Number</b><span> *</<span></label></td>
                            <td><input type="text" name="pps" id="pps" class="form-text" required /></td>
                        </tr>
                        <tr>
                            <td><label for="name"><b>Date of Birth</b><span> *</<span></label></td>
                            <td><input type="text" data-format="00/00/0000" class="dob" name="dob" id="dob" placeholder="dd/mm/yyyy" required /></td>
                        </tr>
                        <tr>
                            <td><label for="name"><b>Mobile Phone</b></label></td>
                            <td><input type="text" name="mobile" id="mobile" class="form-text" value="08" /></td>
                        </tr>
                    </table>
                </div>
                <div>
                    <input type="button" class="button" value="Cancel" onclick="window.location='/'" >
                    <input type="submit" class="button" value="Submit">
                </div>
                </form>
            </div>
        </div>
    </body>
</html>

<script type="text/javascript">
    function validateForm(){
        let dob = document.getElementById("dob").value;
        return (validateMobile() && validateDate(dob) && validateDateFormat(dob));
    }
    
    function validateMobile() {
        let mobile = document.getElementById("mobile").value;
        
        if(mobile.trim() === '08' || mobile.trim() === '') {
            return true;
        //Check if the mobile number starts with 08
        } else if(mobile.match(/08[0-9]*/)) {
            return true;
        } else {
            alert("Mobile Phone wasn't correctly filled in.");
            return false;
        }
    }
    
    function validateDate(dateString) {
        let currentDate = new Date();
        var dateParts = dateString.split("/");
        //Transform the date in dd/mm/yyyy format
        var birthDate = new Date(+dateParts[2], dateParts[1] - 1, +dateParts[0]); 

        //Check if input date is in the future
        if(birthDate > currentDate){
            alert("Date of Birth wasn't correctly filled in.");
            return false;
        } else {
            //Check if is over 16 years old
            if(currentDate.getFullYear() - birthDate.getFullYear() < 16) {
                alert("You must be over 16 years old to register.");
                return false;
            } else {
                return true;
            }
        }
    }
    
    function validateDateFormat(dateString) {
        //Check date pattern
        let regex = /^\d{1,2}\/\d{1,2}\/\d{4}$/;
        if(!regex.test(dateString)) {
            alert("Please fill the date correctly.");
            return false;
        }

        //Parse the date
        var parts = dateString.split("/");
        var day = parseInt(parts[0], 10);
        var month = parseInt(parts[1], 10);
        var year = parseInt(parts[2], 10);
        
        if(year < 1000 || year > 3000 || month == 0 || month > 12) {
            alert("Please fill the date correctly.");
            return false;
        }

        var monthLength = [ 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 ];

        //Adjust for leap years
        if(year % 400 === 0 || (year % 100 !== 0 && year % 4 === 0)) {
            monthLength[1] = 29;
        }
        
        if(day > 0 && day <= monthLength[month - 1]){
            return true;
        } else {
            alert("Please fill the date correctly.");
            return false;
        }
    }
    
    $(function () {
        $("#dob").datepicker({
            dateFormat: 'dd/mm/yy'
        });
    });
</script>

<style>
.parent-flex-container {
  display: flex;
  flex-wrap: nowrap;
  flex-direction: column;
  align-items: center;
}

.child-flex-container {
  display: flex;
  flex-wrap: nowrap;
  flex-direction: column;
  border-style: double;
  align-items: center;
  width: 30%;
  padding-top: 2%;
  padding-bottom: 2%;
  font-family: system-ui,-apple-system,system-ui,"Helvetica Neue",Helvetica,Arial,sans-serif;
}

.button{
    margin-top: 15%;
    margin-bottom: 10%;
    background-color: #FFFFFF;
    border: 1px solid rgba(0, 0, 0, 0.1);
    border-radius: .25rem;
    cursor: pointer;
    font-family: system-ui,-apple-system,system-ui,"Helvetica Neue",Helvetica,Arial,sans-serif;
    font-size: 16px;
    font-weight: 500;
    min-height: 2rem;
    width: 100px;
}

.form-text {
    margin-left: 15px;
    margin-bottom: 5px;
}

span {
    font-weight: bold;
    color: #f74d4d;
}

.alert {
  padding: 15px;
  background-color: #f7e8d2;
  color: white;
  margin-bottom: 3%;
  border: 1px solid rgba(0, 0, 0, 0.1);
  border-radius: .25rem;
  font-size: 16px;
}

.closebtn {
  margin-left: 15px;
  color: black;
  font-weight: bold;
  float: right;
  font-size: 22px;
  line-height: 20px;
  cursor: pointer;
  transition: 0.3s;
}

.dob {
    margin-left: 15px;
}
</style>