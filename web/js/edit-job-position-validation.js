/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function(){
    
   $('#edit-form').validate({
      errorClass: "my-error-class", 
      rules: {
          job_type: {
              remote:{
                  url: 'checkpositionname2', //EmailCheckerController
                   type: 'post',
                   data: {
                       'job_type': function() { return $('#job_type').val();}
                   }
              }
          }
      },
      messages: {
          job_type: {
              remote: "Job name already exists"
          }
      }
   });
});