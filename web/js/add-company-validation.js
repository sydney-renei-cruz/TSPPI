/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$(document).ready(function(){
   $('#add-company-form').validate({
      errorClass: "my-error-class", 
      rules: {
          company_name: "required",
          company_branch: {
            required: true,
            remote: {
                url: 'checkcompanyname',
                type: 'post',
                data: {
                    'company_name' : function() { return $('input[name="company_name"]').val(); },
                    'company_branch' : function() { return $('input[name="company_branch"]').val(); }
                }

            }
          },
          company_telephone: {
                required: true,
                minlength: 7,
                maxlength: 11
          },
          street_line1: "required",
          spr: "required",
          city: "required",
          postal_code: "required",
          country: "required"
      },
      messages: {
          company_name: "Please enter the name of the company",
          company_branch: {
              required: "Please enter company branch",
              remote: "Company already exists"
          },
          street_line1: "Please enter Street Line",
          spr: "Please enter State/Province/Region",
          city: "Please enter City",
          postal_code: "Please enter ZIP/postal_code",
          country: "Please enter country"
      },
      submitHandler: function(form){
           $('input[type="submit"]').attr("disabled", true);
           form.submit();
       }
   }); 
});