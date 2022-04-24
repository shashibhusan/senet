/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


function showDiv(select){
   if(select.value=='Other'){
    document.getElementById('answer1').style.display = "block";
   } else{
    document.getElementById('answer1').style.display = "none";
   }
}

function showDivFeedback(select)
{
    if(select.value=='Agri- business and rural enterprise value chains')
        {
            document.getElementById('issue1').style.display="block";
            document.getElementById('issue2').style.display="none";
            document.getElementById('issue3').style.display="none";
            document.getElementById('issue4').style.display="none";
            document.getElementById('issue5').style.display="none";
            document.getElementById('issue6').style.display="none";
            document.getElementById('issue7').style.display="none";
            document.getElementById('issue8').style.display="none";
            document.getElementById('issue9').style.display="none";
            document.getElementById('issue10').style.display="none";
            document.getElementById('issue11').style.display="none";
            document.getElementById('issue12').style.display="none";
            document.getElementById('issue13').style.display="none";
            document.getElementById('issue14').style.display="none";
            document.getElementById('issue15').style.display="none";
            document.getElementById('issue16').style.display="none";
        }
        else if(select.value=='Trade in Services')
            {
                document.getElementById('issue2').style.display="block";
                document.getElementById('issue1').style.display="none";
                document.getElementById('issue3').style.display="none";
                document.getElementById('issue4').style.display="none";
                document.getElementById('issue5').style.display="none";
                document.getElementById('issue6').style.display="none";
                document.getElementById('issue7').style.display="none";
                document.getElementById('issue8').style.display="none";
                document.getElementById('issue9').style.display="none";
                document.getElementById('issue10').style.display="none";
                document.getElementById('issue11').style.display="none";
                document.getElementById('issue12').style.display="none";
                document.getElementById('issue13').style.display="none";
                document.getElementById('issue14').style.display="none";
                document.getElementById('issue15').style.display="none";
                document.getElementById('issue16').style.display="none";
            }
            else if(select.value=='Manufacturing and Technology')
                {
                    document.getElementById('issue3').style.display="block";
                    document.getElementById('issue1').style.display="none";
                    document.getElementById('issue2').style.display="none";
                    document.getElementById('issue4').style.display="none";
                    document.getElementById('issue5').style.display="none";
                    document.getElementById('issue6').style.display="none";
                    document.getElementById('issue7').style.display="none";
                    document.getElementById('issue8').style.display="none";
                    document.getElementById('issue9').style.display="none";
                    document.getElementById('issue10').style.display="none";
                    document.getElementById('issue11').style.display="none";
                    document.getElementById('issue12').style.display="none";
                    document.getElementById('issue13').style.display="none";
                    document.getElementById('issue14').style.display="none";
                    document.getElementById('issue15').style.display="none";
                    document.getElementById('issue16').style.display="none";
                }
                else if(select.value=='Social Entrepreneurship')
                    {
                        document.getElementById('issue4').style.display="block";
                        document.getElementById('issue1').style.display="none";
                        document.getElementById('issue2').style.display="none";
                        document.getElementById('issue3').style.display="none";
                        document.getElementById('issue5').style.display="none";
                        document.getElementById('issue6').style.display="none";
                        document.getElementById('issue7').style.display="none";
                        document.getElementById('issue8').style.display="none";
                        document.getElementById('issue9').style.display="none";
                        document.getElementById('issue10').style.display="none";
                        document.getElementById('issue11').style.display="none";
                        document.getElementById('issue12').style.display="none";
                        document.getElementById('issue13').style.display="none";
                        document.getElementById('issue14').style.display="none";
                        document.getElementById('issue15').style.display="none";
                        document.getElementById('issue16').style.display="none";
                    }
                    else if(select.value=='Policy and Governance')
                        {
                            document.getElementById('issue5').style.display="block";
                            document.getElementById('issue1').style.display="none";
                            document.getElementById('issue2').style.display="none";
                            document.getElementById('issue3').style.display="none";
                            document.getElementById('issue4').style.display="none";
                            document.getElementById('issue6').style.display="none";
                            document.getElementById('issue7').style.display="none";
                            document.getElementById('issue8').style.display="none";
                            document.getElementById('issue9').style.display="none";
                            document.getElementById('issue10').style.display="none";
                            document.getElementById('issue11').style.display="none";
                            document.getElementById('issue12').style.display="none";
                            document.getElementById('issue13').style.display="none";
                            document.getElementById('issue14').style.display="none";
                            document.getElementById('issue15').style.display="none";
                            document.getElementById('issue16').style.display="none";
                        }
                        else if(select.value=='Industrial Research and Tech Services')
                            {
                                document.getElementById('issue6').style.display="block";
                                document.getElementById('issue1').style.display="none";
                                document.getElementById('issue2').style.display="none";
                                document.getElementById('issue3').style.display="none";
                                document.getElementById('issue4').style.display="none";
                                document.getElementById('issue5').style.display="none";
                                document.getElementById('issue7').style.display="none";
                                document.getElementById('issue8').style.display="none";
                                document.getElementById('issue9').style.display="none";
                                document.getElementById('issue10').style.display="none";
                                document.getElementById('issue11').style.display="none";
                                document.getElementById('issue12').style.display="none";
                                document.getElementById('issue13').style.display="none";
                                document.getElementById('issue14').style.display="none";
                                document.getElementById('issue15').style.display="none";
                                document.getElementById('issue16').style.display="none";
                            }
                            else if(select.value=='Energy and Transport')
                                {
                                    document.getElementById('issue7').style.display="block";
                                    document.getElementById('issue1').style.display="none";
                                    document.getElementById('issue2').style.display="none";
                                    document.getElementById('issue3').style.display="none";
                                    document.getElementById('issue4').style.display="none";
                                    document.getElementById('issue5').style.display="none";
                                    document.getElementById('issue6').style.display="none";
                                    document.getElementById('issue8').style.display="none";
                                    document.getElementById('issue9').style.display="none";
                                    document.getElementById('issue10').style.display="none";
                                    document.getElementById('issue11').style.display="none";
                                    document.getElementById('issue12').style.display="none";
                                    document.getElementById('issue13').style.display="none";
                                    document.getElementById('issue14').style.display="none";
                                    document.getElementById('issue15').style.display="none";
                                    document.getElementById('issue16').style.display="none";
                                }
                                else if(select.value=='Digital Services')
                                    {
                                        document.getElementById('issue8').style.display="block";
                                        document.getElementById('issue1').style.display="none";
                                        document.getElementById('issue2').style.display="none";
                                        document.getElementById('issue3').style.display="none";
                                        document.getElementById('issue4').style.display="none";
                                        document.getElementById('issue5').style.display="none";
                                        document.getElementById('issue6').style.display="none";
                                        document.getElementById('issue7').style.display="none";
                                        document.getElementById('issue9').style.display="none";
                                        document.getElementById('issue10').style.display="none";
                                        document.getElementById('issue11').style.display="none";
                                        document.getElementById('issue12').style.display="none";
                                        document.getElementById('issue13').style.display="none";
                                        document.getElementById('issue14').style.display="none";
                                        document.getElementById('issue15').style.display="none";
                                        document.getElementById('issue16').style.display="none";
                                    }
                                    else if(select.value=='Investment Promotion and Financial Issues ( including credit and delayed payment)')
                                        {
                                            document.getElementById('issue9').style.display="block";
                                            document.getElementById('issue1').style.display="none";
                                            document.getElementById('issue2').style.display="none";
                                            document.getElementById('issue3').style.display="none";
                                            document.getElementById('issue4').style.display="none";
                                            document.getElementById('issue5').style.display="none";
                                            document.getElementById('issue6').style.display="none";
                                            document.getElementById('issue7').style.display="none";
                                            document.getElementById('issue8').style.display="none";
                                            document.getElementById('issue10').style.display="none";
                                            document.getElementById('issue11').style.display="none";
                                            document.getElementById('issue12').style.display="none";
                                            document.getElementById('issue13').style.display="none";
                                            document.getElementById('issue14').style.display="none";
                                            document.getElementById('issue15').style.display="none";
                                            document.getElementById('issue16').style.display="none";
                                        }
                                        else if(select.value=='Market Access (including Public Procurement Policy)')
                                            {
                                                document.getElementById('issue10').style.display="block";
                                                document.getElementById('issue1').style.display="none";
                                                document.getElementById('issue2').style.display="none";
                                                document.getElementById('issue3').style.display="none";
                                                document.getElementById('issue4').style.display="none";
                                                document.getElementById('issue5').style.display="none";
                                                document.getElementById('issue6').style.display="none";
                                                document.getElementById('issue7').style.display="none";
                                                document.getElementById('issue8').style.display="none";
                                                document.getElementById('issue9').style.display="none";
                                                document.getElementById('issue11').style.display="none";
                                                document.getElementById('issue12').style.display="none";
                                                document.getElementById('issue13').style.display="none";
                                                document.getElementById('issue14').style.display="none";
                                                document.getElementById('issue15').style.display="none";
                                                document.getElementById('issue16').style.display="none";
                                            }
                                            else if(select.value=='Skills')
                                                {
                                                    document.getElementById('issue11').style.display="block";
                                                    document.getElementById('issue1').style.display="none";
                                                    document.getElementById('issue2').style.display="none";
                                                    document.getElementById('issue3').style.display="none";
                                                    document.getElementById('issue4').style.display="none";
                                                    document.getElementById('issue5').style.display="none";
                                                    document.getElementById('issue6').style.display="none";
                                                    document.getElementById('issue7').style.display="none";
                                                    document.getElementById('issue8').style.display="none";
                                                    document.getElementById('issue9').style.display="none";
                                                    document.getElementById('issue10').style.display="none";
                                                    document.getElementById('issue12').style.display="none";
                                                    document.getElementById('issue13').style.display="none";
                                                    document.getElementById('issue14').style.display="none";
                                                    document.getElementById('issue15').style.display="none";
                                                    document.getElementById('issue16').style.display="none";
                                                }
                                                else if(select.value=='Clusters')
                                                    {
                                                        document.getElementById('issue12').style.display="block";
                                                        document.getElementById('issue1').style.display="none";
                                                        document.getElementById('issue2').style.display="none";
                                                        document.getElementById('issue3').style.display="none";
                                                        document.getElementById('issue4').style.display="none";
                                                        document.getElementById('issue5').style.display="none";
                                                        document.getElementById('issue6').style.display="none";
                                                        document.getElementById('issue7').style.display="none";
                                                        document.getElementById('issue8').style.display="none";
                                                        document.getElementById('issue9').style.display="none";
                                                        document.getElementById('issue10').style.display="none";
                                                        document.getElementById('issue11').style.display="none";
                                                        document.getElementById('issue13').style.display="none";
                                                        document.getElementById('issue14').style.display="none";
                                                        document.getElementById('issue15').style.display="none";
                                                        document.getElementById('issue16').style.display="none";
                                                    }
                                                    else if(select.value=='Knowledge Services for MSMEs')
                                                        {
                                                            document.getElementById('issue13').style.display="block";
                                                            document.getElementById('issue1').style.display="none";
                                                            document.getElementById('issue2').style.display="none";
                                                            document.getElementById('issue3').style.display="none";
                                                            document.getElementById('issue4').style.display="none";
                                                            document.getElementById('issue5').style.display="none";
                                                            document.getElementById('issue6').style.display="none";
                                                            document.getElementById('issue7').style.display="none";
                                                            document.getElementById('issue8').style.display="none";
                                                            document.getElementById('issue9').style.display="none";
                                                            document.getElementById('issue10').style.display="none";
                                                            document.getElementById('issue11').style.display="none";
                                                            document.getElementById('issue12').style.display="none";
                                                            document.getElementById('issue14').style.display="none";
                                                             document.getElementById('issue15').style.display="none";
                                                             document.getElementById('issue16').style.display="none";
                                                        }
                                                        else if(select.value=='Any other issue')
                                                            {
                                                                document.getElementById('issue14').style.display="block";
                                                                document.getElementById('issue1').style.display="none";
                                                                document.getElementById('issue2').style.display="none";
                                                                document.getElementById('issue3').style.display="none";
                                                                document.getElementById('issue4').style.display="none";
                                                                document.getElementById('issue5').style.display="none";
                                                                document.getElementById('issue6').style.display="none";
                                                                document.getElementById('issue7').style.display="none";
                                                                document.getElementById('issue8').style.display="none";
                                                                document.getElementById('issue9').style.display="none";
                                                                document.getElementById('issue10').style.display="none";
                                                                document.getElementById('issue11').style.display="none";
                                                                document.getElementById('issue12').style.display="none";
                                                                document.getElementById('issue13').style.display="none";
                                                                document.getElementById('issue15').style.display="none";
                                                                document.getElementById('issue16').style.display="none";
                                                            }
                                                            else if(select.value=='Innovative Ideas')
                                                                {
                                                                    document.getElementById('issue15').style.display="block";
                                                                    document.getElementById('issue1').style.display="none";
                                                                    document.getElementById('issue2').style.display="none";
                                                                    document.getElementById('issue3').style.display="none";
                                                                    document.getElementById('issue4').style.display="none";
                                                                    document.getElementById('issue5').style.display="none";
                                                                    document.getElementById('issue6').style.display="none";
                                                                    document.getElementById('issue7').style.display="none";
                                                                    document.getElementById('issue8').style.display="none";
                                                                    document.getElementById('issue9').style.display="none";
                                                                    document.getElementById('issue10').style.display="none";
                                                                    document.getElementById('issue11').style.display="none";
                                                                    document.getElementById('issue12').style.display="none";
                                                                    document.getElementById('issue13').style.display="none";
                                                                    document.getElementById('issue14').style.display="none";
                                                                    document.getElementById('issue16').style.display="none";
                                                                }
                                                                else if(select.value=='Art-based Enterprise')
                                                                    {
                                                                        document.getElementById('issue16').style.display="block";
                                                                        document.getElementById('issue1').style.display="none";
                                                                    document.getElementById('issue2').style.display="none";
                                                                    document.getElementById('issue3').style.display="none";
                                                                    document.getElementById('issue4').style.display="none";
                                                                    document.getElementById('issue5').style.display="none";
                                                                    document.getElementById('issue6').style.display="none";
                                                                    document.getElementById('issue7').style.display="none";
                                                                    document.getElementById('issue8').style.display="none";
                                                                    document.getElementById('issue9').style.display="none";
                                                                    document.getElementById('issue10').style.display="none";
                                                                    document.getElementById('issue11').style.display="none";
                                                                    document.getElementById('issue12').style.display="none";
                                                                    document.getElementById('issue13').style.display="none";
                                                                    document.getElementById('issue14').style.display="none";
                                                                    document.getElementById('issue15').style.display="none";
                                                                    }
}


