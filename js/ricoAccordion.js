/**
  *
  *  Copyright 2006 Luis Enrique Huancapaza 
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
  * 
  *  This code is based in RICO
  **/

//-------------------- ricoAccordion.js
//Luis Huancapaza//
Rico.Accordion = Class.create();
Rico.Accordion.prototype = {
   initialize: function(container, options) {
   	  this.container            = $(container);
      if (!this.container) return;
      this.lastExpandedTab      = null;
      this.accordionTabs        = new Array();
      this.setOptions(options);
      this._attachBehaviors();
      
      if(this.options.panelWidth) this.container.style.width=this.options.panelWidth+"px";	//LEHC
      if (this.options.tabLocation == 'inline' && !this.options.fixborders) 
      	   this.container.style.borderBottom = '1px solid '+this.options.borderColor;
      // validate onloadShowTab
	  if (this.options.onLoadShowTab >= this.accordionTabs.length)
       	  this.options.onLoadShowTab = 0;
      // set the initial visual state...
      var flag=(this.options.panelHeight=="auto"); 
      
      for ( var i=0 ; i < this.accordionTabs.length ; i++ ){
      	this.accordionTabs[i].content.style.display="inline";
	  	this.accordionTabs[i].content.style.margin="0px";
      	  if (i != this.options.onLoadShowTab){
	      	this.accordionTabs[i].collapse();
	      	this.accordionTabs[i].content.style.display = 'none';
	      	this.accordionTabs[i].content.style.height = '1px';
	      	if(this.options.panelHeight == 'auto'){
	      		this.accordionTabs[i].content.style.overflowY = 'hidden';

	      	}else{
	      		this.accordionTabs[i].content.style.overflowY = 'auto';
	      	}
	      }else{
	      	this.accordionTabs[i].showExpanded(flag);
	      	this.accordionTabs[i].content.style.display = 'block';
	      	if(this.options.panelHeight == 'auto'){
	      		this.accordionTabs[i].content.style.height = this.accordionTabs[i].content.scrollHeight+"px";
	      	}else{
	      		this.accordionTabs[i].content.style.overflowY = 'auto';
	      		this.accordionTabs[i].content.style.height = this.options.panelHeight + "px";
	      	}
	      	this.lastExpandedTab=this.accordionTabs[i];
	      }
	    this.accordionTabs[i].content.style.overflowX = 'hidden';
      }
   },
   //LuisHuancapaza
   setOptions: function(options) {
      this.options = {
         expandedBg          : '#63699c',
         hoverBg             : '#63699c',
         collapsedBg         : '#6b79a5',
         expandedTextColor   : '#ffffff',
         expandedFontWeight  : 'bold',
         hoverTextColor      : '#ffffff',
         collapsedTextColor  : '#ced7ef',
         collapsedFontWeight : 'normal',
         borderColor         : '#6b79a5',
         panelHeight         : 200,
         onShowTab           : null,
         onLoadShowTab       : 0,
         tabLocation         : 'inline',
         tabSpacing          : '1',
         panelWidth			 : 0,
         mode                : "normal",
         roundCorners		 : false,
         fixborders          : false,
         expandedBgImg       : false,
         expandedClassName   : "expanded",
         collapsedBgImg      : false,
         collapsedClassName  : "collapsed",
         tabLocations        : 'inline',
         hoverImg            : false,
         duration			 : false,
         transitionColor	 : false
      }
      Object.extend(this.options, options || {});
   },

   showTabByIndex: function( anIndex, animate ) {
      var doAnimate = arguments.length == 1 ? true : animate;
      if(anIndex<this.accordionTabs.length && anIndex>=0){
   		 var accordionTab=this.accordionTabs[anIndex];  
   		 this.showTab(accordionTab,doAnimate);
   	  }else if(anIndex<0){
   	  	  this.showTabHide(this.accordionTabs.length-1,"desc");
   	  }
   },
   //Luis Huancapaza//
   showTabHide: function(index,mode){		//It's possible because all effects have defined the state collapsed
   		if(!mode)mode="desc";
   		var accordion = this;
   		var accordionTab;
   		if((mode=="desc" && index>=0) || (mode=="asc" && index<accordion.accordionTabs.length)){ 
			var newIndex
   			if(mode=="desc") newIndex=index-1;
   			else newIndex=index+1;
   			accordionTab=this.accordionTabs[index];
   			var colapsed = (parseInt(accordionTab.content.offsetHeight) <= 2)?true:false;
   			if(!colapsed){
				accordionTab.content.style.display = '';
				new Rico.Effect.AccordionSize( accordionTab.content,this.options.panelHeight,100,10,
					{ mode:"free",complete: function() {accordion.showTabHide(newIndex)}}
				);
			}else{
	   	  		accordion.showTabHide(newIndex);
   			}
   			
   		}else{
			for(var i=0;i<=(this.accordionTabs.length-1);i++){
	   	  		accordionTab=this.accordionTabs[i];
	   	  		accordion.showTabDone(accordionTab,false,true,{showCollapsed:function(){}});
	   	  	}
	   	  	this.lastExpandedTab=null;
   		}
   },
   
   showTab: function( accordionTab, animate ) {
   	  var doAnimate = (this.options.tabLocation == 'inline') && (arguments.length == 1 ? true : animate);
      var colapsed = (parseInt(accordionTab.content.offsetHeight) <= 2)?true:false;
      var accordion = this;
      var lastExpandedTab = this.lastExpandedTab;
	  var size;
  	  var size2;
	  var state=this.options.panelHeight;
	  var tColor=this.options.transitionColor;
   	  
	  if(!this.lastExpandedTab){
	  	this.lastExpandedTab=accordionTab;	//flag for: this.lastExpanded = -1
	  }
      accordionTab.content.style.display = '';
      if(!(this.options.mode=="free" && doAnimate) && !(state=="auto") && doAnimate && (accordionTab.content.offsetHeight<=5) && (this.lastExpandedTab.content.offsetHeight>5) ){
      	this.lastExpandedTab.content.style.height=(this.lastExpandedTab.content.offsetHeight-1)+"px";
      }
      
      if(this.options.mode=="free" && doAnimate && this.lastExpandedTab!=accordionTab) //LEHC
      		this.lastExpandedTab.content.style.overflowY="auto";
      else 
      		this.lastExpandedTab.content.style.overflowY="hidden";
      
      var factor=1.0;
      if(RicoUtil.isIE){ 	//From ricoCommon.js
      	  factor=1.3;			//IE is faster than FF to render the accordion
      }
      //LuisHuancapaza
      if(state=="auto"){
      	size=accordionTab.content.scrollHeight+incr;					//
      	size2=parseInt(this.lastExpandedTab.content.scrollHeight)+incr;	//
      	var incr=5;
      	accordionTab.content.style.overflowY = 'hidden';
      	size=accordionTab.content.scrollHeight+incr;
      	size2=this.lastExpandedTab.content.scrollHeight+incr;
      	
      	if(this.options.duration){
      		duration2=duration=this.options.duration*factor;
      	}else{
	      	duration=parseInt(size*factor); //1.3 IE	//0.8 FF
	      	duration2=parseInt(size2*factor);
      	}
      }else{
      	accordionTab.content.style.overflowY = 'hidden';
      	size2=size=state;
      	if(this.options.duration){
      		duration2=duration=this.options.duration*factor;
      	}else{
      		duration=duration2=parseInt(size*factor);
      	}
      }	
	  
      if(this.options.mode=="free" && doAnimate){
      		new Rico.Effect.AccordionSize( accordionTab.content,size,duration,(duration/10),
      			{ mode:this.options.mode,color:tColor,complete: function() {accordion.showTabDone(accordionTab,colapsed,true,{showCollapsed:function(){}})}});
      }else{
	    	if(this.lastExpandedTab==accordionTab){		//Initial state alterated:this.lastExpanded = -1
      			if((this.options.onLoadShowTab==-2 && doAnimate) || colapsed || (this.options.mode=="free" && !doAnimate)){
      				accordionTab.content.style.overflowY="hidden";
      				new Rico.Effect.AccordionSize( accordionTab.content,size,duration,(duration/10),
	      			{ mode:"free",color:tColor,complete: function() {accordion.showTabDone(accordionTab,colapsed,true,{showCollapsed:function(){}})}}
	      			) ;
	      			if(!colapsed) this.lastExpandedTab = false;
	      		}else{
	      			accordionTab.content.style.overflowY="auto";
	      		}
	      	}else{//Luis Huancapaza//
	      		if(state=="auto"){
	    			accordionTab.content.style.display = 'none';
	      			new Rico.Effect.AccordionSize( lastExpandedTab.content,size2,duration2,(duration2/10),
		      			{mode:"free",color:tColor,complete: function() {
							    accordionTab.showExpanded(true);
							    lastExpandedTab.showCollapsed(true,true);
							    accordionTab.content.style.display = '';
							    lastExpandedTab.content.style.display = 'none';
		      					new Rico.Effect.AccordionSize( accordionTab.content,size,duration,(duration/10),
			      				{mode:"free",color:tColor,complete:function(){
			      					lastExpandedTab.content.style.display = '';
			      					accordion.showTabDone(accordionTab,colapsed,true,lastExpandedTab)
			      				}
			      				});
							}
		      			}
					);
					this.lastExpandedTab = accordionTab;
	      		}else if(doAnimate){
	      			new Rico.Effect.AccordionSize( this.lastExpandedTab.content,size+1,duration,(duration/10),
	      			{couple:accordionTab.content,mode:this.options.mode,color:tColor,
	      			complete: function() {accordion.showTabDone(accordionTab,colapsed,true,lastExpandedTab)}}
	      			);
	      			this.lastExpandedTab = accordionTab;
	      		}else{
	      			if(this.options.mode=="free" || colapsed) this.showTabDone(accordionTab,colapsed,false,lastExpandedTab);
	      			if(colapsed) this.lastExpandedTab = accordionTab;
	      		}
	        }
      	}
   },
   
   showTabDone: function(expandedTab,colapsed,doAnimate,contractedTab){
      	var flag=(this.options.panelHeight=="auto");
   		if(colapsed){
   				expandedTab.showExpanded(flag);
		      	contractedTab.showCollapsed();
		    	if(!doAnimate){
				    if(expandedTab!=contractedTab){
			    		contractedTab.content.style.height = "1px";
			    		contractedTab.content.style.display = 'none';
			    	}
	   			}
				if(!flag)
	   				expandedTab.content.style.height = this.options.panelHeight + "px";
      	}else{
      		if(this.options.mode=="free"){
     			expandedTab.showCollapsed();
	      		if(!doAnimate){
	      			expandedTab.content.style.height = "1px";
				    contractedTab.content.style.height = "1px";
				    expandedTab.content.style.display = 'none';
		      		contractedTab.content.style.display = 'none';
		      	}
      		}else{
      			if(doAnimate){	
      	  	  		if(expandedTab!=contractedTab){
      	  	  			expandedTab.showCollapsed();
      	  	  			expandedTab.content.style.height = "1px";
				    	expandedTab.content.style.display = 'none';
      	  	  		}
	      	 	}else{
	      	 		contractedTab.content.style.height = "1px";
				    contractedTab.content.style.display = 'none';
	      	 		contractedTab.showCollapsed();
					expandedTab.showExpanded(flag);
   				}
      		}
      	}
      	if ( this.options.onShowTab ) this.options.onShowTab(this.lastExpandedTab);
   },
   //LuisHuancapaza
   _attachBehaviors: function() {
      var panels = this._getDirectChildrenByTag(this.container, 'DIV');
      var viewport = null;
      var tabs = null;
      if (this.options.tabLocation != 'inline') {
         viewport = document.createElement('div');
         
         viewport.style.border = "1px solid " + this.options.borderColor;
         viewport.style.clear = "both";
         this.container.insertBefore(viewport, this.container.firstChild);
         tabs = document.createElement('div');
         tabs.style.overflowY = "hidden";
         tabs.style.backgroundColor = "transparent";
         
         if (this.options.tabLocation == 'top') {
            this.container.insertBefore(tabs, this.container.firstChild);
         } else if (this.options.tabLocation == 'bottom') {
            this.container.appendChild(tabs);
         }
         this.container.style.overflowY = 'hidden';//LEHC
      }
	  
      for ( var i = 0 ; i < panels.length ; i++ ) {
         var tabChildren = this._getDirectChildrenByTag(panels[i],'DIV');
         if ( tabChildren.length != 2 ) {
            alert('Warning: panel '+i+' has '+tabChildren.length+' children (expected 2');
            continue; // unexpected
         }//Luis Huancapaza//
		 
         var tabTitleBar   = tabChildren[0];
         var tabContentBox = tabChildren[1];
         
		 if (this.options.tabLocation != 'inline'){
			var cad;
			var flag;
			if(tabTitleBar.textContent) cad=tabTitleBar.textContent;
			else cad=tabTitleBar.innerText;
			cad=cad.replace(/^\s*|\s*$/g,"");
			cad=cad.substring(0,10);
			
			//if(tabTitleBar.textContent) tabTitleBar.textContent=cad;
			//else tabTitleBar.innerText=cad;
			tabTitleBar.overflow="hidden";
			tabContentBox.style.clear = 'left';
            tabContentBox.style.overflowX = 'hidden';
			
            /*if(this.options.panelWidth)
      			tabContentBox.style.width = (this.options.panelWidth-2)+"px";	
      		else
            	tabContentBox.style.width = (this.container.offsetWidth-parseInt(RicoUtil.getElementsComputedStyle(tabContentBox, 'paddingLeft')) -
            		parseInt(RicoUtil.getElementsComputedStyle(tabContentBox, 'paddingRight'))) + 'px';
           	*/
            viewport.appendChild(tabContentBox);
            tabTitleBar.style.padding = '0px';

            if(this.options.roundCorners){
			    if (this.options.tabLocation == 'top')
	            	tabTitleBar.style.marginTop = '-5px';
	            else if (this.options.tabLocation == 'bottom')
	            	tabTitleBar.style.marginBottom = '-5px';
		 	}
            
	        var tabWrapper = document.createElement('div');
	        tabWrapper.appendChild(tabTitleBar);
	        //tabWrapper.style.padding="0px";
			
		        if (RicoUtil.isIE)
	            	tabWrapper.style.styleFloat = 'left';
	            else
	            	tabWrapper.style.cssFloat = 'left';
			
            //tabWrapper.style.textAlign = 'center';
            
            tabWrapper.style.textAlign = 'center';
			//LuisHuancapaza

			if (i > 0) tabWrapper.style.marginLeft = this.options.tabSpacing + 'px';
            if(this.options.panelWidth){
            	if((Math.floor(this.options.panelWidth)/(parseInt(tabChildren.length)+1)-((i>0)?this.options.tabSpacing:0))<=300)
            		tabWrapper.style.width=(Math.floor(this.options.panelWidth)/(tabChildren.length+2)-( (i>0)?this.options.tabSpacing:0 ))+'px';
            	else
            		tabWrapper.style.width=300/tabChildren.length; 
            }else{
            	if((Math.floor(tabContentBox.offsetWidth)/tabChildren.length)<=300){		//LEHC Here you can ajust the values for the titles
			 		tabWrapper.style.width=((Math.floor(tabContentBox.offsetWidth)/(tabChildren.length /*-1*/))-((i>0)?this.options.tabSpacing:0))+'px';
            	}else{
			 		tabWrapper.style.width=300/tabChildren.length;	
            	}
			}
			tabWrapper.style.styleFloat="left";

            tabs.appendChild(tabWrapper);
            if(this.options.roundCorners){
            	Rico.Corner.round(tabWrapper, {corners:this.options.tabLocation,color:'transparent'});
            }
            this.accordionTabs.push( new Rico.Accordion.Tab(this,tabWrapper,tabContentBox) );
		}
        else 
         	this.accordionTabs.push( new Rico.Accordion.Tab(this,tabTitleBar,tabContentBox) );
      }
   },

   _getDirectChildrenByTag: function(e, tagName) {
      var kids = new Array();
      var allKids = e.childNodes;
      for( var i = 0 ; i < allKids.length ; i++ )
         if ( allKids[i] && allKids[i].tagName && allKids[i].tagName == tagName )
            kids.push(allKids[i]);
      return kids;
   }

};//LEHC

