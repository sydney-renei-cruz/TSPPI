/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(document).ready(function(){
    
   $("#login-form").validate({
       submitHandler: function(form){
           $('input[type="submit"]').attr("disabled", true);
           form.submit();
       }
   }); 
   
});