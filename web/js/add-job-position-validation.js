/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$(document).ready(function(){
   $('#add-job-form').validate({
      errorClass: "my-error-class", 
      rules: {
          job_type: {
              required: true,
              remote:{
                  url: 'checkpositionname', //EmailCheckerController
                   type: 'post',
                   data: {
                       'job_type': function() { return $('#job_type').val();}
                   }
              }
          },
          management_score: "required",
          sales_score: "required",
          inventory_score: "required"
      },
      messages: {
          job_type: {
              required: "Please enter the name of the job",
              remote: "Job name already exists"
          },
          management_score: "Please select yes or no",
          sales_score: "Please select yes or no",
          inventory_score: "Please select yes or no"
      }
   }); 
});