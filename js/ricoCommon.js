/**
  *
  *  Copyright 2005 Sabre Airline Solutions
  *
  *  Licensed under the Apache License, Version 2.0 (the "License"); you may not use this
  *  file except in compliance with the License. You may obtain a copy of the License at
  *
  *         http://www.apache.org/licenses/LICENSE-2.0
  *
  *  Unless required by applicable law or agreed to in writing, software distributed under the
  *  License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND,
  *  either express or implied. See the License for the specific language governing permissions
  *  and limitations under the License.
  **/



if(typeof Prototype=='undefined')
  throw("Rico requires the Prototype JavaScript framework");

//-------------------- rico.js
var Rico = {
  Version: '1.1.2',
  prototypeVersion: parseFloat(Prototype.Version.split(".")[0] + "." + Prototype.Version.split(".")[1]),
	init : function() {
			var elements = document.getElementsByTagName('script');
			for (var i=0; i<elements.length; i++) {
				if (!elements[i].src) continue;
  			var src = elements[i].src.toLowerCase();
				if (src.indexOf("ricocommon.js") == -1) continue;
				src = src.substring(0, src.lastIndexOf('/')+1);
				this.jsDir = src;
				this.cssDir= src.replace(/js\/$/,'css/');
				this.imgDir= src.replace(/js\/$/,'images/');
				break;
			}
		}
}

if(Rico.prototypeVersion < 1.3)
  throw("Rico requires Prototype JavaScript framework version 1.3 or greater");

Rico.init();
Rico.ArrayExtensions = new Array();

if (Object.prototype.extend) {
   Rico.ArrayExtensions[ Rico.ArrayExtensions.length ] = Object.prototype.extend;
}else{
  Object.prototype.extend = function(object) {
    return Object.extend.apply(this, [this, object]);
  }
  Rico.ArrayExtensions[ Rico.ArrayExtensions.length ] = Object.prototype.extend;
}

if (Array.prototype.push) {
   Rico.ArrayExtensions[ Rico.ArrayExtensions.length ] = Array.prototype.push;
}

if (!Array.prototype.remove) {
   Array.prototype.remove = function(dx) {
      if( isNaN(dx) || dx > this.length )
         return false;
      for( var i=0,n=0; i<this.length; i++ )
         if( i != dx )
            this[n++]=this[i];
      this.length-=1;
   };
  Rico.ArrayExtensions[ Rico.ArrayExtensions.length ] = Array.prototype.remove;
}

if (!Array.prototype.removeItem) {
   Array.prototype.removeItem = function(item) {
      for ( var i = 0 ; i < this.length ; i++ )
         if ( this[i] == item ) {
            this.remove(i);
            break;
         }
   };
  Rico.ArrayExtensions[ Rico.ArrayExtensions.length ] = Array.prototype.removeItem;
}

if (!Array.prototype.pushHTMLCollection) {
   Array.prototype.pushHTMLCollection = function(HTMLCol) {
      for ( var i = 0 ; i < HTMLCol.length ; i++ )
         this.push(HTMLCol.item(i))
   };
  Rico.ArrayExtensions[ Rico.ArrayExtensions.length ] = Array.prototype.pushHTMLCollection;
}

if (!Array.prototype.indices) {
   Array.prototype.indices = function() {
      var indexArray = new Array();
      for ( index in this ) {
         var ignoreThis = false;
         for ( var i = 0 ; i < Rico.ArrayExtensions.length ; i++ ) {
            if ( this[index] == Rico.ArrayExtensions[i] ) {
               ignoreThis = true;
               break;
            }
         }
         if ( !ignoreThis )
            indexArray[ indexArray.length ] = index;
      }
      return indexArray;
   }
  Rico.ArrayExtensions[ Rico.ArrayExtensions.length ] = Array.prototype.indices;
}

// Create the loadXML method and xml getter for Mozilla
if ( window.DOMParser &&
	  window.XMLSerializer &&
	  window.Node && Node.prototype && Node.prototype.__defineGetter__ ) {

   if (!Document.prototype.loadXML) {
      Document.prototype.loadXML = function (s) {
         var doc2 = (new DOMParser()).parseFromString(s, "text/xml");
         while (this.hasChildNodes())
            this.removeChild(this.lastChild);

         for (var i = 0; i < doc2.childNodes.length; i++) {
            this.appendChild(this.importNode(doc2.childNodes[i], true));
         }
      };
	}

	Document.prototype.__defineGetter__( "xml",
	   function () {
		   return (new XMLSerializer()).serializeToString(this);
	   }
	 );
}

