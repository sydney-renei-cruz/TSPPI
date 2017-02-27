/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$(document).ready(function(){
//    $('.cart-form').submit(function(){
//        $(".err-msg").empty();
//        var $bool = checkItemStock($onhand, $stock);
//        var $data = "";
//        if($bool !== true){
//            $data = "<span/>";
//            $data.append($itemname + "'s quantity should not exceed the stock");
//            $(".err-msg").append($data);
//        }else{
//            $(".err-msg").empty();
//        }
//    });
    $('.cart-form').submit(function(e){
        var x = $('.special-container');
        $("#err-msg").empty();
        $(x).each(function(){
           var $quantity = $(this).find('input[name="quantity"]').val();
           var $stock = $(this).find('input[name="item_stock"]').val();
           var $name = $(this).find('input[name="item_name"]').val();
           if(parseInt($stock) < parseInt($quantity)){                           
                $("#err-msg").html("<strong>" + $name + "</strong>'s quantity should not exceed the stock.<br> Go back to cart and <strong>update</strong> the stock of the item.");
                e.preventDefault(); //prevent from submitting form
                return false; //break loop
                
           }
        });
    });
});