var counter = 2;
var limit = 100;
function addInput1(divName)
{
 if (counter == limit)  {

             //alert("You have reached the limit of adding " + (counter-1) + " inputs");
             document.getElementById('input').innerHTML="you have reached max limit of "+(counter-1)+ " issues ";

         }else
             {

              var name = document.getElementById("tcname["+(counter-1)+"]").value;

              if (name=="" || name==null){
                  document.getElementById("err1").innerHTML="Please type in above field first"
                    return false;
             }else
                 {

                 document.getElementById("err1").innerHTML=""

              var newdiv = document.createElement('tr');


              newdiv.innerHTML = "<textarea onkeypress='return RestrictCommaSemicolon(event);' name='tcname["+counter +"]' id='tcname["+counter +"]' rows='3' cols='60' placeholder='Max 50 words' maxlength='200'></textarea>";


              document.getElementById(divName).appendChild(newdiv);


              counter++;
                 }

      }
}

/* for second option*/

var counter1 = 2;
var limit1 = 100;
function addInput2(divName)
{
 if (counter1 == limit1)  {

              //alert("You have reached the limit of adding " + counter1 + " inputs");
              document.getElementById('input').innerHTML="you have reached max limit of "+(counter1-1)+ " issues ";

         }else
             {

              var name = document.getElementById("TIS["+(counter1-1)+"]").value;

              if (name=="" || name==null){
                  document.getElementById("err2").innerHTML="Please type in above field first"
                    return false;
             }else
                 {

                 document.getElementById("err2").innerHTML=""

              var newdiv2 = document.createElement('tr');


              newdiv2.innerHTML = "<textarea name='TIS["+counter1 +"]' id='TIS["+counter1+"]' rows='3' cols='60' placeholder='Max 50 words' maxlength='200'></textarea>";


              document.getElementById(divName).appendChild(newdiv2);


              counter1++;
                 }

      }
}