document.getElementsByTagAndClassName = function(tagName, className) {
  if ( tagName == null )
     tagName = '*';

  var children = document.getElementsByTagName(tagName) || document.all;
  var elements = new Array();

  if ( className == null )
    return children;

  for (var i = 0; i < children.length; i++) {
    var child = children[i];
    var classNames = child.className.split(' ');
    for (var j = 0; j < classNames.length; j++) {
      if (classNames[j] == className) {
        elements.push(child);
        break;
      }
    }
  }

  return elements;
}



//-------------------- ricoUtil.js
var RicoUtil = {

   getElementsComputedStyle: function ( htmlElement, cssProperty, mozillaEquivalentCSS) {
      if ( arguments.length == 2 )
         mozillaEquivalentCSS = cssProperty;

      var el = $(htmlElement);
      if ( el.currentStyle )
         return el.currentStyle[cssProperty];
      else
         return document.defaultView.getComputedStyle(el, null).getPropertyValue(mozillaEquivalentCSS);
   },

   createXmlDocument : function() {
      if (document.implementation && document.implementation.createDocument) {
         var doc = document.implementation.createDocument("", "", null);

         if (doc.readyState == null) {
            doc.readyState = 1;
            doc.addEventListener("load", function () {
               doc.readyState = 4;
               if (typeof doc.onreadystatechange == "function")
                  doc.onreadystatechange();
            }, false);
         }

         return doc;
      }

      if (window.ActiveXObject)
          return Try.these(
            function() { return new ActiveXObject('MSXML2.DomDocument')   },
            function() { return new ActiveXObject('Microsoft.DomDocument')},
            function() { return new ActiveXObject('MSXML.DomDocument')    },
            function() { return new ActiveXObject('MSXML3.DomDocument')   }
          ) || false;

      return null;
   },

   getInnerText: function(el) {
     if (typeof el == "string") return el;
     if (typeof el == "undefined") { return el };
     var cs = el.childNodes;
     var l = cs.length;
     if (el.innerText) return el.innerText;  //Not needed but it is faster
     var str = "";
     for (var i = 0; i < l; i++) {
       switch (cs[i].nodeType) {
         case 1: //ELEMENT_NODE
           str += (cs[i].tagName.toLowerCase()=='img') ? cs[i].src : ts_getInnerText(cs[i]);
           break;
         case 3: //TEXT_NODE
           str += cs[i].nodeValue;
           break;
       }
     }
     return str;
   },

   // THIS IS NOT COMPATIBLE WITH KONQUEROR 3.5
   getContentAsString: function( parentNode ) {
      return parentNode.xml != undefined ?
         this._getContentAsStringIE(parentNode) :
         this._getContentAsStringMozilla(parentNode);
   },

  _getContentAsStringIE: function(parentNode) {
     var contentStr = "";
     for ( var i = 0 ; i < parentNode.childNodes.length ; i++ ) {
         var n = parentNode.childNodes[i];
         if (n.nodeType == 4) {
             contentStr += n.nodeValue;
         }
         else {
           contentStr += n.xml;
       }
     }
     return contentStr;
  },

  _getContentAsStringMozilla: function(parentNode) {
     var xmlSerializer = new XMLSerializer();
     var contentStr = "";
     for ( var i = 0 ; i < parentNode.childNodes.length ; i++ ) {
          var n = parentNode.childNodes[i];
          if (n.nodeType == 4) { // CDATA node
              contentStr += n.nodeValue;
          }
          else {
            contentStr += xmlSerializer.serializeToString(n);
        }
     }
     return contentStr;
  },
  
  docElement:(document.compatMode && document.compatMode.indexOf("CSS")!=-1)? document.documentElement : document.body,

  windowHeight: function() {
    return window.innerHeight? innerHeight : this.docElement.clientHeight;
  },

  windowWidth: function() {
    return window.innerWidth? innerWidth : this.docElement.clientWidth;
  },

   toViewportPosition: function(element) {
      if (element.all && !window.opera && element.currentStyle)
         return this._toAbsolute(element,true);
      else
         return this._toAbsoluteMozilla(element,true);
   },

   toDocumentPosition: function(element) {
      return this._toAbsolute(element,false);
   },

   /**
    *  Compute the elements position in terms of the window viewport
    *  so that it can be compared to the position of the mouse (dnd)
    *  This is additions of all the offsetTop,offsetLeft values up the
    *  offsetParent hierarchy, ...taking into account any scrollTop,
    *  scrollLeft values along the way...
    *
    * IE has a bug reporting a correct offsetLeft of elements within a
    * a relatively positioned parent!!!
    **/
   _toAbsolute: function(element,accountForDocScroll) {

      var x = 0;
      var y = 0;
      var audity='';
      var parent = element;
      while ( parent ) {

         var borderXOffset = 0;
         var borderYOffset = 0;
         if ( parent != element ) {
            var borderXOffset = parseInt(this.getElementsComputedStyle(parent, "borderLeftWidth" ));
            var borderYOffset = parseInt(this.getElementsComputedStyle(parent, "borderTopWidth" ));
            borderXOffset = isNaN(borderXOffset) ? 0 : borderXOffset;
            borderYOffset = isNaN(borderYOffset) ? 0 : borderYOffset;
         }

         audity+='/'+parent.offsetTop;
         x += parent.offsetLeft - parent.scrollLeft + borderXOffset;
         y += parent.offsetTop - parent.scrollTop + borderYOffset;
         parent = parent.offsetParent;
      }

      if ( accountForDocScroll ) {
         x -= this.docScrollLeft();
         y -= this.docScrollTop();
      }

      return { x:x, y:y, ie:1, yaudit:audity };
   },

   /**
    *  Mozilla did not report all of the parents up the hierarchy via the
    *  offsetParent property that IE did.  So for the calculation of the
    *  offsets we use the offsetParent property, but for the calculation of
    *  the scrollTop/scrollLeft adjustments we navigate up via the parentNode
    *  property instead so as to get the scroll offsets...
    *
    **/
   _toAbsoluteMozilla: function(element,accountForDocScroll) {
      var x = 0;
      var y = 0;
      var audit='';
      var parent = element;
      while ( parent ) {
         x += parent.offsetLeft;
         y += parent.offsetTop;
         audit+='/'+parent.tagName+'='+parent.offsetLeft;
         
         parent = parent.offsetParent;
      }

      parent = element;
      while ( parent &&
              parent != document.body &&
              parent != document.documentElement ) {
         if ( parent.scrollLeft  ) {
            x -= parent.scrollLeft;
         }
         if ( parent.scrollTop )
            y -= parent.scrollTop;
         parent = parent.parentNode;
      }

      if ( accountForDocScroll ) {
         x -= this.docScrollLeft();
         y -= this.docScrollTop();
      }

      return { x:x, y:y, ie:0, yaudit:audit };
   },

   docScrollLeft: function() {
      if ( window.pageXOffset )
         return window.pageXOffset;
      else if ( document.documentElement && document.documentElement.scrollLeft )
         return document.documentElement.scrollLeft;
      else if ( document.body )
         return document.body.scrollLeft;
      else
         return 0;
   },

   docScrollTop: function() {
      if ( window.pageYOffset )
         return window.pageYOffset;
      else if ( document.documentElement && document.documentElement.scrollTop )
         return document.documentElement.scrollTop;
      else if ( document.body )
         return document.body.scrollTop;
      else
         return 0;
   },

   nan2zero: function(n) {
     return isNaN(n) || typeof(n)==undefined ? 0 : n;
   },

  eventKey: function(e) {
    if( typeof( e.keyCode ) == 'number'  ) {
      return e.keyCode; //DOM
    } else if( typeof( e.which ) == 'number' ) {
      return e.which;   //NS 4 compatible
    } else if( typeof( e.charCode ) == 'number'  ) {
      return e.charCode; //also NS 6+, Mozilla 0.9+
    }
    return -1;  //total failure, we have no way of obtaining the key code
  },

   // Return the previous sibling that has the specified tagName
   getPreviosSiblingByTagName: function(el,tagName) {
   	var sib=el.previousSibling;
   	while (sib) {
   		if ((sib.tagName==tagName) && (sib.style.display!='none')) return sib;
   		sib=sib.previousSibling;
   	}
   	return null;
   },
 
   // Return the parent HTML element that has the specified tagName
   getParentByTagName: function(el,tagName) {
   	var par=el;
   	while (par) {
   		if (par.tagName==tagName) return par;
   		par=par.parentNode;
   	}
   	return null;
   },

  wrapChildren: function(el,cls,id,wrapperTag) {
    var tag=wrapperTag ? wrapperTag : 'div';
    var wrapper = document.createElement(tag);
    if (id) wrapper.id=id;
    if (cls) wrapper.className=cls;
    while (el.firstChild)
      wrapper.appendChild(el.firstChild);
    el.appendChild(wrapper);
    return wrapper;
  },
  
  // format a positive number
  // decPlaces is the number of digits to display after the decimal point
  // thouSep is the character to use as the thousands separator
  // decPoint is the character to use as the decimal point
  formatPosNumber: function(posnum,decPlaces,thouSep,decPoint) {
    var a=posnum.toFixed(decPlaces).split(/\./);
    if (thouSep) {
      var rgx = /(\d+)(\d{3})/;
      while (rgx.test(a[0]))
        a[0]=a[0].replace(rgx, '$1'+thouSep+'$2');
    }
    return a.join(decPoint);
  },

   //Post condition: if childNodes[n] is refChild, than childNodes[n+1] is newChild.
   DOMNode_insertAfter: function(newChild,refChild) {
     var parentx=refChild.parentNode;
     if(parentx.lastChild==refChild) { return parentx.appendChild(newChild);}
     else {return parentx.insertBefore(newChild,refChild.nextSibling);}
   },


   isKonqueror : navigator.userAgent.toLowerCase().indexOf("konqueror") >= 0,
   isSafari    : navigator.userAgent.toLowerCase().indexOf("safari") >= 0,
   isOpera     : (typeof(window.opera)=='object') && (window.opera!=null),
   isIE        : (typeof(document.all)=='object') && (!window.opera),

   /* logging funtions */
   
   startTime : new Date(),

   timeStamp: function() {
      var stamp = new Date();
      return (stamp.getTime()-this.startTime.getTime())+": ";
   }

};

