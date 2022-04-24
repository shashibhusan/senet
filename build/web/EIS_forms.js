/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


function myFunction()
{

         var name = document.getElementById("bas_name").value;
         var designation =document.getElementById("bas_designation").value;
         var DOB =document.getElementById("dob").value;
         var DOJ =document.getElementById("doj_gov").value;
         var DOJMSME =document.getElementById("doj_msme").value;
         var DOR =document.getElementById("dat_ret").value;
         var email =document.getElementById("email").value;
         var descipline=document.getElementById("bas_descipline").value;


    if (name=="" || name==null){
                alert("Please enter name.");
                    return false;
            }
            if (email=="" || email==null){
                alert("Please enter email.....");
                    return false;
            }

            if (designation=="" || designation==null){
                alert("Please select designation.");
                    return false;
            }
            if (descipline=="" || descipline==null){
                alert("Please select descipline.....");
                    return false;
            }

            if (DOB=="" || DOB==null){
                alert("Please enter Date of birth.");
                    return false;
            }

            if (DOJ=="" || DOJ==null){
                alert("Please enter Date of joining to Government Services.");
                    return false;
            }

            if (DOJMSME=="" || DOJMSME==null){
                alert("Please enter date of joining to MSME.");
                    return false;
            }
            if (DOR=="" || DOR==null){
                alert("Please select date of retirement.");
                    return false;
            }
            
            


                 document.forms[0].action = "EIS_success.jsp"
    return true;
        }
        