/* for third option*/

var counter2 = 2;
var limit2 = 100;
function addInput3(divName)
{
 if (counter2 == limit2)  {

             // alert("You have reached the limit of adding " + counter2 + " inputs");
             document.getElementById('input').innerHTML="you have reached max limit of "+(counter2-1)+ " issues ";

         }else
             {

              var name = document.getElementById("MT["+(counter2-1)+"]").value;

              if (name=="" || name==null){
                  document.getElementById("err3").innerHTML="Please type in above field first"
                    return false;
             }else
                 {

                 document.getElementById("err3").innerHTML=""

              var newdiv3 = document.createElement('tr');


              newdiv3.innerHTML = "<textarea name='MT["+counter2 +"]' id='MT["+counter2+"]' rows='3' cols='60' placeholder='Max 50 words' maxlength='200'></textarea>";


              document.getElementById(divName).appendChild(newdiv3);


              counter2++;
                 }

      }
}

/* for 4th option*/

var counter4 = 2;
var limit4 = 100;
function addInput4(divName)
{
 if (counter4 == limit4)  {

             // alert("You have reached the limit of adding " + counter4 + " inputs");
             document.getElementById('input').innerHTML="you have reached max limit of "+(counter4-1)+ " issues ";

         }else
             {

              var name = document.getElementById("SE["+(counter4-1)+"]").value;

              if (name=="" || name==null){
                  document.getElementById("err4").innerHTML="Please type in above field first"
                    return false;
             }else
                 {

                 document.getElementById("err4").innerHTML=""

              var newdiv4 = document.createElement('tr');


              newdiv4.innerHTML = "<textarea name='SE["+counter4 +"]' id='SE["+counter4+"]' rows='3' cols='60' placeholder='Max 50 words' maxlength='200'></textarea>";


              document.getElementById(divName).appendChild(newdiv4);


              counter4++;
                 }

      }
}

