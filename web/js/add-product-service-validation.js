/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(document).ready(function(){
   $('#service-product-form').validate({
      errorClass: "my-error-class", 
      rules: {
          product_name: "required",
          msrp: "required",
          stock: "required",
          product_detail: "required",
          service_name: "required",
          service_description: "required"
      },
      messages: {
          product_name: "Please enter the name of the product",
          msrp: "Please enter the price of the product",
          stock: "Please enter the amount of stock of the product",
          product_detail: "Please enter the details about the product",
          service_name: "Please enter the name of the service",
          service_description: "Please enter the details about the service"
      }
   }); 
});