fx.Slide = Class.create();
fx.Slide.prototype = {
	setOptions: function(options) {
		this.options = {
			delay: 50,
			opacity: false
		}
		Object.extend(this.options, options || {});
	},

	initialize: function(togglers, sliders, options, startopen) {
		this.sliders  = sliders;
		this.togglers = togglers;
		this.setOptions(options);
		sliders.each(function(el, i){
			el.style.display = 'none';
			options.onComplete = function(){
				if (el.offsetHeight == 0) el.style.display = 'none';
				if (el.offsetHeight > 0) el.style.height = '1%';
			}
			el.fx = new fx.Combo(el, options);
			el.fx.hide();
		});

		togglers.each(function(toggler, i){
			if (startopen == 1) {
			  if(i == 0) this.toggle(sliders[i], toggler);
			}
			toggler.onclick = function(){
				this.toggle(sliders[i], toggler);
			}.bind(this);
		}.bind(this));
	},

	toggle: function(slider, toggler){
		
		this.sliders.each(function(el, i){
			if (el.offsetHeight > 0) this.clear(el);
		}.bind(this));
		
		this.togglers.each(function(el, i){
			 Element.removeClassName(el, 'moofx-toggler-down');
		}.bind(this));
		
		slider.style.display = 'block';
		setTimeout(function(){this.clear(slider);}.bind(this), this.options.delay);
		Element.addClassName(toggler, 'moofx-toggler-down');
	},

	clear: function(slider){
		slider.fx.clearTimer();
		slider.fx.toggle();
	}
}

/* -------------------------------------------- */
/* -- page loader ----------------------------- */
/* -------------------------------------------- */