/* for 5th option*/

var counter5 = 2;
var limit5 = 100;
function addInput5(divName)
{
 if (counter5 == limit5)  {

             // alert("You have reached the limit of adding " + counter5 + " inputs");
             document.getElementById('input').innerHTML="you have reached max limit of "+(counter5-1)+ " issues ";

         }else
             {

              var name = document.getElementById("PG["+(counter5-1)+"]").value;

              if (name=="" || name==null){
                  document.getElementById("err5").innerHTML="Please type in above field first"
                    return false;
             }else
                 {

                 document.getElementById("err5").innerHTML=""

              var newdiv5 = document.createElement('tr');


              newdiv5.innerHTML = "<textarea name='PG["+counter5 +"]' id='PG["+counter5+"]' rows='3' cols='60' placeholder='Max 50 words' maxlength='200'></textarea>";


              document.getElementById(divName).appendChild(newdiv5);


              counter5++;
                 }

      }
}

/* for 6th option*/

var counter6 = 2;
var limit6 = 100;
function addInput6(divName)
{
 if (counter6 == limit6)  {

            //  alert("You have reached the limit of adding " + counter6 + " inputs");
            document.getElementById('input').innerHTML="you have reached max limit of "+(counter6-1)+ " issues ";

         }else
             {

              var name = document.getElementById("IRTS["+(counter6-1)+"]").value;

              if (name=="" || name==null){

                  document.getElementById("err6").innerHTML="Please type in above field first"
                    return false;
             }else
                 {

                 document.getElementById("err6").innerHTML=""

              var newdiv6 = document.createElement('tr');

              newdiv6.innerHTML = "<textarea name='IRTS["+counter6 +"]' id='IRTS["+counter6+"]' rows='3' cols='60' placeholder='Max 50 words' maxlength='200'></textarea>";


              document.getElementById(divName).appendChild(newdiv6);


              counter6++;
                 }

      }
}

/* for 7th option*/

var counter7 = 2;
var limit7 = 100;
function addInput7(divName)
{
 if (counter7 == limit7)  {

              //alert("You have reached the limit of adding " + counter7 + " inputs");
              document.getElementById('input').innerHTML="you have reached max limit of "+(counter7-1)+ " issues ";

         }else
             {

              var name = document.getElementById("ET["+(counter7-1)+"]").value;

              if (name=="" || name==null){
                  document.getElementById("err7").innerHTML="Please type in above field first"
                    return false;
             }else
                 {

                 document.getElementById("err7").innerHTML=""

              var newdiv7 = document.createElement('tr');


              newdiv7.innerHTML = "<textarea name='ET["+counter7+"]' id='ET["+counter7+"]' rows='3' cols='60' placeholder='Max 50 words' maxlength='200'></textarea>";


              document.getElementById(divName).appendChild(newdiv7);


              counter7++;
                 }

      }
}

/* for 8th option*/

var counter8 = 2;
var limit8 = 100;
function addInput8(divName)
{
 if (counter8 == limit8)  {

            //  alert("You have reached the limit of adding " + counter8 + " inputs");
            document.getElementById('input').innerHTML="you have reached max limit of "+(counter8-1)+ " issues ";

         }else
             {

              var name = document.getElementById("DS["+(counter8-1)+"]").value;

              if (name=="" || name==null){
                  document.getElementById("err8").innerHTML="Please type in above field first"
                    return false;
             }else
                 {

                 document.getElementById("err8").innerHTML=""

              var newdiv8 = document.createElement('tr');


              newdiv8.innerHTML = "<textarea name='DS["+counter8 +"]' id='DS["+counter8+"]' rows='3' cols='60' placeholder='Max 50 words' maxlength='200'></textarea>";


              document.getElementById(divName).appendChild(newdiv8);


              counter8++;
                 }

      }
}


/* for 9th option*/