Rico.Accordion.Tab = Class.create();

Rico.Accordion.Tab.prototype = {

   initialize: function(accordion, titleBar, content) {
      this.accordion = accordion;
      this.titleBar  = titleBar;
      this.content   = content;
      this._attachBehaviors();
   },

   collapse: function() {
      this.showCollapsed();
      this.content.style.height = "1px";
   },

   showCollapsed: function(inprocess) {
      this.expanded = false;
      if(this.accordion.options.collapsedBgImg)
        this.titleBar.style.backgroundImage = "url("+this.accordion.options.collapsedBgImg+")";
      else
      	this.titleBar.style.backgroundColor = this.accordion.options.collapsedBg;

	//change the class of the titlebar if this is collapsed
	this.titleBar.className = this.accordion.options.collapsedClassName;

      this.titleBar.style.color           = this.accordion.options.collapsedTextColor;
      this.titleBar.style.fontWeight      = this.accordion.options.collapsedFontWeight;
      if(!inprocess)
      	this.content.style.display          = 'none';
   },
   
   showExpanded: function(flag,inprocess) {
      this.expanded = true;
      this.titleBar.style.fontWeight      = this.accordion.options.expandedFontWeight;
      if(this.accordion.options.expandedBgImg)
      	this.titleBar.style.backgroundImage = "url("+this.accordion.options.expandedBgImg+")";
      else 
      	this.titleBar.style.backgroundColor = this.accordion.options.expandedBg;

		//adding "expanded classname" function
    	this.titleBar.className = this.accordion.options.expandedClassName;
      


      this.titleBar.style.color           = this.accordion.options.expandedTextColor;
      if(!inprocess){
	      this.content.style.display          = 'block';
	      if(flag){//=auto
	      	this.content.style.overflowY         = "hidden";
	      }else{
	      	this.content.style.overflowY         = "auto";
	      }
	      this.content.style.overflowX        = "hidden";
      }
   },
   
   titleBarClicked: function(e) {
      this.accordion.showTab(this);
   },//LEHC
   
   hover: function(e) {
		if(this.accordion.options.hoverImg){
			this.titleBar.style.backgroundImage = "url("+this.accordion.options.hoverImg+")";
		}else{
   			this.titleBar.style.backgroundColor = this.accordion.options.hoverBg;
		}
   		this.titleBar.style.color = this.accordion.options.hoverTextColor;
   },
   
   unhover: function(e) {
      if ( this.expanded ) {
        if(this.accordion.options.expandedBgImg) 
        	this.titleBar.style.backgroundImage = "url("+this.accordion.options.expandedBgImg+")";
      	else
        	this.titleBar.style.backgroundColor = this.accordion.options.expandedBg;
         this.titleBar.style.color           = this.accordion.options.expandedTextColor;
         this.titleBar.style.fontWeight      = this.accordion.options.expandedFontWeight;
      }
      else {
        if(this.accordion.options.collapsedBgImg)
        	this.titleBar.style.backgroundImage = "url("+this.accordion.options.collapsedBgImg+")";
      	else 
      		this.titleBar.style.backgroundColor = this.accordion.options.collapsedBg;
         this.titleBar.style.color           = this.accordion.options.collapsedTextColor;
      }
   },

   _attachBehaviors: function() {
   	//alert("fixed img "+this.accordion.options.fixborders+" tab-location "+this.accordion.options.tabLocations);
    if(this.accordion.options.tabLocations == 'inline' ) {
	   	if (this.accordion.options.borderColor){
  		 	this.content.style.border = "1px solid " + this.accordion.options.borderColor;
	      	this.content.style.borderTopWidth    = "0px";
	      	this.content.style.borderBottomWidth = "0px";
	      	this.content.style.margin            = "0px";
		     if(this.accordion.options.fixborders){
		      	var myParent=this.content.parentNode;
		        var bottom = document.createElement('div');
		        bottom.style.borderTop = "1px solid " + this.accordion.options.borderColor;
		        myParent.appendChild(bottom);
		        var top = document.createElement('div');
		        top.style.borderBottom = "1px solid " + this.accordion.options.borderColor;
		        myParent.insertBefore(top,this.content);
		     }
	    }else if(this.accordion.options.fixborders!=true){	//we hope fixborders is a image
  			this.content.style.border = "0px";
	      	this.content.style.margin = "0px";
	      	
		    //Luis Huancapaza//
	      	var myParent=this.content.parentNode;
	        var bottom = document.createElement('div');
	        
	        /*var top = document.createElement('div');
	        top.style.borderBottom = "1px solid " + this.accordion.options.borderColor;		//<-LEHC
	        myParent.insertBefore(top,this.content);*/

	        bottom.style.height = "5px";
	        bottom.style.overflow = "hidden";
	        bottom.style.backgroundImage = "url("+this.accordion.options.fixborders+")";
	        bottom.style.backgroundRepeat ="no-repeat";

	        myParent.appendChild(bottom);
	    }
    }
      Event.observe(this.titleBar , "click",this.titleBarClicked.bindAsEventListener(this));
      Event.observe(this.titleBar , "mouseover",this.hover.bindAsEventListener(this));
      Event.observe(this.titleBar , "mouseout",this.unhover.bindAsEventListener(this));
   }

};

