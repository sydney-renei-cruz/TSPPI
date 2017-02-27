/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

//function maxStock(){
//    
//    $('.stock_error').html("");
//    var $stock = $('.cart-form').find('input[name="item_stock"]').val();
//    var $quantity = $('.cart-form').find('input[name="quantity"]').val();
//    if($stock < $quantity){
//        $('.stock_error').html("Quantity should not exceed stock on hand");
//        $('.stock_error').css("font-weight", "bold");
//        return false;
//    }else{
//        $('.stock_error').html("");
//        return true; 
//    }
//    
//    return true;
//}

$(document).ready(function(){
    $.validator.addMethod("max_stock", function(value, element){
        var $stock = $('.cart-element').find('input[name="item_stock"]').val();
        return this.optional(element) || ($stock > parseInt(value));
    }, "Quantity should not exceed stock on hand");
   $(".cart-form").each(function(){
      $(this).validate({
        errorClass: "my-error-class",
        rules: {
            quantity: {
                required: true,
                min: 1,
                max_stock: true
            }
        },
        messages: {
            quantity: {
                required: "This field is required",
                min: "Quantity should not be below 1"
            }
        }
      }); 
   });
});
