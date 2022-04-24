/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
var tableTodisplay;
function updateSanctionAmount(vSel,amc,webMaint,internet,contgs,others,total)
{
    var InstName=vSel.value;
    if(InstName!=="" || InstName!==null)
        {
            var InstituteName;
            amc.value='0';
            webMaint.value='0';
            internet.value='0';
            contgs.value='0';
            others.value='0';
            total.value='0';
            if(InstName==='I1'){InstituteName='MSME-DI Agartala (Tripura)';tableTodisplay='Agartala';}
            else if(InstName==='I2'){InstituteName='MSME-DI Haldwani (Uttranchal)';tableTodisplay='Haldwani';}
            else if(InstName==='I3'){InstituteName='MSME-DI Ahmedabad (Gujarat)';tableTodisplay='Ahmedabad';}
            else if(InstName==='I4'){InstituteName='MSME-DI Allahabad (U.P.)';tableTodisplay='Allahabad';}
            else if(InstName==='I5'){InstituteName='MSME-DI Agra (UP)';tableTodisplay='Agra';}
            else if(InstName==='I6'){InstituteName='MSME-DI Bangalore (Karnataka)';tableTodisplay='Bangalore';}
            else if(InstName==='I7'){InstituteName='MSME-DI Mumbai (Maharashtra)';tableTodisplay='Mumbai';}
            else if(InstName==='I8'){InstituteName='MSME-DI Kolkatta(West Bengal)';tableTodisplay='Kolkata';}
            else if(InstName==='I9'){InstituteName='MSME-DI Cuttack (Orissa)';tableTodisplay='Cuttack';}
            else if(InstName==='I10'){InstituteName='MSME-DI Guwahati (Assam)';tableTodisplay='Guwahati';}
            else if(InstName==='I11'){InstituteName='MSME-DI Hubli (Karnataka)';tableTodisplay='Hubli';}
            else if(InstName==='I12'){InstituteName='MSME-DI Hyderabad (A.P.)';tableTodisplay='Hyderabad';}
            else if(InstName==='I13'){InstituteName='MSME-DI Indore (M.P.)';tableTodisplay='Indore';}
            else if(InstName==='I14'){InstituteName='MSME-DI Imphal (Manipur)';tableTodisplay='Imphal';}
            else if(InstName==='I15'){InstituteName='MSME-DI Jaipur (Rajasthan)';tableTodisplay='Jaipur';}
            else if(InstName==='I16'){InstituteName='MSME-DI Kanpur (U.P.)';tableTodisplay='Kanpur';}
            else if(InstName==='I17'){InstituteName='MSME-DI Karnal (Haryana)';tableTodisplay='Karnal';}
            else if(InstName==='I18'){InstituteName='MSME-DI Ludhiana (Punjab)';tableTodisplay='Ludhiana';}
            else if(InstName==='I19'){InstituteName='MSME-DI Chennai (Tamil Nadu)';tableTodisplay='Chennai';}
            else if(InstName==='I20'){InstituteName='MSME-DI Margoa (Goa)';tableTodisplay='Margoa';}
            else if(InstName==='I21'){InstituteName='MSME-DI Muzaffarpur (Bihar)';tableTodisplay='Muzaffarpur';}
            else if(InstName==='I22'){InstituteName='MSME-DI Ranchi (Jharkhand)';tableTodisplay='Ranchi';}
            else if(InstName==='I23'){InstituteName='MSME-DI Solan (H.P.)';tableTodisplay='Solan';}
            else if(InstName==='I24'){InstituteName='MSME-DI Jammu (J & K)';tableTodisplay='Jammu';}
            else if(InstName==='I25'){InstituteName='MSME-DI Gangtok (Sikkim)';tableTodisplay='Gangtok';}
            else if(InstName==='I26'){InstituteName='MSME-DI Thrissur (Kerala)';tableTodisplay='Thrissur';}
            else if(InstName==='I27'){InstituteName='MSME-DI Raipur (Chattisgarh)';tableTodisplay='Raipur';}
            else if(InstName==='I28'){InstituteName='MSME-DI Patna (Bihar)';tableTodisplay='Patna';}
            else if(InstName==='I29'){InstituteName='MSME-DI New Delhi (New Delhi)';tableTodisplay='NewDelhi';}
            else if(InstName==='I30'){InstituteName='MSME-DI Nagpur (Maharashtra)';tableTodisplay='Nagpur';}
            else if(InstName==='I100'){InstituteName='TC-Kolkata';}
            else if(InstName==='I101'){InstituteName='TC-Chennai';}
            else if(InstName==='I103'){InstituteName='TC-Mumbai';}
            else if(InstName==='I104'){InstituteName='TC-New Delhi';}
            else if(InstName==='I105'){InstituteName='TI-Tiruvalla';}
            else if(InstName==='I106'){InstituteName='TI-Ettumanoor';}
            else if(InstName==='I107'){InstituteName='TDCHT-Nagpur';}
            else if(InstName==='I122'){InstituteName='MSME-TS Hyderabad';}
            else if(InstName==='I123'){InstituteName='MSME-TS Bangalore';}
            else if(InstName==='I124'){InstituteName='MSME-TS Changacherry';}
            else if(InstName==='I125'){InstituteName='MSME-TS Bhopal';}
            else if(InstName==='I126'){InstituteName='MSME-TS Kolhapur';}
            else if(InstName==='I127'){InstituteName='MSME-TS Jaipur';}
            else if(InstName==='I128'){InstituteName='MSME-TS Pondicherry';}
            else if(InstName==='I58'){InstituteName='MSME-TS Puducherry';}
            else if(InstName==='I150'){InstituteName='MSME-EXC NewDelhi';}
            else if(InstName==='I151'){InstituteName='PAO-Chennai';}
            document.getElementById("Instname").innerHTML=InstituteName;
            document.getElementById("FormTable").style.display="block";
            
            DisplayTableForm(vSel);
            return true;
        }
}

        function myFunction() 
        {
            document.getElementById("sanctionAmountUpdateForm").reset();
            document.getElementById("FormTable").style.display="none";

        }
        function DisplayTableForm(InId)
            {
                var InstId=InId.value;
                    if(InstId==='I1')
                        {
                            document.getElementById("AgartalaTable").style.display="block";
                            document.getElementById("AhmedabadTable").style.display="none";
                            document.getElementById("AllahabadTable").style.display="none";
                            document.getElementById("BangaloreTable").style.display="none";
                            document.getElementById("MumbaiTable").style.display="none";
                            document.getElementById("KolkataTable").style.display="none";
                            document.getElementById("CuttackTable").style.display="none";
                            document.getElementById("GuwahatiTable").style.display="none";
                            document.getElementById("HubliTable").style.display="none";
                            document.getElementById("HyderabadTable").style.display="none";
                            document.getElementById("IndoreTable").style.display="none";
                            document.getElementById("ImphalTable").style.display="none";
                            document.getElementById("KarnalTable").style.display="none";
                            document.getElementById("ChennaiTable").style.display="none";
                            document.getElementById("RanchiTable").style.display="none";
                            document.getElementById("JammuTable").style.display="none";
                            return true;
                        }
                        else if(InstId==='I3')
                            {
                                document.getElementById("AgartalaTable").style.display="none";
                                document.getElementById("AhmedabadTable").style.display="block";
                                document.getElementById("AllahabadTable").style.display="none";
                                document.getElementById("BangaloreTable").style.display="none";
                                document.getElementById("MumbaiTable").style.display="none";
                                document.getElementById("KolkataTable").style.display="none";
                                document.getElementById("CuttackTable").style.display="none";
                                document.getElementById("GuwahatiTable").style.display="none";
                                document.getElementById("HubliTable").style.display="none";
                                document.getElementById("HyderabadTable").style.display="none";
                                document.getElementById("IndoreTable").style.display="none";
                                document.getElementById("ImphalTable").style.display="none";
                                document.getElementById("KarnalTable").style.display="none";
                                document.getElementById("ChennaiTable").style.display="none";
                                document.getElementById("RanchiTable").style.display="none";
                                document.getElementById("JammuTable").style.display="none";
                                return true;
                            }
                            else if(InstId==='I4')
                                {
                                    document.getElementById("AgartalaTable").style.display="none";
                                    document.getElementById("AhmedabadTable").style.display="none";
                                    document.getElementById("AllahabadTable").style.display="block";
                                    document.getElementById("BangaloreTable").style.display="none";
                                    document.getElementById("MumbaiTable").style.display="none";
                                    document.getElementById("KolkataTable").style.display="none";
                                    document.getElementById("CuttackTable").style.display="none";
                                    document.getElementById("GuwahatiTable").style.display="none";
                                    document.getElementById("HubliTable").style.display="none";
                                    document.getElementById("HyderabadTable").style.display="none";
                                    document.getElementById("IndoreTable").style.display="none";
                                    document.getElementById("ImphalTable").style.display="none";
                                    document.getElementById("KarnalTable").style.display="none";
                                    document.getElementById("ChennaiTable").style.display="none";
                                    document.getElementById("RanchiTable").style.display="none";
                                    document.getElementById("JammuTable").style.display="none";
                                }
                                else if(InstId==='I6')
                                    {
                                        document.getElementById("AgartalaTable").style.display="none";
                                        document.getElementById("AhmedabadTable").style.display="none";
                                        document.getElementById("AllahabadTable").style.display="none";
                                        document.getElementById("BangaloreTable").style.display="block";
                                        document.getElementById("MumbaiTable").style.display="none";
                                        document.getElementById("KolkataTable").style.display="none";
                                        document.getElementById("CuttackTable").style.display="none";
                                        document.getElementById("GuwahatiTable").style.display="none";
                                        document.getElementById("HubliTable").style.display="none";
                                        document.getElementById("HyderabadTable").style.display="none";
                                        document.getElementById("IndoreTable").style.display="none";
                                        document.getElementById("ImphalTable").style.display="none";
                                        document.getElementById("KarnalTable").style.display="none";
                                        document.getElementById("ChennaiTable").style.display="none";
                                        document.getElementById("RanchiTable").style.display="none";
                                        document.getElementById("JammuTable").style.display="none";
                                    }
                                    else if(InstId==='I7')
                                        {
                                            document.getElementById("AgartalaTable").style.display="none";
                                            document.getElementById("AhmedabadTable").style.display="none";
                                            document.getElementById("AllahabadTable").style.display="none";
                                            document.getElementById("BangaloreTable").style.display="none";
                                            document.getElementById("MumbaiTable").style.display="block";
                                            document.getElementById("KolkataTable").style.display="none";
                                            document.getElementById("CuttackTable").style.display="none";
                                            document.getElementById("GuwahatiTable").style.display="none";
                                            document.getElementById("HubliTable").style.display="none";
                                            document.getElementById("HyderabadTable").style.display="none";
                                            document.getElementById("IndoreTable").style.display="none";
                                            document.getElementById("ImphalTable").style.display="none";
                                            document.getElementById("KarnalTable").style.display="none";
                                            document.getElementById("ChennaiTable").style.display="none";
                                            document.getElementById("RanchiTable").style.display="none";
                                            document.getElementById("JammuTable").style.display="none";
                                        }
                                        else if(InstId==='I8')
                                            {
                                                document.getElementById("AgartalaTable").style.display="none";
                                                document.getElementById("AhmedabadTable").style.display="none";
                                                document.getElementById("AllahabadTable").style.display="none";
                                                document.getElementById("BangaloreTable").style.display="none";
                                                document.getElementById("MumbaiTable").style.display="none";
                                                document.getElementById("KolkataTable").style.display="block";
                                                document.getElementById("CuttackTable").style.display="none";
                                                document.getElementById("GuwahatiTable").style.display="none";
                                                document.getElementById("HubliTable").style.display="none";
                                                document.getElementById("HyderabadTable").style.display="none";
                                                document.getElementById("IndoreTable").style.display="none";
                                                document.getElementById("ImphalTable").style.display="none";
                                                document.getElementById("KarnalTable").style.display="none";
                                                document.getElementById("ChennaiTable").style.display="none";
                                                document.getElementById("RanchiTable").style.display="none";
                                                document.getElementById("JammuTable").style.display="none";
                                            }
                                            else if(InstId==='I9')
                                                {
                                                    document.getElementById("AgartalaTable").style.display="none";
                                                    document.getElementById("AhmedabadTable").style.display="none";
                                                    document.getElementById("AllahabadTable").style.display="none";
                                                    document.getElementById("BangaloreTable").style.display="none";
                                                    document.getElementById("MumbaiTable").style.display="none";
                                                    document.getElementById("KolkataTable").style.display="none";
                                                    document.getElementById("CuttackTable").style.display="block";
                                                    document.getElementById("GuwahatiTable").style.display="none";
                                                    document.getElementById("HubliTable").style.display="none";
                                                    document.getElementById("HyderabadTable").style.display="none";
                                                    document.getElementById("IndoreTable").style.display="none";
                                                    document.getElementById("ImphalTable").style.display="none";
                                                    document.getElementById("KarnalTable").style.display="none";
                                                    document.getElementById("ChennaiTable").style.display="none";
                                                    document.getElementById("RanchiTable").style.display="none";
                                                    document.getElementById("JammuTable").style.display="none";
                                                }
                                                else if(InstId==='I10')
                                                    {
                                                        document.getElementById("AgartalaTable").style.display="none";
                                                        document.getElementById("AhmedabadTable").style.display="none";
                                                        document.getElementById("AllahabadTable").style.display="none";
                                                        document.getElementById("BangaloreTable").style.display="none";
                                                        document.getElementById("MumbaiTable").style.display="none";
                                                        document.getElementById("KolkataTable").style.display="none";
                                                        document.getElementById("CuttackTable").style.display="none";
                                                        document.getElementById("GuwahatiTable").style.display="block";
                                                        document.getElementById("HubliTable").style.display="none";
                                                        document.getElementById("HyderabadTable").style.display="none";
                                                        document.getElementById("IndoreTable").style.display="none";
                                                        document.getElementById("ImphalTable").style.display="none";
                                                        document.getElementById("KarnalTable").style.display="none";
                                                        document.getElementById("ChennaiTable").style.display="none";
                                                        document.getElementById("RanchiTable").style.display="none";
                                                        document.getElementById("JammuTable").style.display="none";
                                                    }
                                                    else if(InstId==='I11')
                                                        {
                                                            document.getElementById("AgartalaTable").style.display="none";
                                                            document.getElementById("AhmedabadTable").style.display="none";
                                                            document.getElementById("AllahabadTable").style.display="none";
                                                            document.getElementById("BangaloreTable").style.display="none";
                                                            document.getElementById("MumbaiTable").style.display="none";
                                                            document.getElementById("KolkataTable").style.display="none";
                                                            document.getElementById("CuttackTable").style.display="none";
                                                            document.getElementById("GuwahatiTable").style.display="none";
                                                            document.getElementById("HubliTable").style.display="block";
                                                            document.getElementById("HyderabadTable").style.display="none";
                                                            document.getElementById("IndoreTable").style.display="none";
                                                            document.getElementById("ImphalTable").style.display="none";
                                                            document.getElementById("KarnalTable").style.display="none";
                                                            document.getElementById("ChennaiTable").style.display="none";
                                                            document.getElementById("RanchiTable").style.display="none";
                                                            document.getElementById("JammuTable").style.display="none";
                                                        }
                                                        else if(InstId==='I12')
                                                            {
                                                                document.getElementById("AgartalaTable").style.display="none";
                                                                document.getElementById("AhmedabadTable").style.display="none";
                                                                document.getElementById("AllahabadTable").style.display="none";
                                                                document.getElementById("BangaloreTable").style.display="none";
                                                                document.getElementById("MumbaiTable").style.display="none";
                                                                document.getElementById("KolkataTable").style.display="none";
                                                                document.getElementById("CuttackTable").style.display="none";
                                                                document.getElementById("GuwahatiTable").style.display="none";
                                                                document.getElementById("HubliTable").style.display="none";
                                                                document.getElementById("HyderabadTable").style.display="block";
                                                                document.getElementById("IndoreTable").style.display="none";
                                                                document.getElementById("ImphalTable").style.display="none";
                                                                document.getElementById("KarnalTable").style.display="none";
                                                                document.getElementById("ChennaiTable").style.display="none";
                                                                document.getElementById("RanchiTable").style.display="none";
                                                                document.getElementById("JammuTable").style.display="none";
                                                            }
                                                            else if(InstId==='I13')
                                                                {
                                                                    document.getElementById("AgartalaTable").style.display="none";
                                                                    document.getElementById("AhmedabadTable").style.display="none";
                                                                    document.getElementById("AllahabadTable").style.display="none";
                                                                    document.getElementById("BangaloreTable").style.display="none";
                                                                    document.getElementById("MumbaiTable").style.display="none";
                                                                    document.getElementById("KolkataTable").style.display="none";
                                                                    document.getElementById("CuttackTable").style.display="none";
                                                                    document.getElementById("GuwahatiTable").style.display="none";
                                                                    document.getElementById("HubliTable").style.display="none";
                                                                    document.getElementById("HyderabadTable").style.display="none";
                                                                    document.getElementById("IndoreTable").style.display="block";
                                                                    document.getElementById("ImphalTable").style.display="none";
                                                                    document.getElementById("KarnalTable").style.display="none";
                                                                    document.getElementById("ChennaiTable").style.display="none";
                                                                    document.getElementById("RanchiTable").style.display="none";
                                                                    document.getElementById("JammuTable").style.display="none";
                                                                }
                                                                else if(InstId==='I14')
                                                                    {
                                                                        document.getElementById("AgartalaTable").style.display="none";
                                                                        document.getElementById("AhmedabadTable").style.display="none";
                                                                        document.getElementById("AllahabadTable").style.display="none";
                                                                        document.getElementById("BangaloreTable").style.display="none";
                                                                        document.getElementById("MumbaiTable").style.display="none";
                                                                        document.getElementById("KolkataTable").style.display="none";
                                                                        document.getElementById("CuttackTable").style.display="none";
                                                                        document.getElementById("GuwahatiTable").style.display="none";
                                                                        document.getElementById("HubliTable").style.display="none";
                                                                        document.getElementById("HyderabadTable").style.display="none";
                                                                        document.getElementById("IndoreTable").style.display="none";
                                                                        document.getElementById("ImphalTable").style.display="block";
                                                                        document.getElementById("KarnalTable").style.display="none";
                                                                        document.getElementById("ChennaiTable").style.display="none";
                                                                        document.getElementById("RanchiTable").style.display="none";
                                                                        document.getElementById("JammuTable").style.display="none";
                                                                    }
                                                                    else if(InstId==='I17')
                                                                        {
                                                                            document.getElementById("AgartalaTable").style.display="none";
                                                                            document.getElementById("AhmedabadTable").style.display="none";
                                                                            document.getElementById("AllahabadTable").style.display="none";
                                                                            document.getElementById("BangaloreTable").style.display="none";
                                                                            document.getElementById("MumbaiTable").style.display="none";
                                                                            document.getElementById("KolkataTable").style.display="none";
                                                                            document.getElementById("CuttackTable").style.display="none";
                                                                            document.getElementById("GuwahatiTable").style.display="none";
                                                                            document.getElementById("HubliTable").style.display="none";
                                                                            document.getElementById("HyderabadTable").style.display="none";
                                                                            document.getElementById("IndoreTable").style.display="none";
                                                                            document.getElementById("ImphalTable").style.display="none";
                                                                            document.getElementById("KarnalTable").style.display="block";
                                                                            document.getElementById("ChennaiTable").style.display="none";
                                                                            document.getElementById("RanchiTable").style.display="none";
                                                                            document.getElementById("JammuTable").style.display="none";
                                                                        }
                                                                        else if(InstId==='I19')
                                                                            {
                                                                                document.getElementById("AgartalaTable").style.display="none";
                                                                                document.getElementById("AhmedabadTable").style.display="none";
                                                                                document.getElementById("AllahabadTable").style.display="none";
                                                                                document.getElementById("BangaloreTable").style.display="none";
                                                                                document.getElementById("MumbaiTable").style.display="none";
                                                                                document.getElementById("KolkataTable").style.display="none";
                                                                                document.getElementById("CuttackTable").style.display="none";
                                                                                document.getElementById("GuwahatiTable").style.display="none";
                                                                                document.getElementById("HubliTable").style.display="none";
                                                                                document.getElementById("HyderabadTable").style.display="none";
                                                                                document.getElementById("IndoreTable").style.display="none";
                                                                                document.getElementById("ImphalTable").style.display="none";
                                                                                document.getElementById("KarnalTable").style.display="none";
                                                                                document.getElementById("ChennaiTable").style.display="block";
                                                                                document.getElementById("RanchiTable").style.display="none";
                                                                                document.getElementById("JammuTable").style.display="none";
                                                                            }
                                                                            else if(InstId==='I22')
                                                                                {
                                                                                    document.getElementById("AgartalaTable").style.display="none";
                                                                                    document.getElementById("AhmedabadTable").style.display="none";
                                                                                    document.getElementById("AllahabadTable").style.display="none";
                                                                                    document.getElementById("BangaloreTable").style.display="none";
                                                                                    document.getElementById("MumbaiTable").style.display="none";
                                                                                    document.getElementById("KolkataTable").style.display="none";
                                                                                    document.getElementById("CuttackTable").style.display="none";
                                                                                    document.getElementById("GuwahatiTable").style.display="none";
                                                                                    document.getElementById("HubliTable").style.display="none";
                                                                                    document.getElementById("HyderabadTable").style.display="none";
                                                                                    document.getElementById("IndoreTable").style.display="none";
                                                                                    document.getElementById("ImphalTable").style.display="none";
                                                                                    document.getElementById("KarnalTable").style.display="none";
                                                                                    document.getElementById("ChennaiTable").style.display="none";
                                                                                    document.getElementById("RanchiTable").style.display="block";
                                                                                    document.getElementById("JammuTable").style.display="none";
                                                                                }
                                                                                else if(InstId==='I24')
                                                                                    {
                                                                                        document.getElementById("AgartalaTable").style.display="none";
                                                                                        document.getElementById("AhmedabadTable").style.display="none";
                                                                                        document.getElementById("AllahabadTable").style.display="none";
                                                                                        document.getElementById("BangaloreTable").style.display="none";
                                                                                        document.getElementById("MumbaiTable").style.display="none";
                                                                                        document.getElementById("KolkataTable").style.display="none";
                                                                                        document.getElementById("CuttackTable").style.display="none";
                                                                                        document.getElementById("GuwahatiTable").style.display="none";
                                                                                        document.getElementById("HubliTable").style.display="none";
                                                                                        document.getElementById("HyderabadTable").style.display="none";
                                                                                        document.getElementById("IndoreTable").style.display="none";
                                                                                        document.getElementById("ImphalTable").style.display="none";
                                                                                        document.getElementById("KarnalTable").style.display="none";
                                                                                        document.getElementById("ChennaiTable").style.display="none";
                                                                                        document.getElementById("RanchiTable").style.display="none";
                                                                                        document.getElementById("JammuTable").style.display="block";
                                                                                    }
                        else
                            {
                                document.getElementById("AgartalaTable").style.display="none";
                                document.getElementById("AhmedabadTable").style.display="none";
                                document.getElementById("AllahabadTable").style.display="none";
                                document.getElementById("BangaloreTable").style.display="none";
                                document.getElementById("MumbaiTable").style.display="none";
                                document.getElementById("KolkataTable").style.display="none";
                                document.getElementById("CuttackTable").style.display="none";
                                document.getElementById("GuwahatiTable").style.display="none";
                                document.getElementById("HubliTable").style.display="none";
                                document.getElementById("HyderabadTable").style.display="none";
                                document.getElementById("IndoreTable").style.display="none";
                                document.getElementById("ImphalTable").style.display="none";
                                document.getElementById("KarnalTable").style.display="none";
                                document.getElementById("ChennaiTable").style.display="none";
                                document.getElementById("RanchiTable").style.display="none";
                                document.getElementById("JammuTable").style.display="none";
                                return false;
                            }
            }
            
            
            
        function addTotal(amc, webmaint, internet, contgs, other, result) 
              {
                  var vTotal;
                  vTotal=Number(amc)+Number(webmaint)+Number(internet)+Number(contgs)+Number(other);
                  result.value=vTotal;
              }
              
              function addTotalBr(amc, internet, contgs, other, result) 
              {
                  var vTotal;
                  vTotal=Number(amc)+Number(internet)+Number(contgs)+Number(other);
                  result.value=vTotal;
              }
              
          function isNumber(evt) 
            {
                document.getElementById('span').style.display='none';
                evt = (evt) ? evt : window.event;
                var charCode = (evt.which) ? evt.which : evt.keyCode;
                if (charCode > 31 && (charCode < 48 || charCode > 57)) {
                return false;
            }

            return true;
            }
            
            function FormValidate()
            {
                alert("working");
            }
            
            