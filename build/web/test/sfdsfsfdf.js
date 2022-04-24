//formName= keymprForm
function validatForm()
{

    if(document.keymprForm.pmegp_no_of_beneficiary_per_unit_pre_month.value==null || document.keymprForm.pmegp_no_of_beneficiary_per_unit_pre_month.value=="")
        {
            alert("Please enter correct value in no of benificieries/unit in  PMEGP scheme");
            document.getElementById("pmegp_no_of_beneficiary_per_unit_pre_month").focus();
            return false;
        }
        else if(document.keymprForm.pmegp_no_of_beneficiary_per_unit_pre_month_1.value==null || document.keymprForm.pmegp_no_of_beneficiary_per_unit_pre_month_1.value=="")
        {
            alert("Please enter correct value in no of benificieries/unit in  second field");
            document.getElementById("pmegp_no_of_beneficiary_per_unit_pre_month_1").focus();
            return false;
        }
}
            

