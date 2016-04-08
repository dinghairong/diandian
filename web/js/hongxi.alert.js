function sAlert(txt){
//var eSrc=(document.all)?window.event.srcElement:arguments[1];
var shield = document.createElement("DIV");
shield.id = "shield";
shield.style.position = "fixed";
shield.style.left = "0px";
shield.style.top = "0px";
shield.style.width = "100%";
//shield.style.height = ((document.documentElement.clientHeight>document.documentElement.scrollHeight)?document.documentElement.clientHeight:document.documentElement.scrollHeight)+"px";
shield.style.height = "100%";
shield.style.background = "#333";
shield.style.textAlign = "center";
shield.style.zIndex = "9999999";
shield.style.filter = "alpha(opacity=0)";
shield.style.opacity = 0;
var alertFram = document.createElement("DIV");
alertFram.id="alertFram";
alertFram.style.position = "absolute";
alertFram.style.left = "50%";
alertFram.style.top = "50%";
alertFram.style.marginLeft = "-225px" ;
alertFram.style.marginTop = -100 + document.documentElement.scrollTop+"px";
alertFram.style.width = "450px";
alertFram.style.height = "150px";
alertFram.style.background = "#ccc"; 
alertFram.style.textAlign = "center";
alertFram.style.lineHeight = "150px";
alertFram.style.zIndex = "10000000";
strHtml   = "<ul style=\"list-style:none;margin:0px;padding:0px;width:100%\">\n";
strHtml += " <li style=\"background:#DD828D;text-align:left;padding-left:20px;font-size:14px;font-weight:bold;height:25px;line-height:25px;border:1px solid #F9CADE;\">[帮您养车网提醒您]<a style=\"float: right; right: 20px; position: relative; text-decoration: none;\" href=\"javascript:void(0)\" onclick=\"doOk()\">X</a></li>\n";
strHtml += " <li style=\"background:url('" + ctx + "/img/bg_alert.png') repeat scroll 0 0 #fff;text-align:center;font-size:16px;height:120px;line-height:120px;border-left:1px solid #F9CADE;border-right:1px solid #F9CADE;\">"+txt+"</li>\n";
//strHtml += " <li style=\"background:#fff;text-align:center;font-size:12px;height:120px;line-height:120px;border-left:1px solid #F9CADE;border-right:1px solid #F9CADE;\"><input type=\"text\" value=\"asdasdasdas\"   /></li>\n";
strHtml += " <li style=\"background:#FDEEF4;text-align:center;font-weight:bold;height:25px;line-height:25px; border:1px solid #F9CADE;\"><input type=\"button\" value=\"确  认\" id=\"do_OK\" onclick=\"doOk()\" /></li>\n";
strHtml += "</ul>\n";
alertFram.innerHTML = strHtml;
document.body.appendChild(alertFram);
document.body.appendChild(shield);
this.setOpacity = function(obj,opacity){
   if(opacity>=1)opacity=opacity/100;
   try{ obj.style.opacity=opacity; }catch(e){}
   try{ 
    if(obj.filters.length>0&&obj.filters("alpha")){
     obj.filters("alpha").opacity=opacity*100;
    }else{
     obj.style.filter="alpha(opacity=\""+(opacity*100)+"\")";
    }
   }catch(e){}
}
var c = 0;
this.doAlpha = function(){
   if (++c > 20){clearInterval(ad);return 0;}
   setOpacity(shield,c);
}
var ad = setInterval("doAlpha()",1);
this.doOk = function(){
   //alertFram.style.display = "none";
   //shield.style.display = "none";
   document.body.removeChild(alertFram);
   document.body.removeChild(shield);
   //eSrc.focus();
   document.body.onselectstart = function(){return true;}
   document.body.oncontextmenu = function(){return true;}
}
document.getElementById("do_OK").focus();
//eSrc.blur();
document.body.onselectstart = function(){return false;}
document.body.oncontextmenu = function(){return false;}
}

