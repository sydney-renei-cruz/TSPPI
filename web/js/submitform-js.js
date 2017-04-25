/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(document).ready(function(){
   $("#cmd-confirm").click(function(){
        document.getElementById("cart-form").submit();
    });
    
    $("#cmd-cancel").click(function(){
        document.getElementById("cancel-inv").submit();
    });
});