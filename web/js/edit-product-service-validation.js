/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function fileSize(){
    var size = 1048576;
    $('#image_size_error').html("");
    var file_size = $('#product_service_image')[0].files[0].size;
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
   $('#edit-form').validate({
      errorClass: "my-error-class", 
      rules: {
          msrp: {
              min: 1
          },
          stock: {
              min: 1
          },
          product_image: {
              extension: "png|jpg|jpeg|gif",
              maxFile: 1
          },
          service_image: {
              extension: "png|jpg|jpeg|gif",
              maxFile: 1
          },
          category_name: {
            remote:{
                url: 'checkcategoryname2', //EmailCheckerController
                type: 'post',
                data: {
                    'category_name': function() { return $('#category_name').val();}
                }
            }
          },
          payment_method: {
            remote:{
                url: 'checkmethodname2', //EmailCheckerController
                type: 'post',
                data: {
                    'payment_method': function() { return $('#payment_method').val();}
                }
            }
          }
      },
      messages: {
           msrp: {
               min: "No 0 or negative number please"  
           },
           stock: {
               min: "No 0 or negative number please"
           },   
           product_image: {
               extension: "Only image type jpeg, gif, jpg, or png is accepted"
           },
           service_image: {
               extension: "Only image type jpeg, gif, jpg, or png is accepted"
           },
           category_name: {
               remote: "Category name already exists"
           },
           payment_method: {
               remote: "Method name already exists"
           }
      }
   }); 
});