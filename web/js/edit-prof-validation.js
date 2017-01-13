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
                minlength: 4,
                remote: {
                   url: 'checkusername2', //UsernameCheckerController
                   type: 'post',
                   data: {
                       'username': function() { return $('#username').val();}
                   }
               }
            },
            email: {
                email: true,
                remote: {
                   url: 'checkemail2', //EmailCheckerController
                   type: 'post',
                   data: {
                       'email': function() { return $('#email').val();}
                   }
               }
            },
            mobile_number: {
                minlength: 11,
                maxlength: 11
            },
            telephone_number: {
                minlength: 7,
                maxlength: 11
            }
       },
       messages: {
           username:{
               minlength: "Username must be atleast 4 characters",
               remote: "Username is already taken"
           },
           email: {
               email: "Please enter a valid email address",
               remote: "Email is already taken"
           },
           mobile_number: {
               minlength: "Mobile number should be atleast 11 digits",
               maxlength: "Mobile number should not exceed 11 digits"
           },
           telephone_number: {
               minlength: "Telephone number should be atleast 7 digits",
               maxlength: "Telephone number should not exceed 11 digits"
           }
       }
   }); 
});