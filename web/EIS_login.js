/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


function  myFunction()
{

   

    var email = document.myform.user.value;
    var pass = document.myform.password.value;

    

    var Mail_pattern1 = "^[A-Za-z0-9._%+-]+@dcmsme.gov.in$";
    var Mail_pattern2 = "^[A-Za-z0-9._%+-]+@gov.in$";
    var Mail_pattern3 = "^[A-Za-z0-9._%+-]+@nic.in$";
    var Mail_pattern4 = "^[A-Za-z0-9._%+-]+@msmediagra.gov.in$";
    var Mail_pattern5 = "^[A-Za-z0-9._%+-]+@msmedildh.gov.in$";



    if(email == "" || email == null) {
        alert("Please enter your email.....");
        return false;
    }
    if(pass == "" || pass == null) {
        alert("Please enter password.....");
        return false;
    }

    else if(email.match(Mail_pattern1) || email.match(Mail_pattern2) || email.match(Mail_pattern3) || email.match(Mail_pattern4) || email.match(Mail_pattern5))
    {
        
        document.forms[0].action = "EIS_login_check.jsp";
        return true;
    }
    else
    {
        var alert = "This is not a Government email, we are redirecting to the portal to update your email to government email. Do you want to proceed";
        var con = confirm(alert);
        if (con == true)
        {
            document.forms[0].action = "eis_forms/UpdateGovMail.jsp";
            return true;
        } else
        {
            return false;
        }

    }
}



function refresh()
{
    document.getElementById("captcha").src = 'reCaptch.jsp?' + (new Date().getTime());
}
                