// zero-fill
Number.prototype.zf = function(slen) { 
    var s=this.toString();
    while (s.length<slen) s='0'+s;
    return s;
}

Date.prototype.formatDate = function(fmt) {
  var datefmt=RicoTranslate.dateFmt;
  var d=this;
  switch (typeof fmt) {
    case 'object':
      if (typeof fmt.dateFmt=='string') datefmt=fmt.dateFmt;
      break;
    case 'string':
      datefmt=fmt;
      break;
  }

  return datefmt.replace(/(yyyy|mmmm|mmm|mm|dddd|ddd|dd|hh|nn|ss|a\/p)/gi,
    function($1)
    {
      switch ($1.toLowerCase())
      {
      case 'yyyy': return d.getFullYear();
      case 'mmmm': return RicoTranslate.monthNames[d.getMonth()];
      case 'mmm':  return RicoTranslate.monthNames[d.getMonth()].substr(0, 3);
      case 'mm':   return (d.getMonth() + 1).zf(2);
      case 'dddd': return RicoTranslate.dayNames[d.getDay()];
      case 'ddd':  return RicoTranslate.dayNames[d.getDay()].substr(0, 3);
      case 'dd':   return d.getDate().zf(2);
      case 'hh':   return ((h = d.getHours() % 12) ? h : 12).zf(2);
      case 'nn':   return d.getMinutes().zf(2);
      case 'ss':   return d.getSeconds().zf(2);
      case 'a/p':  return d.getHours() < 12 ? 'a' : 'p';
      }
    }
  );
}

