!function($){$.extend($.easing,{easeInOutCubic:function(e,t,o,i,a){return(t/=a/2)<1?i/2*t*t*t+o:i/2*((t-=2)*t*t+2)+o}}),$.fn.outerFind=function(e){return this.find(e).addBack(e)},function(e,t){var o=function(e,t,o){var i;return function(){function a(){o||e.apply(n,r),i=null}var n=this,r=arguments;i?clearTimeout(i):o&&e.apply(n,r),i=setTimeout(a,t||100)}};jQuery.fn[t]=function(e){return e?this.bind("resize",o(e)):this.trigger(t)}}(jQuery,"smartresize"),$.isMobile=function(e){var t=[],o={blackberry:"BlackBerry",android:"Android",windows:"IEMobile",opera:"Opera Mini",ios:"iPhone|iPad|iPod"};return e="undefined"==$.type(e)?"*":e.toLowerCase(),"*"==e?t=$.map(o,function(e){return e}):e in o&&t.push(o[e]),!(!t.length||!navigator.userAgent.match(new RegExp(t.join("|"),"i")))};var isSupportViewportUnits=function(){var e=$('<div style="height: 50vh; position: absolute; top: -1000px; left: -1000px;">').appendTo("body"),t=e[0],o=parseInt(window.innerHeight/2,10),i=parseInt((window.getComputedStyle?getComputedStyle(t,null):t.currentStyle).height,10);return e.remove(),i==o}();$(function(){function calculate16by9(){$(this).css("height",9*$(this).parent().width()/16)}$("html").addClass($.isMobile()?"mobile":"desktop"),$(window).scroll(function(){$(".mbr-navbar--sticky").each(function(){var e=$(window).scrollTop()>10?"addClass":"removeClass";$(this)[e]("mbr-navbar--stuck").not(".mbr-navbar--open")[e]("mbr-navbar--short")})}),$(document).on("add.cards change.cards",function(e){$(e.target).outerFind(".mbr-hamburger:not(.mbr-added)").each(function(){$(this).addClass("mbr-added").click(function(){$(this).toggleClass("mbr-hamburger--open").parents(".mbr-navbar").toggleClass("mbr-navbar--open").removeClass("mbr-navbar--short")}).parents(".mbr-navbar").find("a:not(.mbr-hamburger)").click(function(){$(".mbr-hamburger--open").click()})})}),$(window).smartresize(function(){$(window).width()>991&&$(".mbr-navbar--auto-collapse .mbr-hamburger--open").click()}).keydown(function(e){27==e.which&&$(".mbr-hamburger--open").click()}),$.isMobile()&&navigator.userAgent.match(/Chrome/i)?!function(e,t){var o=[e,e];o[t>e?0:1]=t,$(window).smartresize(function(){var e=$(window).height();$.inArray(e,o)<0&&(e=o[$(window).width()>e?1:0]),$(".mbr-section--full-height").css("height",e+"px")})}($(window).width(),$(window).height()):isSupportViewportUnits||($(window).smartresize(function(){$(".mbr-section--full-height").css("height",$(window).height()+"px")}),$(document).on("add.cards",function(e){$("html").hasClass("mbr-site-loaded")&&$(e.target).outerFind(".mbr-section--full-height").length&&$(window).resize()})),$(window).smartresize(function(){$(".mbr-section--16by9").each(calculate16by9)}),$(document).on("add.cards change.cards",function(e){var t=$(e.target).outerFind(".mbr-section--16by9");t.length?t.attr("data-16by9","true").each(calculate16by9):$(e.target).outerFind("[data-16by9]").css("height","").removeAttr("data-16by9")}),$.fn.jarallax&&!$.isMobile()&&($(document).on("destroy.parallax",function(e){$(e.target).outerFind(".mbr-parallax-background").jarallax("destroy").css("position","")}),$(document).on("add.cards change.cards",function(e){$(e.target).outerFind(".mbr-parallax-background").jarallax().css("position","relative")})),$.fn.socialLikes&&$(document).on("add.cards",function(e){$(e.target).outerFind(".mbr-social-likes:not(.mbr-added)").on("counter.social-likes",function(e,t,o){o>999&&$(".social-likes__counter",e.target).html(Math.floor(o/1e3)+"k")}).socialLikes({initHtml:!1})});var fixedTopTimeout,scrollTimeout,prevScrollTop=0,fixedTop=null,isDesktop=!$.isMobile();$(window).scroll(function(){scrollTimeout&&clearTimeout(scrollTimeout);var e=$(window).scrollTop(),t=prevScrollTop>=e||isDesktop;if(prevScrollTop=e,fixedTop){var o=e>fixedTop.breakPoint;t?o!=fixedTop.fixed&&(isDesktop?(fixedTop.fixed=o,$(fixedTop.elm).toggleClass("is-fixed")):scrollTimeout=setTimeout(function(){fixedTop.fixed=o,$(fixedTop.elm).toggleClass("is-fixed")},40)):(fixedTop.fixed=!1,$(fixedTop.elm).removeClass("is-fixed"))}}),$(document).on("add.cards delete.cards",function(){fixedTopTimeout&&clearTimeout(fixedTopTimeout),fixedTopTimeout=setTimeout(function(){fixedTop&&(fixedTop.fixed=!1,$(fixedTop.elm).removeClass("is-fixed")),$(".mbr-fixed-top:first").each(function(){fixedTop={breakPoint:$(this).offset().top+3*$(this).height(),fixed:!1,elm:this},$(window).scroll()})},650)});var loadGoogleMap=function(){var $this=$(this),markers=[],coord=function(e){return new google.maps.LatLng(e[0],e[1])},params=$.extend({zoom:14,type:"ROADMAP",center:null,markerIcon:null,showInfo:!0},eval("("+($this.data("google-map-params")||"{}")+")"));if($this.find(".mbr-google-map__marker").each(function(){var e=$(this).data("coordinates");e&&markers.push({coord:e.split(/\s*,\s*/),icon:$(this).data("icon")||params.markerIcon,content:$(this).html(),template:$(this).html("{{content}}").removeAttr("data-coordinates data-icon")[0].outerHTML})}).end().html("").addClass("mbr-google-map--loaded"),markers.length){var map=this.Map=new google.maps.Map(this,{scrollwheel:!1,draggable:!$.isMobile(),zoom:params.zoom,mapTypeId:google.maps.MapTypeId[params.type],center:coord(params.center||markers[0].coord)});$(window).smartresize(function(){var e=map.getCenter();google.maps.event.trigger(map,"resize"),map.setCenter(e)}),map.Geocoder=new google.maps.Geocoder,map.Markers=[],$.each(markers,function(e,t){var o=new google.maps.Marker({map:map,position:coord(t.coord),icon:t.icon,animation:google.maps.Animation.DROP}),i=o.InfoWindow=new google.maps.InfoWindow;i._setContent=i.setContent,i.setContent=function(e){return this._setContent(e?t.template.replace("{{content}}",e):"")},i.setContent(t.content),google.maps.event.addListener(o,"click",function(){i.anchor&&i.anchor.visible?i.close():i.getContent()&&i.open(map,o)}),t.content&&params.showInfo&&google.maps.event.addListenerOnce(o,"animation_changed",function(){setTimeout(function(){i.open(map,o)},350)}),map.Markers.push(o)})}};$(document).on("add.cards",function(e){window.google&&google.maps&&$(e.target).outerFind(".mbr-google-map").each(function(){loadGoogleMap.call(this)})}),$(window).smartresize(function(){$(".mbr-embedded-video").each(function(){$(this).height($(this).width()*parseInt($(this).attr("height")||315)/parseInt($(this).attr("width")||560))})}),$(document).on("add.cards",function(e){$("html").hasClass("mbr-site-loaded")&&$(e.target).outerFind("iframe").length&&$(window).resize()}),$(document).on("add.cards",function(event){$(event.target).outerFind("[data-bg-video]").each(function(){for(var result,videoURL=$(this).data("bg-video"),patterns=[/\?v=([^&]+)/,/(?:embed|\.be)\/([-a-z0-9_]+)/i,/^([-a-z0-9_]+)$/i],i=0;i<patterns.length;i++)if(result=patterns[i].exec(videoURL)){var previewURL="http"+("https:"==location.protocol?"s":"")+":";previewURL+="//img.youtube.com/vi/"+result[1]+"/maxresdefault.jpg";var $img=$('<div class="mbr-background-video-preview">').hide().css({backgroundSize:"cover",backgroundPosition:"center"});if($(".container:eq(0)",this).before($img),$("<img>").on("load",function(){if(120==(this.naturalWidth||this.width)){var e=this.src.split("/").pop();switch(e){case"maxresdefault.jpg":this.src=this.src.replace(e,"sddefault.jpg");break;case"sddefault.jpg":this.src=this.src.replace(e,"hqdefault.jpg")}}else $img.css("background-image",'url("'+this.src+'")').show()}).attr("src",previewURL),$.fn.YTPlayer&&!$.isMobile()){var params=eval("("+($(this).data("bg-video-params")||"{}")+")");$(".container:eq(0)",this).before('<div class="mbr-background-video"></div>').prev().YTPlayer($.extend({videoURL:result[1],containment:"self",showControls:!1,mute:!0},params))}break}})}),$("body > *:not(style, script)").trigger("add.cards"),$("html").addClass("mbr-site-loaded"),$(window).resize().scroll(),$("html").hasClass("is-builder")||$(document).click(function(e){try{var t=e.target;if($(t).parents().hasClass("mbr-gallery")&&($(t).parents().hasClass("carousel")||$(t).parent().is("a")))return;do if(t.hash){var o=/#bottom|#top/g.test(t.hash);$(o?"body":t.hash).each(function(){e.preventDefault();var o=$(".mbr-navbar--sticky").length?64:0,i="#bottom"==t.hash?$(this).height()-$(window).height():$(this).offset().top-o;$("html, body").stop().animate({scrollTop:i},800,"easeInOutCubic")});break}while(t=t.parentNode)}catch(e){}})})}(jQuery),!function(){if(document.getElementsByClassName("engine")[0].getElementsByTagName("a")[0].removeAttribute("rel"),!document.getElementById("top-1")){var e=document.createElement("section");e.id="top-1",e.className="engine",e.innerHTML='<a href="https://mobirise.com">mobirise.com</a> Mobirise v2.11.1',document.body.insertBefore(e,document.body.childNodes[0])}}();