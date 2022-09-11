var e="undefined"!==typeof globalThis?globalThis:"undefined"!==typeof self?self:global;var l={};
/**
 * Returns a function, that, as long as it continues to be invoked, will not
 * be triggered. The function will be called after it stops being called for
 * N milliseconds. If `immediate` is passed, trigger the function on the
 * leading edge, instead of the trailing. The function also has a property 'clear' 
 * that is a function which will clear the timer to prevent previously scheduled executions. 
 *
 * @source underscore.js
 * @see http://unscriptable.com/2009/03/20/debouncing-javascript-methods/
 * @param {Function} function to wrap
 * @param {Number} timeout in ms (`100`)
 * @param {Boolean} whether to execute at the beginning (`false`)
 * @api public
 */function debounce(l,n,u){var t,a,o,i,f;null==n&&(n=100);function later(){var e=Date.now()-i;if(e<n&&e>=0)t=setTimeout(later,n-e);else{t=null;if(!u){f=l.apply(o,a);o=a=null}}}var debounced=function(){o=this||e;a=arguments;i=Date.now();var r=u&&!t;t||(t=setTimeout(later,n));if(r){f=l.apply(o,a);o=a=null}return f};debounced.clear=function(){if(t){clearTimeout(t);t=null}};debounced.flush=function(){if(t){f=l.apply(o,a);o=a=null;clearTimeout(t);t=null}};return debounced}debounce.debounce=debounce;l=debounce;var n=l;export default n;