var counter9 = 2;
var limit9 = 100;
function addInput9(divName)
{
 if (counter9 == limit9)  {

            //  alert("You have reached the limit of adding " + counter9 + " inputs");
            document.getElementById('input').innerHTML="you have reached max limit of "+(counter9-1)+ " issues ";

         }else
             {

              var name = document.getElementById("IPFI["+(counter9-1)+"]").value;

              if (name=="" || name==null){
                  document.getElementById("err9").innerHTML="Please type in above field first"
                    return false;
             }else
                 {

                 document.getElementById("err9").innerHTML=""

              var newdiv9 = document.createElement('tr');


              newdiv9.innerHTML = "<textarea name='IPFI["+counter9 +"]' id='IPFI["+counter9+"]' rows='3' cols='60' placeholder='Max 50 words' maxlength='200'></textarea>";


              document.getElementById(divName).appendChild(newdiv9);


              counter9++;
                 }

      }
}

/* for 10th option*/

var counter10 = 2;
var limit10 = 100;
function addInput10(divName)
{
 if (counter10 == limit10)  {

             // alert("You have reached the limit of adding " + counter10 + " inputs");
             document.getElementById('input').innerHTML="you have reached max limit of "+(counter10-1)+ " issues ";

         }else
             {

              var name = document.getElementById("MAC["+(counter10-1)+"]").value;

              if (name=="" || name==null){
                  document.getElementById("err10").innerHTML="Please type in above field first"
                    return false;
             }else
                 {

                 document.getElementById("err10").innerHTML=""

              var newdiv10 = document.createElement('tr');


              newdiv10.innerHTML = "<textarea name='MAC["+counter10 +"]' id='MAC["+counter10+"]' rows='3' cols='60' placeholder='Max 50 words' maxlength='200'></textarea>";


              document.getElementById(divName).appendChild(newdiv10);


              counter10++;
                 }

      }
}


/* for 11th option*/

var counter11 = 2;
var limit11 = 100;
function addInput11(divName)
{
 if (counter11 == limit11)  {

            //  alert("You have reached the limit of adding " + counter11+ " inputs");
            document.getElementById('input').innerHTML="you have reached max limit of "+(counter11-1)+ " issues ";

         }else
             {

              var name = document.getElementById("SKILL["+(counter11-1)+"]").value;

              if (name=="" || name==null){
                  document.getElementById("err11").innerHTML="Please type in above field first"
                    return false;
             }else
                 {

                 document.getElementById("err11").innerHTML=""

              var newdiv11 = document.createElement('tr');


              newdiv11.innerHTML = "<textarea name='SKILL["+counter11 +"]' id='SKILL["+counter11+"]' rows='3' cols='60' placeholder='Max 50 words' maxlength='200'></textarea>";


              document.getElementById(divName).appendChild(newdiv11);


              counter11++;
                 }

      }
}

/* for 12th option*/

var counter12 = 2;
var limit12 = 100;
function addInput12(divName)
{
 if (counter12 == limit12)  {

             // alert("You have reached the limit of adding " + counter12+ " inputs");
             document.getElementById('input').innerHTML="you have reached max limit of "+(counter12-1)+ " issues ";

         }else
             {

              var name = document.getElementById("Cluster["+(counter12-1)+"]").value;

              if (name=="" || name==null){
                  document.getElementById("err12").innerHTML="Please type in above field first"
                    return false;
             }else
                 {

                 document.getElementById("err12").innerHTML=""

              var newdiv12 = document.createElement('tr');


              newdiv12.innerHTML = "<textarea name='Cluster["+counter12+"]' id='Cluster["+counter12+"]' rows='3' cols='60' placeholder='Max 50 words' maxlength='200'></textarea>";


              document.getElementById(divName).appendChild(newdiv12);


              counter12++;
                 }

      }
}

/* for 13th option*/

var counter13 = 2;
var limit13 = 100;
function addInput13(divName)
{
 if (counter13 == limit13)  {

              //alert("You have reached the limit of adding " + counter13+ " inputs");
              document.getElementById('input').innerHTML="you have reached max limit of "+(counter13-1)+ " issues ";

         }else
             {

              var name = document.getElementById("KSMSME["+(counter13-1)+"]").value;

              if (name=="" || name==null){
                  document.getElementById("err13").innerHTML="Please type in above field first"
                    return false;
             }else
                 {

                 document.getElementById("err13").innerHTML=""

              var newdiv13 = document.createElement('tr');


              newdiv13.innerHTML = "<textarea name='KSMSME["+counter13 +"]' id='KSMSME["+counter13+"]' rows='3' cols='60' placeholder='Max 50 words' maxlength='200'></textarea>";


              document.getElementById(divName).appendChild(newdiv13);


              counter13++;
                 }

      }
}
/* for 14th option*/

var counter14 = 2;
var limit14 = 100;
function addInput14(divName)
{
 if (counter14 == limit14)  {

           //   alert("You have reached the limit of adding " + counter14+ " inputs");
           document.getElementById('input').innerHTML="you have reached max limit of "+(counter14-1)+ " issues ";

         }else
             {

              var name = document.getElementById("other["+(counter14-1)+"]").value;

              if (name=="" || name==null){
                  document.getElementById("err14").innerHTML="Please type in above field first"
                    return false;
             }else
                 {

                 document.getElementById("err14").innerHTML=""

              var newdiv14 = document.createElement('tr');


              newdiv14.innerHTML = "<textarea name='other["+counter14+"]' id='other["+counter14+"]' rows='3' cols='60' placeholder='Max 50 words' maxlength='200'></textarea>";


              document.getElementById(divName).appendChild(newdiv14);


              counter14++;
                 }

      }
}

/* for 15th option*/

