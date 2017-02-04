/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function fileSize(){
    var size = 1048576;
    $('#image_size_error').html("");
    var file_size = $('#account_image')[0].files[0].size;
    if(file_size > size){
        $('#image_size_error').html("File should not exceed 1mb");
        $('#image_size_error').css("font-weight", "bold");
        return false;
    }
    return true;
}

$(document).ready(function(){
    $.validator.addMethod("maxFile", function(value, element, params){
       var fileCount = element.files.length;
       if(fileCount > params){
           return false;
       }else{
           return true;
       }
   }, "Please select only 1 file");
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
            },
            account_image: {
                extension: "png|jpg|jpeg|gif",
                maxFile: 1
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
           },
           account_image: {
               extension: "Only image type jpeg, gif, jpg, or png is accepted"
           }
       }
   }); 
   
});