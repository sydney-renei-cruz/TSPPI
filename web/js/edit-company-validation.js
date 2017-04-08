/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$(document).ready(function(){
   $('#edit-company-form').validate({
      errorClass: "my-error-class", 
      rules: {
          company_branch: {
              remote:{
                  url: 'checkcompanyname2',
                   type: 'post',
                   data: {
                       'company_name' : function() { return $('input[name="company_name"]').val(); },
                       'company_branch' : function() { return $('input[name="company_branch"]').val(); }
                   }
              }
          }
      },
      messages: {
          company_branch: {
              remote: "Company already exists"
          }
      }
   }); 
});

