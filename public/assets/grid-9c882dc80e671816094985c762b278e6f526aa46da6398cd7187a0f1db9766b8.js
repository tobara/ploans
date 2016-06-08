/*
* debouncedresize: special jQuery event that happens once after a window resize
*
* latest version and complete README available on Github:
* https://github.com/louisremi/jquery-smartresize/blob/master/jquery.debouncedresize.js
*
* Copyright 2011 @louis_remi
* Licensed under the MIT license.
*/
var $event=$.event,$special,resizeTimeout;$special=$event.special.debouncedresize={setup:function(){$(this).on("resize",$special.handler)},teardown:function(){$(this).off("resize",$special.handler)},handler:function(i,e){var t=this,n=arguments,s=function(){i.type="debouncedresize",$event.dispatch.apply(t,n)};resizeTimeout&&clearTimeout(resizeTimeout),e?s():resizeTimeout=setTimeout(s,$special.threshold)},threshold:250};var BLANK="data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///ywAAAAAAQABAAACAUwAOw==";$.fn.imagesLoaded=function(i){function e(){var e=$(o),t=$(d);s&&(d.length?s.reject(h,e,t):s.resolve(h)),$.isFunction(i)&&i.call(n,h,e,t)}function t(i,t){i.src!==BLANK&&-1===$.inArray(i,r)&&(r.push(i),t?d.push(i):o.push(i),$.data(i,"imagesLoaded",{isBroken:t,src:i.src}),a&&s.notifyWith($(i),[t,h,$(o),$(d)]),h.length===r.length&&(setTimeout(e),h.unbind(".imagesLoaded")))}var n=this,s=$.isFunction($.Deferred)?$.Deferred():0,a=$.isFunction(s.notify),h=n.find("img").add(n.filter("img")),r=[],o=[],d=[];return $.isPlainObject(i)&&$.each(i,function(e,t){"callback"===e?i=t:s&&s[e](t)}),h.length?h.bind("load.imagesLoaded error.imagesLoaded",function(i){t(i.target,"error"===i.type)}).each(function(i,e){var n=e.src,s=$.data(e,"imagesLoaded");return s&&s.src===n?void t(e,s.isBroken):e.complete&&void 0!==e.naturalWidth?void t(e,0===e.naturalWidth||0===e.naturalHeight):void((e.readyState||e.complete)&&(e.src=BLANK,e.src=n))}):e(),s?s.promise(n):n};var Grid=function(){function i(i){x=$.extend(!0,{},x,i),c.imagesLoaded(function(){t(!0),a(),n()})}function e(i){l=l.add(i),i.each(function(){var i=$(this);i.data({offsetTop:i.offset().top,height:i.height()})}),s(i)}function t(i){l.each(function(){var e=$(this);e.data("offsetTop",e.offset().top),i&&e.data("height",e.height())})}function n(){s(l),m.on("debouncedresize",function(){p=0,f=-1,t(),a();var i=$.data(this,"preview");"undefined"!=typeof i&&r()})}function s(i){i.on("click","span.og-close",function(){return r(),!1}).children("a").on("click",function(){var i=$(this).parent();return g===i.index()?r():h(i),!1})}function a(){d={width:m.width(),height:m.height()}}function h(i){var e=$.data(this,"preview"),t=i.data("offsetTop");if(p=0,"undefined"!=typeof e){if(f===t)return e.update(i),!1;t>f&&(p=e.height),r()}f=t,e=$.data(this,"preview",new o(i)),e.open()}function r(){g=-1;var i=$.data(this,"preview");i.close(),$.removeData(this,"preview")}function o(i){this.$item=i,this.expandedIdx=this.$item.index(),this.create(),this.update()}var d,c=$("#og-grid"),l=c.children("li"),g=-1,f=-1,p=0,u=10,m=$(window),v=$("html, body"),w={WebkitTransition:"webkitTransitionEnd",MozTransition:"transitionend",OTransition:"oTransitionEnd",msTransition:"MSTransitionEnd",transition:"transitionend"},A=w[Modernizr.prefixed("transition")],T=Modernizr.csstransitions,x={minHeight:500,speed:350,easing:"ease"};return o.prototype={create:function(){this.$title=$("<h3></h3>"),this.$description=$("<p></p>"),this.$href=$('<a href="#">Visit website</a>'),this.$details=$('<div class="og-details"></div>').append(this.$title,this.$description,this.$href),this.$loading=$('<div class="og-loading"></div>'),this.$fullimage=$('<div class="og-fullimg"></div>').append(this.$loading),this.$closePreview=$('<span class="og-close"></span>'),this.$previewInner=$('<div class="og-expander-inner"></div>').append(this.$closePreview,this.$fullimage,this.$details),this.$previewEl=$('<div class="og-expander"></div>').append(this.$previewInner),this.$item.append(this.getEl()),T&&this.setTransition()},update:function(i){if(i&&(this.$item=i),-1!==g){var e=l.eq(g);e.removeClass("og-expanded"),this.$item.addClass("og-expanded"),this.positionPreview()}g=this.$item.index();var t=this.$item.children("a"),n={href:t.attr("href"),largesrc:t.data("largesrc"),title:t.data("title"),description:t.data("description")};this.$title.html(n.title),this.$description.html(n.description),this.$href.attr("href",n.href);var s=this;"undefined"!=typeof s.$largeImg&&s.$largeImg.remove(),s.$fullimage.is(":visible")&&(this.$loading.show(),$("<img/>").load(function(){var i=$(this);i.attr("src")===s.$item.children("a").data("largesrc")&&(s.$loading.hide(),s.$fullimage.find("img").remove(),s.$largeImg=i.fadeIn(350),s.$fullimage.append(s.$largeImg))}).attr("src",n.largesrc))},open:function(){setTimeout($.proxy(function(){this.setHeights(),this.positionPreview()},this),25)},close:function(){var i=this,e=function(){T&&$(this).off(A),i.$item.removeClass("og-expanded"),i.$previewEl.remove()};return setTimeout($.proxy(function(){"undefined"!=typeof this.$largeImg&&this.$largeImg.fadeOut("fast"),this.$previewEl.css("height",0);var i=l.eq(this.expandedIdx);i.css("height",i.data("height")).on(A,e),T||e.call()},this),25),!1},calcHeight:function(){var i=d.height-this.$item.data("height")-u,e=d.height;i<x.minHeight&&(i=x.minHeight,e=x.minHeight+this.$item.data("height")+u),this.height=i,this.itemHeight=e},setHeights:function(){var i=this,e=function(){T&&i.$item.off(A),i.$item.addClass("og-expanded")};this.calcHeight(),this.$previewEl.css("height",this.height),this.$item.css("height",this.itemHeight).on(A,e),T||e.call()},positionPreview:function(){var i=this.$item.data("offsetTop"),e=this.$previewEl.offset().top-p,t=this.height+this.$item.data("height")+u<=d.height?i:this.height<d.height?e-(d.height-this.height):e;v.animate({scrollTop:t},x.speed)},setTransition:function(){this.$previewEl.css("transition","height "+x.speed+"ms "+x.easing),this.$item.css("transition","height "+x.speed+"ms "+x.easing)},getEl:function(){return this.$previewEl}},{init:i,addItems:e}}();