// based on: http://www.codeproject.com/jscript/dateformat.asp
String.prototype.formatDate = function(fmt) {
  var s=this.replace(/-/g,'/');
  var d = new Date(s);
  return isNaN(d) ? this : d.formatDate(fmt);
}

// Take a string that can be converted via parseFloat
// and format it according to the specs in assoc array 'fmt'.
// Result is wrapped in a span element with a class of: negNumber, zeroNumber, posNumber
// These classes can be set in CSS to display negative numbers in red, for example.
//
// fmt may contain:
//   multiplier - the original number is multiplied by this amount before formatting
//   decPlaces  - number of digits to the right of the decimal point
//   thouSep    - character to use as the thousands separator
//   prefix     - string added to the beginning of the result (e.g. a currency symbol)
//   suffix     - string added to the end of the result (e.g. % symbol)
//   negSign    - specifies format for negative numbers: L=leading minus, T=trailing minus, P=parens
String.prototype.formatNumber = function(fmt) {
  var n=parseFloat(this);
  if (isNaN(n)) return this;
  if (typeof fmt.multiplier=='number') n*=fmt.multiplier;
  var decPlaces=typeof fmt.decPlaces=='number' ? fmt.decPlaces : 0;
  var thouSep=typeof fmt.thouSep=='string' ? fmt.thouSep : RicoTranslate.thouSep;
  var decPoint=typeof fmt.decPoint=='string' ? fmt.decPoint : RicoTranslate.decPoint;
  var prefix=fmt.prefix || "";
  var suffix=fmt.suffix || "";
  var negSign=typeof fmt.negSign=='string' ? fmt.negSign : "L";
  negSign=negSign.toUpperCase();
  var s,cls;
  if (n<0.0) {
    s=RicoUtil.formatPosNumber(-n,decPlaces,thouSep,decPoint);
    if (negSign=="P") s="("+s+")";
    s=prefix+s;
    if (negSign=="L") s="-"+s;
    if (negSign=="T") s+="-";
    cls='negNumber';
  } else {
    cls=n==0.0 ? 'zeroNumber' : 'posNumber';
    s=prefix+RicoUtil.formatPosNumber(n,decPlaces,thouSep,decPoint);
  }
  return "<span class='"+cls+"'>"+s+suffix+"</span>";
}