//-------------------- ricoEffects.js

Rico.Effect.AccordionSize = Class.create();

Rico.Effect.AccordionSize.prototype = {
	initialize: function(e2, size, duration, steps, options) {
		this.e1       = (options.couple && !options.free)?$(options.couple):{offsetHeight:0,style:{height:0,display:0}};
		this.e2       = $(e2);
		this.size     = (this.e1.offsetHeight>this.e2.offsetHeight)?
			(this.e1.offsetHeight):((this.e2.offsetHeight>1)?(this.e2.offsetHeight):(size));	//the bigger

		this.options  = arguments[4] || {};
		
		//-> to simulate the color effect, is temporal
		if(this.options.color){
			this.color1    = this.e1.style.color;
			this.color2    = this.e2.style.color;
		
			this.e1.style.color = this.options.color;
			this.e2.style.color = this.options.color;
		}
		//<-
		
		//error tolerance 
		var margin=10;
		
		this.mode  =    (options.couple && (options.mode!="free") )?
			((parseInt(this.e1.offsetHeight)-parseInt(this.e2.offsetHeight)>=margin)?0:3):(this.e2.offsetHeight<=margin?2:1);	//config mode
		this.diff     = (steps>=0)? parseInt((this.size-1)/steps) :0;
		
		//calculate the numbers of steps again
		if(this.diff){
			realSize=this.diff*steps;
			aditional=this.size-realSize;
			aditionalSteps=parseInt(aditional/this.diff);
			steps+=aditionalSteps;
		}
		
		this.counter  = steps;
		this.stepDuration = (steps>=0)? (Math.round(duration/steps)):0;
		this.accordionSize();
	},
	//LEHC
	accordionSize: function() {
		if (this.isFinished()) {
			
			if(this.e1.style.height<=5){
				this.e1.style.height="1px";
			}
			if(this.e2.style.height<=5){
				this.e2.style.height="1px";
			}
			if(this.options.color){
				this.e1.style.color = this.color1;
				this.e2.style.color = this.color2;
			}
			//alert("HM2");
		
			if(this.options.complete)			//LEHCLECH	Executed when the function finish
				this.options.complete(this);	//LEHCLECH	for example: to update textstyle
			return;	//LEHCLECH
		}
		
		//confirm("Continuar");
		
		if (this.timer) clearTimeout(this.timer);
		var diff;
		
		//Error tolerance Luis Huancapaza//
		if((this.counter<=1)&&(this.size-parseInt(this.e2.style.height)>=0)){
			if(this.mode==0 || this.mode==2)		// Modes 0 y 2 = e2 is expanding
				diff=this.size-parseInt(this.e2.offsetHeight);
			else
				diff=-parseInt(this.e2.offsetHeight)+1;
		}else{
			if(this.mode==0 || this.mode==2)
				diff=this.diff;
			else 									//Modo 1 and 3 e2 is contracting
				diff=-this.diff;
		}

		var stepDuration=this.stepDuration;
		this.counter--;
		this.resizeBy(diff);
		this.timer = setTimeout(this.accordionSize.bind(this), stepDuration);
	},

	isFinished: function() {
		return this.counter <= 0;
	},
	//LEHC
	resizeBy: function(diff) {
		var intDiff = parseInt(diff);
		if(this.mode==0 || this.mode==3) var h1Height = this.e1.offsetHeight;		//Mode 0 = normal mode
		var h2Height = this.e2.offsetHeight;

		if(parseInt(this.mode)==0 || parseInt(this.mode)==3){
			this.e1.style.height = (h1Height - intDiff) + "px";
		}
		this.e2.style.height = (h2Height + intDiff) + "px";
	}//Luis Huancapaza//
};