function sAlert2(txt,txt2){
//var eSrc=(document.all)?window.event.srcElement:arguments[1];
var shield = document.createElement("DIV");
shield.id = "shield";
shield.style.position = "fixed";
shield.style.left = "0px";
shield.style.top = "0px";
shield.style.width = "100%";
//shield.style.height = ((document.documentElement.clientHeight>document.documentElement.scrollHeight)?document.documentElement.clientHeight:document.documentElement.scrollHeight)+"px";
shield.style.height = "100%";
shield.style.background = "#333";
shield.style.textAlign = "center";
shield.style.zIndex = "9999999";
shield.style.filter = "alpha(opacity=0)";
shield.style.opacity = 0;
var alertFram = document.createElement("DIV");
alertFram.id="alertFram";
alertFram.style.position = "absolute";
alertFram.style.left = "50%";
alertFram.style.top = "50%";
alertFram.style.marginLeft = "-225px" ;
alertFram.style.marginTop = -100 + document.documentElement.scrollTop+"px";
alertFram.style.width = "450px";
alertFram.style.height = "150px";
alertFram.style.background = "#ccc"; 
alertFram.style.textAlign = "center";
alertFram.style.lineHeight = "150px";
alertFram.style.zIndex = "10000000";
strHtml   = "<ul style=\"list-style:none;margin:0px;padding:0px;width:100%\">\n";
strHtml += " <li style=\"background:#DD828D;text-align:left;padding-left:20px;font-size:14px;font-weight:bold;height:25px;line-height:25px;border:1px solid #F9CADE;\">[帮您养车网提醒您]<a style=\"float: right; right: 20px; position: relative; text-decoration: none;\" href=\"javascript:void(0)\" onclick=\"doOk()\">X</a></li>\n";
strHtml += " <li style=\"background:url('" + ctx + "/img/bg_alert.png') repeat scroll 0 0 #fff;text-align:center;font-size:16px;height:120px;line-height:120px;border-left:1px solid #F9CADE;border-right:1px solid #F9CADE;\">"+txt+"</li>\n";
//strHtml += " <li style=\"background:#fff;text-align:center;font-size:12px;height:120px;line-height:120px;border-left:1px solid #F9CADE;border-right:1px solid #F9CADE;\"><input type=\"text\" value=\"asdasdasdas\"   /></li>\n";
strHtml += " <li style=\"background:#FDEEF4;text-align:center;font-weight:bold;height:25px;line-height:25px; border:1px solid #F9CADE;\"><input type=\"button\" value=\"确  认\" id=\"do_OK\" onclick=\"doOk()\" /><input type=\"button\" value=\"取 消\" id=\"do_NO\" onclick=\"doNo()\" /></li>\n";
strHtml += "</ul>\n";
alertFram.innerHTML = strHtml;
document.body.appendChild(alertFram);
document.body.appendChild(shield);
this.setOpacity = function(obj,opacity){
   if(opacity>=1)opacity=opacity/100;
   try{ obj.style.opacity=opacity; }catch(e){}
   try{ 
    if(obj.filters.length>0&&obj.filters("alpha")){
     obj.filters("alpha").opacity=opacity*100;
    }else{
     obj.style.filter="alpha(opacity=\""+(opacity*100)+"\")";
    }
   }catch(e){}
}
var c = 0;
this.doAlpha = function(){
   if (++c > 20){clearInterval(ad);return 0;}
   setOpacity(shield,c);
}
var ad = setInterval("doAlpha()",1);
this.doOk = function(){
  window.open(txt2);
}
document.getElementById("do_OK").focus();

this.doNo = function(){
   //alertFram.style.display = "none";
   //shield.style.display = "none";
   document.body.removeChild(alertFram);
   document.body.removeChild(shield);
   //eSrc.focus();
   document.body.onselectstart = function(){return true;}
   document.body.oncontextmenu = function(){return true;}
}
document.getElementById("do_NO").focus();
//eSrc.blur();
document.body.onselectstart = function(){return false;}
document.body.oncontextmenu = function(){return false;}
}