// Translation helper object
var RicoTranslate = {
  phrases : new Array(),
  thouSep : ",",
  decPoint: ".",
  langCode: "en",
  re      : /^(\W*)\b(.*)\b(\W*)$/,
  dateFmt : "mm/dd/yyyy",
  monthNames: ['January','February','March','April','May','June',
               'July','August','September','October','November','December'],
  dayNames: ['Sunday','Monday','Tuesday','Wednesday','Thursday','Friday','Saturday'],
  
  addPhrase: function(fromPhrase, toPhrase) {
    this.phrases[fromPhrase]=toPhrase;
  },
  
  // fromPhrase may contain multiple words/phrases separated by tabs
  // and each portion will be looked up separately.
  // Punctuation & spaces at the beginning or
  // ending of a phrase are ignored.
  getPhrase: function(fromPhrase) {
    var words=fromPhrase.split(/\t/);
    var transWord,translated = '';
    for (var i=0; i<words.length; i++) {
      if (this.re.exec(words[i])) {
        transWord=this.phrases[RegExp.$2];
        translated += (typeof transWord=='string') ? RegExp.$1+transWord+RegExp.$3 : words[i];
      } else {
        translated += words[i];
      }
    }
    return translated;
  }
}


// Fix select control bleed-thru on floating divs in IE
// based on technique published by Joe King
// http://dotnetjunkies.com/WebLog/jking/archive/2003/10/30/2975.aspx
Rico.Shim = Class.create();

if (RicoUtil.isIE) {
  Rico.Shim.prototype = {
  
    initialize: function() {
      this.ifr = document.createElement('iframe');
      this.ifr.style.position="absolute";
      this.ifr.style.display = "none";
      document.body.appendChild(this.ifr);
    },
  
    hide: function() {
      this.ifr.style.display = "none";
    },
    
    show: function(DivRef) {
      //alert("show shim:\nw="+DivRef.offsetWidth+"\nh="+DivRef.offsetHeight+'\ntop='+DivRef.style.top+"\nleft="+DivRef.style.left);
      this.ifr.style.width = DivRef.offsetWidth;
      this.ifr.style.height= DivRef.offsetHeight;
      this.ifr.style.top   = DivRef.style.top;
      this.ifr.style.left  = DivRef.style.left;
      this.ifr.style.zIndex= DivRef.currentStyle.zIndex - 1;
      //this.ifr.style.border = "2px solid green"; // for debugging
      this.ifr.style.display = "block";
    }
  }
} else {
  Rico.Shim.prototype = {
    initialize: function() {},
    hide: function() {},
    show: function() {}
  }
}


