/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function(){
    $("input[name='quantity']").each(function(){
       $(this).tooltipster({
            trigger: 'custom',
            onlyOne: false,
            position: 'left'
         });
    });
   $(".cart-form").each(function(){
       
      $(this).validate({
        rules: {
            quantity: {
                required: true,
                min: 1,
                remote: {
                    url: "checkstock",
                    type: "post",
                    data: {
                        'item_number': function() { return $(".item_number").val(); },
                        'quantity': function() { return $(".quantity").val(); }
                    }
                }
            }

        },
        messages: {
            quantity: {
                required: "This field is required",
                min: "Quantity should not be below 1",
                remote: "Quantity should not exceed the current stock."
            }
        },
        errorPlacement: function(error, element){
            var lastError = $(element).data('lastError'),
                newError = $(error).text();

            $(element).data('lastError', newError);

            if(newError !== '' && newError !== lastError){
                $(element).tooltipster('content', newError);
                $(element).tooltipster('show');
            }
        },
        success: function(label, element){
            $(element).tooltipster('hide');
        }
//            showErrors: function(errorMap, errorList){
//                this.defaultShowErrors();
//                
//                $("." + this.settings.validClass).tooltip("destroy");
//                
//                for(var i=0; i<errorList.length; i++){
//                    var error = errorList[i];
//                    $("#" + error.element.id).tooltip({trigger: "focus"}).attr("data-original-title", error.message);
//                }
//            },
      }); 
   });
});
