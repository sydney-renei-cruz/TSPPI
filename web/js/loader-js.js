/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function createCookie(name,value,days) {
    var expires = "";
    if (days) {
        var date = new Date();
        date.setTime(date.getTime() + (days*24*60*60*1000));
        expires = "; expires=" + date.toUTCString();
    }
    document.cookie = name + "=" + value + expires + "; path=/";
}

function getCookie(cname) {
    var name = cname + "=";
    var decodedCookie = decodeURIComponent(document.cookie);
    var ca = decodedCookie.split(';');
    for(var i = 0; i < ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0) == ' ') {
            c = c.substring(1);
        }
        if (c.indexOf(name) == 0) {
            return c.substring(name.length, c.length);
        }
    }
    return "";
}

function eraseCookie(name) {
    createCookie(name,"",-1);
}

function acctAct(){
    var mssgStatus=getCookie("mssgStatus");
    
    if (mssgStatus == 1){
        $("#mssg-body").text("Account activated");
        document.getElementById("mssgBox").style.display = "block";
    }else if(mssgStatus == 2){
        $("#mssg-body").text("Account deactivated");
        document.getElementById("mssgBox").style.display = "block";
    }
    
    deleteCookie("mssgStatus");
}

function privAdd(){
    var mssgStatus=getCookie("mssgStatus");
    
    if (mssgStatus == 1){
        $("#mssg-body").text("Priviliges has been added.");
        document.getElementById("mssgBox").style.display = "block";
    }else if(mssgStatus == 2){
        $("#mssg-body").text("Privilege has been removed.");
        document.getElementById("mssgBox").style.display = "block";
    }
    deleteCookie("mssgStatus");
}

function prodAdd(){
    var mssgStatus=getCookie("mssgStatus");
    
    if (mssgStatus == 1){
        $("#mssg-body").text("New product added to database.");
        document.getElementById("mssgBox").style.display = "block";
    }
    deleteCookie("mssgStatus");
}

function servAdd(){
    var mssgStatus=getCookie("mssgStatus");
    
    if (mssgStatus == 1){
        $("#mssg-body").text("New service added to database.");
        document.getElementById("mssgBox").style.display = "block";
    }
    deleteCookie("mssgStatus");
}

function prodCat(){
    var mssgStatus=getCookie("mssgStatus");
    
    if (mssgStatus == 1){
        $("#mssg-body").text("New product category added to database.");
        document.getElementById("mssgBox").style.display = "block";
    }
    deleteCookie("mssgStatus");
}

function removeProd(){
    var mssgStatus=getCookie("mssgStatus");
    
    if (mssgStatus == "false"){
        $("#mssg-body").text("Product removed from for-sale list.");
        document.getElementById("mssgBox").style.display = "block";
    }
    if (mssgStatus == "true"){
        $("#mssg-body").text("Product added to for-sale list.");
        document.getElementById("mssgBox").style.display = "block";
    }
}

function removeProdCat(){
    var mssgStatus=getCookie("mssgStatus");
    
    if (mssgStatus == "false"){
        $("#mssg-body").text("Product category removed.");
        document.getElementById("mssgBox").style.display = "block";
    }
    if (mssgStatus == "true"){
        $("#mssg-body").text("Product category added.");
        document.getElementById("mssgBox").style.display = "block";
    }
}

function editVis(){
    var mssgStatus=getCookie("visStatus");
    
    if (mssgStatus == "true"){
        $("#mssg-body").text("Job position has been hidden.");
        document.getElementById("mssgBox").style.display = "block";
    }else if(mssgStatus == "false"){
        $("#mssg-body").text("Job position is shown.");
        document.getElementById("mssgBox").style.display = "block";
    }
    deleteCookie("visStatus");
}

function confirmInv(){
    var mssgStatus=getCookie("reqMssg");
    
    if (mssgStatus == "yes"){
        $("#mssg-body").text("You have approved an invoice.");
        document.getElementById("mssgBox").style.display = "block";
    }else if(mssgStatus == "no"){
        $("#mssg-body").text("You have rejected an invoice.");
        document.getElementById("mssgBox").style.display = "block";
    }else if(mssgStatus == "delivery"){
        $("#mssg-body").text("Invoice is being delivered.");
        document.getElementById("mssgBox").style.display = "block";
    }
    deleteCookie("visStatus");
}

function jobAdd(){
    var mssgStatus=getCookie("regMssg");
    
    if (mssgStatus == 1){
        $("#mssg-body").text("Job Position created.");
        document.getElementById("mssgBox").style.display = "block";
    }
    deleteCookie("regMssg");
}

function regSuccess(){
    var mssgStatus=getCookie("regMssg");
    
    if (mssgStatus == 1){
        $("#mssg-body").text("Registration complete");
        document.getElementById("mssgBox").style.display = "block";
    }
    deleteCookie("regMssg");
}

function payAddSuccess(){
    var mssgStatus=getCookie("regMssg");
    
    if (mssgStatus == 1){
        $("#mssg-body").text("Payment method added.");
        document.getElementById("mssgBox").style.display = "block";
    }
    deleteCookie("regMssg");
}

function editPayVis(){
    var mssgStatus=getCookie("visStatus");
    
    if (mssgStatus == "false"){
        $("#mssg-body").text("Payment Method has been hidden.");
        document.getElementById("mssgBox").style.display = "block";
    }else if(mssgStatus == "true"){
        $("#mssg-body").text("Payment Method is shown.");
        document.getElementById("mssgBox").style.display = "block";
    }
    deleteCookie("visStatus");
}

function editSuccess(){
    var mssgStatus=getCookie("editMssg");
    
    if (mssgStatus == 1){
        $("#mssg-body").text("Your changes have been saved.");
        document.getElementById("mssgBox").style.display = "block";
    }
    deleteCookie("editMssg");
}

function deleteCookie(name){
    createCookie(name, "cleared", 0);
}