Rico.Menu = Class.create();

Rico.Menu.prototype = {

  initialize: function(defaultWidth,hideOnEscape,hideOnClick) {
    this.defaultMenuWidth=(typeof defaultWidth=='string') ? defaultWidth : "15em";
    this.hideOnEscape=(typeof hideOnEscape=='boolean') ? hideOnEscape : true;
    this.hideOnClick=(typeof hideOnClick=='boolean') ? hideOnClick : true;
    this.hideFunc=null;
  },
  
  createDiv: function() {
    if (this.div) return;
    this.div = document.createElement('div');
    this.div.className = 'ricoMenu';
    this.div.style.position="absolute";
    this.div.style.width=this.defaultMenuWidth;
    document.body.appendChild(this.div);
    this.width=this.div.offsetWidth
    this.shim=new Rico.Shim();
    this.hidemenu();
    if (this.hideOnClick) {
      Event.observe(this.div,"click", this.ignoreClick.bindAsEventListener(this), false);
      Event.observe(document,"click", this.cancelmenu.bindAsEventListener(this), false);
    }
    if (this.hideOnEscape)
      Event.observe(document,"keyup", this.checkKey.bindAsEventListener(this), false);
  },

  ignoreClick: function(e) {
    Event.stop(e);
    return false;
  },
  
  // event handler to process keyup events (hide menu on escape key)
  checkKey: function(e) {
    if (RicoUtil.eventKey(e)==27) this.cancelmenu(e);
    return true;
  },

  showmenu: function(e,hidefunc){
    Event.stop(e);
    this.hideFunc=hidefunc;
    if (this.div.childNodes.length==0) {
      this.cancelmenu();
      return false;
    }
    var newLeft=RicoUtil.docScrollLeft()+e.clientX;
    if (e.clientX+this.width>RicoUtil.windowWidth()) newLeft-=this.width;
    this.div.style.left=newLeft+"px";
    var newTop=RicoUtil.docScrollTop()+e.clientY;
    this.div.style.top=newTop+"px";
    /* intent is to get div positioned as close as possible
     * to the correct location before turning display on.
     * This keeps things from jumping around too much on the screen.
     */
    this.div.style.display ="block";
    var contentHt=this.div.offsetHeight;
    if (e.clientY+contentHt>RicoUtil.windowHeight()) {
      newTop=Math.max(newTop-contentHt,0);
      this.div.style.top=newTop+"px";
    }
    this.shim.show(this.div);
    return false;
  },

  clearMenu: function() {
    this.div.innerHTML="";
    this.defaultAction=null;
  },

  addMenuHeading: function(hdg,translate) {
    var el=document.createElement('div')
    el.innerHTML =(translate==null || translate==true) ? RicoTranslate.getPhrase(hdg) : hdg;
    el.className='ricoMenuHeading';
    this.div.appendChild(el);
  },

  addMenuBreak: function() {
    var brk=document.createElement('div');
    brk.className="ricoMenuBreak";
    this.div.appendChild(brk);
  },

  addMenuItem: function(menutext,action,enabled,title,translate) {
    var a = document.createElement('a');
    if ( arguments.length < 3 || enabled ) {
      switch (typeof action) {
        case 'function': a.href = "#"; a.onclick = action; break;
        case 'string'  : a.href = action; break
      }
      a.className = 'enabled';
      if (this.defaultAction==null) this.defaultAction=action;
    } else {
      a.disabled = true;
      a.className = 'disabled';
    }
    a.innerHTML = (translate==null || translate==true) ? RicoTranslate.getPhrase(menutext) : menutext;
    if ( title!=null )
      a.title = (translate==null || translate==true) ? RicoTranslate.getPhrase(title) : title;
    this.div.appendChild(a);
  },

  isVisible: function() {
    return this.div && this.div.style.display!="none";
  },
  
  cancelmenu: function() {
    if (this.hideFunc) this.hideFunc();
    this.hidemenu();
  },

  hidemenu: function() {
    if (!this.div) return;
    this.shim.hide();
    this.div.style.display="none";
    this.hideFunc=null;
  }

};
