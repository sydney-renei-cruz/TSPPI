/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function(){
    if($("#products .item").has('item-group-view')){
        $(".item").style.removeProperty('height');
    }else{
        equalHeight($(".item"));
    }
        
});

function equalHeight(group){
    var max_height = 0;
    group.each(function(){
        if ($(this).height() > max_height){
            max_height = $(this).height();
        } 
     });
    group.each(function(){
       $(this).height(max_height); 
    });
}