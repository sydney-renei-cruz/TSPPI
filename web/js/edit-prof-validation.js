/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(document).ready(function(){
   $("#register-form").validate({
       errorClass: "my-error-class",
       rules: {
            username: {
                required: true,
                minlength: 4
            },
            first_name: "required",
            last_name: "required",
            email: {
                required: true,
                email: true
            },
            mobile_number: {
                required: true,
                minlength: 11,
                maxlength: 11
            },
            telephone_number: {
                required: true,
                minlength: 7,
                maxlength: 11
            },
            address: "required"
       },
       messages: {
           username:{
               required: "Please enter a username",
               minlength: "Username must be atleast 4 characters"
           },
           first_name: "Plese enter your first name",
           last_name: "Please enter your last name",
           email: {
               required: "Please enter an email adress",
               email: "Please enter a valid email address"
           },
           mobile_number: {
               required: "Please enter mobile number",
               minlength: "Mobile number should be atleast 11 digits",
               maxlength: "Mobile number should not exceed 11 digits"
           },
           telephone_number: {
               required: "Please enter telephone number",
               minlength: "Telephone number should be atleast 7 digits",
               maxlength: "Telephone number should not exceed 11 digits"
           },
           address: "Please enter Mailing address"
       }
   }); 
});