var counter15 = 2;
var limit15 = 100;
function addInput15(divName)
{
 if (counter15 == limit15)  {

           //   alert("You have reached the limit of adding " + counter14+ " inputs");
           document.getElementById('input').innerHTML="you have reached max limit of "+(counter15-1)+ " issues ";

         }else
             {

              var name = document.getElementById("ideas["+(counter15-1)+"]").value;

              if (name=="" || name==null){
                  document.getElementById("err15").innerHTML="Please type in above field first"
                    return false;
             }else
                 {

                 document.getElementById("err15").innerHTML=""

              var newdiv15 = document.createElement('tr');


              newdiv15.innerHTML = "<textarea name='ideas["+counter15+"]' id='ideas["+counter15+"]' rows='3' cols='60' placeholder='Max 50 words' maxlength='200'></textarea>";


              document.getElementById(divName).appendChild(newdiv15);


              counter15++;
                 }

      }
}

/* for 16th option*/

var counter16 = 2;
var limit16 = 100;
function addInput16(divName)
{
 if (counter16 == limit16)  {

           //   alert("You have reached the limit of adding " + counter14+ " inputs");
           document.getElementById('input').innerHTML="you have reached max limit of "+(counter16-1)+ " issues ";

         }else
             {

              var name = document.getElementById("ABE["+(counter16-1)+"]").value;

              if (name=="" || name==null){
                  document.getElementById("err16").innerHTML="Please type in above field first"
                    return false;
             }else
                 {

                 document.getElementById("err16").innerHTML=""

              var newdiv16 = document.createElement('tr');


              newdiv16.innerHTML = "<textarea name='ABE["+counter16+"]' id='ABE["+counter16+"]' rows='3' cols='60' placeholder='Max 50 words' maxlength='200'></textarea>";


              document.getElementById(divName).appendChild(newdiv16);


              counter16++;
                 }

      }
}

