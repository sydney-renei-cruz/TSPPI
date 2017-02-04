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
   $('#service-product-form').validate({
      errorClass: "my-error-class", 
      rules: {
          product_name: "required",
          msrp: {
              required: true,
              min: 1
          },
          stock: {
              required: true,
              min: 1
          },
          product_detail: "required",
          service_name: "required",
          service_description: "required",
          product_image: {
                required: true,
                extension: "png|jpg|jpeg|gif",
                maxFile: 1
            },
        service_image: {
            required: true,
            extension: "png|jpg|jpeg|gif",
            maxFile: 1
        }
      },
      messages: {
          product_name: "Please enter the name of the product",
          msrp: {
            required: "Please enter the price of the product",
            min: "No 0 or negative number please"
          },
          stock: {
              required: "Please enter the amount of stock of the product",
              min: "No 0 or negative number please"
          },
          product_detail: "Please enter the details about the product",
          service_name: "Please enter the name of the service",
          service_description: "Please enter the details about the service",
           product_image: {
               required: "Please select an image for you profile",
               extension: "Only image type jpeg, gif, jpg, or png is accepted"
           },
           service_image: {
               required: "Please select an image for you profile",
               extension: "Only image type jpeg, gif, jpg, or png is accepted"
           }
      }
   }); 
});