function sAlert3(txt,txt2){
//var eSrc=(document.all)?window.event.srcElement:arguments[1];
var shield = document.createElement("DIV");
shield.id = "shield";
shield.style.position = "fixed";
shield.style.left = "0px";
shield.style.top = "0px";
shield.style.width = "100%";
//shield.style.height = ((document.documentElement.clientHeight>document.documentElement.scrollHeight)?document.documentElement.clientHeight:document.documentElement.scrollHeight)+"px";
shield.style.height = "100%";
shield.style.background = "#333";
shield.style.textAlign = "center";
shield.style.zIndex = "9999999";
shield.style.filter = "alpha(opacity=0)";
shield.style.opacity = 0;
var alertFram = document.createElement("DIV");
alertFram.id="alertFram";
alertFram.style.position = "absolute";
alertFram.style.left = "50%";
alertFram.style.top = "50%";
alertFram.style.marginLeft = "-225px" ;
alertFram.style.marginTop = -100 + document.documentElement.scrollTop+"px";
alertFram.style.width = "450px";
alertFram.style.height = "150px";
alertFram.style.background = "#ccc"; 
alertFram.style.textAlign = "center";
alertFram.style.lineHeight = "150px";
alertFram.style.zIndex = "10000000";
strHtml   = "<ul style=\"list-style:none;margin:0px;padding:0px;width:100%\">\n";
strHtml += " <li style=\"background:#DD828D;text-align:left;padding-left:20px;font-size:14px;font-weight:bold;height:25px;line-height:25px;border:1px solid #F9CADE;\">[帮您养车网提醒您]<a style=\"float: right; right: 20px; position: relative; text-decoration: none;\" href=\"javascript:void(0)\" onclick=\"doOk()\">X</a></li>\n";
strHtml += " <li style=\"background:url('" + ctx + "/img/bg_alert.png') repeat scroll 0 0 #fff;text-align:center;font-size:16px;height:120px;line-height:120px;border-left:1px solid #F9CADE;border-right:1px solid #F9CADE;\">"+txt+"</li>\n";
//strHtml += " <li style=\"background:#fff;text-align:center;font-size:12px;height:120px;line-height:120px;border-left:1px solid #F9CADE;border-right:1px solid #F9CADE;\"><input type=\"text\" value=\"asdasdasdas\"   /></li>\n";
strHtml += " <li style=\"background:#FDEEF4;text-align:center;font-weight:bold;height:25px;line-height:25px; border:1px solid #F9CADE;\"><input type=\"button\" value=\"确  认\" id=\"do_OK\" onclick=\"doOk()\" /></li>\n";
strHtml += "</ul>\n";
alertFram.innerHTML = strHtml;
document.body.appendChild(alertFram);
document.body.appendChild(shield);
this.setOpacity = function(obj,opacity){
   if(opacity>=1)opacity=opacity/100;
   try{ obj.style.opacity=opacity; }catch(e){}
   try{ 
    if(obj.filters.length>0&&obj.filters("alpha")){
     obj.filters("alpha").opacity=opacity*100;
    }else{
     obj.style.filter="alpha(opacity=\""+(opacity*100)+"\")";
    }
   }catch(e){}
}
var c = 0;
this.doAlpha = function(){
   if (++c > 20){clearInterval(ad);return 0;}
   setOpacity(shield,c);
}
var ad = setInterval("doAlpha()",1);

this.doOk = function(){
   //alertFram.style.display = "none";
   //shield.style.display = "none";
   document.body.removeChild(alertFram);
   document.body.removeChild(shield);
   //eSrc.focus();
   document.body.onselectstart = function(){return true;}
   document.body.oncontextmenu = function(){return true;}
   window.location.href = txt2;
}
document.getElementById("do_OK").focus();
//eSrc.blur();
document.body.onselectstart = function(){return false;}
document.body.oncontextmenu = function(){return false;}
}