function submitFeedback()
{
    var name=document.getElementById('name').value;
    var email=document.getElementById('email').value;
    var category=document.getElementById('category').value;

        if(category=="Other")
            {
        
        var other=document.getElementById('other_cat').value;
        if(other=="" || other==null)
                    {
                        document.getElementById("err_other").innerHTML="Please specify other detail";
                        return false;
                    }
            }
  


//    var atpos = email.indexOf("@");
//    var dotpos = email.lastIndexOf(".");

    if(name=="" || name==null)
        {
            document.getElementById("errname").innerHTML="Please enter your full name";
            return false;
        }
        else if(email=="" || email==null)
        {
           document.getElementById("erremail").innerHTML="Please enter email";
            return false;
        }
    /*    else if(atpos<1 || dotpos<atpos+2 || dotpos+2>=email.length)
       {
            document.getElementById('erremail').innerHTML="Please enter a valid e-mail address."
                    return false;
       }*/
        else if(category=="" || category==null)
        {
            document.getElementById("errcatrel").innerHTML="Please select category belongs to";
            return false;
        }
     /*  if(category=="Other")
            {
                try
                {

                if(other=="" || other==null)
                    {
                        document.getElementById("err_other").innerHTML="Please specify other detail";
                        return false;
                    }
                }
                catch(error)
                {
                    console.log(error);
                }
            }*/
        else
            {
                document.forms[0].action = "submit_feedback.jsp"
                return true;
            }
}
var request;
function submitIssue()
{
    var name=document.getElementById('name').value;
    var email=document.getElementById('email').value;
    var category_related_to=document.getElementById('category').value;
    var atpos = email.indexOf("@");
    var dotpos = email.lastIndexOf(".");
    if(name=="" || name==null)
        {
            document.getElementById("errname").innerHTML="Please type name";
            return false;
        }
        else if(email=="" || email==null)
        {
            document.getElementById("erremail").innerHTML="Please type email";
            return false;
        }
        else if (atpos<1 || dotpos<atpos+2 || dotpos+2>=email.length)
       {
            document.getElementById('erremail').innerHTML="Please enter a valid e-mail address."
                    return false;
       }

        else if(category_related_to=="" || category_related_to==null)
        {
            document.getElementById("errcatrel").innerHTML="Please select category belongs to.";
            return false;
        }
        else
            {

var category=document.getElementById('msme_related_issue').value;
var url="";
var sugg = [];


if(category=="Any other issue")
    {
try
{
/*tcname1=document.getElementById('other[1]').value;
tcname2=document.getElementById('other[2]').value;
tcname3=document.getElementById('other[3]').value;
tcname4=document.getElementById('other[4]').value;
tcname5=document.getElementById('other[5]').value;*/

var data="";
var i=1;
                 for(i=1; i<=(counter14-1); i++)
                     {
                         data=document.getElementById('other['+i+']').value;
                         sugg.push(data);
                     }

}
catch(err)
{
    console.log(err);
}

    }

    else if(category=="Agri- business and rural enterprise value chains")
        {
            try
{
/*tcname1=document.getElementById('tcname[1]').value;
tcname2=document.getElementById('tcname[2]').value;
tcname3=document.getElementById('tcname[3]').value;
tcname4=document.getElementById('tcname[4]').value;
tcname5=document.getElementById('tcname[5]').value;*/

                 for(i=1; i<=(counter-1); i++)
                     {
                         data=document.getElementById('tcname['+i+']').value;
                         sugg.push(data);
                     }
}
catch(err)
{
    console.log(err);
}

        }
        else if(category=="Trade in Services")
            {
                try
{
/*tcname1=document.getElementById('TIS[1]').value;
tcname2=document.getElementById('TIS[2]').value;
tcname3=document.getElementById('TIS[3]').value;
tcname4=document.getElementById('TIS[4]').value;
tcname5=document.getElementById('TIS[5]').value;*/
for(i=1; i<=(counter1-1); i++)
                     {
                         data=document.getElementById('TIS['+i+']').value;
                         sugg.push(data);
                     }
}
catch(err)
{
    console.log(err);
}


            }
            else if(category=="Manufacturing and Technology")
                {
                                    try
{
/*tcname1=document.getElementById('MT[1]').value;
tcname2=document.getElementById('MT[2]').value;
tcname3=document.getElementById('MT[3]').value;
tcname4=document.getElementById('MT[4]').value;
tcname5=document.getElementById('MT[5]').value;*/
for(i=1; i<=(counter2-1); i++)
                     {
                         data=document.getElementById('MT['+i+']').value;
                         sugg.push(data);
                     }
}
catch(err)
{
    console.log(err);
}


                }
                else if(category=="Social Entrepreneurship")
                    {
                        try
                        {
                          /*  tcname1=document.getElementById('SE[1]').value;
                            tcname2=document.getElementById('SE[2]').value;
                            tcname3=document.getElementById('SE[3]').value;
                            tcname4=document.getElementById('SE[4]').value;
                            tcname5=document.getElementById('SE[5]').value;*/
                            for(i=1; i<=(counter4-1); i++)
                     {
                         data=document.getElementById('SE['+i+']').value;
                         sugg.push(data);
                     }
                        }
                        catch(err)
                        {
                            console.log(err);
                        }
                    }
                    else if(category=="Policy and Governance")
                        {
                            try
                            {
                             /*   tcname1=document.getElementById('PG[1]').value;
                                tcname2=document.getElementById('PG[2]').value;
                                tcname3=document.getElementById('PG[3]').value;
                                tcname4=document.getElementById('PG[4]').value;
                                tcname5=document.getElementById('PG[5]').value;*/
                                for(i=1; i<=(counter5-1); i++)
                     {
                         data=document.getElementById('PG['+i+']').value;
                         sugg.push(data);
                     }
                            }
                            catch(err)
                            {
                                console.log(err);
                            }
                        }
                        else if(category=="Industrial Research and Tech Services")
                            {
                                try
                                {
                                   /* tcname1=document.getElementById('IRTS[1]').value;
                                    tcname2=document.getElementById('IRTS[2]').value;
                                    tcname3=document.getElementById('IRTS[3]').value;
                                    tcname4=document.getElementById('IRTS[4]').value;
                                    tcname5=document.getElementById('IRTS[5]').value;*/
                                    for(i=1; i<=(counter6-1); i++)
                     {
                         data=document.getElementById('IRTS['+i+']').value;
                         sugg.push(data);
                     }
                                }
                                catch(err)
                                {
                                    console.log(err);
                                }
                            }
                            else if(category=="Energy and Transport")
                                {
                                    try
                                    {
                                     /*   tcname1=document.getElementById('ET[1]').value;
                                        tcname2=document.getElementById('ET[2]').value;
                                        tcname3=document.getElementById('ET[3]').value;
                                        tcname4=document.getElementById('ET[4]').value;
                                        tcname5=document.getElementById('ET[5]').value;*/
                                        for(i=1; i<=(counter7-1); i++)
                     {
                         data=document.getElementById('ET['+i+']').value;
                         sugg.push(data);
                     }
                                    }
                                    catch(err)
                                    {
                                        console.log(err);
                                    }
                                }
                                else if(category=="Digital Services")
                                    {
                                        try
                                        {
                                      /*  tcname1=document.getElementById('DS[1]').value;
                                        tcname2=document.getElementById('DS[2]').value;
                                        tcname3=document.getElementById('DS[3]').value;
                                        tcname4=document.getElementById('DS[4]').value;
                                        tcname5=document.getElementById('DS[5]').value;*/

                                        for(i=1; i<=(counter8-1); i++)
                     {
                         data=document.getElementById('DS['+i+']').value;
                         sugg.push(data);
                     }
                                        }
                                        catch(err)
                                        {
                                            console.log(err);
                                        }
                                    }
                                    else if(category=="Investment Promotion and Financial Issues ( including credit and delayed payment)")
                                        {
                                            try
                                            {
                                               /* tcname1=document.getElementById('IPFI[1]').value;
                                                tcname2=document.getElementById('IPFI[2]').value;
                                                tcname3=document.getElementById('IPFI[3]').value;
                                                tcname4=document.getElementById('IPFI[4]').value;
                                                tcname5=document.getElementById('IPFI[5]').value;*/
                                                for(i=1; i<=(counter9-1); i++)
                     {
                         data=document.getElementById('IPFI['+i+']').value;
                         sugg.push(data);
                     }
                                            }
                                            catch(err)
                                            {
                                                console.log(err);
                                            }
                                        }
                                        else if(category=="Market Access (including Public Procurement Policy)")
                                            {
                                                try
                                                {
                                                  /*  tcname1=document.getElementById('MAC[1]').value;
                                                    tcname2=document.getElementById('MAC[2]').value;
                                                    tcname3=document.getElementById('MAC[3]').value;
                                                    tcname4=document.getElementById('MAC[4]').value;
                                                    tcname5=document.getElementById('MAC[5]').value;*/
                                                    for(i=1; i<=(counter10-1); i++)
                     {
                         data=document.getElementById('MAC['+i+']').value;
                         sugg.push(data);
                     }
                                                }
                                                catch(err)
                                                {
                                                    console.log(err);
                                                }
                                            }
                                            else if(category=="Skills")
                                                {
                                                    try
                                                    {
                                                      /*  tcname1=document.getElementById('SKILL[1]').value;
                                                        tcname2=document.getElementById('SKILL[2]').value;
                                                        tcname3=document.getElementById('SKILL[3]').value;
                                                        tcname4=document.getElementById('SKILL[4]').value;
                                                        tcname5=document.getElementById('SKILL[5]').value;*/
                                                        for(i=1; i<=(counter11-1); i++)
                     {
                         data=document.getElementById('SKILL['+i+']').value;
                         sugg.push(data);
                     }
                                                    }
                                                    catch(err)
                                                    {
                                                        console.log(err);
                                                    }
                                                }
                                                else if(category=="Clusters")
                                                    {
                                                        try
                                                        {
                                                           /* tcname1=document.getElementById('Cluster[1]').value;
                                                            tcname2=document.getElementById('Cluster[2]').value;
                                                            tcname3=document.getElementById('Cluster[3]').value;
                                                            tcname4=document.getElementById('Cluster[4]').value;
                                                            tcname5=document.getElementById('Cluster[5]').value;*/
                                                            for(i=1; i<=(counter12-1); i++)
                     {
                         data=document.getElementById('Cluster['+i+']').value;
                         sugg.push(data);
                     }
                                                        }
                                                        catch(err)
                                                        {
                                                            console.log(err);
                                                        }
                                                    }
                                                    else if(category=="Knowledge Services for MSMEs")
                                                        {
                                                            try
                                                            {
                                                               /* tcname1=document.getElementById('KSMSME[1]').value;
                                                                tcname2=document.getElementById('KSMSME[2]').value;
                                                                tcname3=document.getElementById('KSMSME[3]').value;
                                                                tcname4=document.getElementById('KSMSME[4]').value;
                                                                tcname5=document.getElementById('KSMSME[5]').value;*/
                                                                for(i=1; i<=(counter13-1); i++)
                     {
                         data=document.getElementById('KSMSME['+i+']').value;
                         sugg.push(data);
                     }
                                                            }
                                                            catch(err)
                                                            {
                                                                console.log(err);
                                                            }
                                                        }
                                                        else if(category=="Innovative Ideas")
                                                            {
                                                                try
                                                                {
                                                              /*  tcname1=document.getElementById('ideas[1]').value;
                                                                tcname2=document.getElementById('ideas[2]').value;
                                                                tcname3=document.getElementById('ideas[3]').value;
                                                                tcname4=document.getElementById('ideas[4]').value;
                                                                tcname5=document.getElementById('ideas[5]').value;*/
                for(i=1; i<=(counter15-1); i++)
                     {
                         data=document.getElementById('ideas['+i+']').value;
                         sugg.push(data);
                     }
                                                                }
                                                                catch(err)
                                                                {
                                                                    console.log(err);
                                                                }
                                                            }
                                                            else if(category=="Art-based Enterprise")
                                                                {
                                                                    try
                                                                    {
                                                                      /*  tcname1=document.getElementById('ABE[1]').value;
                                                                        tcname2=document.getElementById('ABE[2]').value;
                                                                        tcname3=document.getElementById('ABE[3]').value;
                                                                        tcname4=document.getElementById('ABE[4]').value;
                                                                        tcname5=document.getElementById('ABE[5]').value;*/
                for(i=1; i<=(counter16-1); i++)
                     {
                         data=document.getElementById('ABE['+i+']').value;
                         sugg.push(data);
                     }
                                                                    }
                                                                    catch(err)
                                                                    {
                                                                        console.log(err);
                                                                    }
                                                                }


//url="submitIssue.jsp?val="+email+"&val1="+category+"&val2="+tcname1+"&val3="+tcname2+"&val4="+tcname3+"&val5="+tcname4+"&val6="+tcname5;
url="submitIssue.jsp?val="+email+"&val1="+category+"&val2="+sugg;
if(window.XMLHttpRequest){
request=new XMLHttpRequest();
}
else if(window.ActiveXObject){
request=new ActiveXObject("Microsoft.XMLHTTP");
}

try
{
request.onreadystatechange=getInfo;
request.open("POST",url,true);
request.send();
}
catch(e)
{
alert("Unable to connect to server");
}
}

function getInfo(){
if(request.readyState==4){
var val=request.responseText;

var msg=val.substr(val.length - 6);
var finalMsg=msg.trim();
//alert(finalMsg);
//document.getElementById('result').innerHTML=val;
if(finalMsg=="1")
    {
        document.getElementById('resulterr').innerHTML="FAILED !!<br/> You have already submitted your openion.";
    }
    else if(finalMsg=="2")
        {
            document.getElementById('resulterr').innerHTML="";
            document.getElementById('result').innerHTML="Issue Uploaded Successfully !";
            document.getElementById('issue1').style.display="none";
            document.getElementById('issue2').style.display="none";
            document.getElementById('issue3').style.display="none";
            document.getElementById('issue4').style.display="none";
            document.getElementById('issue5').style.display="none";
            document.getElementById('issue6').style.display="none";
            document.getElementById('issue7').style.display="none";
            document.getElementById('issue8').style.display="none";
            document.getElementById('issue9').style.display="none";
            document.getElementById('issue10').style.display="none";
            document.getElementById('issue11').style.display="none";
            document.getElementById('issue12').style.display="none";
            document.getElementById('issue13').style.display="none";
            document.getElementById('issue14').style.display="none";
            document.getElementById('issue15').style.display="none";
            document.getElementById('issue16').style.display="none";

        }
        else
            {
                document.getElementById('result').innerHTML="";
                document.getElementById('resulterr').innerHTML="There is some ERROR. Please try again or contact system Administrator.";
            }
}
/*
if(!val==null || !val=="")
    {



    }*/
}

}



    function RestrictCommaSemicolon(e) {
        var theEvent = e || window.event;
        var key = theEvent.keyCode || theEvent.which;
        key = String.fromCharCode(key);
        var regex = /[^,]+$/;
        if (!regex.test(key)) {
            theEvent.returnValue = false;
            if (theEvent.preventDefault) {
                theEvent.preventDefault();
            }
        }
    }