/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$(document).ready(function(){
   $('#request-company-form').validate({
      errorClass: "my-error-class", 
      rules: {
          first_name: "required",
          last_name: "required",
          email: {
              required: true,
              email: true,
              gmailOnly: true
          },
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
          first_name: "Please enter your first name",
          last_name: "Please enter your last name",
          email: {
              required: "Please enter an email",
              email: "Please enter a valid email"
          },
          company_name: "Please enter company name",
          company_branch: {
              required: "Please enter company branch",
              remote: "Company already exists"
          },
          street_line1: "Please enter Street Line",
          spr: "Please enter State/Province/Region",
          city: "Please enter City",
          postal_code: "Please enter ZIP/postal_code",
          country: "Please enter country"
      }
   }); 
});