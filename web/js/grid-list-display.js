/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function() {
    $('.info').hide();
    $('.caption').addClass('text-center');
    $('#list').click(function(event){
        event.preventDefault();
        $('#products .item').addClass('list-group-item');
        $('.info').show();
        $('.caption').removeClass('text-center');
    });
    $('#grid').click(function(event){
        event.preventDefault();$('#products .item').removeClass('list-group-item');
        $('#products .item').addClass('grid-group-item');
        $('.info').hide();
        $('.caption').addClass('text-center');
    });
});