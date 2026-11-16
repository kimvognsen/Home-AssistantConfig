/**
* @license
* Copyright 2019 Google LLC
* SPDX-License-Identifier: BSD-3-Clause
*/
const e=globalThis,t=e.ShadowRoot&&(e.ShadyCSS===void 0||e.ShadyCSS.nativeShadow)&&`adoptedStyleSheets`in Document.prototype&&`replace`in CSSStyleSheet.prototype,n=Symbol(),r=/* @__PURE__ */ new WeakMap;var i=class{constructor(e,t,r){if(this._$cssResult$=!0,r!==n)throw Error("CSSResult is not constructable. Use `unsafeCSS` or `css` instead.");this.cssText=e,this.t=t}get styleSheet(){let e=this.o,n=this.t;if(t&&e===void 0){let t=n!==void 0&&n.length===1;t&&(e=r.get(n)),e===void 0&&((this.o=e=new CSSStyleSheet).replaceSync(this.cssText),t&&r.set(n,e))}return e}toString(){return this.cssText}};const a=e=>new i(typeof e==`string`?e:e+``,void 0,n),o=(e,...t)=>new i(e.length===1?e[0]:t.reduce((t,n,r)=>t+(e=>{if(!0===e._$cssResult$)return e.cssText;if(typeof e==`number`)return e;throw Error(`Value passed to 'css' function must be a 'css' function result: `+e+`. Use 'unsafeCSS' to pass non-literal values, but take care to ensure page security.`)})(n)+e[r+1],e[0]),e,n),s=(n,r)=>{if(t)n.adoptedStyleSheets=r.map(e=>e instanceof CSSStyleSheet?e:e.styleSheet);else for(let t of r){let r=document.createElement(`style`),i=e.litNonce;i!==void 0&&r.setAttribute(`nonce`,i),r.textContent=t.cssText,n.appendChild(r)}},c=t?e=>e:e=>e instanceof CSSStyleSheet?(e=>{let t=``;for(let n of e.cssRules)t+=n.cssText;return a(t)})(e):e;var l,u;
/**
* @license
* Copyright 2017 Google LLC
* SPDX-License-Identifier: BSD-3-Clause
*/const{is:d,defineProperty:f,getOwnPropertyDescriptor:p,getOwnPropertyNames:m,getOwnPropertySymbols:h,getPrototypeOf:g}=Object,_=globalThis,v=_.trustedTypes,y=v?v.emptyScript:``,b=_.reactiveElementPolyfillSupport,x=(e,t)=>e,ee={toAttribute(e,t){switch(t){case Boolean:e=e?y:null;break;case Object:case Array:e=e==null?e:JSON.stringify(e)}return e},fromAttribute(e,t){let n=e;switch(t){case Boolean:n=e!==null;break;case Number:n=e===null?null:Number(e);break;case Object:case Array:try{n=JSON.parse(e)}catch{n=null}}return n}},S=(e,t)=>!d(e,t),te={attribute:!0,type:String,converter:ee,reflect:!1,useDefault:!1,hasChanged:S};(l=Symbol).metadata!=null||(l.metadata=Symbol(`metadata`)),_.litPropertyMetadata!=null||(_.litPropertyMetadata=/* @__PURE__ */ new WeakMap);var ne=class extends HTMLElement{static addInitializer(e){var t;this._$Ei(),((t=this.l)==null?this.l=[]:t).push(e)}static get observedAttributes(){return this.finalize(),this._$Eh&&[...this._$Eh.keys()]}static createProperty(e,t=te){if(t.state&&(t.attribute=!1),this._$Ei(),this.prototype.hasOwnProperty(e)&&((t=Object.create(t)).wrapped=!0),this.elementProperties.set(e,t),!t.noAccessor){let n=Symbol(),r=this.getPropertyDescriptor(e,n,t);r!==void 0&&f(this.prototype,e,r)}}static getPropertyDescriptor(e,t,n){var r;let{get:i,set:a}=(r=p(this.prototype,e))==null?{get(){return this[t]},set(e){this[t]=e}}:r;return{get:i,set(t){let r=i==null?void 0:i.call(this);a==null||a.call(this,t),this.requestUpdate(e,r,n)},configurable:!0,enumerable:!0}}static getPropertyOptions(e){var t;return(t=this.elementProperties.get(e))==null?te:t}static _$Ei(){if(this.hasOwnProperty(x(`elementProperties`)))return;let e=g(this);e.finalize(),e.l!==void 0&&(this.l=[...e.l]),this.elementProperties=new Map(e.elementProperties)}static finalize(){if(this.hasOwnProperty(x(`finalized`)))return;if(this.finalized=!0,this._$Ei(),this.hasOwnProperty(x(`properties`))){let e=this.properties,t=[...m(e),...h(e)];for(let n of t)this.createProperty(n,e[n])}let e=this[Symbol.metadata];if(e!==null){let t=litPropertyMetadata.get(e);if(t!==void 0)for(let[e,n]of t)this.elementProperties.set(e,n)}this._$Eh=/* @__PURE__ */ new Map;for(let[e,t]of this.elementProperties){let n=this._$Eu(e,t);n!==void 0&&this._$Eh.set(n,e)}this.elementStyles=this.finalizeStyles(this.styles)}static finalizeStyles(e){let t=[];if(Array.isArray(e)){let n=new Set(e.flat(1/0).reverse());for(let e of n)t.unshift(c(e))}else e!==void 0&&t.push(c(e));return t}static _$Eu(e,t){let n=t.attribute;return!1===n?void 0:typeof n==`string`?n:typeof e==`string`?e.toLowerCase():void 0}constructor(){super(),this._$Ep=void 0,this.isUpdatePending=!1,this.hasUpdated=!1,this._$Em=null,this._$Ev()}_$Ev(){var e;this._$ES=new Promise(e=>this.enableUpdating=e),this._$AL=/* @__PURE__ */ new Map,this._$E_(),this.requestUpdate(),(e=this.constructor.l)==null||e.forEach(e=>e(this))}addController(e){var t,n;((t=this._$EO)==null?this._$EO=/* @__PURE__ */ new Set:t).add(e),this.renderRoot!==void 0&&this.isConnected&&((n=e.hostConnected)==null||n.call(e))}removeController(e){var t;(t=this._$EO)==null||t.delete(e)}_$E_(){let e=/* @__PURE__ */ new Map,t=this.constructor.elementProperties;for(let n of t.keys())this.hasOwnProperty(n)&&(e.set(n,this[n]),delete this[n]);e.size>0&&(this._$Ep=e)}createRenderRoot(){var e;let t=(e=this.shadowRoot)==null?this.attachShadow(this.constructor.shadowRootOptions):e;return s(t,this.constructor.elementStyles),t}connectedCallback(){var e;this.renderRoot!=null||(this.renderRoot=this.createRenderRoot()),this.enableUpdating(!0),(e=this._$EO)==null||e.forEach(e=>{var t;return(t=e.hostConnected)==null?void 0:t.call(e)})}enableUpdating(e){}disconnectedCallback(){var e;(e=this._$EO)==null||e.forEach(e=>{var t;return(t=e.hostDisconnected)==null?void 0:t.call(e)})}attributeChangedCallback(e,t,n){this._$AK(e,n)}_$ET(e,t){let n=this.constructor.elementProperties.get(e),r=this.constructor._$Eu(e,n);if(r!==void 0&&!0===n.reflect){var i;let a=(((i=n.converter)==null?void 0:i.toAttribute)===void 0?ee:n.converter).toAttribute(t,n.type);this._$Em=e,a==null?this.removeAttribute(r):this.setAttribute(r,a),this._$Em=null}}_$AK(e,t){let n=this.constructor,r=n._$Eh.get(e);if(r!==void 0&&this._$Em!==r){var i,a,o;let e=n.getPropertyOptions(r),s=typeof e.converter==`function`?{fromAttribute:e.converter}:((i=e.converter)==null?void 0:i.fromAttribute)===void 0?ee:e.converter;this._$Em=r;let c=s.fromAttribute(t,e.type);this[r]=(a=c==null?(o=this._$Ej)==null?void 0:o.get(r):c)==null?c:a,this._$Em=null}}requestUpdate(e,t,n,r=!1,i){if(e!==void 0){var a,o;let s=this.constructor;if(!1===r&&(i=this[e]),n!=null||(n=s.getPropertyOptions(e)),!(((a=n.hasChanged)==null?S:a)(i,t)||n.useDefault&&n.reflect&&i===((o=this._$Ej)==null?void 0:o.get(e))&&!this.hasAttribute(s._$Eu(e,n))))return;this.C(e,t,n)}!1===this.isUpdatePending&&(this._$ES=this._$EP())}C(e,t,{useDefault:n,reflect:r,wrapped:i},a){var o,s,c;n&&!((o=this._$Ej)==null?this._$Ej=/* @__PURE__ */ new Map:o).has(e)&&(this._$Ej.set(e,(s=a==null?t:a)==null?this[e]:s),!0!==i||a!==void 0)||(this._$AL.has(e)||(this.hasUpdated||n||(t=void 0),this._$AL.set(e,t)),!0===r&&this._$Em!==e&&((c=this._$Eq)==null?this._$Eq=/* @__PURE__ */ new Set:c).add(e))}async _$EP(){this.isUpdatePending=!0;try{await this._$ES}catch(e){Promise.reject(e)}let e=this.scheduleUpdate();return e!=null&&await e,!this.isUpdatePending}scheduleUpdate(){return this.performUpdate()}performUpdate(){if(!this.isUpdatePending)return;if(!this.hasUpdated){if(this.renderRoot!=null||(this.renderRoot=this.createRenderRoot()),this._$Ep){for(let[e,t]of this._$Ep)this[e]=t;this._$Ep=void 0}let e=this.constructor.elementProperties;if(e.size>0)for(let[t,n]of e){let{wrapped:e}=n,r=this[t];!0!==e||this._$AL.has(t)||r===void 0||this.C(t,void 0,n,r)}}let e=!1,t=this._$AL;try{var n;e=this.shouldUpdate(t),e?(this.willUpdate(t),(n=this._$EO)==null||n.forEach(e=>{var t;return(t=e.hostUpdate)==null?void 0:t.call(e)}),this.update(t)):this._$EM()}catch(t){throw e=!1,this._$EM(),t}e&&this._$AE(t)}willUpdate(e){}_$AE(e){var t;(t=this._$EO)==null||t.forEach(e=>{var t;return(t=e.hostUpdated)==null?void 0:t.call(e)}),this.hasUpdated||(this.hasUpdated=!0,this.firstUpdated(e)),this.updated(e)}_$EM(){this._$AL=/* @__PURE__ */ new Map,this.isUpdatePending=!1}get updateComplete(){return this.getUpdateComplete()}getUpdateComplete(){return this._$ES}shouldUpdate(e){return!0}update(e){this._$Eq&&(this._$Eq=this._$Eq.forEach(e=>this._$ET(e,this[e]))),this._$EM()}updated(e){}firstUpdated(e){}};ne.elementStyles=[],ne.shadowRootOptions={mode:`open`},ne[x(`elementProperties`)]=/* @__PURE__ */ new Map,ne[x(`finalized`)]=/* @__PURE__ */ new Map,b==null||b({ReactiveElement:ne}),((u=_.reactiveElementVersions)==null?_.reactiveElementVersions=[]:u).push(`2.1.2`);var re;
/**
* @license
* Copyright 2017 Google LLC
* SPDX-License-Identifier: BSD-3-Clause
*/
const C=globalThis,ie=e=>e,ae=C.trustedTypes,oe=ae?ae.createPolicy(`lit-html`,{createHTML:e=>e}):void 0,se=`$lit$`,ce=`lit$${Math.random().toFixed(9).slice(2)}$`,le=`?`+ce,ue=`<${le}>`,de=document,fe=()=>de.createComment(``),pe=e=>e===null||typeof e!=`object`&&typeof e!=`function`,me=Array.isArray,he=e=>me(e)||typeof(e==null?void 0:e[Symbol.iterator])==`function`,ge=`[ 	
\f\r]`,_e=/<(?:(!--|\/[^a-zA-Z])|(\/?[a-zA-Z][^>\s]*)|(\/?$))/g,w=/-->/g,ve=/>/g,ye=RegExp(`>|${ge}(?:([^\\s"'>=/]+)(${ge}*=${ge}*(?:[^ \t\n\f\r"'\`<>=]|("|')|))|$)`,`g`),be=/'/g,xe=/"/g,Se=/^(?:script|style|textarea|title)$/i,Ce=e=>(t,...n)=>({_$litType$:e,strings:t,values:n}),T=Ce(1),we=Ce(2),Te=Symbol.for(`lit-noChange`),E=Symbol.for(`lit-nothing`),Ee=/* @__PURE__ */ new WeakMap,D=de.createTreeWalker(de,129);function De(e,t){if(!me(e)||!e.hasOwnProperty(`raw`))throw Error(`invalid template strings array`);return oe===void 0?t:oe.createHTML(t)}const Oe=(e,t)=>{let n=e.length-1,r=[],i,a=t===2?`<svg>`:t===3?`<math>`:``,o=_e;for(let t=0;t<n;t++){var s;let n=e[t],c,l,u=-1,d=0;for(;d<n.length&&(o.lastIndex=d,l=o.exec(n),l!==null);)d=o.lastIndex,o===_e?l[1]===`!--`?o=w:l[1]===void 0?l[2]===void 0?l[3]!==void 0&&(o=ye):(Se.test(l[2])&&(i=RegExp(`</`+l[2],`g`)),o=ye):o=ve:o===ye?l[0]===`>`?(o=(s=i)==null?_e:s,u=-1):l[1]===void 0?u=-2:(u=o.lastIndex-l[2].length,c=l[1],o=l[3]===void 0?ye:l[3]===`"`?xe:be):o===xe||o===be?o=ye:o===w||o===ve?o=_e:(o=ye,i=void 0);let f=o===ye&&e[t+1].startsWith(`/>`)?` `:``;a+=o===_e?n+ue:u>=0?(r.push(c),n.slice(0,u)+se+n.slice(u)+ce+f):n+ce+(u===-2?t:f)}return[De(e,a+(e[n]||`<?>`)+(t===2?`</svg>`:t===3?`</math>`:``)),r]};var ke=class e{constructor({strings:t,_$litType$:n},r){let i;this.parts=[];let a=0,o=0,s=t.length-1,c=this.parts,[l,u]=Oe(t,n);if(this.el=e.createElement(l,r),D.currentNode=this.el.content,n===2||n===3){let e=this.el.content.firstChild;e.replaceWith(...e.childNodes)}for(;(i=D.nextNode())!==null&&c.length<s;){if(i.nodeType===1){if(i.hasAttributes())for(let e of i.getAttributeNames())if(e.endsWith(se)){let t=u[o++],n=i.getAttribute(e).split(ce),r=/([.?@])?(.*)/.exec(t);c.push({type:1,index:a,name:r[2],strings:n,ctor:r[1]===`.`?Pe:r[1]===`?`?Fe:r[1]===`@`?Ie:Ne}),i.removeAttribute(e)}else e.startsWith(ce)&&(c.push({type:6,index:a}),i.removeAttribute(e));if(Se.test(i.tagName)){let e=i.textContent.split(ce),t=e.length-1;if(t>0){i.textContent=ae?ae.emptyScript:``;for(let n=0;n<t;n++)i.append(e[n],fe()),D.nextNode(),c.push({type:2,index:++a});i.append(e[t],fe())}}}else if(i.nodeType===8){if(i.data===le)c.push({type:2,index:a});else{let e=-1;for(;(e=i.data.indexOf(ce,e+1))!==-1;)c.push({type:7,index:a}),e+=ce.length-1}}a++}}static createElement(e,t){let n=de.createElement(`template`);return n.innerHTML=e,n}};function Ae(e,t,n=e,r){var i,a,o;if(t===Te)return t;let s=r===void 0?n._$Cl:(i=n._$Co)==null?void 0:i[r],c=pe(t)?void 0:t._$litDirective$;return(s==null?void 0:s.constructor)!==c&&(s==null||(a=s._$AO)==null||a.call(s,!1),c===void 0?s=void 0:(s=new c(e),s._$AT(e,n,r)),r===void 0?n._$Cl=s:((o=n._$Co)==null?n._$Co=[]:o)[r]=s),s!==void 0&&(t=Ae(e,s._$AS(e,t.values),s,r)),t}var je=class{constructor(e,t){this._$AV=[],this._$AN=void 0,this._$AD=e,this._$AM=t}get parentNode(){return this._$AM.parentNode}get _$AU(){return this._$AM._$AU}u(e){var t;let{el:{content:n},parts:r}=this._$AD,i=((t=e==null?void 0:e.creationScope)==null?de:t).importNode(n,!0);D.currentNode=i;let a=D.nextNode(),o=0,s=0,c=r[0];for(;c!==void 0;){if(o===c.index){let t;c.type===2?t=new Me(a,a.nextSibling,this,e):c.type===1?t=new c.ctor(a,c.name,c.strings,this,e):c.type===6&&(t=new Le(a,this,e)),this._$AV.push(t),c=r[++s]}o!==(c==null?void 0:c.index)&&(a=D.nextNode(),o++)}return D.currentNode=de,i}p(e){let t=0;for(let n of this._$AV)n!==void 0&&(n.strings===void 0?n._$AI(e[t]):(n._$AI(e,n,t),t+=n.strings.length-2)),t++}},Me=class e{get _$AU(){var e,t;return(e=(t=this._$AM)==null?void 0:t._$AU)==null?this._$Cv:e}constructor(e,t,n,r){var i;this.type=2,this._$AH=E,this._$AN=void 0,this._$AA=e,this._$AB=t,this._$AM=n,this.options=r,this._$Cv=(i=r==null?void 0:r.isConnected)==null||i}get parentNode(){let e=this._$AA.parentNode,t=this._$AM;return t!==void 0&&(e==null?void 0:e.nodeType)===11&&(e=t.parentNode),e}get startNode(){return this._$AA}get endNode(){return this._$AB}_$AI(e,t=this){e=Ae(this,e,t),pe(e)?e===E||e==null||e===``?(this._$AH!==E&&this._$AR(),this._$AH=E):e!==this._$AH&&e!==Te&&this._(e):e._$litType$===void 0?e.nodeType===void 0?he(e)?this.k(e):this._(e):this.T(e):this.$(e)}O(e){return this._$AA.parentNode.insertBefore(e,this._$AB)}T(e){this._$AH!==e&&(this._$AR(),this._$AH=this.O(e))}_(e){this._$AH!==E&&pe(this._$AH)?this._$AA.nextSibling.data=e:this.T(de.createTextNode(e)),this._$AH=e}$(e){var t;let{values:n,_$litType$:r}=e,i=typeof r==`number`?this._$AC(e):(r.el===void 0&&(r.el=ke.createElement(De(r.h,r.h[0]),this.options)),r);if(((t=this._$AH)==null?void 0:t._$AD)===i)this._$AH.p(n);else{let e=new je(i,this),t=e.u(this.options);e.p(n),this.T(t),this._$AH=e}}_$AC(e){let t=Ee.get(e.strings);return t===void 0&&Ee.set(e.strings,t=new ke(e)),t}k(t){me(this._$AH)||(this._$AH=[],this._$AR());let n=this._$AH,r,i=0;for(let a of t)i===n.length?n.push(r=new e(this.O(fe()),this.O(fe()),this,this.options)):r=n[i],r._$AI(a),i++;i<n.length&&(this._$AR(r&&r._$AB.nextSibling,i),n.length=i)}_$AR(e=this._$AA.nextSibling,t){var n;for((n=this._$AP)==null||n.call(this,!1,!0,t);e!==this._$AB;){let t=ie(e).nextSibling;ie(e).remove(),e=t}}setConnected(e){var t;this._$AM===void 0&&(this._$Cv=e,(t=this._$AP)==null||t.call(this,e))}},Ne=class{get tagName(){return this.element.tagName}get _$AU(){return this._$AM._$AU}constructor(e,t,n,r,i){this.type=1,this._$AH=E,this._$AN=void 0,this.element=e,this.name=t,this._$AM=r,this.options=i,n.length>2||n[0]!==``||n[1]!==``?(this._$AH=Array(n.length-1).fill(/* @__PURE__ */ new String),this.strings=n):this._$AH=E}_$AI(e,t=this,n,r){let i=this.strings,a=!1;if(i===void 0)e=Ae(this,e,t,0),a=!pe(e)||e!==this._$AH&&e!==Te,a&&(this._$AH=e);else{var o;let r=e,s,c;for(e=i[0],s=0;s<i.length-1;s++)c=Ae(this,r[n+s],t,s),c===Te&&(c=this._$AH[s]),a||(a=!pe(c)||c!==this._$AH[s]),c===E?e=E:e!==E&&(e+=((o=c)==null?``:o)+i[s+1]),this._$AH[s]=c}a&&!r&&this.j(e)}j(e){e===E?this.element.removeAttribute(this.name):this.element.setAttribute(this.name,e==null?``:e)}},Pe=class extends Ne{constructor(){super(...arguments),this.type=3}j(e){this.element[this.name]=e===E?void 0:e}},Fe=class extends Ne{constructor(){super(...arguments),this.type=4}j(e){this.element.toggleAttribute(this.name,!!e&&e!==E)}},Ie=class extends Ne{constructor(e,t,n,r,i){super(e,t,n,r,i),this.type=5}_$AI(e,t=this){var n;if((e=(n=Ae(this,e,t,0))==null?E:n)===Te)return;let r=this._$AH,i=e===E&&r!==E||e.capture!==r.capture||e.once!==r.once||e.passive!==r.passive,a=e!==E&&(r===E||i);i&&this.element.removeEventListener(this.name,this,r),a&&this.element.addEventListener(this.name,this,e),this._$AH=e}handleEvent(e){var t,n;typeof this._$AH==`function`?this._$AH.call((t=(n=this.options)==null?void 0:n.host)==null?this.element:t,e):this._$AH.handleEvent(e)}},Le=class{constructor(e,t,n){this.element=e,this.type=6,this._$AN=void 0,this._$AM=t,this.options=n}get _$AU(){return this._$AM._$AU}_$AI(e){Ae(this,e)}};const Re=C.litHtmlPolyfillSupport;Re==null||Re(ke,Me),((re=C.litHtmlVersions)==null?C.litHtmlVersions=[]:re).push(`3.3.2`);const ze=(e,t,n)=>{var r;let i=(r=n==null?void 0:n.renderBefore)==null?t:r,a=i._$litPart$;if(a===void 0){var o;let e=(o=n==null?void 0:n.renderBefore)==null?null:o;i._$litPart$=a=new Me(t.insertBefore(fe(),e),e,void 0,n==null?{}:n)}return a._$AI(e),a};var Be,Ve;
/**
* @license
* Copyright 2017 Google LLC
* SPDX-License-Identifier: BSD-3-Clause
*/const He=globalThis;var O=class extends ne{constructor(){super(...arguments),this.renderOptions={host:this},this._$Do=void 0}createRenderRoot(){var e;let t=super.createRenderRoot();return(e=this.renderOptions).renderBefore!=null||(e.renderBefore=t.firstChild),t}update(e){let t=this.render();this.hasUpdated||(this.renderOptions.isConnected=this.isConnected),super.update(e),this._$Do=ze(t,this.renderRoot,this.renderOptions)}connectedCallback(){var e;super.connectedCallback(),(e=this._$Do)==null||e.setConnected(!0)}disconnectedCallback(){var e;super.disconnectedCallback(),(e=this._$Do)==null||e.setConnected(!1)}render(){return Te}};O._$litElement$=!0,O.finalized=!0,(Be=He.litElementHydrateSupport)==null||Be.call(He,{LitElement:O});const Ue=He.litElementPolyfillSupport;Ue==null||Ue({LitElement:O}),((Ve=He.litElementVersions)==null?He.litElementVersions=[]:Ve).push(`4.2.2`);
/**
* @license
* Copyright 2017 Google LLC
* SPDX-License-Identifier: BSD-3-Clause
*/
const We=e=>(t,n)=>{n===void 0?customElements.define(e,t):n.addInitializer(()=>{customElements.define(e,t)})},Ge={attribute:!0,type:String,converter:ee,reflect:!1,hasChanged:S},Ke=(e=Ge,t,n)=>{
/**
* @license
* Copyright 2017 Google LLC
* SPDX-License-Identifier: BSD-3-Clause
*/
let{kind:r,metadata:i}=n,a=globalThis.litPropertyMetadata.get(i);if(a===void 0&&globalThis.litPropertyMetadata.set(i,a=/* @__PURE__ */ new Map),r===`setter`&&((e=Object.create(e)).wrapped=!0),a.set(n.name,e),r===`accessor`){let{name:r}=n;return{set(n){let i=t.get.call(this);t.set.call(this,n),this.requestUpdate(r,i,e,!0,n)},init(t){return t!==void 0&&this.C(r,void 0,e,t),t}}}if(r===`setter`){let{name:r}=n;return function(n){let i=this[r];t.call(this,n),this.requestUpdate(r,i,e,!0,n)}}throw Error(`Unsupported decorator location: `+r)};function qe(e){return(t,n)=>typeof n==`object`?Ke(e,t,n):((e,t,n)=>{let r=t.hasOwnProperty(n);return t.constructor.createProperty(n,e),r?Object.getOwnPropertyDescriptor(t,n):void 0})(e,t,n)}
/**
* @license
* Copyright 2017 Google LLC
* SPDX-License-Identifier: BSD-3-Clause
*/function k(e){return qe({...e,state:!0,attribute:!1})}
/**
* @license
* Copyright 2017 Google LLC
* SPDX-License-Identifier: BSD-3-Clause
*/
const Je={ATTRIBUTE:1,CHILD:2,PROPERTY:3,BOOLEAN_ATTRIBUTE:4,EVENT:5,ELEMENT:6},Ye=e=>(...t)=>({_$litDirective$:e,values:t});var Xe=class{constructor(e){}get _$AU(){return this._$AM._$AU}_$AT(e,t,n){this._$Ct=e,this._$AM=t,this._$Ci=n}_$AS(e,t){return this.update(e,t)}update(e,t){return this.render(...t)}},Ze=class extends Xe{constructor(e){
/**
* @license
* Copyright 2017 Google LLC
* SPDX-License-Identifier: BSD-3-Clause
*/
if(super(e),this.it=E,e.type!==Je.CHILD)throw Error(this.constructor.directiveName+`() can only be used in child bindings`)}render(e){if(e===E||e==null)return this._t=void 0,this.it=e;if(e===Te)return e;if(typeof e!=`string`)throw Error(this.constructor.directiveName+`() called with a non-string value`);if(e===this.it)return this._t;this.it=e;let t=[e];return t.raw=t,this._t={_$litType$:this.constructor.resultType,strings:t,values:[]}}};Ze.directiveName=`unsafeHTML`,Ze.resultType=1;const Qe=Ye(Ze),$e=[`auto`,`6h`,`12h`,`24h`,`72h`],et={"6h":6,"12h":12,"24h":24,"72h":72},tt={preparation:`striped`,active:`shimmer`,ongoing:`pulse`},nt={preparation:`dashed`,active:`solid`,ongoing:`solid`};
/*! @license DOMPurify 3.4.17 | (c) Cure53 and other contributors | Released under the Apache license 2.0 and Mozilla Public License 2.0 | github.com/cure53/DOMPurify/blob/3.4.17/LICENSE */
function rt(e,t){this.v=e,this.k=t}function it(e,t){(t==null||t>e.length)&&(t=e.length);for(var n=0,r=Array(t);n<t;n++)r[n]=e[n];return r}function at(e){if(Array.isArray(e))return e}function ot(e,t){var n=e==null?null:typeof Symbol<`u`&&e[Symbol.iterator]||e[`@@iterator`];if(n!=null){var r,i,a,o,s=[],c=!0,l=!1;try{if(a=(n=n.call(e)).next,t===0){if(Object(n)!==n)return;c=!1}else for(;!(c=(r=a.call(n)).done)&&(s.push(r.value),s.length!==t);c=!0);}catch(e){l=!0,i=e}finally{try{if(!c&&n.return!=null&&(o=n.return(),Object(o)!==o))return}finally{if(l)throw i}}return s}}function st(){throw TypeError(`Invalid attempt to destructure non-iterable instance.
In order to be iterable, non-array objects must have a [Symbol.iterator]() method.`)}
/*! regenerator-runtime -- Copyright (c) 2014-present, Facebook, Inc. -- license (MIT): https://github.com/babel/babel/blob/main/packages/babel-helpers/LICENSE */
function ct(e,t){return at(e)||ot(e,t)||lt(e,t)||st()}function lt(e,t){if(e){if(typeof e==`string`)return it(e,t);var n={}.toString.call(e).slice(8,-1);return n===`Object`&&e.constructor&&(n=e.constructor.name),n===`Map`||n===`Set`?Array.from(e):n===`Arguments`||/^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)?it(e,t):void 0}}function ut(e){var t,n;function r(t,n){try{var a=e[t](n),o=a.value,s=o instanceof rt;Promise.resolve(s?o.v:o).then(function(n){if(s){var c=t===`return`&&o.k?t:`next`;if(!o.k||n.done)return r(c,n);n=e[c](n).value}i(!!a.done,n)},function(e){r(`throw`,e)})}catch(e){i(2,e)}}function i(e,i){e===2?t.reject(i):t.resolve({value:i,done:e}),(t=t.next)?r(t.key,t.arg):n=null}this._invoke=function(e,i){return new Promise(function(a,o){var s={key:e,arg:i,resolve:a,reject:o,next:null};n?n=n.next=s:(t=n=s,r(e,i))})},typeof e.return!=`function`&&(this.return=void 0)}ut.prototype[typeof Symbol==`function`&&Symbol.asyncIterator||`@@asyncIterator`]=function(){return this},ut.prototype.next=function(e){return this._invoke(`next`,e)},ut.prototype.throw=function(e){return this._invoke(`throw`,e)},ut.prototype.return=function(e){return this._invoke(`return`,e)};const dt=Object.entries,ft=Object.setPrototypeOf,pt=Object.isFrozen,mt=Object.getPrototypeOf,ht=Object.getOwnPropertyDescriptor;let A=Object.freeze,j=Object.seal,gt=Object.create,_t=typeof Reflect<`u`&&Reflect,vt=_t.apply,M=_t.construct;A||(A=function(e){return e}),j||(j=function(e){return e}),vt||(vt=function(e,t){var n=[...arguments].slice(2);return e.apply(t,n)}),M||(M=function(e){return new e(...[...arguments].slice(1))});const yt=F(Array.prototype.forEach);Array.prototype.indexOf;const bt=F(Array.prototype.lastIndexOf),xt=F(Array.prototype.pop),St=F(Array.prototype.push),Ct=F(Array.prototype.slice),wt=F(Array.prototype.splice),Tt=Array.isArray,Et=Vt(Set),Dt=F(Set.prototype.add),Ot=F(Set.prototype.has),kt=F(String.prototype.toLowerCase),At=F(String.prototype.toString),jt=F(String.prototype.match),Mt=F(String.prototype.replace),Nt=F(String.prototype.indexOf),Pt=F(String.prototype.trim),Ft=F(Number.prototype.toString),It=F(Boolean.prototype.toString),Lt=typeof BigInt>`u`?null:F(BigInt.prototype.toString),Rt=typeof Symbol>`u`?null:F(Symbol.prototype.toString),N=F(Object.prototype.hasOwnProperty),zt=F(Object.prototype.toString),P=F(RegExp.prototype.test),Bt=Vt(TypeError);function F(e){return function(t){t instanceof RegExp&&(t.lastIndex=0);var n=[...arguments].slice(1);return vt(e,t,n)}}function Vt(e){return function(){return M(e,[...arguments])}}function I(e,t){let n=arguments.length>2&&arguments[2]!==void 0?arguments[2]:kt;if(ft&&ft(e,null),!Tt(t))return e;let r=t.length;for(;r--;){let i=t[r];if(typeof i==`string`){let e=n(i);e!==i&&(pt(t)||(t[r]=e),i=e)}e[i]=!0}return e}function Ht(e){for(let t=0;t<e.length;t++)N(e,t)||(e[t]=null);return e}function L(e){let t=gt(null);for(let r of dt(e)){var n=ct(r,2);let i=n[0],a=n[1];N(e,i)&&(t[i]=Tt(a)?Ht(a):a&&typeof a==`object`&&a.constructor===Object?L(a):a)}return t}function Ut(e){switch(typeof e){case`string`:return e;case`number`:return Ft(e);case`boolean`:return It(e);case`bigint`:return Lt?Lt(e):`0`;case`symbol`:return Rt?Rt(e):`Symbol()`;case`undefined`:return zt(e);case`function`:case`object`:{if(e===null)return zt(e);let t=e,n=R(t,`toString`);if(typeof n==`function`){let e=n(t);return typeof e==`string`?e:zt(e)}return zt(e)}default:return zt(e)}}function R(e,t){for(;e!==null;){let n=ht(e,t);if(n){if(n.get)return F(n.get);if(typeof n.value==`function`)return F(n.value)}e=mt(e)}function n(){return null}return n}function Wt(e,t){for(;e!==null;){let n=ht(e,t);if(n)return n.get?F(n.get):null;e=mt(e)}return null}function Gt(e){try{return P(e,``),!0}catch{return!1}}const Kt=A(/* @__PURE__ */ `a.abbr.acronym.address.area.article.aside.audio.b.bdi.bdo.big.blink.blockquote.body.br.button.canvas.caption.center.cite.code.col.colgroup.content.data.datalist.dd.decorator.del.details.dfn.dialog.dir.div.dl.dt.element.em.fieldset.figcaption.figure.font.footer.form.h1.h2.h3.h4.h5.h6.head.header.hgroup.hr.html.i.img.input.ins.kbd.label.legend.li.main.map.mark.marquee.menu.menuitem.meter.nav.nobr.ol.optgroup.option.output.p.picture.pre.progress.q.rp.rt.ruby.s.samp.search.section.select.shadow.slot.small.source.spacer.span.strike.strong.style.sub.summary.sup.table.tbody.td.template.textarea.tfoot.th.thead.time.tr.track.tt.u.ul.var.video.wbr`.split(`.`)),qt=A(/* @__PURE__ */ `svg.a.altglyph.altglyphdef.altglyphitem.animatecolor.animatemotion.animatetransform.circle.clippath.defs.desc.ellipse.enterkeyhint.exportparts.filter.font.g.glyph.glyphref.hkern.image.inputmode.line.lineargradient.marker.mask.metadata.mpath.part.path.pattern.polygon.polyline.radialgradient.rect.stop.style.switch.symbol.text.textpath.title.tref.tspan.view.vkern`.split(`.`)),Jt=A([`feBlend`,`feColorMatrix`,`feComponentTransfer`,`feComposite`,`feConvolveMatrix`,`feDiffuseLighting`,`feDisplacementMap`,`feDistantLight`,`feDropShadow`,`feFlood`,`feFuncA`,`feFuncB`,`feFuncG`,`feFuncR`,`feGaussianBlur`,`feImage`,`feMerge`,`feMergeNode`,`feMorphology`,`feOffset`,`fePointLight`,`feSpecularLighting`,`feSpotLight`,`feTile`,`feTurbulence`]),Yt=A([`animate`,`color-profile`,`cursor`,`discard`,`font-face`,`font-face-format`,`font-face-name`,`font-face-src`,`font-face-uri`,`foreignobject`,`hatch`,`hatchpath`,`mesh`,`meshgradient`,`meshpatch`,`meshrow`,`missing-glyph`,`script`,`set`,`solidcolor`,`unknown`,`use`]),Xt=A(/* @__PURE__ */ `math.menclose.merror.mfenced.mfrac.mglyph.mi.mlabeledtr.mmultiscripts.mn.mo.mover.mpadded.mphantom.mroot.mrow.ms.mspace.msqrt.mstyle.msub.msup.msubsup.mtable.mtd.mtext.mtr.munder.munderover.mprescripts`.split(`.`)),Zt=A([`maction`,`maligngroup`,`malignmark`,`mlongdiv`,`mscarries`,`mscarry`,`msgroup`,`mstack`,`msline`,`msrow`,`semantics`,`annotation`,`annotation-xml`,`mprescripts`,`none`]),Qt=A([`#text`]),$t=A(/* @__PURE__ */ `accept.action.align.alt.autocapitalize.autocomplete.autopictureinpicture.autoplay.background.bgcolor.border.capture.cellpadding.cellspacing.checked.cite.class.clear.color.cols.colspan.command.commandfor.controls.controlslist.coords.crossorigin.datetime.decoding.default.dir.disabled.disablepictureinpicture.disableremoteplayback.download.draggable.enctype.enterkeyhint.exportparts.face.for.headers.height.hidden.high.href.hreflang.id.inert.inputmode.integrity.ismap.kind.label.lang.list.loading.loop.low.max.maxlength.media.method.min.minlength.multiple.muted.name.nonce.noshade.novalidate.nowrap.open.optimum.part.pattern.placeholder.playsinline.popover.popovertarget.popovertargetaction.poster.preload.pubdate.radiogroup.readonly.rel.required.rev.reversed.role.rows.rowspan.spellcheck.scope.selected.shape.size.sizes.slot.span.srclang.start.src.srcset.step.style.summary.tabindex.title.translate.type.usemap.valign.value.width.wrap.xmlns`.split(`.`)),en=A(/* @__PURE__ */ `accent-height.accumulate.additive.alignment-baseline.amplitude.ascent.attributename.attributetype.azimuth.basefrequency.baseline-shift.begin.bias.by.class.clip.clippathunits.clip-path.clip-rule.color.color-interpolation.color-interpolation-filters.color-profile.color-rendering.cx.cy.d.dx.dy.diffuseconstant.direction.display.divisor.dominant-baseline.dur.edgemode.elevation.end.exponent.fill.fill-opacity.fill-rule.filter.filterunits.flood-color.flood-opacity.font-family.font-size.font-size-adjust.font-stretch.font-style.font-variant.font-weight.fx.fy.g1.g2.glyph-name.glyphref.gradientunits.gradienttransform.height.href.id.image-rendering.in.in2.intercept.k.k1.k2.k3.k4.kerning.keypoints.keysplines.keytimes.lang.lengthadjust.letter-spacing.kernelmatrix.kernelunitlength.lighting-color.local.marker-end.marker-mid.marker-start.markerheight.markerunits.markerwidth.maskcontentunits.maskunits.max.mask.mask-type.media.method.mode.min.name.numoctaves.offset.operator.opacity.order.orient.orientation.origin.overflow.paint-order.path.pathlength.patterncontentunits.patterntransform.patternunits.pointer-events.points.preservealpha.preserveaspectratio.primitiveunits.r.rx.ry.radius.refx.refy.repeatcount.repeatdur.restart.result.rotate.scale.seed.shape-rendering.slope.specularconstant.specularexponent.spreadmethod.startoffset.stddeviation.stitchtiles.stop-color.stop-opacity.stroke-dasharray.stroke-dashoffset.stroke-linecap.stroke-linejoin.stroke-miterlimit.stroke-opacity.stroke.stroke-width.style.surfacescale.systemlanguage.tabindex.tablevalues.targetx.targety.transform.transform-origin.text-anchor.text-decoration.text-orientation.text-rendering.textlength.type.u1.u2.unicode.values.vector-effect.viewbox.visibility.version.vert-adv-y.vert-origin-x.vert-origin-y.width.word-spacing.wrap.writing-mode.xchannelselector.ychannelselector.x.x1.x2.xmlns.y.y1.y2.z.zoomandpan`.split(`.`)),tn=A(/* @__PURE__ */ `accent.accentunder.align.bevelled.close.columnalign.columnlines.columnspacing.columnspan.denomalign.depth.dir.display.displaystyle.encoding.fence.frame.height.href.id.largeop.length.linethickness.lquote.lspace.mathbackground.mathcolor.mathsize.mathvariant.maxsize.minsize.movablelimits.notation.numalign.open.rowalign.rowlines.rowspacing.rowspan.rspace.rquote.scriptlevel.scriptminsize.scriptsizemultiplier.selection.separator.separators.stretchy.subscriptshift.supscriptshift.symmetric.voffset.width.xmlns`.split(`.`)),nn=A([`xlink:href`,`xml:id`,`xlink:title`,`xml:space`,`xmlns:xlink`]),rn=j(/{{[\w\W]*|^[\w\W]*}}/g),an=j(/<%[\w\W]*|^[\w\W]*%>/g),on=j(/\${[\w\W]*/g),sn=j(/^data-[\-\w.\u00B7-\uFFFF]+$/),cn=j(/^aria-[\-\w]+$/),ln=j(/^(?:(?:(?:f|ht)tps?|mailto|tel|callto|sms|cid|xmpp|matrix):|[^a-z]|[a-z+.\-]+(?:[^a-z+.\-:]|$))/i),un=j(/^(?:\w+script|data):/i),dn=j(/[\u0000-\u0020\u00A0\u1680\u180E\u2000-\u2029\u205F\u3000]/g),fn=j(/^html$/i),pn=j(/^[a-z][.\w]*(-[.\w]+)+$/i),mn=j(/<[/\w!]/g),hn=j(/<[/\w]/g),gn=j(/<\/no(script|embed|frames)/i),_n=j(/\/>/i),z={element:1,attribute:2,text:3,cdataSection:4,entityReference:5,entityNode:6,processingInstruction:7,comment:8,document:9,documentType:10,documentFragment:11,notation:12},vn=A(I({},[`style`,`script`,`xmp`,`iframe`,`noembed`,`noframes`,`plaintext`,`noscript`])),yn=function(){return typeof window>`u`?null:window},bn=function(e,t){if(typeof e!=`object`||typeof e.createPolicy!=`function`)return null;let n=null,r=`data-tt-policy-suffix`;t&&t.hasAttribute(r)&&(n=t.getAttribute(r));let i=`dompurify`+(n?`#`+n:``);try{return e.createPolicy(i,{createHTML(e){return e},createScriptURL(e){return e}})}catch{return console.warn(`TrustedTypes policy `+i+` could not be created.`),null}},xn=function(){return{afterSanitizeAttributes:[],afterSanitizeElements:[],afterSanitizeShadowDOM:[],beforeSanitizeAttributes:[],beforeSanitizeElements:[],beforeSanitizeShadowDOM:[],uponSanitizeAttribute:[],uponSanitizeElement:[],uponSanitizeShadowNode:[]}},Sn=function(e,t,n,r){return N(e,t)&&Tt(e[t])?I(r.base?L(r.base):{},e[t],r.transform):n},Cn=function(e,t,n){let r=N(e,t)?e[t]:void 0;return r&&typeof r==`object`?L(r):n()};function wn(){let e=arguments.length>0&&arguments[0]!==void 0?arguments[0]:yn(),t=e=>wn(e);if(t.version=`3.4.17`,t.removed=[],!e||!e.document||e.document.nodeType!==z.document||!e.Element)return t.isSupported=!1,t;let n=e.document,r=n,i=r.currentScript;e.DocumentFragment;let a=e.HTMLTemplateElement,o=e.Node,s=e.Element,c=e.NodeFilter;e.NamedNodeMap===void 0&&(e.NamedNodeMap||e.MozNamedAttrMap),e.HTMLFormElement;let l=e.DOMParser,u=e.trustedTypes,d=s.prototype,f=R(d,`cloneNode`),p=R(d,`remove`),m=R(d,`removeAttributeNode`),h=R(d,`nextSibling`),g=R(d,`childNodes`),_=R(d,`parentNode`),v=R(d,`shadowRoot`),y=R(d,`attributes`),b=o&&o.prototype?R(o.prototype,`nodeType`):null,x=o&&o.prototype?R(o.prototype,`nodeName`):null,ee=o&&o.prototype?R(o.prototype,`ownerDocument`):null,S=function(e){return b?b(e):e.nodeType},te=function(e){return x?x(e):e.nodeName},ne=Wt(d,`namespaceURI`),re=function(e){return ne?ne(e):e.namespaceURI};if(typeof a==`function`){let e=n.createElement(`template`);e.content&&e.content.ownerDocument&&(n=e.content.ownerDocument)}let C,ie=``,ae,oe=!1,se=0,ce=function(){if(se>0)throw Bt(`A configured TRUSTED_TYPES_POLICY callback (createHTML or createScriptURL) must not call DOMPurify.sanitize, as that causes infinite recursion. Do not pass a policy whose callbacks wrap DOMPurify as TRUSTED_TYPES_POLICY; see the "DOMPurify and Trusted Types" section of the README.`)},le=function(e){ce(),se++;try{return C.createHTML(e)}finally{se--}},ue=function(e){ce(),se++;try{return C.createScriptURL(e)}finally{se--}},de=function(){return oe||(ae=bn(u,i),oe=!0),ae},fe=n,pe=fe.implementation,me=fe.createNodeIterator,he=fe.createDocumentFragment,ge=fe.getElementsByTagName,_e=r.importNode,w=xn();t.isSupported=typeof dt==`function`&&typeof _==`function`&&pe&&pe.createHTMLDocument!==void 0;let ve=rn,ye=an,be=on,xe=sn,Se=cn,Ce=un,T=dn,we=pn,Te=ln,E=null,Ee=I({},[...Kt,...qt,...Jt,...Xt,...Qt]),D=null,De=I({},[...$t,...en,...tn,...nn]),Oe=Object.seal(gt(null,{tagNameCheck:{writable:!0,configurable:!1,enumerable:!0,value:null},attributeNameCheck:{writable:!0,configurable:!1,enumerable:!0,value:null},allowCustomizedBuiltInElements:{writable:!0,configurable:!1,enumerable:!0,value:!1}})),ke=null,Ae=null,je=Object.seal(gt(null,{tagCheck:{writable:!0,configurable:!1,enumerable:!0,value:null},attributeCheck:{writable:!0,configurable:!1,enumerable:!0,value:null}})),Me=!0,Ne=!0,Pe=!1,Fe=!0,Ie=!1,Le=!0,Re=!1,ze=!1,Be=null,Ve=null,He=!1,O=!1,Ue=!1,We=!1,Ge=!0,Ke=!1,qe=`user-content-`,k=!0,Je=!1,Ye=null,Xe={},Ze=null,Qe=I({},/* @__PURE__ */ `annotation-xml.audio.colgroup.desc.foreignobject.head.iframe.math.mi.mn.mo.ms.mtext.noembed.noframes.noscript.plaintext.script.selectedcontent.style.svg.template.thead.title.video.xmp`.split(`.`)),$e=null,et=I({},[`audio`,`video`,`img`,`source`,`image`,`track`]),tt=null,nt=I({},[`alt`,`class`,`for`,`id`,`label`,`name`,`pattern`,`placeholder`,`role`,`summary`,`title`,`value`,`style`,`xmlns`]),rt=`http://www.w3.org/1998/Math/MathML`,it=`http://www.w3.org/2000/svg`,at=`http://www.w3.org/1999/xhtml`,ot=at,st=!1,ct=null,lt=I({},[rt,it,at],At),ut=A([`mi`,`mo`,`mn`,`ms`,`mtext`]),ft=I({},ut),pt=A([`annotation-xml`]),mt=I({},pt),ht=I({},[`title`,`style`,`font`,`a`,`script`]),_t=null,vt=[`application/xhtml+xml`,`text/html`],M=null,Ft=null,It=n.createElement(`form`),Lt=function(e){return e instanceof RegExp||e instanceof Function},Rt=function(){let e=arguments.length>0&&arguments[0]!==void 0?arguments[0]:{};if(Ft&&Ft===e)return;e&&typeof e==`object`||(e={}),e=L(e),_t=vt.indexOf(e.PARSER_MEDIA_TYPE)===-1?`text/html`:e.PARSER_MEDIA_TYPE,M=_t===`application/xhtml+xml`?At:kt,E=Sn(e,`ALLOWED_TAGS`,Ee,{transform:M}),D=Sn(e,`ALLOWED_ATTR`,De,{transform:M}),ct=Sn(e,`ALLOWED_NAMESPACES`,lt,{transform:At}),tt=Sn(e,`ADD_URI_SAFE_ATTR`,nt,{transform:M,base:nt}),$e=Sn(e,`ADD_DATA_URI_TAGS`,et,{transform:M,base:et}),Ze=Sn(e,`FORBID_CONTENTS`,Qe,{transform:M}),ke=Sn(e,`FORBID_TAGS`,L({}),{transform:M}),Ae=Sn(e,`FORBID_ATTR`,L({}),{transform:M}),Xe=N(e,`USE_PROFILES`)?e.USE_PROFILES&&typeof e.USE_PROFILES==`object`?L(e.USE_PROFILES):e.USE_PROFILES:!1,Me=e.ALLOW_ARIA_ATTR!==!1,Ne=e.ALLOW_DATA_ATTR!==!1,Pe=e.ALLOW_UNKNOWN_PROTOCOLS||!1,Fe=e.ALLOW_SELF_CLOSE_IN_ATTR!==!1,Ie=e.SAFE_FOR_TEMPLATES||!1,Le=e.SAFE_FOR_XML!==!1,Re=e.WHOLE_DOCUMENT||!1,O=e.RETURN_DOM||!1,Ue=e.RETURN_DOM_FRAGMENT||!1,We=e.RETURN_TRUSTED_TYPE||!1,He=e.FORCE_BODY||!1,Ge=e.SANITIZE_DOM!==!1,Ke=e.SANITIZE_NAMED_PROPS||!1,k=e.KEEP_CONTENT!==!1,Je=e.IN_PLACE||!1,Te=Gt(e.ALLOWED_URI_REGEXP)?e.ALLOWED_URI_REGEXP:ln,ot=typeof e.NAMESPACE==`string`?e.NAMESPACE:at,ft=Cn(e,`MATHML_TEXT_INTEGRATION_POINTS`,()=>I({},ut)),mt=Cn(e,`HTML_INTEGRATION_POINTS`,()=>I({},pt));let t=Cn(e,`CUSTOM_ELEMENT_HANDLING`,()=>gt(null));if(Oe=gt(null),N(t,`tagNameCheck`)&&Lt(t.tagNameCheck)&&(Oe.tagNameCheck=t.tagNameCheck),N(t,`attributeNameCheck`)&&Lt(t.attributeNameCheck)&&(Oe.attributeNameCheck=t.attributeNameCheck),N(t,`allowCustomizedBuiltInElements`)&&typeof t.allowCustomizedBuiltInElements==`boolean`&&(Oe.allowCustomizedBuiltInElements=t.allowCustomizedBuiltInElements),j(Oe),Ie&&(Ne=!1),Ue&&(O=!0),Xe&&(E=I({},Qt),D=gt(null),Xe.html===!0&&(I(E,Kt),I(D,$t)),Xe.svg===!0&&(I(E,qt),I(D,en),I(D,nn)),Xe.svgFilters===!0&&(I(E,Jt),I(D,en),I(D,nn)),Xe.mathMl===!0&&(I(E,Xt),I(D,tn),I(D,nn))),je.tagCheck=null,je.attributeCheck=null,N(e,`ADD_TAGS`)&&(typeof e.ADD_TAGS==`function`?je.tagCheck=e.ADD_TAGS:Tt(e.ADD_TAGS)&&(E===Ee&&(E=L(E)),I(E,e.ADD_TAGS,M))),N(e,`ADD_ATTR`)&&(typeof e.ADD_ATTR==`function`?je.attributeCheck=e.ADD_ATTR:Tt(e.ADD_ATTR)&&(D===De&&(D=L(D)),I(D,e.ADD_ATTR,M))),N(e,`ADD_FORBID_CONTENTS`)&&Tt(e.ADD_FORBID_CONTENTS)&&(Ze===Qe&&(Ze=L(Ze)),I(Ze,e.ADD_FORBID_CONTENTS,M)),k&&(E[`#text`]=!0),Re&&I(E,[`html`,`head`,`body`]),E.table&&(I(E,[`tbody`]),delete ke.tbody),e.TRUSTED_TYPES_POLICY){if(typeof e.TRUSTED_TYPES_POLICY.createHTML!=`function`)throw Bt(`TRUSTED_TYPES_POLICY configuration option must provide a "createHTML" hook.`);if(typeof e.TRUSTED_TYPES_POLICY.createScriptURL!=`function`)throw Bt(`TRUSTED_TYPES_POLICY configuration option must provide a "createScriptURL" hook.`);let t=C;C=e.TRUSTED_TYPES_POLICY;try{ie=le(``)}catch(e){throw C=t,e}}else e.TRUSTED_TYPES_POLICY===null?(C=void 0,ie=``):(C===void 0&&(C=de()),C&&typeof ie==`string`&&(ie=le(``)));A&&A(e),Ft=e},zt=I({},[...qt,...Jt,...Yt]),F=I({},[...Xt,...Zt]),Vt=function(e,t,n){return t.namespaceURI===at?e===`svg`:t.namespaceURI===rt?e===`svg`&&(n===`annotation-xml`||ft[n]):!!zt[e]},Ht=function(e,t,n){return t.namespaceURI===at?e===`math`:t.namespaceURI===it?e===`math`&&mt[n]:!!F[e]},Tn=function(e,t,n){return t.namespaceURI===it&&!mt[n]||t.namespaceURI===rt&&!ft[n]?!1:!F[e]&&(ht[e]||!zt[e])},En=function(e){let t=re(e),n=kt(te(e)),r=_(e),i,a;return r&&S(r)===z.element?(i={namespaceURI:re(r)},a=kt(te(r))):(i={namespaceURI:ot},a=`template`),ct[t]?t===it?Vt(n,i,a):t===rt?Ht(n,i,a):t===at?Tn(n,i,a):!!(_t===`application/xhtml+xml`&&ct[t]):!1},B=function(e){St(t.removed,{element:e});try{_(e).removeChild(e)}catch{if(p(e),!_(e))throw Bt(`a node selected for removal could not be detached from its tree and cannot be safely returned; refusing to sanitize in place`)}},Dn=function(e,t,n){try{m(e,t)}catch{try{e.removeAttribute(n)}catch{}}},V=function(e){jn(e);let t=g(e);t&&yt(Ct(t),e=>{try{p(e)}catch{}});let n=S(e)===z.element?y(e):null;if(n)for(let t=n.length-1;t>=0;--t){let r=n[t],i=r&&r.name;typeof i==`string`&&Dn(e,r,i)}},On=function(e,n,r){if(!r)try{r=n.getAttributeNode(e)}catch{r=null}St(t.removed,{attribute:r||null,from:n});try{r?m(n,r):n.removeAttribute(e)}catch{try{n.removeAttribute(e)}catch{}}if(e===`is`){if(O||Ue)try{B(n)}catch{}else try{n.setAttribute(e,``)}catch{}}},kn=function(e){let t=y(e);if(t)for(let n=t.length-1;n>=0;--n){let r=t[n],i=r&&r.name;typeof i!=`string`||D[M(i)]||Dn(e,r,i)}},An=function(e,t){let n=arguments.length>2&&arguments[2]!==void 0&&arguments[2],r=[e];for(;r.length>0;){let e=r.pop();if(t(e)===!1)continue;if(n&&S(e)===z.element){let t=v(e);Gn(t)&&r.push(t)}let i=g(e);if(i)for(let e=i.length-1;e>=0;--e)r.push(i[e])}},jn=function(e){An(e,e=>{S(e)===z.element&&kn(e)})},Mn=function(e){let t=[];return An(e,e=>{t.push(e)},!0),t},Nn=function(e,t){let n=Et();yt(Mn(e),e=>{S(e)===z.element&&Dt(n,e)}),yt(t,e=>{S(e)===z.element&&!Ot(n,e)&&kn(e)})},Pn=function(e,n){let r=!1;return yt(t.removed,t=>{t.element&&(r=r||t.element===e,jn(t.element))}),Nn(e,n),r},Fn=function(e,t){let n=Ye,r=null,i=()=>(r||(r=Et(),yt(t,e=>{Dt(r,e)})),r);for(let t=0;;t++){let r=Mn(e),a=[e],o=!1;if(yt(r,e=>{S(e)===z.documentFragment?St(a,e):!o&&!Ot(n,e)&&(o=Ot(i(),e))}),!o)return;if(t>=8)throw Bt(`the tree kept changing during in-place sanitization; refusing to return it`);yt(a,(t,n)=>{In(t,n>0,e,i())})}},In=function(e,t,n,r){let i=Vn(e),a;for(;a=i.nextNode();)Ot(r,a)&&!Ot(Ye,a)&&(t&&U(w.uponSanitizeShadowNode,a,null),Qn(a,n),ar(a,n),Gn(a.content)&&or(a.content))},Ln=function(e){Ye&&Dt(Ye,e)},Rn=function(e,t){return Le?e===`patchsrc`||e===`for`&&t!==`label`&&t!==`output`:!1},zn=function(e){Le&&An(e,e=>{let t=S(e);if(t===z.processingInstruction||t===z.comment&&P(hn,e.data)){try{p(e)}catch{}return!1}if(t===z.element){let t=e,n=M(te(e));try{t.hasAttribute&&t.hasAttribute(`patchsrc`)&&t.removeAttribute(`patchsrc`),t.hasAttribute&&t.hasAttribute(`for`)&&Rn(`for`,n)&&t.removeAttribute(`for`)}catch{}}return!0})},Bn=function(e){let t=null,r=null;if(He)e=`<remove></remove>`+e;else{let t=jt(e,/^[\r\n\t ]+/);r=t&&t[0]}_t===`application/xhtml+xml`&&ot===at&&(e=`<html xmlns="http://www.w3.org/1999/xhtml"><head></head><body>`+e+`</body></html>`);let i=C?le(e):e;if(ot===at)try{t=new l().parseFromString(i,_t)}catch{}if(!t||!t.documentElement){t=pe.createDocument(ot,`template`,null);try{t.documentElement.innerHTML=st?ie:i}catch{}}let a=t.body||t.documentElement;return e&&r&&a.insertBefore(n.createTextNode(r),a.childNodes[0]||null),ot===at?ge.call(t,Re?`html`:`body`)[0]:Re?t.documentElement:a},Vn=function(e){let t=ee?ee(e):e.ownerDocument;return me.call(t||e,e,c.SHOW_ELEMENT|c.SHOW_COMMENT|c.SHOW_TEXT|c.SHOW_PROCESSING_INSTRUCTION|c.SHOW_CDATA_SECTION,null)},H=function(e){return e=Mt(e,ve,` `),e=Mt(e,ye,` `),e=Mt(e,be,` `),e},Hn=function(e){var t;Un(e);let n=(t=e.querySelectorAll)==null?void 0:t.call(e,`template`);n&&yt(n,e=>{Gn(e.content)&&Hn(e.content)})},Un=function(e){e.normalize();let t=ee?ee(e):e.ownerDocument,n=me.call(t||e,e,c.SHOW_TEXT|c.SHOW_COMMENT|c.SHOW_CDATA_SECTION|c.SHOW_PROCESSING_INSTRUCTION,null),r=n.nextNode();for(;r;)r.data=H(r.data),r=n.nextNode()},Wn=function(e){let t=x?x(e):null;return typeof t!=`string`||M(t)!==`form`?!1:typeof e.nodeName!=`string`||typeof e.textContent!=`string`||typeof e.removeChild!=`function`||e.attributes!==y(e)||typeof e.removeAttribute!=`function`||typeof e.removeAttributeNode!=`function`||typeof e.getAttributeNode!=`function`||typeof e.setAttribute!=`function`||typeof e.namespaceURI!=`string`||typeof e.insertBefore!=`function`||typeof e.hasChildNodes!=`function`||e.nodeType!==b(e)||e.childNodes!==g(e)},Gn=function(e){if(!b||typeof e!=`object`||!e)return!1;try{return b(e)===z.documentFragment}catch{return!1}},Kn=function(e){if(!b||typeof e!=`object`||!e)return!1;try{return typeof b(e)==`number`}catch{return!1}};function U(e,n,r){e.length!==0&&yt(e,e=>{e.call(t,n,r,Ft)})}let qn=function(e,t){return!!(Le&&e.hasChildNodes()&&!Kn(e.firstElementChild)&&P(mn,e.textContent)&&P(mn,e.innerHTML)||Le&&vn[t]&&S(e)===z.element&&re(e)===at&&(Kn(e.firstElementChild)||typeof e.textContent==`string`&&P(mn,e.textContent))||e.nodeType===z.processingInstruction||Le&&e.nodeType===z.comment&&P(hn,e.data))},Jn=function(e,t){return e instanceof RegExp?P(e,t):e instanceof Function&&!!e(t,...[...arguments].slice(2))},Yn=function(e,t,n){if(!ke[t]&&tr(t)&&Jn(Oe.tagNameCheck,t))return!1;if(k&&!Ze[t]&&!Ze[kt(t)]){let t=_(e),r=g(e);if(r&&t){let i=r.length;for(let a=i-1;a>=0;--a){let i=e===n?f(r[a],!0):r[a];t.insertBefore(i,h(e))}}}return B(e),!0},Xn=function(e,t,n,r){return e.length===0?t:t===n||t===r?L(t):t},Zn=function(e,t){return e===t||_(e)!==null?!1:(Je&&jn(e),!0)},Qn=function(e,n){if(Ln(e),U(w.beforeSanitizeElements,e,null),Zn(e,n))return!0;if(Wn(e))return B(e),!0;let r=M(te(e));if(E=Xn(w.uponSanitizeElement,E,Ee,Be),U(w.uponSanitizeElement,e,{tagName:r,allowedTags:E}),Zn(e,n))return!0;if(qn(e,r))return B(e),!0;if(ke[r]||!(je.tagCheck instanceof Function&&je.tagCheck(r))&&!E[r]){let t=Yn(e,r,n);return t===!1&&(U(w.afterSanitizeElements,e,null),Zn(e,n))?!0:t}if(S(e)===z.element&&!En(e)||(r===`noscript`||r===`noembed`||r===`noframes`)&&P(gn,e.innerHTML))return B(e),!0;if(Ie&&e.nodeType===z.text){let n=H(e.textContent);e.textContent!==n&&(St(t.removed,{element:e.cloneNode()}),e.textContent=n)}return U(w.afterSanitizeElements,e,null),Zn(e,n)},$n=function(e,t,r){if(Ae[t]||Rn(t,e)||Ge&&(t===`id`||t===`name`)&&(r in n||r in It))return!1;let i=D[t]||je.attributeCheck instanceof Function&&je.attributeCheck(t,e);return Ne&&P(xe,t)||Me&&P(Se,t)?!0:i?tt[t]||P(Te,Mt(r,T,``))||(t===`src`||t===`xlink:href`||t===`href`)&&e!==`script`&&Nt(r,`data:`)===0&&$e[e]||Pe&&!P(Ce,Mt(r,T,``))?!0:!r:tr(e)&&Jn(Oe.tagNameCheck,e)&&Jn(Oe.attributeNameCheck,t,e)||t===`is`&&Oe.allowCustomizedBuiltInElements&&Jn(Oe.tagNameCheck,r)},er=I({},[`annotation-xml`,`color-profile`,`font-face`,`font-face-format`,`font-face-name`,`font-face-src`,`font-face-uri`,`missing-glyph`]),tr=function(e){return!er[kt(e)]&&P(we,e)},nr=function(e,t,n,r){if(C&&typeof u==`object`&&typeof u.getAttributeType==`function`&&!n)switch(u.getAttributeType(e,t)){case`TrustedHTML`:return le(r);case`TrustedScriptURL`:return ue(r)}return r},rr=function(e,t,n,r){try{return n?e.setAttributeNS(n,t,r):e.setAttribute(t,r),!Wn(e)||(B(e),!1)}catch{return On(t,e),!1}},ir=function(e,t){return Le&&P(/((--!?|])>)|<\/(style|script|title|xmp|textarea|noscript|iframe|noembed|noframes)/i,t)?!0:kt(e)===`attributename`&&jt(t,`href`)!==null},ar=function(e,n){if(U(w.beforeSanitizeAttributes,e,null),Zn(e,n))return;let r=e.attributes;if(!r||Wn(e))return;D=Xn(w.uponSanitizeAttribute,D,De,Ve);let i={attrName:``,attrValue:``,keepAttr:!0,allowedAttributes:D,forceKeepAttr:void 0},a=r.length,o=M(e.nodeName);for(;a--;){let n=r[a],s=n.name,c=n.namespaceURI,l=n.value,u=M(s),d=l,f=s===`value`?d:Pt(d),p=!1;i.attrName=u,i.attrValue=f,i.keepAttr=!0,i.forceKeepAttr=void 0,U(w.uponSanitizeAttribute,e,i),f=i.attrValue,Ke&&(u===`id`||u===`name`)&&Nt(f,qe)!==0&&(On(s,e,n),f=qe+f,p=!0),ir(s,f)?On(s,e,n):i.forceKeepAttr||(i.keepAttr?!Fe&&P(_n,f)?On(s,e,n):(Ie&&(f=H(f)),$n(o,u,f)?(f=nr(o,u,c,f),f!==d&&rr(e,s,c,f)&&p&&xt(t.removed)):On(s,e,n)):On(s,e,n))}U(w.afterSanitizeAttributes,e,null),Zn(e,n)},or=function(e){let t=null,n=Vn(e);for(U(w.beforeSanitizeShadowDOM,e,null);t=n.nextNode();)if(U(w.uponSanitizeShadowNode,t,null),Qn(t,e),ar(t,e),Gn(t.content)&&or(t.content),S(t)===z.element){let e=v(t);Gn(e)&&(W(e),or(e))}Ie&&Un(e),U(w.afterSanitizeShadowDOM,e,null)},W=function(e){let t=[{node:e,shadow:null}];for(;t.length>0;){let e=t.pop();if(e.shadow){or(e.shadow);continue}let n=e.node,r=S(n)===z.element,i=g(n);if(i)for(let e=i.length-1;e>=0;--e)t.push({node:i[e],shadow:null});if(r){let e=x?x(n):null;if(typeof e==`string`&&M(e)===`template`){let e=n.content;Gn(e)&&t.push({node:e,shadow:null})}}if(r){let e=v(n);Gn(e)&&t.push({node:null,shadow:e},{node:e,shadow:null})}}};return t.sanitize=function(e){let n=arguments.length>1&&arguments[1]!==void 0?arguments[1]:{},i=null,a=null,o=null,s=null;if(st=!e,st&&(e=`<!-->`),typeof e!=`string`&&!Kn(e)&&(e=Ut(e),typeof e!=`string`))throw Bt(`dirty is not a string, aborting`);if(!t.isSupported)return e;ze?(E=Be,D=Ve):Rt(n),(w.uponSanitizeElement.length>0||w.uponSanitizeAttribute.length>0)&&(E=L(E)),w.uponSanitizeAttribute.length>0&&(D=L(D)),t.removed=[];let c=Je&&typeof e!=`string`&&Kn(e),l=[],u=Ye;if(c){zn(e);let t=te(e);if(typeof t==`string`){let n=M(t);if(!E[n]||ke[n])throw V(e),Bt(`root node is forbidden and cannot be sanitized in-place`)}if(Wn(e))throw V(e),Bt(`root node is clobbered and cannot be sanitized in-place`);l=Mn(e),Ye=Et()}else if(Kn(e))i=Bn(`<!---->`),a=i.ownerDocument.importNode(e,!0),a.nodeType===z.element&&a.nodeName===`BODY`||a.nodeName===`HTML`?i=a:i.appendChild(a),W(i);else{if(!O&&!Ie&&!Re&&e.indexOf(`<`)===-1)return C&&We?le(e):e;if(i=Bn(e),!i)return O?null:We?ie:``}i&&He&&B(i.firstChild);let d=c?e:i;try{c&&W(e);let t=Vn(d);for(;o=t.nextNode();)Qn(o,d),ar(o,d),Gn(o.content)&&or(o.content);c&&Fn(e,l)}catch(t){throw c&&(V(e),Pn(e,l)),t}finally{Ye=u}if(c){if(Pn(e,l))throw Bt(`a node selected for removal could not be safely returned; refusing to sanitize in place`);return Ie&&Hn(e),e}if(O){if(Ie&&Hn(i),Ue)for(s=he.call(i.ownerDocument);i.firstChild;)s.appendChild(i.firstChild);else s=i;return(D.shadowroot||D.shadowrootmode)&&(s=_e.call(r,s,!0)),s}let f=Re?i.outerHTML:i.innerHTML;return Re&&E[`!doctype`]&&i.ownerDocument&&i.ownerDocument.doctype&&i.ownerDocument.doctype.name&&P(fn,i.ownerDocument.doctype.name)&&(f=`<!DOCTYPE `+i.ownerDocument.doctype.name+`>
`+f),Ie&&(f=H(f)),C&&We?le(f):f},t.setConfig=function(){let e=arguments.length>0&&arguments[0]!==void 0?arguments[0]:{};Rt(e),ze=!0,Be=E,Ve=D},t.clearConfig=function(){Ft=null,ze=!1,Be=null,Ve=null,C=ae,ie=``},t.isValidAttribute=function(e,t,n){Ft||Rt({});let r=M(e),i=M(t);return typeof n==`string`&&(ir(t,n)||!Fe&&P(_n,n))?!1:$n(r,i,n)},t.addHook=function(e,t){typeof t==`function`&&N(w,e)&&St(w[e],t)},t.removeHook=function(e,t){if(N(w,e)){if(t!==void 0){let n=bt(w[e],t);return n===-1?void 0:wt(w[e],n,1)[0]}return xt(w[e])}},t.removeHooks=function(e){N(w,e)&&(w[e]=[])},t.removeAllHooks=function(){w=xn()},t}var Tn=wn();const En={"card.no_alerts":`No active alerts.`,"card.sources_unavailable_named":`{name} unavailable`,"card.sources_unavailable_count":`{count} sources unavailable`,"card.sources_unavailable_one":`A source is unavailable`,"card.preview":`Sample Data`,"card.read_details":`Read Details`,"card.open_source":`Open {provider} Source`,"card.zones_count":`{count} zones`,"card.zone_count_singular":`{count} zone`,"card.dismiss":`Dismiss`,"card.dismissed_toast":`Dismissed: {event}`,"card.dismissed_toast_undo":`Undo`,"card.close":`Close`,"detail.issued":`Issued`,"detail.onset":`Onset`,"detail.expires":`Expires`,"detail.area":`Area`,"detail.distance":`Distance`,"detail.area_more":`and {count} more areas`,"detail.area_fewer":`Show fewer`,"detail.geometry_with_location":`{area}, with your location marked`,"detail.source":`Source`,"detail.description":`Description`,"detail.instructions":`Instructions`,"progress.start":`Start`,"progress.now":`Now`,"progress.end":`End`,"progress.ongoing":`Ongoing`,"progress.expires_in_label":`Expires in`,"progress.starts_in_label":`Starts in`,"progress.tbd":`TBD`,"progress.na":`N/A`,"progress.expired_label":`Expired`,"progress.compact_active":`for {time}`,"progress.compact_prep":`in {time}`,"progress.compact_ongoing":`ongoing`,"progress.compact_expired":`expired {time} ago`,"timeline.clipped_start":`Started before this window`,"timeline.clipped_end":`Continues past this window`,"time.just_now":`just now`,"time.in_less_than_1m":`in <1m`,"time.minutes_ago":`{m}m ago`,"time.in_minutes":`in {m}m`,"time.hours_ago":`{dur} ago`,"time.in_hours":`in {dur}`,"time.days_ago":`{d}d ago`,"time.in_days":`in {d}d`,"badge.severity_extreme":`Extreme`,"badge.severity_severe":`Severe`,"badge.severity_moderate":`Moderate`,"badge.severity_minor":`Minor`,"badge.severity_unknown":`Unknown`,"badge.certainty_observed":`Observed`,"badge.certainty_likely":`Likely`,"badge.certainty_possible":`Possible`,"badge.certainty_unlikely":`Unlikely`,"badge.certainty_unknown":`Unknown`,"editor.entities":`Entities`,"editor.title":`Title (optional)`,"editor.provider":`Alert provider`,"editor.provider_auto":`Auto-detect`,"editor.provider_nws":`NWS (United States)`,"editor.provider_bom":`BoM (Australia)`,"editor.provider_meteoalarm":`MeteoAlarm (Europe)`,"editor.provider_pirateweather":`PirateWeather`,"editor.provider_dwd":`DWD (Germany)`,"editor.provider_nina":`NINA (Germany, civil protection)`,"editor.provider_meteoswiss":`MeteoSwiss (Switzerland)`,"editor.provider_eccc":`ECCC (Canada)`,"editor.provider_nsw_rfs":`NSW RFS (Australia)`,"editor.provider_inmet":`INMET (Brazil)`,"editor.provider_cap":`CAP Alerts (multi-region)`,"editor.devices":`Alert devices (optional)`,"editor.devices_helper":`Pulls in every active alert sensor under the selected devices automatically (CAP Alerts, NINA). Add more devices to combine locations or providers.`,"editor.zones":`Zones (optional)`,"editor.zones_helper":`Comma-separated BoM area_id codes, e.g. NSW_FL049`,"editor.event_codes":`Event codes (optional)`,"editor.event_codes_helper":`Comma-separated event codes, e.g. TOW, SVW (NWS) or 31, 95 (DWD)`,"editor.exclude_event_codes":`Exclude event codes (optional)`,"editor.exclude_event_codes_helper":`Comma-separated event codes to exclude, e.g. SCY (NWS) or 22 (DWD)`,"editor.sort_order":`Sort order`,"editor.sort_default":`Default`,"editor.sort_onset":`Onset time`,"editor.sort_severity":`Severity`,"editor.sort_distance":`Distance`,"editor.color_theme":`Color theme`,"editor.color_severity":`Severity-based`,"editor.color_nws":`NWS Official`,"editor.color_meteoalarm":`MeteoAlarm Awareness`,"editor.color_eccc":`ECCC Public Alerts`,"editor.provider_colors":`Use the provider's published alert colors`,"editor.timezone":`Timezone`,"editor.tz_server":`Server (Home Assistant)`,"editor.tz_browser":`Browser (local device)`,"editor.min_severity":`Minimum severity`,"editor.severity_all":`All severities`,"editor.severity_minor":`Minor or higher`,"editor.severity_moderate":`Moderate or higher`,"editor.severity_severe":`Severe or higher`,"editor.severity_extreme":`Extreme only`,"editor.max_distance":`Maximum distance ({unit})`,"editor.max_distance_helper":`Only show incidents within this distance of your Home Assistant home location, or of the location entity set below. Applies to point-incident feeds (NSW RFS) — area warnings have no distance and are never filtered.`,"editor.my_location_entity":`My location`,"editor.my_location_entity_helper":`A device tracker, person, or zone whose coordinates replace the Home Assistant home location as the card's reference point — for the "My location" marker and as the origin of the maximum-distance filter. Use a zone for a fixed location.`,"editor.animations":`Enable animations`,"editor.enhance_contrast":`Enhance contrast`,"editor.enhance_contrast_off":`Off`,"editor.enhance_contrast_subtle":`Subtle`,"editor.enhance_contrast_strict":`Strict (WCAG AA)`,"editor.deduplicate":`Deduplicate alerts`,"editor.deduplicate_headlines":`Deduplicate headlines`,"editor.show_details":`Show detail panel`,"editor.expand_details":`Always expand details`,"editor.show_metadata":`Show metadata`,"editor.show_description":`Show description`,"editor.show_instructions":`Show instructions`,"editor.show_geometry":`Show area map`,"editor.geometry_style":`Area map style`,"editor.geometry_style_shape":`Outline only`,"editor.geometry_style_map":`Map tiles (online)`,"editor.show_my_location":`Show my location on the map`,"editor.show_provider":`Show provider label`,"editor.show_source_link":`Show source link`,"editor.reformat_text":`Reflow alert text (strip hard line breaks)`,"editor.layout":`Layout`,"editor.layout_default":`Default`,"editor.layout_compact":`Compact`,"editor.layout_timeline":`Timeline`,"editor.timeline_horizon":`Timeline window`,"editor.timeline_horizon_auto":`Fit alerts`,"editor.timeline_horizon_6h":`6 hours`,"editor.timeline_horizon_12h":`12 hours`,"editor.timeline_horizon_24h":`24 hours`,"editor.timeline_horizon_72h":`3 days`,"editor.timeline_styling_note":`The timeline draws fixed per-phase bars; progress fill and decoration settings do not apply.`,"editor.timeline_dismiss_note":`The timeline dismisses by button only.`,"editor.font_size":`Font size`,"editor.font_size_small":`Small`,"editor.font_size_default":`Default`,"editor.font_size_large":`Large`,"editor.font_size_x_large":`Extra large`,"editor.progress_fill":`Progress fill`,"editor.progress_fill_track":`Track (thin bar)`,"editor.progress_fill_background":`Background wash`,"editor.styling_section":`Progress & icon styling`,"editor.progress_style":`Progress bar decoration`,"editor.progress_style_wash_note":`Not applied while Progress fill is set to Background wash (the wash is always solid).`,"editor.progress_style_preparation":`Preparation`,"editor.progress_style_active":`Active`,"editor.progress_style_ongoing":`Ongoing`,"editor.deco_solid":`Solid`,"editor.deco_striped":`Striped`,"editor.deco_shimmer":`Shimmer`,"editor.deco_pulse":`Pulse`,"editor.icon_border_style":`Icon ring border`,"editor.icon_border_dashed":`Dashed`,"editor.icon_border_solid":`Solid`,"editor.hide_expired":`Hide expired alerts`,"editor.hide_no_alerts":`Hide card when there are no active alerts`,"editor.unavailable_behavior":`When a source is unavailable`,"editor.unavailable_message":`Show which source`,"editor.unavailable_compact":`Show a compact indicator`,"editor.unavailable_hide":`Hide indicator (not recommended)`,"editor.unavailable_hide_warning":`Hiding the indicator can present an all-clear while a source is blind — an unavailable sensor is not proof of safety.`,"editor.tap_action":`Tap action`,"editor.tap_action_helper":`Setting any tap action replaces the inline expand affordance on each alert row.`,"editor.tap_default":`Inline expand (default)`,"editor.tap_details":`Detail pop-up`,"editor.tap_more_info":`More info`,"editor.tap_navigate":`Navigate`,"editor.tap_url":`Open URL`,"editor.tap_toggle":`Toggle`,"editor.tap_perform_action":`Perform action`,"editor.tap_call_service":`Call service (legacy)`,"editor.tap_fire_dom_event":`Fire DOM event`,"editor.tap_none":`Nothing`,"editor.tap_navigation_path":`Navigation path`,"editor.tap_url_path":`URL`,"editor.tap_yaml_managed":`This action carries a payload the visual editor does not edit. Its existing YAML is preserved — edit it in the YAML editor.`,"editor.tap_details_expand_hint":`With "Always expand details" off, the pop-up opens with its description behind the Read Details toggle.`,"editor.allow_dismiss":`Allow dismissing alerts`,"editor.show_dismiss_undo":`Show undo notification on dismiss`,"editor.dismissed_count":`Dismissed: {count} alerts.`,"editor.dismissed_count_singular":`Dismissed: {count} alert.`,"editor.restore_all":`Restore all`,"editor.show_preview":`Show sample data`,"editor.preview_hint":`Preview card layout with sample alerts`,"editor.preview_nudge":`No active alerts — enable to preview the card layout.`,"editor.entity_warning":`Selected entity does not appear to contain weather alert data.`,"editor.no_entities_hint":`No supported weather alert entities found. A provider integration (e.g. NWS Alerts) must be installed first.`,"editor.no_entities_hint_link":`Supported providers`,"editor.feeds":`Auto-collect from installed feeds`,"editor.feeds_helper":`Detected integration feeds. Check one to include every live incident it reports — no per-incident entities to list. Requires the integration to be set up in Home Assistant.`,"editor.source_hint":`Auto-collecting {count} live incident(s) from the feed — no entities to list manually.`,"editor.feeds_missing_warning":`No live data for {feeds}. This feed is enabled but nothing is providing it — is the integration set up in Home Assistant?`,"editor.devices_missing_warning":`No device found for {ids}. Was the integration removed?`,"editor.no_device_alerts_hint":`No active alert sensors found under the selected devices yet. The card will populate automatically when the integration publishes alerts.`,"editor.section_source":`Source`,"editor.section_filtering":`Filtering`,"editor.section_appearance":`Appearance`,"editor.section_detail_panel":`Detail Panel`,"editor.section_behavior":`Behavior`,"editor.section_dismissal":`Dismissal`,"editor.section_advanced":`Advanced`,"editor.detail_sections":`Sections`,"editor.panel_more":`+{count} more`,"editor.option_default":`{label} (default)`,"editor.reset_default":`Reset to default`,"editor.also_set":`Also set: {names}`,"editor.dismiss_trigger":`Dismiss trigger`,"editor.dismiss_trigger_button":`Button only`,"editor.dismiss_trigger_swipe":`Swipe only`,"editor.dismiss_trigger_both":`Button and swipe`,"editor.dismiss_button_style":`Button style`,"editor.dismiss_button_style_icon":`Icon only`,"editor.dismiss_button_style_labeled":`Icon and label`},B={en:En,fr:{"card.no_alerts":`Aucune alerte active.`,"card.sources_unavailable_named":`{name} indisponible`,"card.sources_unavailable_count":`{count} sources indisponibles`,"card.sources_unavailable_one":`Une source est indisponible`,"card.preview":`Donnees d'exemple`,"card.read_details":`Lire les details`,"card.open_source":`Ouvrir la source {provider}`,"card.zones_count":`{count} zones`,"card.zone_count_singular":`{count} zone`,"card.dismiss":`Ignorer`,"card.dismissed_toast":`Ignorée : {event}`,"card.dismissed_toast_undo":`Annuler`,"card.close":`Fermer`,"detail.issued":`Emis`,"detail.onset":`Debut`,"detail.expires":`Expire`,"detail.area":`Zone`,"detail.distance":`Distance`,"detail.area_more":`et {count} autres zones`,"detail.area_fewer":`Afficher moins`,"detail.geometry_with_location":`{area}, avec votre position indiquée`,"detail.source":`Source`,"detail.description":`Description`,"detail.instructions":`Instructions`,"progress.start":`Debut`,"progress.now":`Maint.`,"progress.end":`Fin`,"progress.ongoing":`En cours`,"progress.expires_in_label":`Expire dans`,"progress.starts_in_label":`Commence dans`,"progress.tbd":`Ind.`,"progress.na":`N/D`,"progress.expired_label":`Expiré`,"progress.compact_active":`pour {time}`,"progress.compact_prep":`dans {time}`,"progress.compact_ongoing":`en cours`,"progress.compact_expired":`expiré il y a {time}`,"timeline.clipped_start":`Commencée avant cette fenêtre`,"timeline.clipped_end":`Se poursuit au-delà de cette fenêtre`,"time.just_now":`a l'instant`,"time.in_less_than_1m":`dans <1m`,"time.minutes_ago":`il y a {m}m`,"time.in_minutes":`dans {m}m`,"time.hours_ago":`il y a {dur}`,"time.in_hours":`dans {dur}`,"time.days_ago":`il y a {d}j`,"time.in_days":`dans {d}j`,"badge.severity_extreme":`Extrême`,"badge.severity_severe":`Grave`,"badge.severity_moderate":`Modérée`,"badge.severity_minor":`Mineure`,"badge.severity_unknown":`Inconnue`,"badge.certainty_observed":`Observée`,"badge.certainty_likely":`Probable`,"badge.certainty_possible":`Possible`,"badge.certainty_unlikely":`Improbable`,"badge.certainty_unknown":`Inconnue`,"editor.entities":`Entites`,"editor.title":`Titre (optionnel)`,"editor.provider":`Fournisseur d'alertes`,"editor.provider_auto":`Detection auto`,"editor.provider_nws":`NWS (Etats-Unis)`,"editor.provider_bom":`BoM (Australie)`,"editor.provider_meteoalarm":`MeteoAlarm (Europe)`,"editor.provider_pirateweather":`PirateWeather`,"editor.provider_dwd":`DWD (Allemagne)`,"editor.provider_nina":`NINA (Allemagne, protection civile)`,"editor.provider_meteoswiss":`MeteoSwiss (Suisse)`,"editor.provider_eccc":`ECCC (Canada)`,"editor.provider_nsw_rfs":`NSW RFS (Australie)`,"editor.provider_inmet":`INMET (Brésil)`,"editor.provider_cap":`Alertes CAP (multi-region)`,"editor.devices":`Appareils d'alerte (optionnel)`,"editor.devices_helper":`Récupère automatiquement chaque capteur d'alerte actif sous les appareils sélectionnés (CAP Alerts, NINA). Ajoutez d'autres appareils pour combiner des lieux ou des fournisseurs.`,"editor.zones":`Zones (optionnel)`,"editor.zones_helper":`Codes area_id BoM separes par des virgules, ex. NSW_FL049`,"editor.event_codes":`Codes d'evenement (optionnel)`,"editor.event_codes_helper":`Codes d'evenement separes par des virgules, ex. TOW, SVW (NWS) ou 31, 95 (DWD)`,"editor.exclude_event_codes":`Exclure codes d'evenement (optionnel)`,"editor.exclude_event_codes_helper":`Codes d'evenement a exclure, ex. SCY (NWS) ou 22 (DWD)`,"editor.sort_order":`Ordre de tri`,"editor.sort_default":`Par defaut`,"editor.sort_onset":`Heure de debut`,"editor.sort_severity":`Gravite`,"editor.sort_distance":`Distance`,"editor.color_theme":`Theme de couleur`,"editor.color_severity":`Base sur la gravite`,"editor.color_nws":`NWS officiel`,"editor.color_meteoalarm":`MeteoAlarm Vigilance`,"editor.color_eccc":`Alertes publiques ECCC`,"editor.provider_colors":`Utiliser les couleurs publiées par le fournisseur`,"editor.timezone":`Fuseau horaire`,"editor.tz_server":`Serveur (Home Assistant)`,"editor.tz_browser":`Navigateur (appareil local)`,"editor.min_severity":`Gravite minimale`,"editor.severity_all":`Toutes les gravites`,"editor.severity_minor":`Mineure ou plus`,"editor.severity_moderate":`Moderee ou plus`,"editor.severity_severe":`Grave ou plus`,"editor.severity_extreme":`Extreme uniquement`,"editor.max_distance":`Distance maximale ({unit})`,"editor.max_distance_helper":`N'afficher que les incidents situés à moins de cette distance du lieu de votre installation Home Assistant, ou de l'entité de position définie ci-dessous. S'applique aux flux d'incidents ponctuels (NSW RFS) — les alertes de zone n'ont pas de distance et ne sont jamais filtrées.`,"editor.my_location_entity":`Ma position`,"editor.my_location_entity_helper":`Un traceur d'appareil, une personne ou une zone dont les coordonnées remplacent le lieu de Home Assistant comme point de référence de la carte — pour le marqueur « Ma position » et comme origine du filtre de distance maximale. Utilisez une zone pour un emplacement fixe.`,"editor.animations":`Activer les animations`,"editor.enhance_contrast":`Améliorer le contraste`,"editor.enhance_contrast_off":`Désactivé`,"editor.enhance_contrast_subtle":`Subtil`,"editor.enhance_contrast_strict":`Strict (WCAG AA)`,"editor.deduplicate":`Dedupliquer les alertes`,"editor.deduplicate_headlines":`Dédupliquer les titres`,"editor.show_details":`Afficher le panneau de details`,"editor.expand_details":`Toujours afficher les details`,"editor.show_metadata":`Afficher les metadonnees`,"editor.show_description":`Afficher la description`,"editor.show_instructions":`Afficher les instructions`,"editor.show_geometry":`Afficher la carte de zone`,"editor.geometry_style":`Style de la carte de zone`,"editor.geometry_style_shape":`Contour uniquement`,"editor.geometry_style_map":`Tuiles cartographiques (en ligne)`,"editor.show_my_location":`Afficher ma position sur la carte`,"editor.show_provider":`Afficher le fournisseur`,"editor.show_source_link":`Afficher le lien source`,"editor.reformat_text":`Reformater le texte (supprimer les retours a la ligne)`,"editor.layout":`Disposition`,"editor.layout_default":`Par défaut`,"editor.layout_compact":`Compacte`,"editor.layout_timeline":`Chronologie`,"editor.timeline_horizon":`Fenêtre de la chronologie`,"editor.timeline_horizon_auto":`Ajuster aux alertes`,"editor.timeline_horizon_6h":`6 heures`,"editor.timeline_horizon_12h":`12 heures`,"editor.timeline_horizon_24h":`24 heures`,"editor.timeline_horizon_72h":`3 jours`,"editor.timeline_styling_note":`La chronologie affiche des barres fixes par phase ; les réglages de remplissage et de décoration de la progression ne s'appliquent pas.`,"editor.timeline_dismiss_note":`Dans la chronologie, seul le bouton permet d'ignorer une alerte.`,"editor.font_size":`Taille de police`,"editor.font_size_small":`Petit`,"editor.font_size_default":`Par défaut`,"editor.font_size_large":`Grand`,"editor.font_size_x_large":`Très grand`,"editor.progress_fill":`Remplissage de progression`,"editor.progress_fill_track":`Barre fine`,"editor.progress_fill_background":`Fond coloré`,"editor.styling_section":`Style de progression et d’icône`,"editor.progress_style":`Décoration de la barre de progression`,"editor.progress_style_wash_note":`Sans effet lorsque le remplissage de progression est réglé sur Fond coloré (le fond est toujours uni).`,"editor.progress_style_preparation":`Préparation`,"editor.progress_style_active":`Active`,"editor.progress_style_ongoing":`En cours`,"editor.deco_solid":`Plein`,"editor.deco_striped":`Rayé`,"editor.deco_shimmer":`Scintillement`,"editor.deco_pulse":`Pulsation`,"editor.icon_border_style":`Bordure de l'anneau d'icône`,"editor.icon_border_dashed":`Pointillé`,"editor.icon_border_solid":`Plein`,"editor.hide_expired":`Masquer les alertes expirées`,"editor.hide_no_alerts":`Masquer la carte sans alertes`,"editor.unavailable_behavior":`Quand une source est indisponible`,"editor.unavailable_message":`Afficher la source concernée`,"editor.unavailable_compact":`Afficher un indicateur compact`,"editor.unavailable_hide":`Masquer l'indicateur (déconseillé)`,"editor.unavailable_hide_warning":`Masquer l'indicateur peut présenter une absence d'alerte alors qu'une source est aveugle — un capteur indisponible n'est pas une preuve de sécurité.`,"editor.tap_action":`Action au clic`,"editor.tap_action_helper":`Définir une action au clic remplace l'affichage détaillé en ligne sur chaque ligne d'alerte.`,"editor.tap_default":`Développer en ligne (par défaut)`,"editor.tap_details":`Fenêtre de détails`,"editor.tap_more_info":`Plus d'infos`,"editor.tap_navigate":`Naviguer`,"editor.tap_url":`Ouvrir une URL`,"editor.tap_toggle":`Basculer`,"editor.tap_perform_action":`Exécuter une action`,"editor.tap_call_service":`Appeler un service (ancien)`,"editor.tap_fire_dom_event":`Déclencher un événement DOM`,"editor.tap_none":`Rien`,"editor.tap_navigation_path":`Chemin de navigation`,"editor.tap_url_path":`URL`,"editor.tap_yaml_managed":`Cette action transporte des données que l'éditeur visuel ne modifie pas. Son YAML existant est préservé — modifiez-le dans l'éditeur YAML.`,"editor.tap_details_expand_hint":`Si « Toujours développer les détails » est désactivé, la fenêtre s'ouvre avec sa description derrière le bouton Lire les détails.`,"editor.allow_dismiss":`Permettre d'ignorer les alertes`,"editor.show_dismiss_undo":`Afficher une notification d'annulation`,"editor.dismissed_count":`Ignorées : {count} alertes.`,"editor.dismissed_count_singular":`Ignorée : {count} alerte.`,"editor.restore_all":`Tout restaurer`,"editor.show_preview":`Afficher les donnees exemples`,"editor.preview_hint":`Apercu de la disposition avec des alertes fictives`,"editor.preview_nudge":`Aucune alerte active — activez pour previsualiser la disposition.`,"editor.entity_warning":`L'entite selectionnee ne semble pas contenir de donnees d'alerte meteo.`,"editor.no_entities_hint":`Aucune entite d'alerte meteo compatible trouvee. Une integration (ex. NWS Alerts) doit etre installee.`,"editor.no_entities_hint_link":`Fournisseurs supportes`,"editor.feeds":`Collecte automatique des flux installes`,"editor.feeds_helper":`Flux d'integration detectes. Cochez-en un pour inclure chaque incident en direct qu'il signale — aucune entite par incident a lister. Necessite que l'integration soit configuree dans Home Assistant.`,"editor.source_hint":`Collecte automatique de {count} incident(s) en direct du flux — aucune entite a lister manuellement.`,"editor.feeds_missing_warning":`Aucune donnee en direct pour {feeds}. Ce flux est active mais rien ne l'alimente — l'integration est-elle configuree dans Home Assistant ?`,"editor.devices_missing_warning":`Aucun appareil trouvé pour {ids}. L'intégration a-t-elle été supprimée ?`,"editor.no_device_alerts_hint":`Aucun capteur d'alerte actif trouvé sous les appareils sélectionnés pour le moment. La carte se remplira automatiquement lorsque l'intégration publiera des alertes.`,"editor.section_source":`Source`,"editor.section_filtering":`Filtrage`,"editor.section_appearance":`Apparence`,"editor.section_detail_panel":`Panneau de details`,"editor.section_behavior":`Comportement`,"editor.section_dismissal":`Masquage`,"editor.section_advanced":`Avancé`,"editor.detail_sections":`Sections`,"editor.panel_more":`+{count} de plus`,"editor.option_default":`{label} (par défaut)`,"editor.reset_default":`Rétablir la valeur par défaut`,"editor.also_set":`Également défini : {names}`,"editor.dismiss_trigger":`Declencheur`,"editor.dismiss_trigger_button":`Bouton uniquement`,"editor.dismiss_trigger_swipe":`Glissement uniquement`,"editor.dismiss_trigger_both":`Bouton et glissement`,"editor.dismiss_button_style":`Style du bouton`,"editor.dismiss_button_style_icon":`Icone uniquement`,"editor.dismiss_button_style_labeled":`Icone et texte`},es:{"card.no_alerts":`Sin alertas activas.`,"card.sources_unavailable_named":`{name} no disponible`,"card.sources_unavailable_count":`{count} fuentes no disponibles`,"card.sources_unavailable_one":`Una fuente no está disponible`,"card.preview":`Datos de ejemplo`,"card.read_details":`Leer detalles`,"card.open_source":`Abrir fuente {provider}`,"card.zones_count":`{count} zonas`,"card.zone_count_singular":`{count} zona`,"card.dismiss":`Descartar`,"card.dismissed_toast":`Descartada: {event}`,"card.dismissed_toast_undo":`Deshacer`,"card.close":`Cerrar`,"detail.issued":`Emitido`,"detail.onset":`Inicio`,"detail.expires":`Expira`,"detail.area":`Area`,"detail.distance":`Distancia`,"detail.area_more":`y {count} áreas más`,"detail.area_fewer":`Mostrar menos`,"detail.geometry_with_location":`{area}, con tu ubicación marcada`,"detail.source":`Fuente`,"detail.description":`Descripcion`,"detail.instructions":`Instrucciones`,"progress.start":`Inicio`,"progress.now":`Ahora`,"progress.end":`Fin`,"progress.ongoing":`En curso`,"progress.expires_in_label":`Expira en`,"progress.starts_in_label":`Comienza en`,"progress.tbd":`Pend.`,"progress.na":`N/D`,"progress.expired_label":`Expirada`,"progress.compact_active":`por {time}`,"progress.compact_prep":`en {time}`,"progress.compact_ongoing":`en curso`,"progress.compact_expired":`expiró hace {time}`,"timeline.clipped_start":`Comenzó antes de esta ventana`,"timeline.clipped_end":`Continúa después de esta ventana`,"time.just_now":`ahora mismo`,"time.in_less_than_1m":`en <1m`,"time.minutes_ago":`hace {m}m`,"time.in_minutes":`en {m}m`,"time.hours_ago":`hace {dur}`,"time.in_hours":`en {dur}`,"time.days_ago":`hace {d}d`,"time.in_days":`en {d}d`,"badge.severity_extreme":`Extrema`,"badge.severity_severe":`Grave`,"badge.severity_moderate":`Moderada`,"badge.severity_minor":`Menor`,"badge.severity_unknown":`Desconocida`,"badge.certainty_observed":`Observada`,"badge.certainty_likely":`Probable`,"badge.certainty_possible":`Posible`,"badge.certainty_unlikely":`Improbable`,"badge.certainty_unknown":`Desconocida`,"editor.entities":`Entidades`,"editor.title":`Titulo (opcional)`,"editor.provider":`Proveedor de alertas`,"editor.provider_auto":`Deteccion auto`,"editor.provider_nws":`NWS (Estados Unidos)`,"editor.provider_bom":`BoM (Australia)`,"editor.provider_meteoalarm":`MeteoAlarm (Europa)`,"editor.provider_pirateweather":`PirateWeather`,"editor.provider_dwd":`DWD (Alemania)`,"editor.provider_nina":`NINA (Alemania, protección civil)`,"editor.provider_meteoswiss":`MeteoSwiss (Suiza)`,"editor.provider_eccc":`ECCC (Canadá)`,"editor.provider_nsw_rfs":`NSW RFS (Australia)`,"editor.provider_inmet":`INMET (Brasil)`,"editor.provider_cap":`Alertas CAP (multi-region)`,"editor.devices":`Dispositivos de alerta (opcional)`,"editor.devices_helper":`Incorpora automáticamente cada sensor de alerta activo bajo los dispositivos seleccionados (CAP Alerts, NINA). Añade más dispositivos para combinar ubicaciones o proveedores.`,"editor.zones":`Zonas (opcional)`,"editor.zones_helper":`Codigos area_id de BoM separados por comas, ej. NSW_FL049`,"editor.event_codes":`Codigos de evento (opcional)`,"editor.event_codes_helper":`Codigos de evento separados por comas, ej. TOW, SVW (NWS) o 31, 95 (DWD)`,"editor.exclude_event_codes":`Excluir codigos de evento (opcional)`,"editor.exclude_event_codes_helper":`Codigos de evento a excluir, ej. SCY (NWS) o 22 (DWD)`,"editor.sort_order":`Orden`,"editor.sort_default":`Predeterminado`,"editor.sort_onset":`Hora de inicio`,"editor.sort_severity":`Gravedad`,"editor.sort_distance":`Distancia`,"editor.color_theme":`Tema de color`,"editor.color_severity":`Basado en gravedad`,"editor.color_nws":`NWS oficial`,"editor.color_meteoalarm":`MeteoAlarm Conciencia`,"editor.color_eccc":`Alertas públicas ECCC`,"editor.provider_colors":`Usar los colores publicados por el proveedor`,"editor.timezone":`Zona horaria`,"editor.tz_server":`Servidor (Home Assistant)`,"editor.tz_browser":`Navegador (dispositivo local)`,"editor.min_severity":`Gravedad minima`,"editor.severity_all":`Todas las gravedades`,"editor.severity_minor":`Menor o superior`,"editor.severity_moderate":`Moderada o superior`,"editor.severity_severe":`Grave o superior`,"editor.severity_extreme":`Solo extrema`,"editor.max_distance":`Distancia máxima ({unit})`,"editor.max_distance_helper":`Mostrar solo los incidentes situados a menos de esta distancia de la ubicación de tu Home Assistant, o de la entidad de ubicación indicada abajo. Se aplica a los feeds de incidentes puntuales (NSW RFS): las alertas de área no tienen distancia y nunca se filtran.`,"editor.my_location_entity":`Mi ubicación`,"editor.my_location_entity_helper":`Un rastreador de dispositivo, persona o zona cuyas coordenadas sustituyen la ubicación de Home Assistant como punto de referencia de la tarjeta: para el marcador «Mi ubicación» y como origen del filtro de distancia máxima. Usa una zona para una ubicación fija.`,"editor.animations":`Activar animaciones`,"editor.enhance_contrast":`Mejorar contraste`,"editor.enhance_contrast_off":`Desactivado`,"editor.enhance_contrast_subtle":`Sutil`,"editor.enhance_contrast_strict":`Estricto (WCAG AA)`,"editor.deduplicate":`Deduplicar alertas`,"editor.deduplicate_headlines":`Deduplicar titulares`,"editor.show_details":`Mostrar panel de detalles`,"editor.expand_details":`Siempre expandir detalles`,"editor.show_metadata":`Mostrar metadatos`,"editor.show_description":`Mostrar descripcion`,"editor.show_instructions":`Mostrar instrucciones`,"editor.show_geometry":`Mostrar mapa de área`,"editor.geometry_style":`Estilo del mapa de área`,"editor.geometry_style_shape":`Solo contorno`,"editor.geometry_style_map":`Mosaicos de mapa (en línea)`,"editor.show_my_location":`Mostrar mi ubicación en el mapa`,"editor.show_provider":`Mostrar proveedor`,"editor.show_source_link":`Mostrar enlace de fuente`,"editor.reformat_text":`Reformatear texto (eliminar saltos de linea)`,"editor.layout":`Diseño`,"editor.layout_default":`Predeterminado`,"editor.layout_compact":`Compacto`,"editor.layout_timeline":`Cronología`,"editor.timeline_horizon":`Ventana de la cronología`,"editor.timeline_horizon_auto":`Ajustar a las alertas`,"editor.timeline_horizon_6h":`6 horas`,"editor.timeline_horizon_12h":`12 horas`,"editor.timeline_horizon_24h":`24 horas`,"editor.timeline_horizon_72h":`3 días`,"editor.timeline_styling_note":`La cronología dibuja barras fijas por fase; los ajustes de relleno y decoración del progreso no se aplican.`,"editor.timeline_dismiss_note":`En la cronología solo se descarta con el botón.`,"editor.font_size":`Tamaño de fuente`,"editor.font_size_small":`Pequeño`,"editor.font_size_default":`Predeterminado`,"editor.font_size_large":`Grande`,"editor.font_size_x_large":`Extra grande`,"editor.progress_fill":`Relleno de progreso`,"editor.progress_fill_track":`Barra fina`,"editor.progress_fill_background":`Fondo tenue`,"editor.styling_section":`Estilo de progreso e icono`,"editor.progress_style":`Decoración de la barra de progreso`,"editor.progress_style_wash_note":`Sin efecto cuando el relleno de progreso está en Fondo tenue (el fondo siempre es sólido).`,"editor.progress_style_preparation":`Preparación`,"editor.progress_style_active":`Activa`,"editor.progress_style_ongoing":`En curso`,"editor.deco_solid":`Sólido`,"editor.deco_striped":`Rayado`,"editor.deco_shimmer":`Destello`,"editor.deco_pulse":`Pulso`,"editor.icon_border_style":`Borde del anillo del icono`,"editor.icon_border_dashed":`Discontinuo`,"editor.icon_border_solid":`Sólido`,"editor.hide_expired":`Ocultar alertas expiradas`,"editor.hide_no_alerts":`Ocultar tarjeta sin alertas`,"editor.unavailable_behavior":`Cuando una fuente no está disponible`,"editor.unavailable_message":`Mostrar qué fuente`,"editor.unavailable_compact":`Mostrar un indicador compacto`,"editor.unavailable_hide":`Ocultar indicador (no recomendado)`,"editor.unavailable_hide_warning":`Ocultar el indicador puede presentar una calma total mientras una fuente está ciega: un sensor no disponible no es prueba de seguridad.`,"editor.tap_action":`Acción al tocar`,"editor.tap_action_helper":`Definir cualquier acción al tocar sustituye la expansión en línea en cada fila de alerta.`,"editor.tap_default":`Expandir en línea (predeterminado)`,"editor.tap_details":`Ventana de detalles`,"editor.tap_more_info":`Más información`,"editor.tap_navigate":`Navegar`,"editor.tap_url":`Abrir URL`,"editor.tap_toggle":`Alternar`,"editor.tap_perform_action":`Ejecutar acción`,"editor.tap_call_service":`Llamar servicio (heredado)`,"editor.tap_fire_dom_event":`Disparar evento DOM`,"editor.tap_none":`Nada`,"editor.tap_navigation_path":`Ruta de navegación`,"editor.tap_url_path":`URL`,"editor.tap_yaml_managed":`Esta acción incluye datos que el editor visual no modifica. Su YAML existente se conserva: edítelo en el editor YAML.`,"editor.tap_details_expand_hint":`Con «Expandir siempre los detalles» desactivado, la ventana se abre con su descripción detrás del botón Leer detalles.`,"editor.allow_dismiss":`Permitir descartar alertas`,"editor.show_dismiss_undo":`Mostrar notificación para deshacer`,"editor.dismissed_count":`Descartadas: {count} alertas.`,"editor.dismissed_count_singular":`Descartada: {count} alerta.`,"editor.restore_all":`Restaurar todo`,"editor.show_preview":`Mostrar datos de ejemplo`,"editor.preview_hint":`Vista previa con alertas de ejemplo`,"editor.preview_nudge":`Sin alertas activas — active para previsualizar el diseno.`,"editor.entity_warning":`La entidad seleccionada no parece contener datos de alerta meteorologica.`,"editor.no_entities_hint":`No se encontraron entidades de alerta meteorologica compatibles. Se debe instalar una integracion (ej. NWS Alerts).`,"editor.no_entities_hint_link":`Proveedores compatibles`,"editor.feeds":`Recopilar feeds instalados automaticamente`,"editor.feeds_helper":`Feeds de integracion detectados. Marca uno para incluir cada incidente en vivo que reporta — sin entidades por incidente que listar. Requiere que la integracion este configurada en Home Assistant.`,"editor.source_hint":`Recopilando automaticamente {count} incidente(s) en vivo del feed — sin entidades que listar manualmente.`,"editor.feeds_missing_warning":`Sin datos en vivo para {feeds}. Este feed esta habilitado pero nada lo proporciona — ¿esta la integracion configurada en Home Assistant?`,"editor.devices_missing_warning":`No se encontró ningún dispositivo para {ids}. ¿Se eliminó la integración?`,"editor.no_device_alerts_hint":`Aún no se encontraron sensores de alerta activos bajo los dispositivos seleccionados. La tarjeta se rellenará automáticamente cuando la integración publique alertas.`,"editor.section_source":`Fuente`,"editor.section_filtering":`Filtrado`,"editor.section_appearance":`Apariencia`,"editor.section_detail_panel":`Panel de detalles`,"editor.section_behavior":`Comportamiento`,"editor.section_dismissal":`Descarte`,"editor.section_advanced":`Avanzado`,"editor.detail_sections":`Secciones`,"editor.panel_more":`+{count} más`,"editor.option_default":`{label} (predeterminado)`,"editor.reset_default":`Restablecer el valor predeterminado`,"editor.also_set":`También definido: {names}`,"editor.dismiss_trigger":`Disparador`,"editor.dismiss_trigger_button":`Solo boton`,"editor.dismiss_trigger_swipe":`Solo deslizamiento`,"editor.dismiss_trigger_both":`Boton y deslizamiento`,"editor.dismiss_button_style":`Estilo del boton`,"editor.dismiss_button_style_icon":`Solo icono`,"editor.dismiss_button_style_labeled":`Icono y texto`},it:{"card.no_alerts":`Nessuna allerta attiva.`,"card.sources_unavailable_named":`{name} non disponibile`,"card.sources_unavailable_count":`{count} fonti non disponibili`,"card.sources_unavailable_one":`Una fonte non è disponibile`,"card.preview":`Dati di esempio`,"card.read_details":`Leggi dettagli`,"card.open_source":`Apri fonte {provider}`,"card.zones_count":`{count} zone`,"card.zone_count_singular":`{count} zona`,"card.dismiss":`Ignora`,"card.dismissed_toast":`Ignorata: {event}`,"card.dismissed_toast_undo":`Annulla`,"card.close":`Chiudi`,"detail.issued":`Emessa`,"detail.onset":`Inizio`,"detail.expires":`Scadenza`,"detail.area":`Area`,"detail.distance":`Distanza`,"detail.area_more":`e altre {count} aree`,"detail.area_fewer":`Mostra meno`,"detail.geometry_with_location":`{area}, con la tua posizione indicata`,"detail.source":`Fonte`,"detail.description":`Descrizione`,"detail.instructions":`Istruzioni`,"progress.start":`Inizio`,"progress.now":`Ora`,"progress.end":`Fine`,"progress.ongoing":`In corso`,"progress.expires_in_label":`Scade tra`,"progress.starts_in_label":`Inizia tra`,"progress.tbd":`N.D.`,"progress.na":`N/D`,"progress.expired_label":`Scaduta`,"progress.compact_active":`per {time}`,"progress.compact_prep":`tra {time}`,"progress.compact_ongoing":`in corso`,"progress.compact_expired":`scaduta {time} fa`,"timeline.clipped_start":`Iniziata prima di questa finestra`,"timeline.clipped_end":`Prosegue oltre questa finestra`,"time.just_now":`proprio ora`,"time.in_less_than_1m":`in <1m`,"time.minutes_ago":`{m}m fa`,"time.in_minutes":`in {m}m`,"time.hours_ago":`{dur} fa`,"time.in_hours":`in {dur}`,"time.days_ago":`{d}g fa`,"time.in_days":`in {d}g`,"badge.severity_extreme":`Estrema`,"badge.severity_severe":`Grave`,"badge.severity_moderate":`Moderata`,"badge.severity_minor":`Lieve`,"badge.severity_unknown":`Sconosciuta`,"badge.certainty_observed":`Osservata`,"badge.certainty_likely":`Probabile`,"badge.certainty_possible":`Possibile`,"badge.certainty_unlikely":`Improbabile`,"badge.certainty_unknown":`Sconosciuta`,"editor.entities":`Entità`,"editor.title":`Titolo (opzionale)`,"editor.provider":`Fornitore allerte`,"editor.provider_auto":`Rilevamento automatico`,"editor.provider_nws":`NWS (Stati Uniti)`,"editor.provider_bom":`BoM (Australia)`,"editor.provider_meteoalarm":`MeteoAlarm (Europa)`,"editor.provider_pirateweather":`PirateWeather`,"editor.provider_dwd":`DWD (Germania)`,"editor.provider_nina":`NINA (Germania, protezione civile)`,"editor.provider_meteoswiss":`MeteoSwiss (Svizzera)`,"editor.provider_eccc":`ECCC (Canada)`,"editor.provider_nsw_rfs":`NSW RFS (Australia)`,"editor.provider_inmet":`INMET (Brasile)`,"editor.provider_cap":`Allerte CAP (multi-regione)`,"editor.devices":`Dispositivi di allerta (opzionale)`,"editor.devices_helper":`Aggiunge automaticamente ogni sensore di allerta attivo sotto i dispositivi selezionati (CAP Alerts, NINA). Aggiungi altri dispositivi per combinare località o fornitori.`,"editor.zones":`Zone (opzionale)`,"editor.zones_helper":`Codici area_id BoM separati da virgola, es. NSW_FL049`,"editor.event_codes":`Codici evento (opzionale)`,"editor.event_codes_helper":`Codici evento separati da virgola, es. TOW, SVW (NWS) o 31, 95 (DWD)`,"editor.exclude_event_codes":`Escludi codici evento (opzionale)`,"editor.exclude_event_codes_helper":`Codici evento da escludere, es. SCY (NWS) o 22 (DWD)`,"editor.sort_order":`Ordinamento`,"editor.sort_default":`Predefinito`,"editor.sort_onset":`Ora di inizio`,"editor.sort_severity":`Gravità`,"editor.sort_distance":`Distanza`,"editor.color_theme":`Tema colori`,"editor.color_severity":`Basato sulla gravità`,"editor.color_nws":`NWS ufficiale`,"editor.color_meteoalarm":`MeteoAlarm Livelli`,"editor.color_eccc":`Allerte pubbliche ECCC`,"editor.provider_colors":`Usa i colori pubblicati dal provider`,"editor.timezone":`Fuso orario`,"editor.tz_server":`Server (Home Assistant)`,"editor.tz_browser":`Browser (dispositivo locale)`,"editor.min_severity":`Gravità minima`,"editor.severity_all":`Tutte le gravità`,"editor.severity_minor":`Lieve o superiore`,"editor.severity_moderate":`Moderata o superiore`,"editor.severity_severe":`Grave o superiore`,"editor.severity_extreme":`Solo estrema`,"editor.max_distance":`Distanza massima ({unit})`,"editor.max_distance_helper":`Mostra solo gli incidenti entro questa distanza dalla posizione della tua installazione Home Assistant, o dall'entità di posizione impostata qui sotto. Si applica ai feed di incidenti puntuali (NSW RFS) — le allerte di area non hanno una distanza e non vengono mai filtrate.`,"editor.my_location_entity":`La mia posizione`,"editor.my_location_entity_helper":`Un device tracker, una persona o una zona le cui coordinate sostituiscono la posizione di Home Assistant come punto di riferimento della scheda: per il marcatore «La mia posizione» e come origine del filtro di distanza massima. Usa una zona per una posizione fissa.`,"editor.animations":`Abilita animazioni`,"editor.enhance_contrast":`Migliora contrasto`,"editor.enhance_contrast_off":`Disattivato`,"editor.enhance_contrast_subtle":`Sottile`,"editor.enhance_contrast_strict":`Rigoroso (WCAG AA)`,"editor.deduplicate":`Deduplica allerte`,"editor.deduplicate_headlines":`Deduplica titoli`,"editor.show_details":`Mostra pannello dettagli`,"editor.expand_details":`Espandi sempre i dettagli`,"editor.show_metadata":`Mostra metadati`,"editor.show_description":`Mostra descrizione`,"editor.show_instructions":`Mostra istruzioni`,"editor.show_geometry":`Mostra mappa area`,"editor.geometry_style":`Stile mappa area`,"editor.geometry_style_shape":`Solo contorno`,"editor.geometry_style_map":`Tile mappa (online)`,"editor.show_my_location":`Mostra la mia posizione sulla mappa`,"editor.show_provider":`Mostra fornitore`,"editor.show_source_link":`Mostra link alla fonte`,"editor.reformat_text":`Riformatta testo (rimuovi interruzioni di riga)`,"editor.layout":`Layout`,"editor.layout_default":`Predefinito`,"editor.layout_compact":`Compatto`,"editor.layout_timeline":`Cronologia`,"editor.timeline_horizon":`Finestra della cronologia`,"editor.timeline_horizon_auto":`Adatta alle allerte`,"editor.timeline_horizon_6h":`6 ore`,"editor.timeline_horizon_12h":`12 ore`,"editor.timeline_horizon_24h":`24 ore`,"editor.timeline_horizon_72h":`3 giorni`,"editor.timeline_styling_note":`La cronologia disegna barre fisse per fase; le impostazioni di riempimento e decorazione dell'avanzamento non si applicano.`,"editor.timeline_dismiss_note":`Nella cronologia le allerte si ignorano solo con il pulsante.`,"editor.font_size":`Dimensione testo`,"editor.font_size_small":`Piccolo`,"editor.font_size_default":`Predefinito`,"editor.font_size_large":`Grande`,"editor.font_size_x_large":`Molto grande`,"editor.progress_fill":`Riempimento avanzamento`,"editor.progress_fill_track":`Barra sottile`,"editor.progress_fill_background":`Sfondo colorato`,"editor.styling_section":`Stile avanzamento e icona`,"editor.progress_style":`Decorazione barra di avanzamento`,"editor.progress_style_wash_note":`Non applicata quando il riempimento avanzamento è impostato su Sfondo colorato (lo sfondo è sempre pieno).`,"editor.progress_style_preparation":`Preparazione`,"editor.progress_style_active":`Attiva`,"editor.progress_style_ongoing":`In corso`,"editor.deco_solid":`Pieno`,"editor.deco_striped":`Righe`,"editor.deco_shimmer":`Bagliore`,"editor.deco_pulse":`Pulsazione`,"editor.icon_border_style":`Bordo dell'anello dell'icona`,"editor.icon_border_dashed":`Tratteggiato`,"editor.icon_border_solid":`Pieno`,"editor.hide_expired":`Nascondi allerte scadute`,"editor.hide_no_alerts":`Nascondi scheda senza allerte`,"editor.unavailable_behavior":`Quando una fonte non è disponibile`,"editor.unavailable_message":`Mostra quale fonte`,"editor.unavailable_compact":`Mostra un indicatore compatto`,"editor.unavailable_hide":`Nascondi indicatore (sconsigliato)`,"editor.unavailable_hide_warning":`Nascondere l'indicatore può presentare un cessato allarme mentre una fonte è cieca: un sensore non disponibile non è prova di sicurezza.`,"editor.tap_action":`Azione al tocco`,"editor.tap_action_helper":`Impostare una qualsiasi azione al tocco sostituisce l'espansione in linea su ogni riga di allerta.`,"editor.tap_default":`Espansione in linea (predefinito)`,"editor.tap_details":`Finestra dei dettagli`,"editor.tap_more_info":`Maggiori informazioni`,"editor.tap_navigate":`Naviga`,"editor.tap_url":`Apri URL`,"editor.tap_toggle":`Attiva/disattiva`,"editor.tap_perform_action":`Esegui azione`,"editor.tap_call_service":`Chiama servizio (obsoleto)`,"editor.tap_fire_dom_event":`Genera evento DOM`,"editor.tap_none":`Niente`,"editor.tap_navigation_path":`Percorso di navigazione`,"editor.tap_url_path":`URL`,"editor.tap_yaml_managed":`Questa azione trasporta dati che l'editor visuale non modifica. Il suo YAML esistente viene conservato: modificalo nell'editor YAML.`,"editor.tap_details_expand_hint":`Con «Espandi sempre i dettagli» disattivato, la finestra si apre con la descrizione dietro il pulsante Leggi i dettagli.`,"editor.allow_dismiss":`Consenti di ignorare le allerte`,"editor.show_dismiss_undo":`Mostra notifica di annullamento`,"editor.dismissed_count":`Ignorate: {count} allerte.`,"editor.dismissed_count_singular":`Ignorata: {count} allerta.`,"editor.restore_all":`Ripristina tutto`,"editor.show_preview":`Mostra dati di esempio`,"editor.preview_hint":`Anteprima del layout con allerte di esempio`,"editor.preview_nudge":`Nessuna allerta attiva — attiva per visualizzare il layout.`,"editor.entity_warning":`L'entità selezionata non sembra contenere dati di allerta meteo.`,"editor.no_entities_hint":`Nessuna entita di allerta meteo compatibile trovata. Un'integrazione (es. NWS Alerts) deve essere installata.`,"editor.no_entities_hint_link":`Provider supportati`,"editor.feeds":`Raccolta automatica dai feed installati`,"editor.feeds_helper":`Feed di integrazione rilevati. Selezionane uno per includere ogni incidente in tempo reale che segnala — nessuna entita per incidente da elencare. Richiede che l'integrazione sia configurata in Home Assistant.`,"editor.source_hint":`Raccolta automatica di {count} incident(i) in tempo reale dal feed — nessuna entita da elencare manualmente.`,"editor.feeds_missing_warning":`Nessun dato in tempo reale per {feeds}. Questo feed e abilitato ma nulla lo fornisce — l'integrazione e configurata in Home Assistant?`,"editor.devices_missing_warning":`Nessun dispositivo trovato per {ids}. L'integrazione è stata rimossa?`,"editor.no_device_alerts_hint":`Nessun sensore di allerta attivo trovato sotto i dispositivi selezionati per ora. La scheda si popolerà automaticamente quando l'integrazione pubblicherà delle allerte.`,"editor.section_source":`Sorgente`,"editor.section_filtering":`Filtraggio`,"editor.section_appearance":`Aspetto`,"editor.section_detail_panel":`Pannello dettagli`,"editor.section_behavior":`Comportamento`,"editor.section_dismissal":`Dismissione`,"editor.section_advanced":`Avanzate`,"editor.detail_sections":`Sezioni`,"editor.panel_more":`+{count} altri`,"editor.option_default":`{label} (predefinito)`,"editor.reset_default":`Ripristina il valore predefinito`,"editor.also_set":`Impostati anche: {names}`,"editor.dismiss_trigger":`Attivatore`,"editor.dismiss_trigger_button":`Solo pulsante`,"editor.dismiss_trigger_swipe":`Solo scorrimento`,"editor.dismiss_trigger_both":`Pulsante e scorrimento`,"editor.dismiss_button_style":`Stile pulsante`,"editor.dismiss_button_style_icon":`Solo icona`,"editor.dismiss_button_style_labeled":`Icona e testo`},de:{"card.no_alerts":`Keine aktiven Warnungen.`,"card.sources_unavailable_named":`{name} nicht verfügbar`,"card.sources_unavailable_count":`{count} Quellen nicht verfügbar`,"card.sources_unavailable_one":`Eine Quelle ist nicht verfügbar`,"card.preview":`Beispieldaten`,"card.read_details":`Details lesen`,"card.open_source":`{provider}-Quelle öffnen`,"card.zones_count":`{count} Zonen`,"card.zone_count_singular":`{count} Zone`,"card.dismiss":`Ausblenden`,"card.dismissed_toast":`Ausgeblendet: {event}`,"card.dismissed_toast_undo":`Rückgängig`,"card.close":`Schließen`,"detail.issued":`Ausgegeben`,"detail.onset":`Beginn`,"detail.expires":`Ablauf`,"detail.area":`Gebiet`,"detail.distance":`Entfernung`,"detail.area_more":`und {count} weitere Gebiete`,"detail.area_fewer":`Weniger anzeigen`,"detail.geometry_with_location":`{area}, mit markiertem eigenen Standort`,"detail.source":`Quelle`,"detail.description":`Beschreibung`,"detail.instructions":`Hinweise`,"progress.start":`Start`,"progress.now":`Jetzt`,"progress.end":`Ende`,"progress.ongoing":`Laufend`,"progress.expires_in_label":`Endet in`,"progress.starts_in_label":`Beginnt in`,"progress.tbd":`Offen`,"progress.na":`K. A.`,"progress.expired_label":`Abgelaufen`,"progress.compact_active":`für {time}`,"progress.compact_prep":`in {time}`,"progress.compact_ongoing":`laufend`,"progress.compact_expired":`vor {time} abgelaufen`,"timeline.clipped_start":`Hat vor diesem Zeitfenster begonnen`,"timeline.clipped_end":`Geht über dieses Zeitfenster hinaus`,"time.just_now":`gerade eben`,"time.in_less_than_1m":`in <1 Min`,"time.minutes_ago":`vor {m} Min`,"time.in_minutes":`in {m} Min`,"time.hours_ago":`vor {dur}`,"time.in_hours":`in {dur}`,"time.days_ago":`vor {d} T`,"time.in_days":`in {d} T`,"badge.severity_extreme":`Extrem`,"badge.severity_severe":`Schwer`,"badge.severity_moderate":`Mäßig`,"badge.severity_minor":`Gering`,"badge.severity_unknown":`Unbekannt`,"badge.certainty_observed":`Beobachtet`,"badge.certainty_likely":`Wahrscheinlich`,"badge.certainty_possible":`Möglich`,"badge.certainty_unlikely":`Unwahrscheinlich`,"badge.certainty_unknown":`Unbekannt`,"editor.entities":`Entitäten`,"editor.title":`Titel (optional)`,"editor.provider":`Warnanbieter`,"editor.provider_auto":`Automatisch erkennen`,"editor.provider_nws":`NWS (USA)`,"editor.provider_bom":`BoM (Australien)`,"editor.provider_meteoalarm":`MeteoAlarm (Europa)`,"editor.provider_pirateweather":`PirateWeather`,"editor.provider_dwd":`DWD (Deutschland)`,"editor.provider_nina":`NINA (Deutschland, Bevölkerungsschutz)`,"editor.provider_meteoswiss":`MeteoSwiss (Schweiz)`,"editor.provider_eccc":`ECCC (Kanada)`,"editor.provider_nsw_rfs":`NSW RFS (Australien)`,"editor.provider_inmet":`INMET (Brasilien)`,"editor.provider_cap":`CAP-Warnungen (multi-regional)`,"editor.devices":`Warngeräte (optional)`,"editor.devices_helper":`Bezieht automatisch jeden aktiven Warnsensor unter den ausgewählten Geräten ein (CAP Alerts, NINA). Weitere Geräte hinzufügen, um Orte oder Anbieter zu kombinieren.`,"editor.zones":`Zonen (optional)`,"editor.zones_helper":`Kommagetrennte BoM area_id-Codes, z. B. NSW_FL049`,"editor.event_codes":`Ereigniscodes (optional)`,"editor.event_codes_helper":`Kommagetrennte Ereigniscodes, z. B. TOW, SVW (NWS) oder 31, 95 (DWD)`,"editor.exclude_event_codes":`Ereigniscodes ausschließen (optional)`,"editor.exclude_event_codes_helper":`Ereigniscodes zum Ausschließen, z. B. SCY (NWS) oder 22 (DWD)`,"editor.sort_order":`Sortierung`,"editor.sort_default":`Standard`,"editor.sort_onset":`Beginnzeit`,"editor.sort_severity":`Schweregrad`,"editor.sort_distance":`Entfernung`,"editor.color_theme":`Farbschema`,"editor.color_severity":`Nach Schweregrad`,"editor.color_nws":`NWS offiziell`,"editor.color_meteoalarm":`MeteoAlarm-Warnstufen`,"editor.color_eccc":`ECCC öffentliche Warnungen`,"editor.provider_colors":`Vom Anbieter veröffentlichte Farben verwenden`,"editor.timezone":`Zeitzone`,"editor.tz_server":`Server (Home Assistant)`,"editor.tz_browser":`Browser (lokales Gerät)`,"editor.min_severity":`Mindestschweregrad`,"editor.severity_all":`Alle Schweregrade`,"editor.severity_minor":`Gering oder höher`,"editor.severity_moderate":`Mäßig oder höher`,"editor.severity_severe":`Schwer oder höher`,"editor.severity_extreme":`Nur extrem`,"editor.max_distance":`Maximale Entfernung ({unit})`,"editor.max_distance_helper":`Nur Ereignisse innerhalb dieser Entfernung vom in Home Assistant festgelegten Standort oder von der unten gewählten Standort-Entität anzeigen. Gilt für Einzelereignis-Feeds (NSW RFS) — Flächenwarnungen haben keine Entfernung und werden nie gefiltert.`,"editor.my_location_entity":`Mein Standort`,"editor.my_location_entity_helper":`Ein Gerätetracker, eine Person oder eine Zone, deren Koordinaten den Home-Assistant-Standort als Bezugspunkt der Karte ersetzen — für die Markierung „Mein Standort“ und als Ausgangspunkt des Filters für die maximale Entfernung. Für einen festen Ort eine Zone verwenden.`,"editor.animations":`Animationen aktivieren`,"editor.enhance_contrast":`Kontrast erhöhen`,"editor.enhance_contrast_off":`Aus`,"editor.enhance_contrast_subtle":`Dezent`,"editor.enhance_contrast_strict":`Streng (WCAG AA)`,"editor.deduplicate":`Warnungen deduplizieren`,"editor.deduplicate_headlines":`Überschriften deduplizieren`,"editor.show_details":`Detailbereich anzeigen`,"editor.expand_details":`Details immer anzeigen`,"editor.show_metadata":`Metadaten anzeigen`,"editor.show_description":`Beschreibung anzeigen`,"editor.show_instructions":`Hinweise anzeigen`,"editor.show_geometry":`Gebietskarte anzeigen`,"editor.geometry_style":`Gebietskartenstil`,"editor.geometry_style_shape":`Nur Umriss`,"editor.geometry_style_map":`Kartenkacheln (online)`,"editor.show_my_location":`Meinen Standort auf der Karte anzeigen`,"editor.show_provider":`Anbieter anzeigen`,"editor.show_source_link":`Quelllink anzeigen`,"editor.reformat_text":`Text umformatieren (harte Zeilenumbrüche entfernen)`,"editor.layout":`Layout`,"editor.layout_default":`Standard`,"editor.layout_compact":`Kompakt`,"editor.layout_timeline":`Zeitleiste`,"editor.timeline_horizon":`Zeitfenster der Zeitleiste`,"editor.timeline_horizon_auto":`An Warnungen anpassen`,"editor.timeline_horizon_6h":`6 Stunden`,"editor.timeline_horizon_12h":`12 Stunden`,"editor.timeline_horizon_24h":`24 Stunden`,"editor.timeline_horizon_72h":`3 Tage`,"editor.timeline_styling_note":`Die Zeitleiste zeigt für jede Phase Balken mit festgelegter Gestaltung. Die Einstellungen „Fortschrittsfüllung“ und „Fortschrittsbalken-Dekoration“ haben hier keine Wirkung.`,"editor.timeline_dismiss_note":`In der Zeitleiste lassen sich Warnungen nur über die Schaltfläche ausblenden.`,"editor.font_size":`Schriftgröße`,"editor.font_size_small":`Klein`,"editor.font_size_default":`Standard`,"editor.font_size_large":`Groß`,"editor.font_size_x_large":`Sehr groß`,"editor.progress_fill":`Fortschrittsfüllung`,"editor.progress_fill_track":`Dünner Balken`,"editor.progress_fill_background":`Hintergrundfüllung`,"editor.styling_section":`Fortschritts- & Symbolstil`,"editor.progress_style":`Fortschrittsbalken-Dekoration`,"editor.progress_style_wash_note":`Ohne Wirkung, wenn die Fortschrittsfüllung auf Hintergrundfüllung steht (die Füllung ist immer einfarbig).`,"editor.progress_style_preparation":`Vorbereitung`,"editor.progress_style_active":`Aktiv`,"editor.progress_style_ongoing":`Laufend`,"editor.deco_solid":`Einfarbig`,"editor.deco_striped":`Gestreift`,"editor.deco_shimmer":`Schimmer`,"editor.deco_pulse":`Puls`,"editor.icon_border_style":`Symbolring-Rahmen`,"editor.icon_border_dashed":`Gestrichelt`,"editor.icon_border_solid":`Durchgezogen`,"editor.hide_expired":`Abgelaufene Warnungen ausblenden`,"editor.hide_no_alerts":`Karte ohne aktive Warnungen ausblenden`,"editor.unavailable_behavior":`Wenn eine Quelle nicht verfügbar ist`,"editor.unavailable_message":`Betroffene Quelle anzeigen`,"editor.unavailable_compact":`Kompakten Hinweis anzeigen`,"editor.unavailable_hide":`Hinweis ausblenden (nicht empfohlen)`,"editor.unavailable_hide_warning":`Das Ausblenden des Hinweises kann fälschlich Entwarnung vermitteln, obwohl eine Quelle keine Daten liefert. Ein nicht verfügbarer Sensor ist kein Beleg dafür, dass keine Gefahr besteht.`,"editor.tap_action":`Aktion beim Tippen`,"editor.tap_action_helper":`Eine beliebige Tipp-Aktion ersetzt das Aufklappen der Details in jeder Warnungszeile.`,"editor.tap_default":`Details in der Karte aufklappen (Standard)`,"editor.tap_details":`Detail-Dialog`,"editor.tap_more_info":`Weitere Informationen`,"editor.tap_navigate":`Navigieren`,"editor.tap_url":`URL öffnen`,"editor.tap_toggle":`Umschalten`,"editor.tap_perform_action":`Aktion ausführen`,"editor.tap_call_service":`Dienst aufrufen (veraltet)`,"editor.tap_fire_dom_event":`DOM-Ereignis auslösen`,"editor.tap_none":`Nichts`,"editor.tap_navigation_path":`Navigationspfad`,"editor.tap_url_path":`URL`,"editor.tap_yaml_managed":`Diese Aktion enthält Daten, die der visuelle Editor nicht bearbeitet. Das vorhandene YAML bleibt erhalten — im YAML-Editor bearbeiten.`,"editor.tap_details_expand_hint":`Wenn „Details immer anzeigen“ deaktiviert ist, öffnet sich der Dialog mit der Beschreibung hinter der Schaltfläche „Details lesen“.`,"editor.allow_dismiss":`Warnungen ausblendbar machen`,"editor.show_dismiss_undo":`Rückgängig-Benachrichtigung anzeigen`,"editor.dismissed_count":`Ausgeblendet: {count} Warnungen.`,"editor.dismissed_count_singular":`Ausgeblendet: {count} Warnung.`,"editor.restore_all":`Alle wiederherstellen`,"editor.show_preview":`Beispieldaten anzeigen`,"editor.preview_hint":`Kartenlayout mit Beispielwarnungen anzeigen`,"editor.preview_nudge":`Keine aktiven Warnungen — aktivieren, um das Kartenlayout zu sehen.`,"editor.entity_warning":`Die ausgewählte Entität scheint keine Wetterwarnungsdaten zu enthalten.`,"editor.no_entities_hint":`Keine kompatiblen Wetterwarnungs-Entitäten gefunden. Eine Integration (z.B. NWS Alerts) muss installiert sein.`,"editor.no_entities_hint_link":`Unterstützte Anbieter`,"editor.feeds":`Automatisch aus installierten Feeds erfassen`,"editor.feeds_helper":`Erkannte Integrations-Feeds. Einen Feed auswählen, um alle von ihm gemeldeten aktuellen Ereignisse einzubeziehen. Einzelne Entitäten müssen dafür nicht angegeben werden. Voraussetzung ist, dass die Integration in Home Assistant eingerichtet ist.`,"editor.source_hint":`Automatische Erfassung aktueller Ereignisse aus dem Feed (Anzahl: {count}). Entitäten müssen nicht manuell aufgelistet werden.`,"editor.feeds_missing_warning":`Keine Live-Daten für {feeds}. Der Feed ist aktiviert, liefert aber keine Daten. Bitte prüfen, ob die Integration in Home Assistant eingerichtet ist.`,"editor.devices_missing_warning":`Kein Gerät für {ids} gefunden. Wurde die Integration entfernt?`,"editor.no_device_alerts_hint":`Noch keine aktiven Warnsensoren unter den ausgewählten Geräten gefunden. Die Karte füllt sich automatisch, sobald die Integration Warnungen veröffentlicht.`,"editor.section_source":`Quelle`,"editor.section_filtering":`Filterung`,"editor.section_appearance":`Darstellung`,"editor.section_detail_panel":`Detailbereich`,"editor.section_behavior":`Verhalten`,"editor.section_dismissal":`Ausblenden`,"editor.section_advanced":`Erweitert`,"editor.detail_sections":`Abschnitte`,"editor.panel_more":`+{count} weitere`,"editor.option_default":`{label} (Standard)`,"editor.reset_default":`Auf Standard zurücksetzen`,"editor.also_set":`Ebenfalls gesetzt: {names}`,"editor.dismiss_trigger":`Auslöser`,"editor.dismiss_trigger_button":`Nur Schaltfläche`,"editor.dismiss_trigger_swipe":`Nur wischen`,"editor.dismiss_trigger_both":`Schaltfläche und wischen`,"editor.dismiss_button_style":`Schaltflächenstil`,"editor.dismiss_button_style_icon":`Nur Symbol`,"editor.dismiss_button_style_labeled":`Symbol und Text`},nl:{"card.no_alerts":`Geen actieve alerts.`,"card.sources_unavailable_named":`{name} niet beschikbaar`,"card.sources_unavailable_count":`{count} bronnen niet beschikbaar`,"card.sources_unavailable_one":`Een bron is niet beschikbaar`,"card.preview":`Voorbeeld Data`,"card.read_details":`Meer Details`,"card.open_source":`Open bron van {provider}`,"card.zones_count":`{count} zones`,"card.zone_count_singular":`{count} zone`,"card.dismiss":`Negeren`,"card.dismissed_toast":`Genegeerd: {event}`,"card.dismissed_toast_undo":`Maak ongedaan`,"card.close":`Sluiten`,"detail.issued":`Uitgegeven`,"detail.onset":`Begin`,"detail.expires":`Verloopt`,"detail.area":`Gebied`,"detail.distance":`Afstand`,"detail.area_more":`en {count} andere gebieden`,"detail.area_fewer":`Minder tonen`,"detail.geometry_with_location":`{area}, met je locatie gemarkeerd`,"detail.source":`Bron`,"detail.description":`Beschrijving`,"detail.instructions":`Instructies`,"progress.start":`Gestart`,"progress.now":`Nu`,"progress.end":`Einde`,"progress.ongoing":`Lopend`,"progress.expires_in_label":`Verloopt over`,"progress.starts_in_label":`Begint over`,"progress.tbd":`N.t.b.`,"progress.na":`N/A`,"progress.expired_label":`Verlopen`,"progress.compact_active":`Gedurende {time}`,"progress.compact_prep":`over {time}`,"progress.compact_ongoing":`lopend`,"progress.compact_expired":`{time} geleden verlopen`,"timeline.clipped_start":`Begonnen vóór dit venster`,"timeline.clipped_end":`Loopt door na dit venster`,"time.just_now":`zojuist`,"time.in_less_than_1m":`binnen 1m`,"time.minutes_ago":`{m}m geleden`,"time.in_minutes":`over {m}m`,"time.hours_ago":`{dur} geleden`,"time.in_hours":`over {dur}`,"time.days_ago":`{d}d geleden`,"time.in_days":`over {d}d`,"badge.severity_extreme":`Extreem`,"badge.severity_severe":`Ernstig`,"badge.severity_moderate":`Matig`,"badge.severity_minor":`Licht`,"badge.severity_unknown":`Onbekend`,"badge.certainty_observed":`Waargenomen`,"badge.certainty_likely":`Waarschijnlijk`,"badge.certainty_possible":`Mogelijk`,"badge.certainty_unlikely":`Onwaarschijnlijk`,"badge.certainty_unknown":`Onbekend`,"editor.entities":`Entiteiten`,"editor.title":`Titel (optioneel)`,"editor.provider":`Waarschuwingsbron`,"editor.provider_auto":`Automatisch detecteren`,"editor.provider_nws":`NWS (Verenigde Staten)`,"editor.provider_bom":`BoM (Australië)`,"editor.provider_meteoalarm":`MeteoAlarm (Europa)`,"editor.provider_pirateweather":`PirateWeather`,"editor.provider_dwd":`DWD (Duitsland)`,"editor.provider_nina":`NINA (Duitsland, civiele bescherming)`,"editor.provider_meteoswiss":`MeteoSwiss (Zwitserland)`,"editor.provider_eccc":`ECCC (Canada)`,"editor.provider_nsw_rfs":`NSW RFS (Australië)`,"editor.provider_inmet":`INMET (Brazilië)`,"editor.provider_cap":`CAP Alerts (meerdere regio's)`,"editor.devices":`Waarschuwingsapparaten (optioneel)`,"editor.devices_helper":`Haalt automatisch elke actieve waarschuwingssensor onder de geselecteerde apparaten binnen (CAP Alerts, NINA). Voeg meer apparaten toe om locaties of aanbieders te combineren.`,"editor.zones":`Zones (optioneel)`,"editor.zones_helper":`Comma-gescheiden BoM area_id codes, bijv. NSW_FL049`,"editor.event_codes":`Gebeurteniscodes (optioneel)`,"editor.event_codes_helper":`Comma-gescheiden gebeurteniscodes, bijv. TOW, SVW (NWS) of 31, 95 (DWD)`,"editor.exclude_event_codes":`Gebeurteniscodes uitsluiten (optioneel)`,"editor.exclude_event_codes_helper":`Comma-gescheiden gebeurteniscodes om uit te sluiten, bijv. SCY (NWS) of 22 (DWD)`,"editor.sort_order":`Sorteervolgorde`,"editor.sort_default":`Standaard`,"editor.sort_onset":`Begintijd`,"editor.sort_severity":`Ernst`,"editor.sort_distance":`Afstand`,"editor.color_theme":`Kleurthema`,"editor.color_severity":`Op basis van ernst`,"editor.color_nws":`NWS Officieel`,"editor.color_meteoalarm":`MeteoAlarm Bewustwording`,"editor.color_eccc":`ECCC Publieke Waarschuwingen`,"editor.provider_colors":`Door de aanbieder gepubliceerde kleuren gebruiken`,"editor.timezone":`Tijdzone`,"editor.tz_server":`Server (Home Assistant)`,"editor.tz_browser":`Browser (lokaal apparaat)`,"editor.min_severity":`Minimale ernst`,"editor.severity_all":`Alle gradaties`,"editor.severity_minor":`Licht of hoger`,"editor.severity_moderate":`Matig of hoger`,"editor.severity_severe":`Ernstig of hoger`,"editor.severity_extreme":`Alleen extreem`,"editor.max_distance":`Maximale afstand ({unit})`,"editor.max_distance_helper":`Toon alleen incidenten binnen deze afstand van de locatie van je Home Assistant, of van de hieronder gekozen locatie-entiteit. Geldt voor feeds met losse incidenten (NSW RFS) — gebiedswaarschuwingen hebben geen afstand en worden nooit gefilterd.`,"editor.my_location_entity":`Mijn locatie`,"editor.my_location_entity_helper":`Een device tracker, persoon of zone waarvan de coördinaten de Home Assistant-locatie vervangen als referentiepunt van de kaart — voor de markering "Mijn locatie" en als oorsprong van het maximale-afstandsfilter. Gebruik een zone voor een vaste locatie.`,"editor.animations":`Animaties inschakelen`,"editor.enhance_contrast":`Contrast verbeteren`,"editor.enhance_contrast_off":`Uit`,"editor.enhance_contrast_subtle":`Subtiel`,"editor.enhance_contrast_strict":`Strikt (WCAG AA)`,"editor.deduplicate":`Waarschuwingen ontdubbelen`,"editor.deduplicate_headlines":`Kopteksten ontdubbelen`,"editor.show_details":`Detailpaneel tonen`,"editor.expand_details":`Details altijd uitklappen`,"editor.show_metadata":`Metadata tonen`,"editor.show_description":`Beschrijving tonen`,"editor.show_instructions":`Instructies tonen`,"editor.show_geometry":`Gebiedskaart tonen`,"editor.geometry_style":`Stijl gebiedskaart`,"editor.geometry_style_shape":`Alleen omlijning`,"editor.geometry_style_map":`Kaarttegels (online)`,"editor.show_my_location":`Mijn locatie op de kaart tonen`,"editor.show_provider":`Providerlabel tonen`,"editor.show_source_link":`Bronlink tonen`,"editor.reformat_text":`Tekst automatisch omloop geven (harde afbrekingen verwijderen)`,"editor.layout":`Lay-out`,"editor.layout_default":`Standaard`,"editor.layout_compact":`Compact`,"editor.layout_timeline":`Tijdlijn`,"editor.timeline_horizon":`Tijdlijnvenster`,"editor.timeline_horizon_auto":`Passend bij waarschuwingen`,"editor.timeline_horizon_6h":`6 uur`,"editor.timeline_horizon_12h":`12 uur`,"editor.timeline_horizon_24h":`24 uur`,"editor.timeline_horizon_72h":`3 dagen`,"editor.timeline_styling_note":`De tijdlijn tekent vaste balken per fase; instellingen voor voortgangsinvulling en decoratie zijn niet van toepassing.`,"editor.timeline_dismiss_note":`In de tijdlijn wordt alleen met de knop afgewezen.`,"editor.font_size":`Lettergrootte`,"editor.font_size_small":`Klein`,"editor.font_size_default":`Standaard`,"editor.font_size_large":`Groot`,"editor.font_size_x_large":`Extra groot`,"editor.progress_fill":`Voortgangsinvulling`,"editor.progress_fill_track":`Spoor (dunne balk)`,"editor.progress_fill_background":`Achtergrondgloed`,"editor.styling_section":`Stijl van voortgang & icoon`,"editor.progress_style":`Decoratie voortgangsbalk`,"editor.progress_style_wash_note":`Wordt niet toegepast als Voortgangsinvulling is ingesteld op Achtergrondgloed (de gloed is altijd effen).`,"editor.progress_style_preparation":`Voorbereiding`,"editor.progress_style_active":`Actief`,"editor.progress_style_ongoing":`Lopend`,"editor.deco_solid":`Effen`,"editor.deco_striped":`Gestreept`,"editor.deco_shimmer":`Schittering`,"editor.deco_pulse":`Pulseren`,"editor.icon_border_style":`Icoon grensrand`,"editor.icon_border_dashed":`Gestreept`,"editor.icon_border_solid":`Effen`,"editor.hide_expired":`Verlopen waarschuwingen verbergen`,"editor.hide_no_alerts":`Kaart verbergen als er geen actieve waarschuwingen zijn`,"editor.unavailable_behavior":`Wanneer een bron niet beschikbaar is`,"editor.unavailable_message":`Toon welke bron`,"editor.unavailable_compact":`Toon een compacte indicator`,"editor.unavailable_hide":`Indicator verbergen (niet aanbevolen)`,"editor.unavailable_hide_warning":`Het verbergen van de indicator kan een vals gevoel van veiligheid geven terwijl een bron blind is — een onbeschikbare sensor is geen bewijs van veiligheid.`,"editor.tap_action":`Tik-actie`,"editor.tap_action_helper":`Het instellen van een tik-actie vervangt de inline uitklapmogelijkheid op elke waarschuwingsregel.`,"editor.tap_default":`Inline uitklappen (standaard)`,"editor.tap_details":`Detail pop-up`,"editor.tap_more_info":`Meer info`,"editor.tap_navigate":`Navigeren`,"editor.tap_url":`URL openen`,"editor.tap_toggle":`Schakelen`,"editor.tap_perform_action":`Actie uitvoeren`,"editor.tap_call_service":`Service aanroepen (verouderd)`,"editor.tap_fire_dom_event":`DOM-event afvuren`,"editor.tap_none":`Niets`,"editor.tap_navigation_path":`Navigatiepad`,"editor.tap_url_path":`URL`,"editor.tap_yaml_managed":`Deze actie bevat gegevens die de visuele editor niet bewerkt. De bestaande YAML blijft behouden — bewerk deze in de YAML-editor.`,"editor.tap_details_expand_hint":`Als "Details altijd uitklappen" is uitgeschakeld, opent de pop-up met de beschrijving achter de knop Meer Details.`,"editor.allow_dismiss":`Toestaan van afwijzen waarschuwingen`,"editor.show_dismiss_undo":`Toon ongedaan maken-notificatie bij afwijzen`,"editor.dismissed_count":`Afgewezen: {count} waarschuwingen.`,"editor.dismissed_count_singular":`Afgewezen: {count} waarschuwing.`,"editor.restore_all":`Alles herstellen`,"editor.show_preview":`Voorbeelddata tonen`,"editor.preview_hint":`Voorbeeld van kaartlay-out met testwaarschuwingen`,"editor.preview_nudge":`Geen actieve waarschuwingen — inschakelen om de lay-out van de kaart te bekijken.`,"editor.entity_warning":`Geselecteerde entiteit lijkt geen weerwaarschuwingsgegevens te bevatten.`,"editor.no_entities_hint":`Geen ondersteunde weerwaarschuwingsentiteiten gevonden. Er moet eerst een provider-integratie (bijv. NWS Alerts) worden geïnstalleerd.`,"editor.no_entities_hint_link":`Ondersteunde providers`,"editor.feeds":`Automatisch verzamelen van geïnstalleerde feeds`,"editor.feeds_helper":`Gedetecteerde integratie-feeds. Vink er een aan om elk live incident op te nemen dat deze rapporteert — geen entiteiten per incident te vermelden. Vereist dat de integratie is ingesteld in Home Assistant.`,"editor.source_hint":`Automatisch verzamelen van {count} live incident(en) uit de feed — geen entiteiten om handmatig te vermelden.`,"editor.feeds_missing_warning":`Geen live gegevens voor {feeds}. Deze feed is ingeschakeld maar niets levert gegevens — is de integratie ingesteld in Home Assistant?`,"editor.devices_missing_warning":`Geen apparaat gevonden voor {ids}. Is de integratie verwijderd?`,"editor.no_device_alerts_hint":`Nog geen actieve waarschuwingssensoren gevonden onder de geselecteerde apparaten. De kaart wordt automatisch gevuld wanneer de integratie waarschuwingen publiceert.`,"editor.section_source":`Bron`,"editor.section_filtering":`Filteren`,"editor.section_appearance":`Weergave`,"editor.section_detail_panel":`Detailpaneel`,"editor.section_behavior":`Gedrag`,"editor.section_dismissal":`Afwijzen`,"editor.section_advanced":`Geavanceerd`,"editor.detail_sections":`Secties`,"editor.panel_more":`+{count} meer`,"editor.option_default":`{label} (standaard)`,"editor.reset_default":`Terugzetten naar standaard`,"editor.also_set":`Ook ingesteld: {names}`,"editor.dismiss_trigger":`Actie voor afwijzen`,"editor.dismiss_trigger_button":`Alleen knop`,"editor.dismiss_trigger_swipe":`Alleen swipen`,"editor.dismiss_trigger_both":`Knop en swipen`,"editor.dismiss_button_style":`Knopstijl`,"editor.dismiss_button_style_icon":`Alleen icoon`,"editor.dismiss_button_style_labeled":`Icoon en label`},pl:{"card.no_alerts":`Brak aktywnych alertów.`,"card.sources_unavailable_named":`{name} niedostępne`,"card.sources_unavailable_count":`Niedostępne źródła: {count}`,"card.sources_unavailable_one":`Źródło jest niedostępne`,"card.preview":`Przykładowe dane`,"card.read_details":`Pokaż szczegóły`,"card.open_source":`Otwórz źródło {provider}`,"card.zones_count":`Strefy: {count}`,"card.zone_count_singular":`{count} strefa`,"card.dismiss":`Odrzuć`,"card.dismissed_toast":`Odrzucono: {event}`,"card.dismissed_toast_undo":`Cofnij`,"card.close":`Zamknij`,"detail.issued":`Wydano`,"detail.onset":`Początek`,"detail.expires":`Wygasa`,"detail.area":`Obszar`,"detail.distance":`Odległość`,"detail.area_more":`i kolejne obszary: {count}`,"detail.area_fewer":`Pokaż mniej`,"detail.geometry_with_location":`{area}, z zaznaczoną Twoją lokalizacją`,"detail.source":`Źródło`,"detail.description":`Opis`,"detail.instructions":`Instrukcje`,"progress.start":`Start`,"progress.now":`Teraz`,"progress.end":`Koniec`,"progress.ongoing":`Trwa`,"progress.expires_in_label":`Wygasa za`,"progress.starts_in_label":`Zaczyna się za`,"progress.tbd":`Do ustalenia`,"progress.na":`N/D`,"progress.expired_label":`Wygasło`,"progress.compact_active":`przez {time}`,"progress.compact_prep":`za {time}`,"progress.compact_ongoing":`trwa`,"progress.compact_expired":`wygasło {time} temu`,"timeline.clipped_start":`Rozpoczęte przed tym oknem`,"timeline.clipped_end":`Trwa dalej poza tym oknem`,"time.just_now":`przed chwilą`,"time.in_less_than_1m":`za <1m`,"time.minutes_ago":`{m}m temu`,"time.in_minutes":`za {m}m`,"time.hours_ago":`{dur} temu`,"time.in_hours":`za {dur}`,"time.days_ago":`{d}d temu`,"time.in_days":`za {d}d`,"badge.severity_extreme":`Ekstremalne`,"badge.severity_severe":`Poważne`,"badge.severity_moderate":`Umiarkowane`,"badge.severity_minor":`Niewielkie`,"badge.severity_unknown":`Nieznane`,"badge.certainty_observed":`Zaobserwowane`,"badge.certainty_likely":`Prawdopodobne`,"badge.certainty_possible":`Możliwe`,"badge.certainty_unlikely":`Mało prawdopodobne`,"badge.certainty_unknown":`Nieznane`,"editor.entities":`Encje`,"editor.title":`Tytuł (opcjonalnie)`,"editor.provider":`Dostawca alertów`,"editor.provider_auto":`Wykryj automatycznie`,"editor.provider_nws":`NWS (Stany Zjednoczone)`,"editor.provider_bom":`BoM (Australia)`,"editor.provider_meteoalarm":`MeteoAlarm (Europa)`,"editor.provider_pirateweather":`PirateWeather`,"editor.provider_dwd":`DWD (Niemcy)`,"editor.provider_nina":`NINA (Niemcy, ochrona ludności)`,"editor.provider_meteoswiss":`MeteoSwiss (Szwajcaria)`,"editor.provider_eccc":`ECCC (Kanada)`,"editor.provider_nsw_rfs":`NSW RFS (Australia)`,"editor.provider_inmet":`INMET (Brazylia)`,"editor.provider_cap":`Alerty CAP (wieloregionalne)`,"editor.devices":`Urządzenia z alertami (opcjonalnie)`,"editor.devices_helper":`Automatycznie pobiera każdy aktywny sensor alertów dla wybranych urządzeń (CAP Alerts, NINA). Dodaj więcej urządzeń, aby połączyć lokalizacje lub dostawców.`,"editor.zones":`Strefy (opcjonalnie)`,"editor.zones_helper":`Kody area_id BoM oddzielone przecinkami, np. NSW_FL049`,"editor.event_codes":`Kody zdarzeń (opcjonalnie)`,"editor.event_codes_helper":`Kody zdarzeń oddzielone przecinkami, np. TOW, SVW (NWS) lub 31, 95 (DWD)`,"editor.exclude_event_codes":`Wykluczone kody zdarzeń (opcjonalnie)`,"editor.exclude_event_codes_helper":`Kody zdarzeń do wykluczenia oddzielone przecinkami, np. SCY (NWS) lub 22 (DWD)`,"editor.sort_order":`Kolejność sortowania`,"editor.sort_default":`Domyślna`,"editor.sort_onset":`Czas rozpoczęcia`,"editor.sort_severity":`Waga alertu`,"editor.sort_distance":`Odległość`,"editor.color_theme":`Motyw kolorystyczny`,"editor.color_severity":`Na podstawie wagi`,"editor.color_nws":`Oficjalny NWS`,"editor.color_meteoalarm":`MeteoAlarm`,"editor.color_eccc":`Publiczne Alerty ECCC`,"editor.provider_colors":`Użyj publikowanych kolorów alertów dostawcy`,"editor.timezone":`Strefa czasowa`,"editor.tz_server":`Serwer (Home Assistant)`,"editor.tz_browser":`Przeglądarka (lokalne urządzenie)`,"editor.min_severity":`Minimalna waga`,"editor.severity_all":`Wszystkie wagi`,"editor.severity_minor":`Niewielkie lub wyższe`,"editor.severity_moderate":`Umiarkowane lub wyższe`,"editor.severity_severe":`Poważne lub wyższe`,"editor.severity_extreme":`Tylko ekstremalne`,"editor.max_distance":`Maksymalna odległość ({unit})`,"editor.max_distance_helper":`Pokaż tylko zdarzenia w tej odległości od lokalizacji domowej Home Assistant lub encji lokalizacji ustawionej poniżej. Dotyczy źródeł punktowych (NSW RFS) — ostrzeżenia obszarowe nie mają przypisanej odległości i nigdy nie są filtrowane.`,"editor.my_location_entity":`Moja lokalizacja`,"editor.my_location_entity_helper":`Device tracker, osoba lub strefa, której współrzędne zastępują lokalizację domową Home Assistant jako punkt odniesienia dla karty — dla znacznika „Moja lokalizacja” oraz jako początek filtru maksymalnej odległości. Użyj strefy dla stałej lokalizacji.`,"editor.animations":`Włącz animacje`,"editor.enhance_contrast":`Zwiększ kontrast`,"editor.enhance_contrast_off":`Wył.`,"editor.enhance_contrast_subtle":`Subtelny`,"editor.enhance_contrast_strict":`Ścisły (WCAG AA)`,"editor.deduplicate":`Deduplikacja alertów`,"editor.deduplicate_headlines":`Deduplikacja nagłówków`,"editor.show_details":`Pokaż panel szczegółów`,"editor.expand_details":`Zawsze rozwijaj szczegóły`,"editor.show_metadata":`Pokaż metadane`,"editor.show_description":`Pokaż opis`,"editor.show_instructions":`Pokaż instrukcje`,"editor.show_geometry":`Pokaż mapę obszaru`,"editor.geometry_style":`Styl mapy obszaru`,"editor.geometry_style_shape":`Tylko kontur`,"editor.geometry_style_map":`Kafelki mapy (online)`,"editor.show_my_location":`Pokaż moją lokalizację na mapie`,"editor.show_provider":`Pokaż etykietę dostawcy`,"editor.show_source_link":`Pokaż link do źródła`,"editor.reformat_text":`Przeformatuj tekst alertu (usuń twarde złamania linii)`,"editor.layout":`Układ`,"editor.layout_default":`Domyślny`,"editor.layout_compact":`Kompaktowy`,"editor.layout_timeline":`Oś czasu`,"editor.timeline_horizon":`Okno osi czasu`,"editor.timeline_horizon_auto":`Dopasuj do alertów`,"editor.timeline_horizon_6h":`6 godzin`,"editor.timeline_horizon_12h":`12 godzin`,"editor.timeline_horizon_24h":`24 godziny`,"editor.timeline_horizon_72h":`3 dni`,"editor.timeline_styling_note":`Oś czasu rysuje stałe paski dla każdej fazy; ustawienia wypełnienia postępu oraz dekoracji nie mają zastosowania.`,"editor.timeline_dismiss_note":`Oś czasu można zamknąć wyłącznie za pomocą przycisku.`,"editor.font_size":`Rozmiar czcionki`,"editor.font_size_small":`Mała`,"editor.font_size_default":`Domyślna`,"editor.font_size_large":`Duża`,"editor.font_size_x_large":`Bardzo duża`,"editor.progress_fill":`Wypełnienie postępu`,"editor.progress_fill_track":`Ścieżka (cienki pasek)`,"editor.progress_fill_background":`Tło rozmyte`,"editor.styling_section":`Stylizacja postępu i ikon`,"editor.progress_style":`Dekoracja paska postępu`,"editor.progress_style_wash_note":`Nie ma zastosowania, gdy wypełnienie postępu jest ustawione na tło (jest ono zawsze jednolite).`,"editor.progress_style_preparation":`Przygotowanie`,"editor.progress_style_active":`Aktywne`,"editor.progress_style_ongoing":`Trwające`,"editor.deco_solid":`Jednolite`,"editor.deco_striped":`Paskowane`,"editor.deco_shimmer":`Migoczące`,"editor.deco_pulse":`Pulsujące`,"editor.icon_border_style":`Obramowanie pierścienia ikony`,"editor.icon_border_dashed":`Przerywane`,"editor.icon_border_solid":`Jednolite`,"editor.hide_expired":`Ukryj wygasłe alerty`,"editor.hide_no_alerts":`Ukryj kartę, gdy nie ma aktywnych alertów`,"editor.unavailable_behavior":`Gdy źródło jest niedostępne`,"editor.unavailable_message":`Pokaż które źródło`,"editor.unavailable_compact":`Pokaż mały wskaźnik`,"editor.unavailable_hide":`Ukryj wskaźnik (niezalecane)`,"editor.unavailable_hide_warning":`Ukrycie wskaźnika może mylnie sygnalizować bezpieczeństwo, gdy źródło jest uszkodzone — niedostępny sensor nie oznacza braku zagrożeń.`,"editor.tap_action":`Akcja po kliknięciu`,"editor.tap_action_helper":`Ustawienie jakiejkolwiek akcji po kliknięciu zastępuje opcję rozwijania na wierszu każdego alertu.`,"editor.tap_default":`Rozwiń w miejscu (domyślnie)`,"editor.tap_details":`Wyskakujące okienko szczegółów`,"editor.tap_more_info":`Więcej informacji`,"editor.tap_navigate":`Nawiguj`,"editor.tap_url":`Otwórz adres URL`,"editor.tap_toggle":`Przełącz`,"editor.tap_perform_action":`Wykonaj akcję`,"editor.tap_call_service":`Wywołaj usługę (przestarzałe)`,"editor.tap_fire_dom_event":`Wywołaj zdarzenie DOM`,"editor.tap_none":`Brak`,"editor.tap_navigation_path":`Ścieżka nawigacji`,"editor.tap_url_path":`Adres URL`,"editor.tap_yaml_managed":`Ta akcja niesie payload, którego nie można edytować wizualnie. Edytuj akcję za pomocą edytora YAML (obecny kod zostanie zachowany).`,"editor.tap_details_expand_hint":`Gdy opcja "Zawsze rozwijaj szczegóły" jest wyłączona, wyskakujące okienko otwiera się, ale opis jest ukryty i wymaga kliknięcia "Pokaż szczegóły".`,"editor.allow_dismiss":`Zezwól na odrzucanie alertów`,"editor.show_dismiss_undo":`Pokaż przycisk "Cofnij" po odrzuceniu`,"editor.dismissed_count":`Odrzucone alerty: {count}.`,"editor.dismissed_count_singular":`Odrzucone: {count} alert.`,"editor.restore_all":`Przywróć wszystkie`,"editor.show_preview":`Pokaż przykładowe dane`,"editor.preview_hint":`Podgląd układu karty z przykładowymi alertami`,"editor.preview_nudge":`Brak aktywnych alertów — włącz tę opcję, by sprawdzić układ karty.`,"editor.entity_warning":`Wybrana encja najprawdopodobniej nie zawiera danych o alertach pogodowych.`,"editor.no_entities_hint":`Nie znaleziono obsługiwanych encji dla alertów. Najpierw zainstaluj odpowiednią integrację (np. MeteoAlarm).`,"editor.no_entities_hint_link":`Obsługiwani dostawcy`,"editor.feeds":`Pobieraj z zainstalowanych źródeł (feeds)`,"editor.feeds_helper":`Wykryto aktywne integracje. Zaznacz, aby zebrać każde wykryte w nich zdarzenie — bez konieczności ręcznego wypisywania encji. Wymagane jest poprawne skonfigurowanie tych integracji w Home Assistant.`,"editor.source_hint":`Automatycznie pobierane alerty ze źródeł: {count} — brak encji do ręcznego przypisania.`,"editor.feeds_missing_warning":`Brak danych dla {feeds}. Źródło jest zaznaczone, ale nic z niego nie dociera — upewnij się, że integracja jest poprawnie dodana do Home Assistant.`,"editor.devices_missing_warning":`Nie znaleziono urządzenia dla {ids}. Czy integracja została usunięta?`,"editor.no_device_alerts_hint":`Dla wskazanych urządzeń nie znaleziono jeszcze żadnych czujników alertów. Karta wyświetli powiadomienia, gdy integracja zacznie cokolwiek raportować.`,"editor.section_source":`Źródło`,"editor.section_filtering":`Filtrowanie`,"editor.section_appearance":`Wygląd`,"editor.section_detail_panel":`Panel szczegółów`,"editor.section_behavior":`Zachowanie`,"editor.section_dismissal":`Odrzucanie`,"editor.section_advanced":`Zaawansowane`,"editor.detail_sections":`Sekcje`,"editor.panel_more":`+{count} więcej`,"editor.option_default":`{label} (domyślnie)`,"editor.reset_default":`Przywróć domyślne`,"editor.also_set":`Ustaw również: {names}`,"editor.dismiss_trigger":`Wyzwalacz odrzucenia`,"editor.dismiss_trigger_button":`Tylko przycisk`,"editor.dismiss_trigger_swipe":`Tylko przesunięcie`,"editor.dismiss_trigger_both":`Przycisk i przesunięcie`,"editor.dismiss_button_style":`Styl przycisku odrzucania`,"editor.dismiss_button_style_icon":`Tylko ikona`,"editor.dismiss_button_style_labeled":`Ikona i etykieta`},sr:{"card.no_alerts":`Нема активних упозорења.`,"card.sources_unavailable_named":`{name} је недоступан`,"card.sources_unavailable_count":`{count} извора је недоступно`,"card.sources_unavailable_one":`Извор је недоступан`,"card.preview":`Пример података`,"card.read_details":`Прочитај детаље`,"card.open_source":`Отвори извор ({provider})`,"card.zones_count":`{count} зона`,"card.zone_count_singular":`{count} зона`,"card.dismiss":`Затвори`,"card.dismissed_toast":`Затворено: {event}`,"card.dismissed_toast_undo":`Опозови`,"card.close":`Затвори`,"detail.issued":`Издато`,"detail.onset":`Почетак`,"detail.expires":`Истиче`,"detail.area":`Област`,"detail.distance":`Удаљеност`,"detail.area_more":`и још области: {count}`,"detail.area_fewer":`Прикажи мање`,"detail.geometry_with_location":`{area}, са означеном вашом локацијом`,"detail.source":`Извор`,"detail.description":`Опис`,"detail.instructions":`Упутства`,"progress.start":`Почетак`,"progress.now":`Сада`,"progress.end":`Крај`,"progress.ongoing":`У току`,"progress.expires_in_label":`Истиче за`,"progress.starts_in_label":`Почиње за`,"progress.tbd":`Неодређено`,"progress.na":`N/A`,"progress.expired_label":`Истекло`,"progress.compact_active":`још {time}`,"progress.compact_prep":`за {time}`,"progress.compact_ongoing":`у току`,"progress.compact_expired":`истекло пре {time}`,"timeline.clipped_start":`Почело пре овог прозора`,"timeline.clipped_end":`Наставља се после овог прозора`,"time.just_now":`управо сада`,"time.in_less_than_1m":`за <1 мин`,"time.minutes_ago":`пре {m} мин`,"time.in_minutes":`за {m} мин`,"time.hours_ago":`пре {dur}`,"time.in_hours":`за {dur}`,"time.days_ago":`пре {d} д`,"time.in_days":`за {d} д`,"badge.severity_extreme":`Екстремно`,"badge.severity_severe":`Озбиљно`,"badge.severity_moderate":`Умерено`,"badge.severity_minor":`Мање`,"badge.severity_unknown":`Непознато`,"badge.certainty_observed":`Осмотрено`,"badge.certainty_likely":`Вероватно`,"badge.certainty_possible":`Могуће`,"badge.certainty_unlikely":`Мало вероватно`,"badge.certainty_unknown":`Непознато`,"editor.entities":`Ентитети`,"editor.title":`Наслов (опционо)`,"editor.provider":`Провајдер упозорења`,"editor.provider_auto":`Аутоматско препознавање`,"editor.provider_nws":`NWS (Сједињене Америчке Државе)`,"editor.provider_bom":`BoM (Аустралија)`,"editor.provider_meteoalarm":`MeteoAlarm (Европа)`,"editor.provider_pirateweather":`PirateWeather`,"editor.provider_dwd":`DWD (Немачка)`,"editor.provider_nina":`NINA (Немачка, цивилна заштита)`,"editor.provider_meteoswiss":`MeteoSwiss (Швајцарска)`,"editor.provider_eccc":`ECCC (Канада)`,"editor.provider_nsw_rfs":`NSW RFS (Аустралија)`,"editor.provider_inmet":`INMET (Бразил)`,"editor.provider_cap":`CAP Alerts (више региона)`,"editor.devices":`Уређаји за упозорења (опционо)`,"editor.devices_helper":`Аутоматски повлачи сваки активни сензор упозорења под изабраним уређајима (CAP Alerts, NINA). Додајте још уређаја да бисте комбиновали локације или провајдере.`,"editor.zones":`Зоне (опционо)`,"editor.zones_helper":`Зарезом одвојени BoM area_id кодови, нпр. NSW_FL049`,"editor.event_codes":`Кодови догађаја (опционо)`,"editor.event_codes_helper":`Зарезом одвојени кодови догађаја, нпр. TOW, SVW (NWS) или 31, 95 (DWD)`,"editor.exclude_event_codes":`Искључи кодове догађаја (опционо)`,"editor.exclude_event_codes_helper":`Зарезом одвојени кодови догађаја за искључивање, нпр. SCY (NWS) или 22 (DWD)`,"editor.sort_order":`Редослед сортирања`,"editor.sort_default":`Подразумевано`,"editor.sort_onset":`Време почетка`,"editor.sort_severity":`Озбиљност`,"editor.sort_distance":`Удаљеност`,"editor.color_theme":`Тема боја`,"editor.color_severity":`На основу озбиљности`,"editor.color_nws":`NWS званичне`,"editor.color_meteoalarm":`MeteoAlarm свест о опасности`,"editor.color_eccc":`ECCC јавна упозорења`,"editor.provider_colors":`Користи званичне боје упозорења провајдера`,"editor.timezone":`Временска зона`,"editor.tz_server":`Сервер (Home Assistant)`,"editor.tz_browser":`Претраживач (локални уређај)`,"editor.min_severity":`Минимална озбиљност`,"editor.severity_all":`Све озбиљности`,"editor.severity_minor":`Мања или виша`,"editor.severity_moderate":`Умерена или виша`,"editor.severity_severe":`Озбиљна или виша`,"editor.severity_extreme":`Само екстремна`,"editor.max_distance":`Максимална удаљеност ({unit})`,"editor.max_distance_helper":`Приказуј само инциденте унутар ове удаљености од ваше матичне Home Assistant локације, или од ентитета локације који је подешен испод. Примену има на изворе са тачкастим инцидентима (NSW RFS) — просторна упозорења немају удаљеност и никада се не филтрирају.`,"editor.my_location_entity":`Моја локација`,"editor.my_location_entity_helper":`Праћење уређаја (device tracker), особа или зона чије координате замењују матичну Home Assistant локацију као референтну тачку картице — за маркер „Моја локација” и као полазиште филтера за максималну удаљеност. Користите зону за фиксну локацију.`,"editor.animations":`Омогући анимације`,"editor.enhance_contrast":`Повећај контраст`,"editor.enhance_contrast_off":`Искључено`,"editor.enhance_contrast_subtle":`Суптилно`,"editor.enhance_contrast_strict":`Строго (WCAG AA)`,"editor.deduplicate":`Уклони дупликате упозорења`,"editor.deduplicate_headlines":`Уклони дупликате наслова`,"editor.show_details":`Прикажи панел са детаљима`,"editor.expand_details":`Увек прошири детаље`,"editor.show_metadata":`Прикажи метаподатке`,"editor.show_description":`Прикажи опис`,"editor.show_instructions":`Прикажи упутства`,"editor.show_geometry":`Прикажи мапу области`,"editor.geometry_style":`Стил мапе области`,"editor.geometry_style_shape":`Само контура`,"editor.geometry_style_map":`Мапе са мреже (онлајн)`,"editor.show_my_location":`Прикажи моју локацију на мапи`,"editor.show_provider":`Прикажи ознаку провајдера`,"editor.show_source_link":`Прикажи линк ка извору`,"editor.reformat_text":`Прилагоди текст упозорења (уклони тврде преломе редова)`,"editor.layout":`Изглед`,"editor.layout_default":`Подразумевано`,"editor.layout_compact":`Компактно`,"editor.layout_timeline":`Временска линија`,"editor.timeline_horizon":`Прозор временске линије`,"editor.timeline_horizon_auto":`Прилагоди упозорењима`,"editor.timeline_horizon_6h":`6 сати`,"editor.timeline_horizon_12h":`12 сати`,"editor.timeline_horizon_24h":`24 сата`,"editor.timeline_horizon_72h":`3 дана`,"editor.timeline_styling_note":`Временска линија црта фиксне траке по фази; подешавања испуне и декорације напретка се не примењују.`,"editor.timeline_dismiss_note":`На временској линији затварање је само дугметом.`,"editor.font_size":`Величина фонта`,"editor.font_size_small":`Мало`,"editor.font_size_default":`Подразумевано`,"editor.font_size_large":`Велико`,"editor.font_size_x_large":`Веома велико`,"editor.progress_fill":`Испуњење траке напретка`,"editor.progress_fill_track":`Линија (танка трака)`,"editor.progress_fill_background":`Позадинска боја`,"editor.styling_section":`Стилови напретка и икона`,"editor.progress_style":`Декорација траке напретка`,"editor.progress_style_wash_note":`Не примењује се када је испуњење траке подешено на Позадинску боју (позадина је увек пуна).`,"editor.progress_style_preparation":`Припрема`,"editor.progress_style_active":`Активно`,"editor.progress_style_ongoing":`У току`,"editor.deco_solid":`Пуна линија`,"editor.deco_striped":`Пругасто`,"editor.deco_shimmer":`Светлуцање`,"editor.deco_pulse":`Пулсирање`,"editor.icon_border_style":`Ивица прстена иконе`,"editor.icon_border_dashed":`Испрекидана`,"editor.icon_border_solid":`Пуна`,"editor.hide_expired":`Сакриј истекла упозорења`,"editor.hide_no_alerts":`Сакриј картицу када нема активних упозорења`,"editor.unavailable_behavior":`Када извор није доступан`,"editor.unavailable_message":`Прикажи који извор`,"editor.unavailable_compact":`Прикажи компактни индикатор`,"editor.unavailable_hide":`Сакриј индикатор (не препоручује се)`,"editor.unavailable_hide_warning":`Скривање индикатора може приказати лажно стање безбедности док је извор слеп — недоступан сензор није доказ безбедности.`,"editor.tap_action":`Акција на додир`,"editor.tap_action_helper":`Подешавање било које акције на додир замењује уграђену опцију проширивања у сваком реду упозорења.`,"editor.tap_default":`Уграђено проширивање (подразумевано)`,"editor.tap_details":`Искачући прозор са детаљима`,"editor.tap_more_info":`Више информација`,"editor.tap_navigate":`Навигација`,"editor.tap_url":`Отвори URL`,"editor.tap_toggle":`Преклопи стање`,"editor.tap_perform_action":`Изврши акцију`,"editor.tap_call_service":`Позови услугу (застарело)`,"editor.tap_fire_dom_event":`Покрени DOM догађај`,"editor.tap_none":`Ништа`,"editor.tap_navigation_path":`Путања навигације`,"editor.tap_url_path":`URL`,"editor.tap_yaml_managed":`Ова акција садржи податке које визуелни едитор не уређује. Постојећи YAML је сачуван — уредите га у YAML едитору.`,"editor.tap_details_expand_hint":`Када је опција „Увек прошири детаље” искључена, искачући прозор се отвара са описом скривеним иза прекидача „Прочитај детаље”.`,"editor.allow_dismiss":`Дозволи затварање упозорења`,"editor.show_dismiss_undo":`Прикажи обавештење за опозив након затварања`,"editor.dismissed_count":`Затворено: {count} упозорења.`,"editor.dismissed_count_singular":`Затворено: {count} упозорење.`,"editor.restore_all":`Врати све`,"editor.show_preview":`Прикажи пример података`,"editor.preview_hint":`Прегледај изглед картице са примерима упозорења`,"editor.preview_nudge":`Нема активних упозорења — омогућите ову опцију за преглед изгледа картице.`,"editor.entity_warning":`Изабрани ентитет изгледа не садржи податке о временским упозорењима.`,"editor.no_entities_hint":`Нису пронађени подржани ентитети за временска упозорења. Прво мора бити инсталирана интеграција провајдера (нпр. NWS Alerts).`,"editor.no_entities_hint_link":`Подржани провајдери`,"editor.feeds":`Аутоматски прикупљај са инсталираних извора (Feeds)`,"editor.feeds_helper":`Детектовани извори интеграције. Означите извор да бисте укључили сваки инцидент уживо који пријављује — нема потребе за ручним листањем појединачних ентитета. Захтева да интеграција буде подешена у Home Assistant-у.`,"editor.source_hint":`Аутоматско прикупљање {count} инцидената уживо са извора — нема потребе за ручним листањем ентитета.`,"editor.feeds_missing_warning":`Нема података уживо за {feeds}. Овај извор је омогућен али ништа не шаље податке — да ли је интеграција подешена у Home Assistant-у?`,"editor.devices_missing_warning":`Није пронађен ниједан уређај за {ids}. Да ли је интеграција уклоњена?`,"editor.no_device_alerts_hint":`Још увек нису пронађени активни сензори упозорења под изабраним уређајима. Картица ће се аутоматски попунити када интеграција објави упозорења.`,"editor.section_source":`Извор`,"editor.section_filtering":`Филтрирање`,"editor.section_appearance":`Изглед`,"editor.section_detail_panel":`Панел са детаљима`,"editor.section_behavior":`Понашање`,"editor.section_dismissal":`Затварање`,"editor.section_advanced":`Напредно`,"editor.detail_sections":`Одељци`,"editor.panel_more":`+ још {count}`,"editor.option_default":`{label} (подразумевано)`,"editor.reset_default":`Врати на подразумевано`,"editor.also_set":`Такође подешено: {names}`,"editor.dismiss_trigger":`Окидач за затварање`,"editor.dismiss_trigger_button":`Само дугме`,"editor.dismiss_trigger_swipe":`Само превлачење`,"editor.dismiss_trigger_both":`Дугме и превлачење`,"editor.dismiss_button_style":`Стил дугмета`,"editor.dismiss_button_style_icon":`Само икона`,"editor.dismiss_button_style_labeled":`Икона и ознака`},"sr-Latn":{"card.no_alerts":`Nema aktivnih upozorenja.`,"card.sources_unavailable_named":`{name} je nedostupan`,"card.sources_unavailable_count":`{count} izvora je nedostupno`,"card.sources_unavailable_one":`Izvor je nedostupan`,"card.preview":`Primer podataka`,"card.read_details":`Pročitaj detalje`,"card.open_source":`Otvori izvor ({provider})`,"card.zones_count":`{count} zona`,"card.zone_count_singular":`{count} zona`,"card.dismiss":`Zatvori`,"card.dismissed_toast":`Zatvoreno: {event}`,"card.dismissed_toast_undo":`Opozovi`,"card.close":`Zatvori`,"detail.issued":`Izdato`,"detail.onset":`Početak`,"detail.expires":`Ističe`,"detail.area":`Oblast`,"detail.distance":`Udaljenost`,"detail.area_more":`i još oblasti: {count}`,"detail.area_fewer":`Prikaži manje`,"detail.geometry_with_location":`{area}, sa označenom vašom lokacijom`,"detail.source":`Izvor`,"detail.description":`Opis`,"detail.instructions":`Uputstva`,"progress.start":`Početak`,"progress.now":`Sada`,"progress.end":`Kraj`,"progress.ongoing":`U toku`,"progress.expires_in_label":`Ističe za`,"progress.starts_in_label":`Počinje za`,"progress.tbd":`Neodređeno`,"progress.na":`N/A`,"progress.expired_label":`Isteklo`,"progress.compact_active":`još {time}`,"progress.compact_prep":`za {time}`,"progress.compact_ongoing":`u toku`,"progress.compact_expired":`isteklo pre {time}`,"timeline.clipped_start":`Počelo pre ovog prozora`,"timeline.clipped_end":`Nastavlja se posle ovog prozora`,"time.just_now":`upravo sada`,"time.in_less_than_1m":`za <1min`,"time.minutes_ago":`pre {m}min`,"time.in_minutes":`za {m}min`,"time.hours_ago":`pre {dur}`,"time.in_hours":`za {dur}`,"time.days_ago":`pre {d}d`,"time.in_days":`za {d}d`,"badge.severity_extreme":`Ekstremno`,"badge.severity_severe":`Ozbiljno`,"badge.severity_moderate":`Umereno`,"badge.severity_minor":`Manje`,"badge.severity_unknown":`Nepoznato`,"badge.certainty_observed":`Osmotreno`,"badge.certainty_likely":`Verovatno`,"badge.certainty_possible":`Moguće`,"badge.certainty_unlikely":`Malo verovatno`,"badge.certainty_unknown":`Nepoznato`,"editor.entities":`Entiteti`,"editor.title":`Naslov (opciono)`,"editor.provider":`Provajder upozorenja`,"editor.provider_auto":`Automatsko prepoznavanje`,"editor.provider_nws":`NWS (Sjedinjene Američke Države)`,"editor.provider_bom":`BoM (Australija)`,"editor.provider_meteoalarm":`MeteoAlarm (Evropa)`,"editor.provider_pirateweather":`PirateWeather`,"editor.provider_dwd":`DWD (Nemačka)`,"editor.provider_nina":`NINA (Nemačka, civilna zaštita)`,"editor.provider_meteoswiss":`MeteoSwiss (Švajcarska)`,"editor.provider_eccc":`ECCC (Kanada)`,"editor.provider_nsw_rfs":`NSW RFS (Australija)`,"editor.provider_inmet":`INMET (Brazil)`,"editor.provider_cap":`CAP Alerts (više regiona)`,"editor.devices":`Uređaji za upozorenja (opciono)`,"editor.devices_helper":`Automatski povlači svaki aktivni senzor upozorenja pod izabranim uređajima (CAP Alerts, NINA). Dodajte još uređaja da biste kombinovali lokacije ili provajdere.`,"editor.zones":`Zone (opciono)`,"editor.zones_helper":`Zarezom odvojeni BoM area_id kodovi, npr. NSW_FL049`,"editor.event_codes":`Kodovi događaja (opciono)`,"editor.event_codes_helper":`Zarezom odvojeni kodovi događaja, npr. TOW, SVW (NWS) ili 31, 95 (DWD)`,"editor.exclude_event_codes":`Isključi kodove događaja (opciono)`,"editor.exclude_event_codes_helper":`Zarezom odvojeni kodovi događaja za isključivanje, npr. SCY (NWS) ili 22 (DWD)`,"editor.sort_order":`Redosled sortiranja`,"editor.sort_default":`Podrazumevano`,"editor.sort_onset":`Vreme početka`,"editor.sort_severity":`Ozbiljnost`,"editor.sort_distance":`Udaljenost`,"editor.color_theme":`Tema boja`,"editor.color_severity":`Na osnovu ozbiljnosti`,"editor.color_nws":`NWS zvanične`,"editor.color_meteoalarm":`MeteoAlarm svest o opasnosti`,"editor.color_eccc":`ECCC javna upozorenja`,"editor.provider_colors":`Koristi zvanične boje upozorenja provajdera`,"editor.timezone":`Vremenska zona`,"editor.tz_server":`Server (Home Assistant)`,"editor.tz_browser":`Pretraživač (lokalni uređaj)`,"editor.min_severity":`Minimalna ozbiljnost`,"editor.severity_all":`Sve ozbiljnosti`,"editor.severity_minor":`Manja ili viša`,"editor.severity_moderate":`Umerena ili viša`,"editor.severity_severe":`Ozbiljna ili viša`,"editor.severity_extreme":`Samo ekstremna`,"editor.max_distance":`Maksimalna udaljenost ({unit})`,"editor.max_distance_helper":`Prikazuj samo incidente unutar ove udaljenosti od vaše matične Home Assistant lokacije, ili od entiteta lokacije koji je podešen ispod. Primenu ima na izvore sa tačkastim incidentima (NSW RFS) — prostorna upozorenja nemaju udaljenost i nikada se ne filtriraju.`,"editor.my_location_entity":`Moja lokacija`,"editor.my_location_entity_helper":`Praćenje uređaja (device tracker), osoba ili zona čije koordinate zamenjuju matičnu Home Assistant lokaciju kao referentnu tačku kartice — za marker „Moja lokacija” i kao polazište filtera za maksimalnu udaljenost. Koristite zonu za fiksnu lokaciju.`,"editor.animations":`Omogući animacije`,"editor.enhance_contrast":`Povećaj kontrast`,"editor.enhance_contrast_off":`Isključeno`,"editor.enhance_contrast_subtle":`Suptilno`,"editor.enhance_contrast_strict":`Strogo (WCAG AA)`,"editor.deduplicate":`Ukloni duplikate upozorenja`,"editor.deduplicate_headlines":`Ukloni duplikate naslova`,"editor.show_details":`Prikaži panel sa detaljima`,"editor.expand_details":`Uvek proširi detalje`,"editor.show_metadata":`Prikaži metapodatke`,"editor.show_description":`Prikaži opis`,"editor.show_instructions":`Prikaži uputstva`,"editor.show_geometry":`Prikaži mapu oblasti`,"editor.geometry_style":`Stil mape oblasti`,"editor.geometry_style_shape":`Samo kontura`,"editor.geometry_style_map":`Mape sa mreže (onlajn)`,"editor.show_my_location":`Prikaži moju lokaciju na mapi`,"editor.show_provider":`Prikaži oznaku provajdera`,"editor.show_source_link":`Prikaži link ka izvoru`,"editor.reformat_text":`Prilagodi tekst upozorenja (ukloni tvrde prelome redova)`,"editor.layout":`Izgled`,"editor.layout_default":`Podrazumevano`,"editor.layout_compact":`Kompaktno`,"editor.layout_timeline":`Vremenska linija`,"editor.timeline_horizon":`Prozor vremenske linije`,"editor.timeline_horizon_auto":`Prilagodi upozorenjima`,"editor.timeline_horizon_6h":`6 sati`,"editor.timeline_horizon_12h":`12 sati`,"editor.timeline_horizon_24h":`24 sata`,"editor.timeline_horizon_72h":`3 dana`,"editor.timeline_styling_note":`Vremenska linija crta fiksne trake po fazi; podešavanja ispune i dekoracije napretka se ne primenjuju.`,"editor.timeline_dismiss_note":`Na vremenskoj liniji zatvaranje je samo dugmetom.`,"editor.font_size":`Veličina fonta`,"editor.font_size_small":`Malo`,"editor.font_size_default":`Podrazumevano`,"editor.font_size_large":`Veliko`,"editor.font_size_x_large":`Veoma veliko`,"editor.progress_fill":`Ispunjenje trake napretka`,"editor.progress_fill_track":`Linija (tanka traka)`,"editor.progress_fill_background":`Pozadinska boja`,"editor.styling_section":`Stilovi napretka i ikona`,"editor.progress_style":`Dekoracija trake napretka`,"editor.progress_style_wash_note":`Ne primenjuje se kada je ispunjenje trake podešeno na Pozadinsku boju (pozadina je uvek puna).`,"editor.progress_style_preparation":`Priprema`,"editor.progress_style_active":`Aktivno`,"editor.progress_style_ongoing":`U toku`,"editor.deco_solid":`Puna linija`,"editor.deco_striped":`Prugasto`,"editor.deco_shimmer":`Svetlucanje`,"editor.deco_pulse":`Pulsiranje`,"editor.icon_border_style":`Ivica prstena ikone`,"editor.icon_border_dashed":`Isprekidana`,"editor.icon_border_solid":`Puna`,"editor.hide_expired":`Sakrij istekla upozorenja`,"editor.hide_no_alerts":`Sakrij karticu kada nema aktivnih upozorenja`,"editor.unavailable_behavior":`Kada izvor nije dostupan`,"editor.unavailable_message":`Prikaži koji izvor`,"editor.unavailable_compact":`Prikaži kompaktni indikator`,"editor.unavailable_hide":`Sakrij indikator (ne preporučuje se)`,"editor.unavailable_hide_warning":`Skrivanje indikatora može prikazati lažno stanje bezbednosti dok je izvor slep — nedostupan senzor nije dokaz bezbednosti.`,"editor.tap_action":`Akcija na dodir`,"editor.tap_action_helper":`Podešavanje bilo koje akcije na dodir zamenjuje ugrađenu opciju proširivanja u svakom redu upozorenja.`,"editor.tap_default":`Ugrađeno proširivanje (podrazumevano)`,"editor.tap_details":`Iskačući prozor sa detaljima`,"editor.tap_more_info":`Više informacija`,"editor.tap_navigate":`Navigacija`,"editor.tap_url":`Otvori URL`,"editor.tap_toggle":`Preklopi stanje`,"editor.tap_perform_action":`Izvrši akciju`,"editor.tap_call_service":`Pozovi uslugu (zastarelo)`,"editor.tap_fire_dom_event":`Pokreni DOM događaj`,"editor.tap_none":`Ništa`,"editor.tap_navigation_path":`Putanja navigacije`,"editor.tap_url_path":`URL`,"editor.tap_yaml_managed":`Ova akcija sadrži podatke koje vizuelni editor ne uređuje. Postojeći YAML je sačuvan — uredite ga u YAML editoru.`,"editor.tap_details_expand_hint":`Kada je opcija „Uvek proširi detalje” isključena, iskačući prozor se otvara sa opisom skrivenim iza prekidača „Pročitaj detalje”.`,"editor.allow_dismiss":`Dozvoli zatvaranje upozorenja`,"editor.show_dismiss_undo":`Prikaži obaveštenje za opoziv nakon zatvaranja`,"editor.dismissed_count":`Zatvoreno: {count} upozorenja.`,"editor.dismissed_count_singular":`Zatvoreno: {count} upozorenje.`,"editor.restore_all":`Vrati sve`,"editor.show_preview":`Prikaži primer podataka`,"editor.preview_hint":`Pregledaj izgled kartice sa primerima upozorenja`,"editor.preview_nudge":`Nema aktivnih upozorenja — omogućite ovu opciju za pregled izgleda kartice.`,"editor.entity_warning":`Izabrani entitet izgleda ne sadrži podatke o vremenskim upozorenjima.`,"editor.no_entities_hint":`Nisu pronađeni podržani entiteti za vremenska upozorenja. Prvo mora biti instalirana integracija provajdera (npr. NWS Alerts).`,"editor.no_entities_hint_link":`Podržani provajderi`,"editor.feeds":`Automatski prikupljaj sa instaliranih izvora (Feeds)`,"editor.feeds_helper":`Detektovani izvori integracije. Označite izvor da biste uključili svaki incident uživo koji prijavljuje — nema potrebe za ručnim listanjem pojedinačnih entiteta. Zahteva da integracija bude podešena u Home Assistant-u.`,"editor.source_hint":`Automatsko prikupljanje {count} incidenata uživo sa izvora — nema potrebe za ručnim listanjem entiteta.`,"editor.feeds_missing_warning":`Nema podataka uživo za {feeds}. Ovaj izvor je omogućen ali ništa ne šalje podatke — da li je integracija podešena u Home Assistant-u?`,"editor.devices_missing_warning":`Nije pronađen nijedan uređaj za {ids}. Da li je integracija uklonjena?`,"editor.no_device_alerts_hint":`Još uvek nisu pronađeni aktivni senzori upozorenja pod izabranim uređajima. Kartica će se automatski popuniti kada integracija objavi upozorenja.`,"editor.section_source":`Izvor`,"editor.section_filtering":`Filtriranje`,"editor.section_appearance":`Izgled`,"editor.section_detail_panel":`Panel sa detaljima`,"editor.section_behavior":`Ponašanje`,"editor.section_dismissal":`Zatvaranje`,"editor.section_advanced":`Napredno`,"editor.detail_sections":`Odeljci`,"editor.panel_more":`+ još {count}`,"editor.option_default":`{label} (podrazumevano)`,"editor.reset_default":`Vrati na podrazumevano`,"editor.also_set":`Takođe podešeno: {names}`,"editor.dismiss_trigger":`Okidač za zatvaranje`,"editor.dismiss_trigger_button":`Samo dugme`,"editor.dismiss_trigger_swipe":`Samo prevlačenje`,"editor.dismiss_trigger_both":`Dugme i prevlačenje`,"editor.dismiss_button_style":`Stil dugmeta`,"editor.dismiss_button_style_icon":`Samo ikona`,"editor.dismiss_button_style_labeled":`Ikona i oznaka`},"zh-Hans":{"card.no_alerts":`无活跃警报。`,"card.sources_unavailable_named":`{name} 不可用`,"card.sources_unavailable_count":`{count} 个来源不可用`,"card.sources_unavailable_one":`一个来源不可用`,"card.preview":`示例数据`,"card.read_details":`查看详情`,"card.open_source":`打开 {provider} 来源`,"card.zones_count":`{count} 个区域`,"card.zone_count_singular":`{count} 个区域`,"card.dismiss":`忽略`,"card.dismissed_toast":`已忽略：{event}`,"card.dismissed_toast_undo":`撤销`,"card.close":`关闭`,"detail.issued":`发布时间`,"detail.onset":`开始时间`,"detail.expires":`过期时间`,"detail.area":`区域`,"detail.distance":`距离`,"detail.area_more":`及另外 {count} 个区域`,"detail.area_fewer":`收起`,"detail.geometry_with_location":`{area}，已标出您的位置`,"detail.source":`来源`,"detail.description":`描述`,"detail.instructions":`说明`,"progress.start":`开始`,"progress.now":`现在`,"progress.end":`结束`,"progress.ongoing":`进行中`,"progress.expires_in_label":`将于以下时间后过期`,"progress.starts_in_label":`将于以下时间后开始`,"progress.tbd":`待定`,"progress.na":`不适用`,"progress.expired_label":`已过期`,"progress.compact_active":`持续 {time}`,"progress.compact_prep":`{time} 后开始`,"progress.compact_ongoing":`进行中`,"progress.compact_expired":`已于 {time} 前过期`,"timeline.clipped_start":`开始于此时间窗口之前`,"timeline.clipped_end":`持续到此时间窗口之后`,"time.just_now":`刚刚`,"time.in_less_than_1m":`1分钟内`,"time.minutes_ago":`{m} 分钟前`,"time.in_minutes":`{m} 分钟后`,"time.hours_ago":`{dur} 前`,"time.in_hours":`{dur} 后`,"time.days_ago":`{d} 天前`,"time.in_days":`{d} 天后`,"badge.severity_extreme":`极端`,"badge.severity_severe":`严重`,"badge.severity_moderate":`中度`,"badge.severity_minor":`轻微`,"badge.severity_unknown":`未知`,"badge.certainty_observed":`已观测`,"badge.certainty_likely":`很可能`,"badge.certainty_possible":`可能`,"badge.certainty_unlikely":`不太可能`,"badge.certainty_unknown":`未知`,"editor.entities":`实体`,"editor.title":`标题（可选）`,"editor.provider":`警报提供方`,"editor.provider_auto":`自动检测`,"editor.provider_nws":`NWS（美国）`,"editor.provider_bom":`BoM（澳大利亚）`,"editor.provider_meteoalarm":`MeteoAlarm（欧洲）`,"editor.provider_pirateweather":`PirateWeather`,"editor.provider_dwd":`DWD（德国）`,"editor.provider_nina":`NINA（德国民防预警）`,"editor.provider_meteoswiss":`MeteoSwiss（瑞士）`,"editor.provider_eccc":`ECCC（加拿大）`,"editor.provider_nsw_rfs":`NSW RFS（澳大利亚）`,"editor.provider_inmet":`INMET（巴西）`,"editor.provider_cap":`CAP 警报（多区域）`,"editor.devices":`警报设备（可选）`,"editor.devices_helper":`自动拉取所选设备下的所有活跃警报传感器（CAP Alerts、NINA）。添加更多设备可合并多个地点或提供方。`,"editor.zones":`区域（可选）`,"editor.zones_helper":`以逗号分隔的 BoM area_id 代码，例如 NSW_FL049`,"editor.event_codes":`事件代码（可选）`,"editor.event_codes_helper":`以逗号分隔的事件代码，例如 TOW、SVW（NWS）或 31、95（DWD）`,"editor.exclude_event_codes":`排除事件代码（可选）`,"editor.exclude_event_codes_helper":`以逗号分隔的要排除的事件代码，例如 SCY（NWS）或 22（DWD）`,"editor.sort_order":`排序方式`,"editor.sort_default":`默认`,"editor.sort_onset":`开始时间`,"editor.sort_severity":`严重程度`,"editor.sort_distance":`距离`,"editor.color_theme":`配色主题`,"editor.color_severity":`基于严重程度`,"editor.color_nws":`NWS 官方`,"editor.color_meteoalarm":`MeteoAlarm 认知等级`,"editor.color_eccc":`ECCC 公共警报`,"editor.provider_colors":`使用提供方发布的警报颜色`,"editor.timezone":`时区`,"editor.tz_server":`服务器（Home Assistant）`,"editor.tz_browser":`浏览器（本地设备）`,"editor.min_severity":`最低严重程度`,"editor.severity_all":`所有严重程度`,"editor.severity_minor":`轻微及以上`,"editor.severity_moderate":`中度及以上`,"editor.severity_severe":`严重及以上`,"editor.severity_extreme":`仅极端`,"editor.max_distance":`最大距离（{unit}）`,"editor.max_distance_helper":`仅显示距离 Home Assistant 家庭位置或下方所设位置实体在此范围内的事件。适用于逐个事件的订阅源（NSW RFS）——区域性警报没有距离信息，永远不会被过滤。`,"editor.my_location_entity":`我的位置`,"editor.my_location_entity_helper":`一个设备追踪器、人员或区域，其坐标将取代 Home Assistant 家庭位置作为卡片的参考点——用于“我的位置”标记，并作为最大距离过滤的原点。固定位置请使用区域。`,"editor.animations":`启用动画`,"editor.enhance_contrast":`增强对比度`,"editor.enhance_contrast_off":`关闭`,"editor.enhance_contrast_subtle":`柔和`,"editor.enhance_contrast_strict":`严格（WCAG AA）`,"editor.deduplicate":`去重警报`,"editor.deduplicate_headlines":`去重标题`,"editor.show_details":`显示详情面板`,"editor.expand_details":`始终展开详情`,"editor.show_metadata":`显示元数据`,"editor.show_description":`显示描述`,"editor.show_instructions":`显示说明`,"editor.show_geometry":`显示区域地图`,"editor.geometry_style":`区域地图样式`,"editor.geometry_style_shape":`仅轮廓`,"editor.geometry_style_map":`地图瓦片（在线）`,"editor.show_my_location":`在地图上显示我的位置`,"editor.show_provider":`显示提供方标签`,"editor.show_source_link":`显示来源链接`,"editor.reformat_text":`重排警报文本（去除硬换行）`,"editor.layout":`布局`,"editor.layout_default":`默认`,"editor.layout_compact":`紧凑`,"editor.layout_timeline":`时间线`,"editor.timeline_horizon":`时间线窗口`,"editor.timeline_horizon_auto":`适应警报`,"editor.timeline_horizon_6h":`6 小时`,"editor.timeline_horizon_12h":`12 小时`,"editor.timeline_horizon_24h":`24 小时`,"editor.timeline_horizon_72h":`3 天`,"editor.timeline_styling_note":`时间线按阶段绘制固定样式的条形；进度填充和装饰设置不适用。`,"editor.timeline_dismiss_note":`时间线中仅可通过按钮忽略警报。`,"editor.font_size":`字体大小`,"editor.font_size_small":`小`,"editor.font_size_default":`默认`,"editor.font_size_large":`大`,"editor.font_size_x_large":`特大`,"editor.progress_fill":`进度填充`,"editor.progress_fill_track":`轨道（细条）`,"editor.progress_fill_background":`背景覆盖`,"editor.styling_section":`进度与图标样式`,"editor.progress_style":`进度条装饰`,"editor.progress_style_wash_note":`当进度填充设置为背景覆盖时不适用（覆盖始终为纯色）。`,"editor.progress_style_preparation":`准备阶段`,"editor.progress_style_active":`活跃阶段`,"editor.progress_style_ongoing":`持续阶段`,"editor.deco_solid":`纯色`,"editor.deco_striped":`条纹`,"editor.deco_shimmer":`闪烁`,"editor.deco_pulse":`脉冲`,"editor.icon_border_style":`图标环形边框`,"editor.icon_border_dashed":`虚线`,"editor.icon_border_solid":`实线`,"editor.hide_expired":`隐藏已过期警报`,"editor.hide_no_alerts":`无活跃警报时隐藏卡片`,"editor.unavailable_behavior":`当来源不可用时`,"editor.unavailable_message":`显示哪个来源`,"editor.unavailable_compact":`显示紧凑指示器`,"editor.unavailable_hide":`隐藏指示器（不推荐）`,"editor.unavailable_hide_warning":`隐藏指示器可能会在来源失效时呈现一切正常的假象——不可用的传感器并不能证明安全。`,"editor.tap_action":`点击操作`,"editor.tap_action_helper":`设置任意点击操作后，每条预警行的内嵌展开功能将被替代。`,"editor.tap_default":`内嵌展开（默认）`,"editor.tap_details":`详情弹窗`,"editor.tap_more_info":`更多信息`,"editor.tap_navigate":`导航`,"editor.tap_url":`打开网址`,"editor.tap_toggle":`切换`,"editor.tap_perform_action":`执行操作`,"editor.tap_call_service":`调用服务（旧版）`,"editor.tap_fire_dom_event":`触发 DOM 事件`,"editor.tap_none":`无`,"editor.tap_navigation_path":`导航路径`,"editor.tap_url_path":`网址`,"editor.tap_yaml_managed":`此操作包含可视化编辑器无法编辑的数据。其现有 YAML 会被保留——请在 YAML 编辑器中修改。`,"editor.tap_details_expand_hint":`当“始终展开详情”关闭时，弹窗打开后描述内容仍位于“阅读详情”按钮之后。`,"editor.allow_dismiss":`允许忽略警报`,"editor.show_dismiss_undo":`忽略时显示撤销通知`,"editor.dismissed_count":`已忽略：{count} 条警报。`,"editor.dismissed_count_singular":`已忽略：{count} 条警报。`,"editor.restore_all":`全部恢复`,"editor.show_preview":`显示示例数据`,"editor.preview_hint":`使用示例警报预览卡片布局`,"editor.preview_nudge":`无活跃警报——启用以预览卡片布局。`,"editor.entity_warning":`所选实体似乎不包含天气警报数据。`,"editor.no_entities_hint":`未找到支持的天气警报实体。必须先安装提供方集成（例如 NWS Alerts）。`,"editor.no_entities_hint_link":`支持的提供方`,"editor.feeds":`从已安装的订阅源自动收集`,"editor.feeds_helper":`检测到的集成订阅源。勾选一项即可包含其报告的所有实时事件——无需逐个列出实体。需要先在 Home Assistant 中配置该集成。`,"editor.source_hint":`正从订阅源自动收集 {count} 个实时事件——无需手动列出实体。`,"editor.feeds_missing_warning":`{feeds} 无实时数据。该订阅源已启用但没有任何内容提供——是否在 Home Assistant 中配置了该集成？`,"editor.devices_missing_warning":`未找到 {ids} 对应的设备。该集成是否已被移除？`,"editor.no_device_alerts_hint":`所选设备下尚未找到活跃警报传感器。当集成发布警报时，卡片将自动填充。`,"editor.section_source":`来源`,"editor.section_filtering":`过滤`,"editor.section_appearance":`外观`,"editor.section_detail_panel":`详情面板`,"editor.section_behavior":`行为`,"editor.section_dismissal":`忽略`,"editor.section_advanced":`高级`,"editor.detail_sections":`内容板块`,"editor.panel_more":`还有 {count} 项`,"editor.option_default":`{label}（默认）`,"editor.reset_default":`恢复默认`,"editor.also_set":`另已设置：{names}`,"editor.dismiss_trigger":`忽略触发方式`,"editor.dismiss_trigger_button":`仅按钮`,"editor.dismiss_trigger_swipe":`仅滑动`,"editor.dismiss_trigger_both":`按钮和滑动`,"editor.dismiss_button_style":`按钮样式`,"editor.dismiss_button_style_icon":`仅图标`,"editor.dismiss_button_style_labeled":`图标和标签`},"pt-BR":{"card.no_alerts":`Nenhum alerta ativo.`,"card.sources_unavailable_named":`{name} indisponível`,"card.sources_unavailable_count":`{count} fontes indisponíveis`,"card.sources_unavailable_one":`Uma fonte está indisponível`,"card.preview":`Dados de exemplo`,"card.read_details":`Ver detalhes`,"card.open_source":`Abrir fonte {provider}`,"card.zones_count":`{count} zonas`,"card.zone_count_singular":`{count} zona`,"card.dismiss":`Dispensar`,"card.dismissed_toast":`Dispensado: {event}`,"card.dismissed_toast_undo":`Desfazer`,"card.close":`Fechar`,"detail.issued":`Emitido`,"detail.onset":`Início`,"detail.expires":`Expira`,"detail.area":`Área`,"detail.distance":`Distância`,"detail.area_more":`e mais {count} áreas`,"detail.area_fewer":`Mostrar menos`,"detail.geometry_with_location":`{area}, com sua localização marcada`,"detail.source":`Fonte`,"detail.description":`Descrição`,"detail.instructions":`Instruções`,"progress.start":`Início`,"progress.now":`Agora`,"progress.end":`Fim`,"progress.ongoing":`Em andamento`,"progress.expires_in_label":`Expira em`,"progress.starts_in_label":`Começa em`,"progress.tbd":`A definir`,"progress.na":`N/D`,"progress.expired_label":`Expirado`,"progress.compact_active":`por {time}`,"progress.compact_prep":`em {time}`,"progress.compact_ongoing":`em andamento`,"progress.compact_expired":`expirou há {time}`,"timeline.clipped_start":`Começou antes desta janela`,"timeline.clipped_end":`Continua além desta janela`,"time.just_now":`agora mesmo`,"time.in_less_than_1m":`em <1 min`,"time.minutes_ago":`há {m} min`,"time.in_minutes":`em {m} min`,"time.hours_ago":`há {dur}`,"time.in_hours":`em {dur}`,"time.days_ago":`há {d} d`,"time.in_days":`em {d} d`,"badge.severity_extreme":`Extremo`,"badge.severity_severe":`Severo`,"badge.severity_moderate":`Moderado`,"badge.severity_minor":`Menor`,"badge.severity_unknown":`Desconhecido`,"badge.certainty_observed":`Observado`,"badge.certainty_likely":`Provável`,"badge.certainty_possible":`Possível`,"badge.certainty_unlikely":`Improvável`,"badge.certainty_unknown":`Desconhecido`,"editor.entities":`Entidades`,"editor.title":`Título (opcional)`,"editor.provider":`Provedor de alertas`,"editor.provider_auto":`Detectar automaticamente`,"editor.provider_nws":`NWS (Estados Unidos)`,"editor.provider_bom":`BoM (Austrália)`,"editor.provider_meteoalarm":`MeteoAlarm (Europa)`,"editor.provider_pirateweather":`PirateWeather`,"editor.provider_dwd":`DWD (Alemanha)`,"editor.provider_nina":`NINA (Alemanha, proteção civil)`,"editor.provider_meteoswiss":`MeteoSwiss (Suíça)`,"editor.provider_eccc":`ECCC (Canadá)`,"editor.provider_nsw_rfs":`NSW RFS (Austrália)`,"editor.provider_inmet":`INMET (Brasil)`,"editor.provider_cap":`Alertas CAP (multi-região)`,"editor.devices":`Dispositivos de alerta (opcional)`,"editor.devices_helper":`Inclui automaticamente todos os sensores de alerta ativos nos dispositivos selecionados (CAP Alerts, NINA). Adicione mais dispositivos para combinar locais ou provedores.`,"editor.zones":`Zonas (opcional)`,"editor.zones_helper":`Códigos area_id do BoM separados por vírgula, por exemplo NSW_FL049`,"editor.event_codes":`Códigos de evento (opcional)`,"editor.event_codes_helper":`Códigos de evento separados por vírgula, por exemplo TOW, SVW (NWS) ou 31, 95 (DWD)`,"editor.exclude_event_codes":`Excluir códigos de evento (opcional)`,"editor.exclude_event_codes_helper":`Códigos de evento a excluir, separados por vírgula, por exemplo SCY (NWS) ou 22 (DWD)`,"editor.sort_order":`Ordem`,"editor.sort_default":`Padrão`,"editor.sort_onset":`Horário de início`,"editor.sort_severity":`Severidade`,"editor.sort_distance":`Distância`,"editor.color_theme":`Tema de cores`,"editor.color_severity":`Baseado na severidade`,"editor.color_nws":`Oficial do NWS`,"editor.color_meteoalarm":`Níveis do MeteoAlarm`,"editor.color_eccc":`Alertas públicos do ECCC`,"editor.provider_colors":`Usar as cores de alerta publicadas pelo provedor`,"editor.timezone":`Fuso horário`,"editor.tz_server":`Servidor (Home Assistant)`,"editor.tz_browser":`Navegador (dispositivo local)`,"editor.min_severity":`Severidade mínima`,"editor.severity_all":`Todas as severidades`,"editor.severity_minor":`Menor ou superior`,"editor.severity_moderate":`Moderado ou superior`,"editor.severity_severe":`Severo ou superior`,"editor.severity_extreme":`Somente extremo`,"editor.max_distance":`Distância máxima ({unit})`,"editor.max_distance_helper":`Mostra somente incidentes dentro desta distância da localização da sua casa no Home Assistant ou da entidade de localização definida abaixo. Aplica-se a feeds de incidentes pontuais (NSW RFS, INMET), alertas de área não têm distância e nunca são filtrados.`,"editor.my_location_entity":`Minha localização`,"editor.my_location_entity_helper":`Um rastreador de dispositivo, pessoa ou zona cujas coordenadas substituem a localização da casa no Home Assistant como ponto de referência do card, para o marcador "Minha localização" e como origem do filtro de distância máxima. Use uma zona para uma localização fixa.`,"editor.animations":`Ativar animações`,"editor.enhance_contrast":`Aumentar contraste`,"editor.enhance_contrast_off":`Desativado`,"editor.enhance_contrast_subtle":`Sutil`,"editor.enhance_contrast_strict":`Rigoroso (WCAG AA)`,"editor.deduplicate":`Remover alertas duplicados`,"editor.deduplicate_headlines":`Remover títulos duplicados`,"editor.show_details":`Mostrar painel de detalhes`,"editor.expand_details":`Sempre expandir detalhes`,"editor.show_metadata":`Mostrar metadados`,"editor.show_description":`Mostrar descrição`,"editor.show_instructions":`Mostrar instruções`,"editor.show_geometry":`Mostrar mapa da área`,"editor.geometry_style":`Estilo do mapa da área`,"editor.geometry_style_shape":`Somente contorno`,"editor.geometry_style_map":`Mapa com tiles (online)`,"editor.show_my_location":`Mostrar minha localização no mapa`,"editor.show_provider":`Mostrar rótulo do provedor`,"editor.show_source_link":`Mostrar link da fonte`,"editor.reformat_text":`Reformatar texto do alerta (remover quebras fixas)`,"editor.layout":`Layout`,"editor.layout_default":`Padrão`,"editor.layout_compact":`Compacto`,"editor.layout_timeline":`Linha do tempo`,"editor.timeline_horizon":`Janela da linha do tempo`,"editor.timeline_horizon_auto":`Ajustar aos alertas`,"editor.timeline_horizon_6h":`6 horas`,"editor.timeline_horizon_12h":`12 horas`,"editor.timeline_horizon_24h":`24 horas`,"editor.timeline_horizon_72h":`3 dias`,"editor.timeline_styling_note":`A linha do tempo desenha barras fixas por fase; as configurações de preenchimento e decoração do progresso não se aplicam.`,"editor.timeline_dismiss_note":`Na linha do tempo, dispensar é somente pelo botão.`,"editor.font_size":`Tamanho da fonte`,"editor.font_size_small":`Pequeno`,"editor.font_size_default":`Padrão`,"editor.font_size_large":`Grande`,"editor.font_size_x_large":`Extra grande`,"editor.progress_fill":`Preenchimento do progresso`,"editor.progress_fill_track":`Trilha (barra fina)`,"editor.progress_fill_background":`Fundo preenchido`,"editor.styling_section":`Estilo do progresso e do ícone`,"editor.progress_style":`Decoração da barra de progresso`,"editor.progress_style_wash_note":`Não se aplica quando o preenchimento do progresso está em Fundo preenchido (o fundo é sempre sólido).`,"editor.progress_style_preparation":`Preparação`,"editor.progress_style_active":`Ativo`,"editor.progress_style_ongoing":`Em andamento`,"editor.deco_solid":`Sólido`,"editor.deco_striped":`Listrado`,"editor.deco_shimmer":`Brilho`,"editor.deco_pulse":`Pulso`,"editor.icon_border_style":`Borda do anel do ícone`,"editor.icon_border_dashed":`Tracejada`,"editor.icon_border_solid":`Sólida`,"editor.hide_expired":`Ocultar alertas expirados`,"editor.hide_no_alerts":`Ocultar card quando não houver alertas ativos`,"editor.unavailable_behavior":`Quando uma fonte está indisponível`,"editor.unavailable_message":`Mostrar qual fonte`,"editor.unavailable_compact":`Mostrar indicador compacto`,"editor.unavailable_hide":`Ocultar indicador (não recomendado)`,"editor.unavailable_hide_warning":`Ocultar o indicador pode mostrar tudo limpo enquanto uma fonte está sem dados, um sensor indisponível não prova segurança.`,"editor.tap_action":`Ação ao tocar`,"editor.tap_action_helper":`Definir qualquer ação ao tocar substitui o controle de expansão em cada linha de alerta.`,"editor.tap_default":`Expandir em linha (padrão)`,"editor.tap_details":`Pop-up de detalhes`,"editor.tap_more_info":`Mais informações`,"editor.tap_navigate":`Navegar`,"editor.tap_url":`Abrir URL`,"editor.tap_toggle":`Alternar`,"editor.tap_perform_action":`Executar ação`,"editor.tap_call_service":`Chamar serviço (legado)`,"editor.tap_fire_dom_event":`Disparar evento DOM`,"editor.tap_none":`Nada`,"editor.tap_navigation_path":`Caminho de navegação`,"editor.tap_url_path":`URL`,"editor.tap_yaml_managed":`Esta ação tem um payload que o editor visual não edita. O YAML existente é preservado, edite-o no editor YAML.`,"editor.tap_details_expand_hint":`Com "Sempre expandir detalhes" desativado, o pop-up abre com a descrição atrás do botão Ver detalhes.`,"editor.allow_dismiss":`Permitir dispensar alertas`,"editor.show_dismiss_undo":`Mostrar notificação de desfazer ao dispensar`,"editor.dismissed_count":`Dispensados: {count} alertas.`,"editor.dismissed_count_singular":`Dispensado: {count} alerta.`,"editor.restore_all":`Restaurar todos`,"editor.show_preview":`Mostrar dados de exemplo`,"editor.preview_hint":`Pré-visualize o layout do card com alertas de exemplo`,"editor.preview_nudge":`Nenhum alerta ativo, ative para pré-visualizar o layout do card.`,"editor.entity_warning":`A entidade selecionada não parece conter dados de alerta meteorológico.`,"editor.no_entities_hint":`Nenhuma entidade de alerta meteorológico compatível encontrada. Uma integração provedora (por exemplo, NWS Alerts) precisa ser instalada primeiro.`,"editor.no_entities_hint_link":`Provedores compatíveis`,"editor.feeds":`Coletar automaticamente de feeds instalados`,"editor.feeds_helper":`Feeds de integração detectados. Marque um para incluir todos os incidentes ativos que ele relata, sem listar entidades por incidente. Requer que a integração esteja configurada no Home Assistant.`,"editor.source_hint":`Coletando automaticamente {count} incidente(s) ativo(s) do feed, sem listar entidades manualmente.`,"editor.feeds_missing_warning":`Sem dados ativos para {feeds}. Este feed está ativado, mas nada o está fornecendo, a integração está configurada no Home Assistant?`,"editor.devices_missing_warning":`Nenhum dispositivo encontrado para {ids}. A integração foi removida?`,"editor.no_device_alerts_hint":`Nenhum sensor de alerta ativo encontrado nos dispositivos selecionados ainda. O card será preenchido automaticamente quando a integração publicar alertas.`,"editor.section_source":`Fonte`,"editor.section_filtering":`Filtros`,"editor.section_appearance":`Aparência`,"editor.section_detail_panel":`Painel de detalhes`,"editor.section_behavior":`Comportamento`,"editor.section_dismissal":`Dispensar`,"editor.section_advanced":`Avançado`,"editor.detail_sections":`Seções`,"editor.panel_more":`+{count} mais`,"editor.option_default":`{label} (padrão)`,"editor.reset_default":`Restaurar padrão`,"editor.also_set":`Também definido: {names}`,"editor.dismiss_trigger":`Gatilho para dispensar`,"editor.dismiss_trigger_button":`Somente botão`,"editor.dismiss_trigger_swipe":`Somente deslizar`,"editor.dismiss_trigger_both":`Botão e deslizar`,"editor.dismiss_button_style":`Estilo do botão`,"editor.dismiss_button_style_icon":`Somente ícone`,"editor.dismiss_button_style_labeled":`Ícone e texto`}};function Dn(e){var t,n,r,i;let a=e.toLowerCase(),o=(t=a.split(`-`)[0])==null?a:t,s=(n=(r=B[e])==null?B[a]:r)==null?B[o]:n;if(s)return s;let c=Object.keys(B).find(e=>e.toLowerCase().split(`-`)[0]===o);return(i=c?B[c]:void 0)==null?En:i}function V(e,t,n){var r,i;let a=(r=(i=Dn(t)[e])==null?En[e]:i)==null?e:r;if(n)for(let[e,t]of Object.entries(n))a=a.split(`{${e}}`).join(String(t));return a}const On={"tsunami warning":{hex:`#FD6347`,rgb:`253, 99, 71`,crLight:2.978,crDark:5.714},"tornado warning":{hex:`#FF0000`,rgb:`255, 0, 0`,crLight:3.998,crDark:4.255},"extreme wind warning":{hex:`#FF8C00`,rgb:`255, 140, 0`,crLight:2.332,crDark:7.295},"severe thunderstorm warning":{hex:`#FFA500`,rgb:`255, 165, 0`,crLight:1.975,crDark:8.616},"flash flood warning":{hex:`#8B0000`,rgb:`139, 0, 0`,crLight:10.011,crDark:1.7},"flash flood statement":{hex:`#8B0000`,rgb:`139, 0, 0`,crLight:10.011,crDark:1.7},"severe weather statement":{hex:`#00FFFF`,rgb:`0, 255, 255`,crLight:1.254,crDark:13.57},"shelter in place warning":{hex:`#FA8072`,rgb:`250, 128, 114`,crLight:2.501,crDark:6.802},"evacuation immediate":{hex:`#7FFF00`,rgb:`127, 255, 0`,crLight:1.296,crDark:13.131},"civil danger warning":{hex:`#FFB6C1`,rgb:`255, 182, 193`,crLight:1.652,crDark:10.301},"nuclear power plant warning":{hex:`#4B0082`,rgb:`75, 0, 130`,crLight:12.951,crDark:1.314},"radiological hazard warning":{hex:`#4B0082`,rgb:`75, 0, 130`,crLight:12.951,crDark:1.314},"hazardous materials warning":{hex:`#4B0082`,rgb:`75, 0, 130`,crLight:12.951,crDark:1.314},"fire warning":{hex:`#A0522D`,rgb:`160, 82, 45`,crLight:5.616,crDark:3.03},"civil emergency message":{hex:`#FFB6C1`,rgb:`255, 182, 193`,crLight:1.652,crDark:10.301},"law enforcement warning":{hex:`#C0C0C0`,rgb:`192, 192, 192`,crLight:1.819,crDark:9.352},"storm surge warning":{hex:`#B524F7`,rgb:`181, 36, 247`,crLight:4.605,crDark:3.695},"hurricane force wind warning":{hex:`#CD5C5C`,rgb:`205, 92, 92`,crLight:3.976,crDark:4.279},"hurricane warning":{hex:`#DC143C`,rgb:`220, 20, 60`,crLight:4.99,crDark:3.41},"typhoon warning":{hex:`#DC143C`,rgb:`220, 20, 60`,crLight:4.99,crDark:3.41},"special marine warning":{hex:`#FFA500`,rgb:`255, 165, 0`,crLight:1.975,crDark:8.616},"blizzard warning":{hex:`#FF4500`,rgb:`255, 69, 0`,crLight:3.441,crDark:4.945},"snow squall warning":{hex:`#C71585`,rgb:`199, 21, 133`,crLight:5.42,crDark:3.139},"ice storm warning":{hex:`#8B008B`,rgb:`139, 0, 139`,crLight:8.5,crDark:2.002},"heavy freezing spray warning":{hex:`#00BFFF`,rgb:`0, 191, 255`,crLight:2.122,crDark:8.018},"winter storm warning":{hex:`#FF69B4`,rgb:`255, 105, 180`,crLight:2.648,crDark:6.426},"lake effect snow warning":{hex:`#008B8B`,rgb:`0, 139, 139`,crLight:4.145,crDark:4.104},"dust storm warning":{hex:`#FFE4C4`,rgb:`255, 228, 196`,crLight:1.225,crDark:13.893},"blowing dust warning":{hex:`#FFE4C4`,rgb:`255, 228, 196`,crLight:1.225,crDark:13.893},"high wind warning":{hex:`#DAA520`,rgb:`218, 165, 32`,crLight:2.238,crDark:7.603},"tropical storm warning":{hex:`#B22222`,rgb:`178, 34, 34`,crLight:6.677,crDark:2.548},"storm warning":{hex:`#9400D3`,rgb:`148, 0, 211`,crLight:6.563,crDark:2.593},"tsunami advisory":{hex:`#D2691E`,rgb:`210, 105, 30`,crLight:3.633,crDark:4.683},"tsunami watch":{hex:`#FF00FF`,rgb:`255, 0, 255`,crLight:3.136,crDark:5.425},"avalanche warning":{hex:`#1E90FF`,rgb:`30, 144, 255`,crLight:3.236,crDark:5.257},"earthquake warning":{hex:`#8B4513`,rgb:`139, 69, 19`,crLight:7.098,crDark:2.397},"volcano warning":{hex:`#2F4F4F`,rgb:`47, 79, 79`,crLight:8.928,crDark:1.906},"ashfall warning":{hex:`#A9A9A9`,rgb:`169, 169, 169`,crLight:2.35,crDark:7.239},"flood warning":{hex:`#00FF00`,rgb:`0, 255, 0`,crLight:1.372,crDark:12.4},"coastal flood warning":{hex:`#228B22`,rgb:`34, 139, 34`,crLight:4.389,crDark:3.876},"lakeshore flood warning":{hex:`#228B22`,rgb:`34, 139, 34`,crLight:4.389,crDark:3.876},"ashfall advisory":{hex:`#696969`,rgb:`105, 105, 105`,crLight:5.49,crDark:3.099},"high surf warning":{hex:`#228B22`,rgb:`34, 139, 34`,crLight:4.389,crDark:3.876},"extreme heat warning":{hex:`#C71585`,rgb:`199, 21, 133`,crLight:5.42,crDark:3.139},"tornado watch":{hex:`#FFFF00`,rgb:`255, 255, 0`,crLight:1.074,crDark:15.845},"severe thunderstorm watch":{hex:`#DB7093`,rgb:`219, 112, 147`,crLight:3.111,crDark:5.47},"flash flood watch":{hex:`#2E8B57`,rgb:`46, 139, 87`,crLight:4.245,crDark:4.008},"gale warning":{hex:`#DDA0DD`,rgb:`221, 160, 221`,crLight:2.07,crDark:8.221},"flood statement":{hex:`#00FF00`,rgb:`0, 255, 0`,crLight:1.372,crDark:12.4},"extreme cold warning":{hex:`#0000FF`,rgb:`0, 0, 255`,crLight:8.592,crDark:1.98},"freeze warning":{hex:`#483D8B`,rgb:`72, 61, 139`,crLight:9.068,crDark:1.876},"red flag warning":{hex:`#FF1493`,rgb:`255, 20, 147`,crLight:3.637,crDark:4.678},"storm surge watch":{hex:`#DB7FF7`,rgb:`219, 127, 247`,crLight:2.503,crDark:6.798},"hurricane watch":{hex:`#FF00FF`,rgb:`255, 0, 255`,crLight:3.136,crDark:5.425},"hurricane force wind watch":{hex:`#9932CC`,rgb:`153, 50, 204`,crLight:5.702,crDark:2.984},"typhoon watch":{hex:`#FF00FF`,rgb:`255, 0, 255`,crLight:3.136,crDark:5.425},"tropical storm watch":{hex:`#F08080`,rgb:`240, 128, 128`,crLight:2.591,crDark:6.566},"storm watch":{hex:`#FFE4B5`,rgb:`255, 228, 181`,crLight:1.234,crDark:13.787},"tropical cyclone local statement":{hex:`#FFE4B5`,rgb:`255, 228, 181`,crLight:1.234,crDark:13.787},"winter weather advisory":{hex:`#7B68EE`,rgb:`123, 104, 238`,crLight:4.153,crDark:4.097},"avalanche advisory":{hex:`#CD853F`,rgb:`205, 133, 63`,crLight:2.99,crDark:5.69},"cold weather advisory":{hex:`#AFEEEE`,rgb:`175, 238, 238`,crLight:1.289,crDark:13.196},"heat advisory":{hex:`#FF7F50`,rgb:`255, 127, 80`,crLight:2.499,crDark:6.809},"flood advisory":{hex:`#00FF7F`,rgb:`0, 255, 127`,crLight:1.345,crDark:12.648},"coastal flood advisory":{hex:`#7CFC00`,rgb:`124, 252, 0`,crLight:1.331,crDark:12.786},"lakeshore flood advisory":{hex:`#7CFC00`,rgb:`124, 252, 0`,crLight:1.331,crDark:12.786},"high surf advisory":{hex:`#BA55D3`,rgb:`186, 85, 211`,crLight:3.942,crDark:4.317},"dense fog advisory":{hex:`#708090`,rgb:`112, 128, 144`,crLight:4.055,crDark:4.196},"dense smoke advisory":{hex:`#F0E68C`,rgb:`240, 230, 140`,crLight:1.28,crDark:13.29},"small craft advisory":{hex:`#D8BFD8`,rgb:`216, 191, 216`,crLight:1.699,crDark:10.017},"brisk wind advisory":{hex:`#D8BFD8`,rgb:`216, 191, 216`,crLight:1.699,crDark:10.017},"hazardous seas warning":{hex:`#D8BFD8`,rgb:`216, 191, 216`,crLight:1.699,crDark:10.017},"dust advisory":{hex:`#BDB76B`,rgb:`189, 183, 107`,crLight:2.069,crDark:8.223},"blowing dust advisory":{hex:`#BDB76B`,rgb:`189, 183, 107`,crLight:2.069,crDark:8.223},"lake wind advisory":{hex:`#D2B48C`,rgb:`210, 180, 140`,crLight:1.972,crDark:8.627},"wind advisory":{hex:`#D2B48C`,rgb:`210, 180, 140`,crLight:1.972,crDark:8.627},"frost advisory":{hex:`#6495ED`,rgb:`100, 149, 237`,crLight:2.973,crDark:5.723},"freezing fog advisory":{hex:`#008080`,rgb:`0, 128, 128`,crLight:4.773,crDark:3.564},"freezing spray advisory":{hex:`#00BFFF`,rgb:`0, 191, 255`,crLight:2.122,crDark:8.018},"low water advisory":{hex:`#A52A2A`,rgb:`165, 42, 42`,crLight:7.084,crDark:2.402},"local area emergency":{hex:`#C0C0C0`,rgb:`192, 192, 192`,crLight:1.819,crDark:9.352},"winter storm watch":{hex:`#4682B4`,rgb:`70, 130, 180`,crLight:4.108,crDark:4.142},"rip current statement":{hex:`#40E0D0`,rgb:`64, 224, 208`,crLight:1.642,crDark:10.364},"beach hazards statement":{hex:`#40E0D0`,rgb:`64, 224, 208`,crLight:1.642,crDark:10.364},"gale watch":{hex:`#FFC0CB`,rgb:`255, 192, 203`,crLight:1.538,crDark:11.063},"avalanche watch":{hex:`#F4A460`,rgb:`244, 164, 96`,crLight:2.034,crDark:8.366},"hazardous seas watch":{hex:`#483D8B`,rgb:`72, 61, 139`,crLight:9.068,crDark:1.876},"heavy freezing spray watch":{hex:`#BC8F8F`,rgb:`188, 143, 143`,crLight:2.814,crDark:6.047},"flood watch":{hex:`#2E8B57`,rgb:`46, 139, 87`,crLight:4.245,crDark:4.008},"coastal flood watch":{hex:`#66CDAA`,rgb:`102, 205, 170`,crLight:1.931,crDark:8.814},"lakeshore flood watch":{hex:`#66CDAA`,rgb:`102, 205, 170`,crLight:1.931,crDark:8.814},"high wind watch":{hex:`#B8860B`,rgb:`184, 134, 11`,crLight:3.254,crDark:5.228},"extreme heat watch":{hex:`#800000`,rgb:`128, 0, 0`,crLight:10.95,crDark:1.554},"extreme cold watch":{hex:`#5F9EA0`,rgb:`95, 158, 160`,crLight:3.05,crDark:5.578},"freeze watch":{hex:`#00FFFF`,rgb:`0, 255, 255`,crLight:1.254,crDark:13.57},"fire weather watch":{hex:`#FFDEAD`,rgb:`255, 222, 173`,crLight:1.288,crDark:13.21},"extreme fire danger":{hex:`#E9967A`,rgb:`233, 150, 122`,crLight:2.306,crDark:7.38},"911 telephone outage":{hex:`#C0C0C0`,rgb:`192, 192, 192`,crLight:1.819,crDark:9.352},"coastal flood statement":{hex:`#6B8E23`,rgb:`107, 142, 35`,crLight:3.805,crDark:4.471},"lakeshore flood statement":{hex:`#6B8E23`,rgb:`107, 142, 35`,crLight:3.805,crDark:4.471},"special weather statement":{hex:`#FFE4B5`,rgb:`255, 228, 181`,crLight:1.234,crDark:13.787},"marine weather statement":{hex:`#FFDAB9`,rgb:`255, 218, 185`,crLight:1.314,crDark:12.948},"air quality alert":{hex:`#808080`,rgb:`128, 128, 128`,crLight:3.949,crDark:4.308},"air stagnation advisory":{hex:`#808080`,rgb:`128, 128, 128`,crLight:3.949,crDark:4.308},"hazardous weather outlook":{hex:`#EEE8AA`,rgb:`238, 232, 170`,crLight:1.253,crDark:13.578},"hydrologic outlook":{hex:`#90EE90`,rgb:`144, 238, 144`,crLight:1.417,crDark:12.006},"short term forecast":{hex:`#98FB98`,rgb:`152, 251, 152`,crLight:1.266,crDark:13.439},"administrative message":{hex:`#C0C0C0`,rgb:`192, 192, 192`,crLight:1.819,crDark:9.352},test:{hex:`#F0FFFF`,rgb:`240, 255, 255`,crLight:1.027,crDark:16.572},"child abduction emergency":{hex:`#FFFFFF`,rgb:`255, 255, 255`,crLight:1,crDark:17.015},"blue alert":{hex:`#FFFFFF`,rgb:`255, 255, 255`,crLight:1,crDark:17.015}},kn=[`a`,`b`,`br`,`em`,`i`,`li`,`ol`,`p`,`strong`,`ul`];Tn.addHook(`afterSanitizeAttributes`,e=>{e.tagName===`A`&&(e.setAttribute(`target`,`_blank`),e.setAttribute(`rel`,`noopener noreferrer`))});function An(e){return e?Tn.sanitize(e,{ALLOWED_TAGS:kn,ALLOWED_ATTR:[`href`]}):``}const jn=[[[`tornado`],`mdi:weather-tornado`],[[`tsunami`],`mdi:tsunami`],[[`hurricane`,`tropical`,`typhoon`,`cyclone`],`mdi:weather-hurricane`],[[`thunderstorm`,`gewitter`],`mdi:weather-lightning`],[[`hail`,`hagel`],`mdi:weather-hail`],[[`flood`,`hydrologic`,`storm surge`,`hochwasser`],`mdi:home-flood`],[[`rain`,`shower`,`precipitation`,`starkregen`,`dauerregen`],`mdi:weather-pouring`],[[`snow`,`blizzard`,`winter`,`schnee`,`schneesturm`],`mdi:weather-snowy-heavy`],[[`sleet`],`mdi:weather-snowy-rainy`],[[`ice`,`freeze`,`frost`,`slippery`,`glätte`,`glatteis`],`mdi:snowflake`],[[`thaw`],`mdi:snowflake-melt`],[[`cold`,`chill`,`low temperature`,`kälte`],`mdi:thermometer-low`],[[`landslide`,`avalanche`,`lawine`],`mdi:landslide`],[[`earthquake`],`mdi:pulse`],[[`volcano`,`ashfall`,`vog`],`mdi:volcano`],[[`dust`,`sand`],`mdi:weather-dust`],[[`smoke`],`mdi:smoke`],[[`air quality`,`air stagnation`],`mdi:air-filter`],[[`fire`,`red flag`,`waldbrand`],`mdi:fire`],[[`heat`,`high temperature`,`hitze`],`mdi:weather-sunny-alert`],[[`drought`,`trockenheit`],`mdi:water-off`],[[`fog`,`nebel`],`mdi:weather-fog`],[[`sheep`,`grazier`],`mdi:weather-windy-variant`],[[`gale`,`squall`],`mdi:weather-windy`],[[`wind`,`sturm`,`orkan`,`böen`],`mdi:weather-windy`],[[`small craft`],`mdi:sail-boat`],[[`rip current`],`mdi:wave`],[[`surf`,`marine`,`coastal`,`seas`],`mdi:waves`]];function Mn(e){let t=e.toLowerCase().replace(/[-/]/g,` `);for(let[e,n]of jn)if(e.some(e=>t.includes(e)))return n;return`mdi:alert-circle-outline`}const Nn=[[[`likely`],`mdi:check-decagram`],[[`observed`],`mdi:eye-check`],[[`possible`,`unlikely`],`mdi:help-circle-outline`]];function Pn(e){let t=e.toLowerCase();for(let[e,n]of Nn)if(e.some(e=>t.includes(e)))return n;return`mdi:bullseye-arrow`}const Fn=[[[`tornado`],`#FF0000`],[[`hurricane`,`typhoon`,`tropical storm`],`#DC143C`],[[`flood`],`#228B22`],[[`blizzard`,`ice storm`],`#FF4500`],[[`snow`,`winter`],`#1E90FF`],[[`freeze`,`frost`,`ice`],`#6495ED`],[[`wind`],`#D2B48C`],[[`heat`],`#FF7F50`],[[`fire`,`red flag`],`#FF4500`],[[`fog`],`#708090`],[[`tsunami`],`#FD6347`]],In=`#ffffff`,Ln=`#1c1c1e`,Rn={subtle:{text:2,progress:1.3},strict:{text:3,progress:2}},zn=`subtle`;function Bn(e){return e==null?zn:e}function Vn(e){let t=e.replace(`#`,``),n=parseInt(t.slice(0,2),16)/255,r=parseInt(t.slice(2,4),16)/255,i=parseInt(t.slice(4,6),16)/255,a=e=>e<=.04045?e/12.92:((e+.055)/1.055)**2.4;return .2126*a(n)+.7152*a(r)+.0722*a(i)}function H(e,t){let n=Vn(e),r=Vn(t),i=Math.max(n,r),a=Math.min(n,r);return(i+.05)/(a+.05)}const Hn={boostLight:!1,boostDark:!1,progressBoostLight:!1,progressBoostDark:!1};function Un(e,t,n){if(n===`off`)return Hn;let{text:r,progress:i}=Rn[n];return{boostLight:e<r,boostDark:t<r,progressBoostLight:e<i,progressBoostDark:t<i}}function Wn(e){let t=e.replace(`#`,``);return`${parseInt(t.slice(0,2),16)}, ${parseInt(t.slice(2,4),16)}, ${parseInt(t.slice(4,6),16)}`}function Gn(e,t,n){return H(e,t)>=1.9?t:n}function Kn(e){return{light:Gn(e,In,`#1a1a1a`),dark:Gn(e,Ln,`#f5f5f5`)}}function U(e,t,n,r,i){let a=Kn(e);return{color:e,rgb:t,textColorLight:a.light,textColorDark:a.dark,...Un(n,r,i)}}function qn(e,t=zn){let n=e.toLowerCase(),r=On[n];if(r)return U(r.hex,r.rgb,r.crLight,r.crDark,t);for(let[e,r]of Fn)if(e.some(e=>n.includes(e)))return U(r,Wn(r),H(r,In),H(r,Ln),t)}const Jn={extreme:`#D8001E`,severe:`#FF9900`,moderate:`#FFC800`,minor:`#88C840`},Yn={red:Jn.extreme,orange:Jn.severe,yellow:Jn.moderate,green:Jn.minor};function Xn(e){var t;if(typeof e!=`string`)return;let n=e.split(`;`);if(!(n.length<2))return Yn[((t=n[1])==null?``:t).trim().toLowerCase()]}function Zn(e,t=zn){var n;let r=(n=Jn[e])==null?`#808080`:n;return U(r,Wn(r),H(r,In),H(r,Ln),t)}const Qn={red:`#D10000`,orange:`#FF9500`,yellow:`#FFFF00`,grey:`#656565`},$n={extreme:Qn.red,severe:Qn.orange,moderate:Qn.yellow,minor:Qn.grey,unknown:Qn.grey};function er(e){var t;return(t=$n[e])==null?Qn.grey:t}function tr(e,t=zn){let n=er(e);return U(n,Wn(n),H(n,In),H(n,Ln),t)}const nr=/^#[0-9a-f]{6}$/;function rr(e,t=zn){var n;let r=(n=e.colorHint)==null?void 0:n.trim().toLowerCase();if(r&&nr.test(r))return U(r,Wn(r),H(r,In),H(r,Ln),t)}function ir(e){var t;return(t=e.providerColors)==null?e.colorTheme===`eccc`:t}function ar(e){return e.providerColors!==void 0||e.colorTheme!==`eccc`?e:{...e,providerColors:!0}}function or(e){return e.startsWith(`http://`)||e.startsWith(`https://`)?e:``}function W(e){if(!e||e===`None`||e.trim()===``)return 0;let t=new Date(e.trim());return isNaN(t.getTime())?0:t.getTime()/1e3}function sr(e,t,n,r){let i=e=>e*Math.PI/180,a=i(r-t),o=i(n-e),s=Math.sin(a/2)**2+Math.cos(i(t))*Math.cos(i(r))*Math.sin(o/2)**2;return 12742*Math.asin(Math.min(1,Math.sqrt(s)))}function cr(e,t){if(typeof e==`number`&&typeof t==`number`&&Number.isFinite(e)&&Number.isFinite(t)&&!(Math.abs(e)>90||Math.abs(t)>180))return[t,e]}function lr(e,t){var n,r;if(e){if(t){var i;let n=(i=e.states)==null||(i=i[t])==null?void 0:i.attributes,r=cr(n==null?void 0:n.latitude,n==null?void 0:n.longitude);if(r)return r}return cr((n=e.config)==null?void 0:n.latitude,(r=e.config)==null?void 0:r.longitude)}}const ur=1.609344;function dr(e,t){return t===`mi`?Math.round(e/ur*100)/100:e}function fr(e,t){return t===`mi`?Math.round(e*ur*1e3)/1e3:e}function pr(e){return e===`mi`?`mi`:`km`}function mr(e,t,n){let r=dr(e,t),i=+(r<10),a;try{a=br(n,{minimumFractionDigits:0,maximumFractionDigits:i}).format(r)}catch{a=r.toFixed(i)}return`${a} ${t}`}function hr(e,t=Date.now()/1e3){let n=e.sentTs,r=n>0?n:t,i=e.onsetTs;i===0&&(i=r);let a=i+3600,o=e.endsTs;o===0&&(o=a);let s=e.endsTs>0,c=t>=i,l=s&&t>=o,u,d,f,p;l?(u=i,d=o,f=o,p=`Expired`):c?(u=i,d=o,f=t,p=`Active`):(u=t,d=o,f=i,p=`Preparation`);let m=d-u,h=m>0?m:1,g=(f-u)/h*100,_=Math.max(0,Math.min(100,Math.round(g*10)/10)),v=Math.round((o-t)/3600*10)/10,y=Math.round((i-t)/3600*10)/10,b=Math.round((i-t)/60);return{isActive:c,isExpired:l,phaseText:p,progressPct:_,remainingHours:v,onsetHours:y,onsetMinutes:b,onsetTs:i,endsTs:o,sentTs:n,nowTs:t,hasEndTime:s}}const gr=/* @__PURE__ */ new Map,_r=/* @__PURE__ */ new Map;function vr(e,t,n,r){let i=`${t==null?``:t}\u0000${JSON.stringify(n)}`,a=e.get(i);return a===void 0&&(a=r(),e.size>=128&&e.clear(),e.set(i,a)),a}function yr(e,t){return vr(gr,e,t,()=>new Intl.DateTimeFormat(e,t))}function br(e,t){return vr(_r,e,t,()=>new Intl.NumberFormat(e,t))}function xr(e){if(!e)return{locale:void 0};let t=e.language;return e.time_format===`12`?{locale:t,hour12:!0}:e.time_format===`24`?{locale:t,hour12:!1}:{locale:t}}function Sr(e,t,n){let r=yr(`en-CA`,{year:`numeric`,month:`2-digit`,day:`2-digit`,timeZone:n});return r.format(e)===r.format(t)}function Cr(e,t){var n,r;return t!=null&&t.timeZone?(n=(r=yr(t.language,{timeZoneName:`short`,timeZone:t.timeZone}).formatToParts(e).find(e=>e.type===`timeZoneName`))==null?void 0:r.value)==null?``:n:``}function wr(e,t){var n,r,i,a,o,s;let c=t==null?void 0:t.language,l=t==null?void 0:t.date_format,u=t==null?void 0:t.timeZone;if(!l||l===`language`)return yr(c,{timeZone:u}).format(e);let d=yr(c,{day:`numeric`,month:`numeric`,year:`numeric`,timeZone:u}).formatToParts(e),f=(n=(r=d.find(e=>e.type===`day`))==null?void 0:r.value)==null?``:n,p=(i=(a=d.find(e=>e.type===`month`))==null?void 0:a.value)==null?``:i,m=(o=(s=d.find(e=>e.type===`year`))==null?void 0:s.value)==null?``:o;switch(l){case`DMY`:return`${f}/${p}/${m}`;case`MDY`:return`${p}/${f}/${m}`;case`YMD`:return`${m}/${p}/${f}`;default:return yr(c,{timeZone:u}).format(e)}}function Tr(e,t,n){let r=xr(t),i={hour:n,minute:`2-digit`,timeZone:t==null?void 0:t.timeZone};return r.hour12!==void 0&&(i.hour12=r.hour12),yr(r.locale,i).format(e)}function Er(e,t,n=`en`,r){if(e<=0)return V(`progress.na`,n);let i=/* @__PURE__ */ new Date(e*1e3),a=r===void 0?/* @__PURE__ */ new Date:/* @__PURE__ */ new Date(r*1e3),o=Cr(i,t),s=Tr(i,t,`2-digit`),c=o?`${s} ${o}`:s;return Sr(i,a,t==null?void 0:t.timeZone)?c:`${c} (${wr(i,t)})`}function Dr(e,t,n=`en`){if(e<=100)return V(`progress.na`,n);let r=/* @__PURE__ */ new Date(e*1e3),i=Cr(r,t),a=Tr(r,t,`numeric`),o=i?`${a} ${i}`:a;return`${wr(r,t)}, ${o}`}function Or(e,t=Date.now()/1e3,n=`en`){let r=e-t,i=Math.abs(r),a=r<0;if(i<60)return V(a?`time.just_now`:`time.in_less_than_1m`,n);if(i<3600){let e=Math.floor(i/60);return V(a?`time.minutes_ago`:`time.in_minutes`,n,{m:e})}if(i<86400){let e=Math.floor(i/3600),t=Math.floor(i%3600/60),r=t>0?`${e}h ${t}m`:`${e}h`;return V(a?`time.hours_ago`:`time.in_hours`,n,{dur:r})}let o=Math.floor(i/86400);return V(a?`time.days_ago`:`time.in_days`,n,{d:o})}function kr(e,t=Date.now()/1e3){let n=Math.abs(e-t);if(n<60)return`<1m`;if(n<3600)return`${Math.floor(n/60)}m`;if(n<86400){let e=Math.floor(n/3600),t=Math.floor(n%3600/60);return t>0?`${e}h ${t}m`:`${e}h`}let r=Math.floor(n/86400),i=Math.floor(n%86400/3600);return i>0?`${r}d ${i}h`:`${r}d`}function Ar(e,t=!0){let n=(e.headline||``).trim();if(!n)return``;if(!t)return n;let r=n.toLowerCase().replace(/[.\s]+$/,``),i=e.event.toLowerCase();return r.startsWith(i)||i.startsWith(r)?``:n}function jr(e){if(!e)return``;let t=/^\s*[·•-]\s/,n=/^\.[A-Z]/;return e.split(/\n{2,}/).map(e=>{let r=e.split(`
`),i=[];for(let e of r){var a,o;i.length===0?i.push(e.trimStart()):t.test(e)||n.test(e.trimStart())||(a=(o=i[i.length-1])==null?void 0:o.trimEnd().endsWith(`:`))!=null&&a?i.push(e):i[i.length-1]+=` `+e.trimStart()}return i.map(e=>e.replace(/ {2,}/g,` `)).map(e=>e.trimEnd()).filter(Boolean).join(`
`)}).filter(Boolean).join(`

`)}function Mr(e){var t;let n=e.trim(),r=n.includes(`;`)?/;\s*/:/,\s*/,i=n.split(r).map(e=>e.trim()).filter(Boolean);return i.length<=4?{first:n,more:0}:{first:(t=i[0])==null?n:t,more:i.length-1}}function Nr(e){let t=(e||``).toLowerCase().replace(/\s/g,``);return[`extreme`,`severe`,`moderate`,`minor`].includes(t)?t:`unknown`}const Pr={extreme:0,severe:1,moderate:2,minor:3,unknown:4},Fr=(e,t)=>{var n,r;let i=((n=Pr[e.severity])==null?4:n)-((r=Pr[t.severity])==null?4:r);return i===0?(e.onsetTs||1/0)-(t.onsetTs||1/0):i};function Ir(e,t,n){if(t===`onset`)return[...e].sort((e,t)=>(e.onsetTs||1/0)-(t.onsetTs||1/0));if(t===`severity`)return[...e].sort(Fr);if(t===`distance`&&n){let t=new Map(e.map(e=>[e,e.point?sr(e.point[0],e.point[1],n[0],n[1]):-1]));return[...e].sort((e,n)=>{var r,i;let a=((r=t.get(e))==null?-1:r)-((i=t.get(n))==null?-1:i);return a===0?Fr(e,n):a})}return e}function Lr(e,t){return e.zones.some(e=>t.has(e.toUpperCase()))}function Rr(e,t,n){let r=e;if(n&&n.size>0){let t=/* @__PURE__ */ new Set;r=e.filter(e=>{if(!e.id||!n.has(e.provider))return!0;let r=`${e.provider}\0${e.id}`;return!t.has(r)&&(t.add(r),!0)})}let i=/* @__PURE__ */ new Map,a=[];for(let e of r){let t=`${e.event}\0${e.severity}\0${e.onsetTs}\0${e.endsTs}\0${e.provider}`,n=i.get(t);n?n.push(e):(i.set(t,[e]),a.push(t))}let o=a.map(e=>{let t=i.get(e),n=`merged:${e}`;if(t.length===1)return{...t[0],dismissAliases:[n]};let r={...t.reduce((e,t)=>t.sentTs>e.sentTs||t.sentTs===e.sentTs&&t.id<e.id?t:e)},a=/* @__PURE__ */ new Set,o=/* @__PURE__ */ new Set;for(let e of t){for(let t of e.zones)a.add(t.toUpperCase());e.areaDesc&&o.add(e.areaDesc)}return r.zones=[...a],r.areaDesc=[...o].join(`; `),r.mergedCount=t.length,r.id=n,r.dismissAliases=t.map(e=>e.id),r});if(t&&t.length>1){let e=/* @__PURE__ */ new Map;for(let[n,r]of t.entries())e.has(r)||e.set(r,n);let n=/* @__PURE__ */ new Map;for(let t of o){var s,c;if(t.endsTs===0)continue;let r=`${t.event}\0${t.endsTs}`,i=n.get(r);(!i||((s=e.get(t.provider))==null?1/0:s)<((c=e.get(i))==null?1/0:c))&&n.set(r,t.provider)}o=o.filter(e=>{if(e.endsTs===0)return!0;let t=`${e.event}\0${e.endsTs}`;return e.provider===n.get(t)})}return o}function zr(e,t,n){let r;if(t&&t!==`auto`)r=et[t]*3600;else{let t=0;for(let r of e)r.endsTs>0&&(t=Math.max(t,r.endsTs)),r.onsetTs>n&&(t=Math.max(t,r.onsetTs));r=Math.min(604800,Math.max(21600,(t-n)*1.04))}let i=r*.125;return{startTs:n-i,endTs:n+r,nowTs:n,nowPct:i/(i+r)*100}}function Br(e,t){let{startTs:n,endTs:r}=t,i=r-n||1,a=e=>Math.max(0,Math.min(100,(e-n)/i*100)),o=e.onsetTs,s=!e.hasEndTime,c=s?1/0:e.endsTs;if(c<=n)return{startPct:0,endPct:0,clipStart:!0,clipEnd:!1,openEnd:s,fadeFromPct:null,offAxis:`start`};if(o>=r)return{startPct:100,endPct:100,clipStart:!1,clipEnd:!s,openEnd:s,fadeFromPct:null,offAxis:`end`};let l=a(o),u=s?100:a(c);return{startPct:l,endPct:u,clipStart:o<n,clipEnd:!s&&c>r,openEnd:s,fadeFromPct:s?(a(Math.max(o,t.nowTs))-l)/(u-l||1)*100:null,offAxis:null}}const Vr=[900,1800,3600,7200,10800,21600,43200,86400,172800,259200];function Hr(e,t){let n=/* @__PURE__ */ new Date(e*1e3);if(t)try{let r=yr(`en-US`,{timeZone:t,hourCycle:`h23`,year:`numeric`,month:`numeric`,day:`numeric`,hour:`numeric`,minute:`numeric`,second:`numeric`}).formatToParts(n),i=e=>{var t,n;return Number((t=(n=r.find(t=>t.type===e))==null?void 0:n.value)==null?NaN:t)},a=Date.UTC(i(`year`),i(`month`)-1,i(`day`),i(`hour`)%24,i(`minute`),i(`second`))/1e3;if(!isNaN(a))return a-Math.floor(e)}catch{}return-n.getTimezoneOffset()*60}function Ur(e,t,n=8){var r;let{startTs:i,endTs:a}=e,o=a-i;if(o<=0)return[];let s=Math.max(2,Math.min(8,n)),c=(r=Vr.find(e=>o/e<=s))==null?Vr[Vr.length-1]:r,l=Math.min(c,86400),u=[],d=Hr(i,t),f=Math.ceil((i+d)/l)*l;for(let e=0;e<=16;e++,f+=l){let e=f-Hr(f-d,t);if(!(e<i)){if(e>a)break;u.push({ts:e,pct:(e-i)/o*100,dayBoundary:f%86400==0,minutes:c<3600,minor:f%c!==0})}}return u}function Wr(e,t){return Tr(/* @__PURE__ */ new Date(e*1e3),t,`numeric`)}function Gr(e,t){let n=/* @__PURE__ */ new Date(e.ts*1e3);if(e.dayBoundary){let e=yr(t==null?void 0:t.language,{weekday:`short`,day:`numeric`,timeZone:t==null?void 0:t.timeZone}).formatToParts(n),s=t==null?void 0:t.date_format;if(s&&s!==`language`){var r,i,a,o;let t=(r=(i=e.find(e=>e.type===`weekday`))==null?void 0:i.value)==null?``:r,n=(a=(o=e.find(e=>e.type===`day`))==null?void 0:o.value)==null?``:a;return s===`DMY`?`${n} ${t}`:`${t} ${n}`}return e.map(e=>e.value).join(``)}if(!e.minutes){let e=xr(t),r={hour:`numeric`,timeZone:t==null?void 0:t.timeZone};e.hour12!==void 0&&(r.hour12=e.hour12);let i=yr(e.locale,r).formatToParts(n);if(i.some(e=>e.type===`dayPeriod`))return i.map(e=>e.value).join(``).replace(/\s+/g,` `).trim()}return Tr(n,t,e.minutes?`numeric`:`2-digit`)}const Kr=6e4;function qr(e,t){let n=Hr(e,t),r=Math.floor((e+n)/86400)*86400+86400;return r-Hr(r-n,t)}function Jr(e,t,n={}){var r;if(e.length===0)return Kr;let i=t+Kr/1e3,a=e=>{e>=t&&e<i&&(i=e)},o=e=>{let n=e-t,r=Math.abs(n)<86400?60:3600,i=Math.abs(n)%r;a(t+(n>0?i:r-i))},s=(r=n.barPx)==null?0:r,c=!!n.timeline;for(let n of e){let e=hr(n,t);if(a(e.onsetTs),o(e.onsetTs),e.hasEndTime&&(a(e.endsTs),o(e.endsTs)),e.isActive||(c=!0),s>0&&e.hasEndTime&&!e.isExpired){let n=Math.max(1/s,.001),r=Math.max(e.endsTs-e.onsetTs,1);a(t+(e.isActive?n*r:n*(e.endsTs-t)**2/r))}}if(c&&a(Math.floor(t/60)*60+60),a(qr(t,n.timeZone)),n.timeline){let e=n.timeline.lanePx>0?n.timeline.lanePx:400;a(t+n.timeline.spanS/e)}let l=(Math.ceil(i)-t+.05)*1e3;return Math.min(Kr,Math.max(1e3,l))}function Yr(e){var t;let n=e.split(`/`);return((t=n[n.length-1])==null?``:t).toUpperCase()}function Xr(e){var t;let n=[];if(Array.isArray(e.AffectedZones))for(let t of e.AffectedZones)typeof t==`string`&&t&&n.push(Yr(t));if(Array.isArray((t=e.Geocode)==null?void 0:t.UGC))for(let t of e.Geocode.UGC){if(typeof t!=`string`||!t)continue;let e=t.toUpperCase();n.includes(e)||n.push(e)}return n}var Zr=class{constructor(){this.provider=`nws`,this.stableIds=!0}canHandle(e){let t=e.Alerts;if(!Array.isArray(t))return!1;if(t.length===0)return!0;let n=t[0];return typeof n==`object`&&!!n&&`Event`in n&&`Severity`in n}parseAlerts(e){let t=e.Alerts;return Array.isArray(t)?t.filter(e=>typeof e==`object`&&!!e).map(e=>this._normalize(e)):[]}_normalize(e){let t=Nr(e.Severity);return{id:e.ID,event:e.Event||`Unknown`,severity:t,severityLabel:e.Severity&&Nr(e.Severity)!==`unknown`?e.Severity:t.charAt(0).toUpperCase()+t.slice(1),certainty:e.Certainty||``,urgency:e.Urgency||``,sentTs:W(e.Sent),onsetTs:W(e.Onset),endsTs:W(e.Ends)||W(e.Expires),description:e.Description||``,instruction:e.Instruction||``,url:e.URL||``,headline:e.Headline||``,areaDesc:e.AreaDesc||e.AreasAffected||``,zones:Xr(e),eventCode:e.NWSCode||``,provider:`nws`,phase:``,severityInferred:!e.Severity||Nr(e.Severity)===`unknown`,certaintyInferred:!1}}};function Qr(e,t,n){let r=e.toLowerCase();if(r.includes(`extreme`)||r.includes(`tropical cyclone`))return{severity:`extreme`,label:(r.includes(`extreme`),`Extreme`)};if(r.includes(`severe`))return{severity:`severe`,label:`Severe`};if(r.includes(`major`))return{severity:`severe`,label:`Major`};if(r.includes(`moderate`))return{severity:`moderate`,label:`Moderate`};if(r.includes(`minor`)||r.includes(`initial`))return{severity:`minor`,label:`Minor`};let i=t.toLowerCase();if(i.includes(`tropical_cyclone`))return{severity:`extreme`,label:`Extreme`};if(i.includes(`severe`)||i.includes(`fire_weather`))return{severity:`severe`,label:`Severe`};let a=n.charAt(0).toUpperCase()+n.slice(1);return n===`major`?{severity:`moderate`,label:a}:{severity:`minor`,label:a}}function $r(e){return e.title||e.short_title||e.type.replace(/_/g,` `)}function ei(e){if(e.area_id&&e.id.startsWith(e.area_id+`_`)){let t=e.id.slice(e.area_id.length+1);return`https://www.bom.gov.au/warning/${e.type.replace(/_/g,`-`)}/${t}`}return`https://www.bom.gov.au/weather-and-climate/warnings-and-alerts`}function ti(e){if(typeof e!=`object`||!e)return null;let t=e,n=e=>typeof t[e]==`string`?t[e]:``,r=n(`id`);if(!r)return null;let i=n(`area_id`);return{id:r,...i?{area_id:i}:{},type:n(`type`),title:n(`title`),short_title:n(`short_title`),state:n(`state`),warning_group_type:n(`warning_group_type`),issue_time:n(`issue_time`),expiry_time:n(`expiry_time`),phase:n(`phase`)}}const ni={new:`New`,update:`Updated`,renewal:`Renewed`,upgrade:`Upgraded`,downgrade:`Downgraded`,final:`Final`};function ri(e){return ni[e.toLowerCase()]||``}var ii=class{constructor(){this.provider=`bom`,this.stableIds=!0}canHandle(e){let t=e.warnings;if(!Array.isArray(t))return!1;if(t.length===0)return typeof e.attribution==`string`&&e.attribution.toLowerCase().includes(`bureau of meteorology`);let n=t[0];return typeof n==`object`&&!!n&&`warning_group_type`in n&&`issue_time`in n}parseAlerts(e){let t=e.warnings;return Array.isArray(t)?t.map(ti).filter(e=>e!==null).filter(e=>e.phase!==`cancelled`).map(e=>this._normalize(e)):[]}_normalize(e){let t=W(e.issue_time),n=W(e.expiry_time),r=$r(e),{severity:i,label:a}=Qr(r,e.type,e.warning_group_type);return{id:e.id,event:r,severity:i,severityLabel:a,certainty:``,urgency:``,sentTs:t,onsetTs:t,endsTs:n,description:``,instruction:``,url:ei(e),headline:e.short_title||r,areaDesc:e.state||``,zones:e.area_id?[e.area_id.toUpperCase()]:[],eventCode:``,provider:`bom`,phase:ri(e.phase),severityInferred:!0,certaintyInferred:!1}}};const ai={"#880e4f":{severity:`extreme`,label:`Extreme`},"#ff0000":{severity:`severe`,label:`Severe`},"#ff9900":{severity:`moderate`,label:`Moderate`},"#ffff00":{severity:`minor`,label:`Minor`}};function oi(e,t){if(typeof e==`number`)switch(e){case 4:return{severity:`extreme`,label:`Extreme`};case 3:return{severity:`severe`,label:`Severe`};case 2:return{severity:`moderate`,label:`Moderate`};case 1:return{severity:`minor`,label:`Minor`};case 0:return{severity:`unknown`,label:`Unknown`}}if(typeof t==`string`){let e=ai[t.toLowerCase()];if(e)return e}return{severity:`unknown`,label:`Unknown`}}function si(e){return typeof e==`object`&&!!e&&typeof e.level==`number`&&typeof e.color==`string`}var ci=class{constructor(){this.provider=`dwd`}canHandle(e){return typeof e.warning_count!=`number`||typeof e.region_name!=`string`?!1:e.warning_count>0?si(e.warning_1):!0}parseAlerts(e){let t=typeof e.warning_count==`number`?e.warning_count:0;if(t<=0)return[];let n=typeof e.region_name==`string`?e.region_name:``,r=[];for(let i=1;i<=t;i++){let t=e[`warning_${i}`];if(!t||typeof t!=`object`)continue;let a=t,o=typeof a.level==`number`?a.level:void 0;if(o===0)continue;let{severity:s,label:c}=oi(o,a.color),l=W(a.start_time),u=W(a.end_time),d=typeof a.event_code==`number`?String(a.event_code):``,f=typeof a.event==`string`?a.event:``;r.push({id:`dwd_${d||f}_${l}`,event:f,severity:s,severityLabel:c,certainty:``,urgency:``,sentTs:0,onsetTs:l,endsTs:u,description:typeof a.description==`string`?a.description:``,instruction:typeof a.instruction==`string`?a.instruction:``,url:`https://www.dwd.de/DE/wetter/warnungen_gemeinden/warnWetter_node.html`,headline:typeof a.headline==`string`?a.headline:``,areaDesc:n,zones:[],eventCode:d,provider:`dwd`,phase:``,severityInferred:!1,certaintyInferred:!1})}return r}};function li(e){switch(e){case 5:return{severity:`extreme`,label:`Extreme`};case 4:return{severity:`extreme`,label:`Extreme`};case 3:return{severity:`severe`,label:`Severe`};case 2:return{severity:`moderate`,label:`Moderate`};case 1:return{severity:`minor`,label:`Minor`};case 0:return{severity:`unknown`,label:`Unknown`};default:return{severity:`unknown`,label:`Unknown`}}}var ui=class{constructor(){this.provider=`meteoswiss`}canHandle(e){return Array.isArray(e.warning_types)&&Array.isArray(e.warning_levels_numeric)&&Array.isArray(e.warning_valid_from)}parseAlerts(e){let t=t=>Array.isArray(e[t])?e[t]:[],n=t(`warning_types`),r=t(`warning_levels`),i=t(`warning_levels_numeric`),a=t(`warning_valid_from`),o=t(`warning_valid_to`),s=t(`warning_texts`),c=t(`warning_links`),l=e=>n.length>0&&c.length>0&&c.length%n.length===0?String(c[e*(c.length/n.length)]):c.length>0?String(c[0]):`https://www.meteoswiss.admin.ch/services-and-publications/applications/hazards.html#tab=severe-weather-map&weather-tab=all`,u=e=>typeof e==`string`?e:typeof e==`number`||typeof e==`boolean`?String(e):``,d=[];for(let e=0;e<n.length;e++){let t=Number(i[e]);if(t===0)continue;let c=u(n[e]),{severity:f,label:p}=li(t),m=u(r[e])||p,h=a[e]==null?0:W(String(a[e])),g=o[e]==null?0:W(String(o[e]));d.push({id:`meteoswiss_${c}_${h}`,event:c,severity:f,severityLabel:m,certainty:``,urgency:``,sentTs:0,onsetTs:h,endsTs:g,description:u(s[e]),instruction:``,url:l(e),headline:``,areaDesc:``,zones:[],eventCode:c,provider:`meteoswiss`,phase:``,severityInferred:!1,certaintyInferred:!1,iconHint:c})}return d}};function di(e){var t;if(!e||typeof e!=`string`)return;let n=parseInt(((t=e.split(`;`)[0])==null?``:t).trim(),10);if(n>=4)return`extreme`;if(n===3)return`severe`;if(n===2)return`moderate`;if(n===1)return`minor`}function fi(e){var t,n;return!e||typeof e!=`string`||(t=(n=e.split(`;`)[2])==null?void 0:n.trim())==null?``:t}function pi(e){if(!e||typeof e!=`string`)return``;let t=e.split(`;`);return t.length>1?t.slice(1).join(`;`).trim():``}var mi=class{constructor(){this.provider=`meteoalarm`}canHandle(e){return typeof e.attribution==`string`&&e.attribution.toLowerCase().includes(`meteoalarm`)?!0:typeof e.awareness_level==`string`&&typeof e.awareness_type==`string`}parseAlerts(e){let t=G(e.event),n=G(e.headline);if(!t&&!n)return[];let r=G(e.awareness_level),i=di(r)||Nr(G(e.severity)),a=fi(r)||G(e.severity)||i.charAt(0).toUpperCase()+i.slice(1),o=W(G(e.onset)||G(e.effective)),s=W(G(e.expires)),c=W(G(e.effective)),l=pi(G(e.awareness_type)),u=t||l||n,d=!di(r)&&!G(e.severity),f=Xn(r);return[{id:`meteoalarm_${u}_${o}`,event:u,severity:i,severityLabel:a,certainty:G(e.certainty),urgency:G(e.urgency),sentTs:c,onsetTs:o||c,endsTs:s,description:G(e.description),instruction:G(e.instruction),url:``,headline:n||u,areaDesc:G(e.senderName),zones:[],eventCode:``,provider:`meteoalarm`,iconHint:l,phase:``,severityInferred:d,certaintyInferred:!1,...f!==void 0&&{colorHint:f}}]}};function G(e){return typeof e==`string`?e:``}var hi=class{constructor(){this.provider=`pirateweather`}canHandle(e){return typeof e.attribution==`string`&&e.attribution.toLowerCase().includes(`pirate weather`)}parseAlerts(e){let t=[],n=typeof e.title==`string`&&e.title!==``,r=typeof e.title_0==`string`&&e.title_0!==``;if(n&&!r){let n=this._parseOne(e,``);n&&t.push(n)}for(let n=0;;n++){let r=`_${n}`;if(typeof e[`title${r}`]!=`string`||e[`title${r}`]===``)break;let i=this._parseOne(e,r);i&&t.push(i)}return t}_parseOne(e,t){let n=gi(e[`title${t}`]);if(!n)return null;let r=gi(e[`severity${t}`]),i=Nr(r),a=r?r.charAt(0).toUpperCase()+r.slice(1).toLowerCase():i.charAt(0).toUpperCase()+i.slice(1),o=W(gi(e[`time${t}`])),s=W(gi(e[`expires${t}`])),c=e[`regions${t}`],l=Array.isArray(c)?c.join(`, `):gi(c),u=gi(e[`uri${t}`]),d=gi(e[`description${t}`]);return{id:`pirateweather_${n}_${o}`,event:n,severity:i,severityLabel:a,certainty:``,urgency:``,sentTs:o,onsetTs:o,endsTs:s,description:d,instruction:``,url:u,headline:n,areaDesc:l,zones:[],eventCode:``,provider:`pirateweather`,phase:``,severityInferred:!r||Nr(r)===`unknown`,certaintyInferred:!1}}};function gi(e){return typeof e==`string`?e:``}var _i=class{constructor(){this.provider=`cap`,this.stableIds=!0,this.carriesPoint=!0}canHandle(e){return typeof e.incident_platform_version==`string`&&typeof e.id==`string`}parseAlerts(e){var t;let n=K(e.id);if(!n)return[];let r=K(e.event),i=K(e.severity),a=K(e.severity_normalized),o=Nr(a||i),s=i||a,c=s?s.charAt(0).toUpperCase()+s.slice(1).toLowerCase():o.charAt(0).toUpperCase()+o.slice(1),l=W(K(e.sent)||K(e.effective)),u=W(K(e.onset))||l,d=W(K(e.ends))||W(K(e.expires)),f=K(e.icon),p=f.startsWith(`mdi:`)?f:void 0,m=K(e.geometry_ref)||void 0,h=wi(e.bbox),g=h!==void 0&&h[0]===h[2]&&h[1]===h[3],_=(t=Ti(e.points))==null?g?cr(h[1],h[0]):void 0:t,v=g?void 0:h,y=xi(e.parameters),b=y?Xn(y.awareness_level):void 0;return[{id:n,event:r||`Unknown`,severity:o,severityLabel:c,certainty:K(e.certainty),urgency:K(e.urgency),sentTs:l,onsetTs:u,endsTs:d,description:K(e.description),instruction:K(e.instruction),url:or(K(e.url))||or(K(e.web)),headline:K(e.headline),areaDesc:K(e.area_desc),zones:bi(e),eventCode:Si(e,y),provider:`cap`,phase:yi(K(e.phase)),severityInferred:!i&&!a,certaintyInferred:!1,...p!==void 0&&{providerIcon:p},...m!==void 0&&{geometryRef:m},...v!==void 0&&{bbox:v},..._!==void 0&&{point:_},...b!==void 0&&{colorHint:b}}]}};const vi={new:`New`,update:`Update`,cancel:`Cancel`,expired:`Expired`};function yi(e){return vi[e.toLowerCase()]||``}function bi(e){let t=[],n=/* @__PURE__ */ new Set,r=e=>{if(typeof e!=`string`)return;let r=e.toUpperCase();n.has(r)||(n.add(r),t.push(r))};for(let t of[`affected_zones`,`geocode_ugc`,`geocode_same`]){let n=e[t];if(Array.isArray(n))for(let e of n)r(e)}let i=e.geocodes;if(i&&typeof i==`object`&&!Array.isArray(i)){for(let e of Object.values(i))if(Array.isArray(e))for(let t of e)r(t)}return t}function xi(e){return e&&typeof e==`object`&&!Array.isArray(e)?e:void 0}function Si(e,t){return Ci(t==null?void 0:t.NationalWeatherService)||Ci(t==null?void 0:t.SAME)||K(e.event_code_nws)||K(e.event_code_same)}function Ci(e){return K(Array.isArray(e)?e[0]:e)}function K(e){return typeof e==`string`?e:``}function wi(e){if(Array.isArray(e)&&e.length===4&&e.every(e=>typeof e==`number`&&Number.isFinite(e)))return[e[0],e[1],e[2],e[3]]}function Ti(e){if(!Array.isArray(e)||e.length!==1)return;let t=e[0];if(Array.isArray(t)&&t.length===2)return cr(t[1],t[0])}const Ei=`environnement canada`,Di={red:`extreme`,orange:`severe`,yellow:`moderate`,grey:`minor`,green:`unknown`,rouge:`extreme`,jaune:`moderate`,gris:`minor`,vert:`unknown`},Oi={warning:`severe`,watch:`moderate`,advisory:`minor`,statement:`minor`,ending:`unknown`},ki={high:`severe`,medium:`moderate`,moderate:`moderate`,low:`minor`,élevé:`severe`,élevée:`severe`,modéré:`moderate`,modérée:`moderate`,faible:`minor`},Ai={high:`Likely`,moderate:`Possible`,medium:`Possible`,low:`Unlikely`,élevée:`Likely`,élevé:`Likely`,modérée:`Possible`,modéré:`Possible`,faible:`Unlikely`},ji={new:`New`,issued:`New`,continued:`Continued`,updated:`Updated`,extended:`Updated`,expired:`Final`,ended:`Final`,émis:`New`,maintenu:`Continued`,"mis à jour":`Updated`,prolongé:`Updated`,terminé:`Final`,annulé:`Final`};function Mi(e){var t;return e?(t=Di[e.toLowerCase()])==null?`unknown`:t:`unknown`}function Ni(e){var t;return e?(t=Oi[e.toLowerCase()])==null?`unknown`:t:`unknown`}function Pi(e){var t;return e?(t=ki[e.toLowerCase()])==null?`unknown`:t:`unknown`}function Fi(...e){var t;let n=`unknown`,r=(t=Pr[n])==null?0:t;for(let t of e){var i,a;let e=(i=(a=Pr[t])==null?Pr.unknown:a)==null?0:i;e<r&&(n=t,r=e)}return n}function Ii(e){return e.charAt(0).toUpperCase()+e.slice(1).toLowerCase()}function Li(e){var t;if(!e)return``;let n=e.toLowerCase();return(t=ji[n])==null?Ii(e):t}function Ri(e){var t;return e?(t=Ai[e.toLowerCase()])==null?``:t:``}function zi(e){return typeof e==`string`&&e.toLowerCase().includes(Ei)}function Bi(e){return zi(e)?`https://meteo.gc.ca/index_f.html`:`https://weather.gc.ca/index_e.html`}var Vi=class{constructor(){this.provider=`eccc`}canHandle(e){let t=e.attribution;if(typeof t!=`string`)return!1;let n=t.toLowerCase();return n.includes(`environment canada`)||n.includes(Ei)}parseAlerts(e){let t=e.alerts;if(!Array.isArray(t))return[];let n=Bi(e.attribution);return t.filter(e=>typeof e==`object`&&!!e).filter(e=>{let t=Ui(e.status).toLowerCase();return t!==`cancelled`&&t!==`annulé`}).map(e=>this._normalize(e,n))}_normalize(e,t){let n=W(e.issued),r=W(e.expiry),i=Fi(Mi(e.color),Ni(e.type),Pi(e.impact)),a=Ui(e.title),o=Ui(e.alert_code),s=Ui(e.area),c=Hi(e.color,i),l=Ui(e.impact),u=l?Ii(l):void 0,d=u==null?i.charAt(0).toUpperCase()+i.slice(1):u,f=Ri(e.confidence);return{id:`eccc_${o||a||`unknown`}_${s}_${n}`,event:a,severity:i,severityLabel:d,certainty:f,urgency:``,sentTs:n,onsetTs:n,endsTs:r,description:Ui(e.text),instruction:``,url:Ui(e.url)||t,headline:a,areaDesc:s,zones:[],eventCode:o,provider:`eccc`,phase:Li(e.status),severityInferred:!e.color&&!e.type&&!e.impact,certaintyInferred:!e.confidence,colorHint:c,severityBadgeLabel:u}}};function Hi(e,t){let n=e?e.trim().toLowerCase():``,r=Qn[n];return r==null?er(t):r}function Ui(e){return typeof e==`string`?e:``}function Wi(e){let t=e.toLowerCase();return t.includes(`emergency warning`)?{severity:`extreme`,label:`Emergency Warning`,inferred:!1}:t.includes(`watch and act`)?{severity:`severe`,label:`Watch and Act`,inferred:!1}:t.includes(`advice`)?{severity:`moderate`,label:`Advice`,inferred:!1}:t.includes(`planned burn`)?{severity:`minor`,label:`Planned Burn`,inferred:!1}:{severity:`unknown`,label:Gi(e)||`Unknown`,inferred:!0}}function Gi(e){return e.replace(/\w\S*/g,e=>e.charAt(0).toUpperCase()+e.slice(1).toLowerCase())}function Ki(e){return e.toLowerCase().replace(/[^a-z0-9]+/g,`_`).replace(/^_+|_+$/g,``)}function qi(e){if(e==null||e===``)return``;if(typeof e==`number`)return`${e} ha`;let t=e.trim();return/^\d+(\.\d+)?$/.test(t)?`${t} ha`:t}function Ji(e){let t=[],n=(e,n)=>{n&&t.push(`${e}: ${n}`)};return n(`Status`,Xi(e.status)),n(`Type`,Xi(e.type)),n(`Location`,Xi(e.location)),n(`Council area`,Xi(e.council_area)),n(`Size`,qi(e.size)),n(`Responsible agency`,Xi(e.responsible_agency)),t.join(`

`)}var Yi=class{constructor(){this.provider=`nsw_rfs`,this.feedSources=[`nsw_rural_fire_service_feed`],this.carriesPoint=!0,this.stableIds=!0}canHandle(e){return typeof e.category==`string`&&typeof e.status==`string`&&typeof e.responsible_agency==`string`}parseAlerts(e){return this.canHandle(e)?[this._normalize(e)]:[]}_normalize(e){let t=W(e.publication_date),{severity:n,label:r,inferred:i}=Wi(Xi(e.category)),a=Xi(e.location),o=Xi(e.type),s=o?Gi(o):a||`Fire Incident`,c=cr(e.latitude,e.longitude);return{id:Xi(e.external_id)||`nsw_rfs_${Ki(a)}_${t}`,event:s,severity:n,severityLabel:r,certainty:``,urgency:``,sentTs:t,onsetTs:t,endsTs:0,description:Ji(e),instruction:``,url:`https://www.fire.nsw.gov.au/firesnearme/`,headline:a||s,areaDesc:Xi(e.council_area)||a||`NSW`,zones:[],eventCode:``,provider:`nsw_rfs`,phase:``,severityInferred:i,certaintyInferred:!1,providerIcon:`mdi:fire`,...c!==void 0&&{point:c}}}};function Xi(e){return typeof e==`string`?e:``}const Zi=/^(?:amtliche\s+)?(?:(?:extreme\s+)?(?:unwetter)?warnung|vorabinformation)\s+(?:vor\s+)?/i;function Qi(e){return e.replace(/\w\S*/g,e=>e.charAt(0).toUpperCase()+e.slice(1).toLowerCase())}function $i(e){if(!Zi.test(e))return e;let t=e.replace(Zi,``).trim();return t?Qi(t):e}function ea(e,t){if(!t)return e;let n=`Herausgeber: ${t}`;return e?`${e}\n\n${n}`:n}var ta=class{constructor(){this.provider=`nina`,this.stableIds=!0}canHandle(e){return typeof e.recommended_actions==`string`&&typeof e.affected_areas==`string`&&typeof e.id==`string`}parseAlerts(e){if(!this.canHandle(e))return[];let t=ra(e.id);if(!t)return[];let n=ra(e.headline),r=ra(e.severity),i=Nr(r),a=W(ra(e.sent)),o=W(ra(e.start))||a,s=W(ra(e.expires));return[{id:t,event:$i(n)||`Warnung`,severity:i,severityLabel:r?r.charAt(0).toUpperCase()+r.slice(1).toLowerCase():i.charAt(0).toUpperCase()+i.slice(1),certainty:``,urgency:``,sentTs:a,onsetTs:o,endsTs:s,description:ea(ra(e.description),ra(e.sender)),instruction:ra(e.recommended_actions),url:or(ra(e.web)),headline:n,areaDesc:ra(e.affected_areas),zones:[],eventCode:``,provider:`nina`,phase:``,severityInferred:!1,certaintyInferred:!1}]}};function na(e,t){return e===`on`&&t.device_class===`safety`&&typeof t.id==`string`&&t.id!==``&&!(`headline`in t)&&!(`affected_areas`in t)}function ra(e){return typeof e==`string`?e:``}const ia=`inmet`;function aa(e){return typeof e==`string`?e:``}function oa(e){return typeof e==`string`||typeof e==`number`?String(e):``}function sa(e){return e.toLowerCase().replace(/[^a-z0-9]+/g,`_`).replace(/^_+|_+$/g,``)}function ca(e){return Array.isArray(e)?e.filter(e=>typeof e==`string`&&e.trim()!==``).join(`

`):aa(e)}function la(e){let t=aa(e).trim();return t?W(/(?:[zZ]|[+-]\d\d:?\d\d)$/.test(t)?t:`${t}-03:00`):0}function ua(e){if(!Array.isArray(e)||e.length!==4)return;let[t,n,r,i]=e;if(da(t)&&da(n)&&da(r)&&da(i)&&!(t<-180||r>180||n<-90||i>90)&&!(t>r||n>i))return[t,n,r,i]}function da(e){return typeof e==`number`&&Number.isFinite(e)}function fa(e){return e.replace(/\w\S*/g,e=>e.charAt(0).toUpperCase()+e.slice(1).toLowerCase())}function pa(e){let t=e.trim().toLowerCase();if(t){if(t.includes(`vermel`)||t===`red`||t===`#ff0000`)return`extreme`;if(t.includes(`laranja`)||t===`orange`||t===`#f96602`)return`severe`;if(t.includes(`amarel`)||t===`yellow`||t===`#fffe00`)return`moderate`}}function ma(e){let t=aa(e.severity),n=t.toLowerCase();if(n.includes(`grande`))return{severity:`extreme`,label:t,inferred:!1};if(n.includes(`potencial`))return{severity:`moderate`,label:t,inferred:!1};if(n===`perigo`||n.includes(`perigo`))return{severity:`severe`,label:t,inferred:!1};let r=pa(aa(e.color));return r?{severity:r,label:t||fa(aa(e.color)),inferred:!0}:{severity:`unknown`,label:t||`Unknown`,inferred:!0}}var ha=class{constructor(){this.provider=`inmet`,this.feedSources=[ia],this.stableIds=!0}canHandle(e){return e.source===ia&&oa(e.alert_id)!==``&&typeof e.description==`string`&&typeof e.severity==`string`}parseAlerts(e){if(!this.canHandle(e))return[];let t=e,n=oa(t.alert_id),r=aa(t.description)||`INMET Alert`,{severity:i,label:a,inferred:o}=ma(t),s=la(t.updated_at)||la(t.start_date),c=la(t.start_date)||s,l=la(t.end_date),u=ua(t.bbox),d=t.finished?`Final`:t.updated?`Update`:t.future?`Future`:``;return[{id:n||`inmet_${sa(r)}_${c}`,event:r,severity:i,severityLabel:a,certainty:``,urgency:``,sentTs:s,onsetTs:c,endsTs:l,description:ca(t.risks),instruction:ca(t.instructions),url:aa(t.url),headline:r,areaDesc:aa(t.area)||`Brazil`,zones:[],eventCode:``,provider:`inmet`,phase:d,severityInferred:o,certaintyInferred:!1,providerIcon:aa(e.icon)||`mdi:alert`,colorHint:aa(t.color),...u!==void 0&&{bbox:u}}]}};const ga=new Zr,_a=new _i,va=[_a,ga,new ii,new Yi,new ha,new ta,new ci,new ui,new mi,new Vi,new hi],ya=[/^sensor\..*alerts?$/i,/^sensor\..*warnings?$/i,/^binary_sensor\.meteoalarm/i,/^sensor\.dwd_weather_warnings/i,/^sensor\.weather_warnings_at_/i,/^sensor\..*cap_alert_/i,/^binary_sensor\..*_warn(?:ing|ung)_\d+$/i];function ba(e){return va.some(t=>t.canHandle(e))}function xa(){let e=[];for(let n of va){var t;for(let r of(t=n.feedSources)==null?[]:t)e.push({source:r,provider:n.provider})}return e}function Sa(){return new Set(va.filter(e=>e.carriesPoint).map(e=>e.provider))}function Ca(e,t){if(e&&e!==`cap`&&_a.canHandle(t))return _a;if(e){let t=va.find(t=>t.provider===e);if(t)return t}for(let e of va)if(e.canHandle(t))return e;return ga}function q(e){if(!e)return[];let t=[];for(let n of[e.device,...e.devices||[]])n&&!t.includes(n)&&t.push(n);return t}function wa(e,t,n){let r=n==null?e.entities?Object.values(e.entities):null:n;if(!r)return[];let i=[];for(let n of r){if(!n||n.device_id!==t)continue;let r=n.entity_id;if(!r)continue;let a=e.states[r];a&&ba(a.attributes)&&i.push(r)}return i}function Ta(e,t,n){let r=n==null?e.entities?Object.values(e.entities):null:n;return r?r.filter(e=>(e==null?void 0:e.device_id)===t&&!!e.entity_id):[]}function Ea(e,t,n){return Ta(e,t,n).map(e=>e.entity_id)}function Da(e,t,n){if(n)return n.some(e=>(e==null?void 0:e.device_id)===t);let r=e.entities;if(!r)return!1;for(let e of Object.values(r))if((e==null?void 0:e.device_id)===t)return!0;return!1}async function Oa(e,t){let n=async()=>{let n=await e.sendMessagePromise({type:`config/entity_registry/list`});t(n==null?[]:n)},r=null,i=!1,a=()=>{r===null?(n().catch(()=>{}),r=setTimeout(()=>{r=null,i&&(i=!1,a())},250)):i=!0},o=await e.subscribeEvents(()=>a(),`entity_registry_updated`);return await n(),()=>{r!==null&&(clearTimeout(r),r=null),i=!1,o()}}function J(e,t,n,r){var i=arguments.length,a=i<3?t:r===null?r=Object.getOwnPropertyDescriptor(t,n):r,o;if(typeof Reflect==`object`&&typeof Reflect.decorate==`function`)a=Reflect.decorate(e,t,n,r);else for(var s=e.length-1;s>=0;s--)(o=e[s])&&(a=(i<3?o(a):i>3?o(t,n,a):o(t,n))||a);return i>3&&a&&Object.defineProperty(t,n,a),a}const ka=`weather-alerts-card:dismissals-changed`;function Aa(){return Math.floor(Date.now()/1e3)}function ja(e){return`${e.severity}|${e.sentTs}|${e.endsTs}|${e.phase||``}`}function Ma(e,t){let n=[e,...t].filter(Boolean).sort().join(`
`),r=2166136261;for(let e=0;e<n.length;e++)r^=n.charCodeAt(e),r=Math.imul(r,16777619);return(r>>>0).toString(16).padStart(8,`0`)}function Na(e){return`weather-alerts-card:dismissals:v1:`+e}function Pa(e){if(!e)return[];let t=[];if(e.entity&&t.push(e.entity),e.entities)for(let n of e.entities)n&&t.push(n);for(let n of[...q(e)].sort())t.push(`device:${n}`);if(e.sources)for(let n of e.sources)n&&t.push(`source:${n}`);return t}function Fa(e){let[t,...n]=Pa(e);return t===void 0?``:Ma(t,n)}function Ia(){try{return typeof localStorage<`u`?localStorage:null}catch{return null}}function La(e){if(typeof window<`u`)try{window.dispatchEvent(new CustomEvent(ka,{detail:{scope:e}}))}catch{}}function Ra(e,t){if(typeof window>`u`)return()=>{};let n=n=>{let r=n.detail;r&&r.scope===e&&t()},r=Na(e),i=e=>{(e.key===null||e.key===r)&&t()};return window.addEventListener(ka,n),window.addEventListener(`storage`,i),()=>{window.removeEventListener(ka,n),window.removeEventListener(`storage`,i)}}function za(e,t=Aa()){let n=/* @__PURE__ */ new Map,r=Ia();if(!r)return n;let i;try{i=r.getItem(Na(e))}catch{return n}if(!i)return n;let a;try{a=JSON.parse(i)}catch{return n}if(!a||typeof a!=`object`)return n;let o=a;for(let[e,r]of Object.entries(o)){if(!r||typeof r!=`object`)continue;let i=r;typeof i.sig==`string`&&typeof i.dismissedAt==`number`&&typeof i.lastSeenAt==`number`&&(t-i.lastSeenAt>2592e3||n.set(e,{sig:i.sig,dismissedAt:i.dismissedAt,lastSeenAt:i.lastSeenAt}))}return n}function Ba(e,t){let n=Ia();if(!n){La(e);return}let r=Na(e);try{if(t.size===0)n.removeItem(r);else{let e={};for(let[n,r]of t)e[n]=r;n.setItem(r,JSON.stringify(e))}}catch{}La(e)}function Va(e,t,n=Aa()){let r=new Map(e);return r.set(t.id,{sig:ja(t),dismissedAt:n,lastSeenAt:n}),r}function Ha(e,t){if(!e.has(t))return e;let n=new Map(e);return n.delete(t),n}function Ua(e){let t=Ia();if(t)try{t.removeItem(Na(e))}catch{}La(e)}function Wa(e,t,n=Aa()){var r;if(t.size===0)return{visible:e,updatedMap:t};let i=null,a=[];for(let r of e){let e=t.get(r.id);if(!e){var o;let e=(o=r.dismissAliases)==null?void 0:o.find(e=>t.has(e));if(e===void 0){a.push(r);continue}i||(i=new Map(t)),i.set(r.id,{...t.get(e),sig:ja(r),lastSeenAt:n}),i.delete(e);continue}let s=ja(r);e.sig===s?n-e.lastSeenAt>3600&&(i||(i=new Map(t)),i.set(r.id,{...e,lastSeenAt:n})):(i||(i=new Map(t)),i.delete(r.id),a.push(r))}return{visible:a,updatedMap:(r=i)==null?t:r}}async function Ga(e,t){try{var n;let r=await e.sendMessagePromise({type:`cap_alerts/geometry`,geometry_ref:t}),i=r==null||(n=r.features)==null||(n=n[0])==null?void 0:n.geometry;return!i||typeof i.type!=`string`?null:i}catch{return null}}const Ka=1e-4,qa=111.32;function Ja(e){return Math.max(-85.05112878,Math.min(85.05112878,e))}function Ya(e,t=10){let n=1/0,r=1/0,i=-1/0,a=-1/0;for(let[t,o]of e)t<n&&(n=t),t>i&&(i=t),o<r&&(r=o),o>a&&(a=o);Number.isFinite(n)||(n=i=0,r=a=0);let o=(n+i)/2,s=(r+a)/2,c=Math.max(Math.cos(s*Math.PI/180),.01),l=t/qa,u=t/(qa*c);i-n<2*u&&(n=o-u,i=o+u);let d=Math.max((a-r)/2,l);a-r<2*l&&(r=s-l,a=s+l);let f=Ja(a),p=Math.max(Math.min(r,f-2*d),-85.05112878);return[n,p,i,f]}function Xa(e){return`M${Y(e.x)},${Y(e.y)}l0.0001,0`}function Za(e,t,n,r){let[i,a,o,s]=e,c=(a+s)/2,l=Math.cos(c*Math.PI/180)||Ka,u=Math.max((o-i)*l,Ka),d=Math.max(s-a,Ka),f=`0 0 ${Y(u)} ${Y(d)}`,p=(e,t)=>[(e-i)*l,s-t];return{viewBox:f,shapePath:$a(t,p),...n&&{marker:Qa(n,p)},...r&&{referenceMarker:Qa(r,p)}}}function Qa([e,t],n){let[r,i]=n(e,t);return{x:Number(Y(r)),y:Number(Y(i))}}function $a(e,t){return to(e).map(e=>no(e,t)).filter(e=>e!==null).join(``)}function eo(e,t){return`wac-geometry-mask-${`${e}-${t}`.replace(/[^A-Za-z0-9_-]+/g,`_`)}`}function to(e){if(!e)return[];if(e.type===`Polygon`){let t=e.coordinates,n=Array.isArray(t)?t[0]:void 0;return n?[n]:[]}if(e.type===`MultiPolygon`){let t=e.coordinates;return Array.isArray(t)?t.map(e=>Array.isArray(e)&&e.length>0?e[0]:null).filter(e=>Array.isArray(e)&&e.length>0):[]}return[]}function no(e,t){if(!Array.isArray(e)||e.length===0)return null;let n=[];for(let r of e){if(!Array.isArray(r))continue;let[e,i]=r;e!==void 0&&i!==void 0&&n.push(t(e,i))}return n.length===0?null:(ro(n)<0&&n.reverse(),`${n.map(([e,t],n)=>`${n===0?`M`:`L`}${Y(e)},${Y(t)}`).join(``)}Z`)}function ro(e){let t=0;for(let n=0;n<e.length;n++){let[r,i]=e[n],[a,o]=e[(n+1)%e.length];t+=r*o-a*i}return t/2}function Y(e){return Number(e.toFixed(5)).toString()}function io(e,t){return`${(e||``).replace(/\/+$/,``)}/api/map_tiles/raster/{z}/{x}/{y}.png?token=${encodeURIComponent(t)}`}async function ao(e){try{let t=await e.sendMessagePromise({type:`map_tiles/access_token`}),n=t==null?void 0:t.token;return typeof n==`string`&&n.length>0?n:null}catch{return null}}const oo=.15;function so(e,t,n){let r=256*2**n,i=(e+180)/360*r,a=Ja(t)*Math.PI/180;return[i,(1-Math.log(Math.tan(a)+1/Math.cos(a))/Math.PI)/2*r]}function co(e,t,n,r){for(let i=16;i>=1;i--){let[a,o]=so(e,r,i),[s,c]=so(n,t,i);if(s-a<=512&&c-o<=512)return i}return 1}function lo(e,t,n,r){return e.split(`{z}`).join(String(t)).split(`{x}`).join(String(n)).split(`{y}`).join(String(r)).split(`{s}`).join(`a`)}function uo(e,t,n){let r=(n==null?void 0:n.tileUrl)||`/api/map_tiles/raster/{z}/{x}/{y}.png`,i=(n==null?void 0:n.attribution)||`© OpenStreetMap contributors`,[a,o,s,c]=e,l=Math.max((s-a)*oo,Ka),u=Math.max((c-o)*oo,Ka),d=a-l,f=s+l,p=Ja(o-u),m=Ja(c+u),h=co(d,p,f,m),g=2**h,[_,v]=so(d,m,h),[y,b]=so(f,p,h),x=Math.max(y-_,Ka),ee=Math.max(b-v,Ka),S=`0 0 ${Y(x)} ${Y(ee)}`,te=`${Y(x)} / ${Y(ee)}`,ne=[],re=Math.floor(_/256),C=Math.floor((y-1e-6)/256),ie=Math.floor(v/256),ae=Math.floor((b-1e-6)/256);if((C-re+1)*(ae-ie+1)<=16){for(let e=ie;e<=ae;e++)if(!(e<0||e>=g))for(let t=re;t<=C;t++){let n=(t%g+g)%g;ne.push({href:lo(r,h,n,e),x:Number((t*256-_).toFixed(3)),y:Number((e*256-v).toFixed(3)),size:256})}}let oe=(e,t)=>{let[n,r]=so(e,t,h);return[n-_,r-v]};return{viewBox:S,aspect:te,tiles:ne,shapePath:$a(t,oe),attribution:i,...(n==null?void 0:n.point)&&{marker:Qa(n.point,oe)},...(n==null?void 0:n.referencePoint)&&{referenceMarker:Qa(n.referencePoint,oe)}}}function fo(e,t,n){e.dispatchEvent(new CustomEvent(t,{detail:n,bubbles:!0,composed:!0}))}function po(e){return(e==null?void 0:e.tap_action)!==void 0}function mo(e,t,n,r){switch(n.action){case`more-info`:{var i;let t=(i=n.entity)==null?r:i;if(!t)return;fo(e,`hass-more-info`,{entityId:t});break}case`navigate`:{let e=n.navigation_path;if(!e)return;let t=n.navigation_replace===!0;t?history.replaceState(null,``,e):history.pushState(null,``,e),fo(window,`location-changed`,{replace:t});break}case`url`:if(!n.url_path)return;window.open(n.url_path,`_blank`,`noopener`);break;case`toggle`:{var a;let e=(a=n.entity)==null?r:a;if(!e||!(t!=null&&t.callService))return;t.callService(`homeassistant`,`toggle`,{entity_id:e});break}case`call-service`:case`perform-action`:{var o,s;let e=(o=n.perform_action)==null?n.service:o;if(!e||!(t!=null&&t.callService))return;let r=e.indexOf(`.`);if(r<0)return;let i=e.slice(0,r),a=e.slice(r+1);t.callService(i,a,(s=n.data)==null?n.service_data:s,n.target);break}case`fire-dom-event`:fo(e,`ll-custom`,n)}}const ho=o`
  @keyframes pulse-ring {
    0%, 100% { opacity: 0; }
    50% { opacity: 0.7; }
  }
  @keyframes ongoing-pulse {
    0% { opacity: 1; }
    50% { opacity: 0.7; }
    100% { opacity: 1; }
  }
  @keyframes stripe-march {
    to { transform: translateX(calc(var(--wac-flow, 1) * var(--wac-stripe-tile, 24px))); }
  }
  @keyframes fill-shimmer {
    0% { transform: translateX(calc(var(--wac-flow, 1) * -23.333%)); }
    60% { transform: translateX(calc(var(--wac-flow, 1) * 23.333%)); }
    100% { transform: translateX(calc(var(--wac-flow, 1) * 23.333%)); }
  }
  :host {
    display: block;
  }
  ha-card {
    position: relative;
    background: var(--wac-card-background, var(--ha-card-background, var(--card-background-color)));
  }
  .error {
    padding: 16px;
    color: var(--error-color, red);
  }
  .degraded-badge {
    display: flex;
    align-items: center;
    gap: 8px;
    padding: 8px 16px;
    background: color-mix(in srgb, var(--warning-color) 14%, transparent);
    color: var(--primary-text-color);
    font-size: 0.85em;
    border-bottom: 1px solid var(--divider-color);
  }
  .degraded-badge ha-icon {
    color: var(--warning-color);
    --mdc-icon-size: 18px;
    flex-shrink: 0;
  }
  .degraded-dot {
    position: absolute;
    top: 8px;
    right: 8px;
    display: flex;
    align-items: center;
    justify-content: center;
    width: 18px;
    height: 18px;
    border-radius: 50%;
    background: var(--warning-color);
    box-shadow: 0 0 0 2px var(--card-background-color, #fff);
    z-index: 2;
  }
  .degraded-dot ha-icon {
    color: var(--card-background-color, #fff);
    --mdc-icon-size: 12px;
  }
  .severity-extreme,
  .severity-severe { --color: var(--error-color); --color-rgb: 244, 67, 54; --color-on: #ffffff; }
  .severity-moderate { --color: var(--warning-color); --color-rgb: 255, 152, 0; --color-on: #1a1a1a; }
  .severity-minor { --color: var(--info-color); --color-rgb: 33, 150, 243; --color-on: #ffffff; }
  .severity-unknown { --color: var(--secondary-text-color); --color-rgb: 128, 128, 128; --color-on: var(--primary-text-color); }
  .alert-card {
    --wac-fg: var(--color);
    --wac-progress-fg: var(--color);
    --wac-progress-fill-color: var(--wac-progress-fg);
    --wac-progress-fill-opacity: 0.10;
    --wac-progress-fill-expired-opacity: 0.06;
    position: relative;
    margin-bottom: var(--wac-alert-gap, 16px);
    padding: 0;
    border-radius: var(--wac-alert-border-radius, 12px);
    background: var(--wac-alert-background, transparent);
    border: var(--wac-alert-border, 1px solid var(--divider-color));
    box-shadow: var(--wac-alert-shadow, var(--ha-card-box-shadow, 0 2px 5px rgba(0,0,0,0.1)));
    overflow: hidden;
    transition: border-color 0.2s ease-in-out, box-shadow 0.2s ease-in-out, transform 0.15s ease-out;
  }
  [data-theme-mode="light"] .alert-card.boost-light,
  [data-theme-mode="dark"] .alert-card.boost-dark {
    --wac-fg: color-mix(in oklch, var(--color) 65%, var(--primary-text-color));
  }
  [data-theme-mode="light"] .alert-card.progress-boost-light,
  [data-theme-mode="dark"] .alert-card.progress-boost-dark {
    --wac-progress-fg: color-mix(in oklch, var(--color) 65%, var(--primary-text-color));
  }
  [data-theme-mode="light"] .alert-card { --color-on: var(--color-on-light, #ffffff); }
  [data-theme-mode="dark"]  .alert-card { --color-on: var(--color-on-dark,  #1a1a1a); }
  [data-theme-mode="dark"] .alert-card { --wac-progress-fill-opacity: 0.14; }
  .alert-card:last-child {
    margin-bottom: 0;
  }
  .alert-card.tappable {
    cursor: pointer;
  }
  .alert-card.tappable:focus-visible {
    outline: 2px solid var(--wac-focus-ring, var(--primary-color));
    outline-offset: 2px;
  }
  .alert-card::before {
    content: "";
    position: absolute;
    left: 0; top: 0; bottom: 0;
    width: 6px;
    background: var(--color);
  }
  .alert-card.severity-extreme,
  .alert-card.severity-severe {
    border-color: var(--color);
  }
  .pulse-ring {
    position: absolute;
    inset: 0;
    border-radius: inherit;
    pointer-events: none;
    z-index: 0;
    box-shadow: inset 0 0 0 2px var(--wac-fg);
    opacity: 0;
    animation: pulse-ring 2s ease-in-out infinite;
  }
  .alert-header-row {
    display: flex;
    align-items: center;
    padding: 12px 16px;
    gap: 16px;
  }
  .icon-box {
    display: flex;
    align-items: center;
    justify-content: center;
    background: rgba(var(--color-rgb), 0.1);
    color: var(--wac-fg);
    width: calc(44px * var(--wac-scale, 1));
    height: calc(44px * var(--wac-scale, 1));
    border-radius: 50%;
    flex-shrink: 0;
    box-sizing: border-box;
    border: 2px solid transparent;
    transition: border 0.2s, background 0.2s, color 0.2s;
  }
  .active .icon-box {
    border-color: var(--color);
    background: rgba(var(--color-rgb), 0.12);
  }
  .expired .icon-box {
    border-color: var(--divider-color);
    opacity: 0.5;
  }
  .expired {
    opacity: 0.6;
  }
  .preparation .icon-box {
    border: 2px dashed var(--color);
  }
  .icon-border-dashed .icon-box {
    border-style: dashed;
  }
  .icon-border-solid .icon-box {
    border-style: solid;
  }
  .icon-box ha-icon { --mdc-icon-size: calc(26px * var(--wac-scale, 1)); }
  .info-box { flex-grow: 1; }
  .title-row { margin-bottom: 4px; }
  .alert-title {
    font-size: calc(1.15rem * var(--wac-scale, 1));
    font-weight: 600;
    line-height: 1.2;
    color: var(--primary-text-color);
  }
  .alert-headline {
    font-size: calc(0.8rem * var(--wac-scale, 1));
    line-height: 1.3;
    color: var(--secondary-text-color);
    margin-bottom: 4px;
  }
  .area-desc {
    display: flex;
    align-items: flex-start;
    gap: 4px;
    font-size: calc(0.8rem * var(--wac-scale, 1));
    line-height: 1.4;
    color: var(--secondary-text-color);
    margin-bottom: 6px;
    max-width: 100%;
    opacity: 0.85;
  }
  .area-desc ha-icon {
    flex-shrink: 0;
    margin-top: 1px;
    --mdc-icon-size: calc(13px * var(--wac-scale, 1));
    width: calc(13px * var(--wac-scale, 1));
    height: calc(13px * var(--wac-scale, 1));
    opacity: 0.7;
  }
  .area-desc-text {
    display: -webkit-box;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
    overflow: hidden;
  }
  .compact .alert-expanded .alert-headline {
    padding: 4px 12px 0;
    margin-bottom: 2px;
  }
  .compact .alert-expanded .area-desc {
    padding: 4px 12px 0;
    margin-bottom: 4px;
  }
  .badges-row {
    display: flex;
    flex-wrap: wrap;
    gap: 6px;
  }
  .badge {
    display: inline-flex;
    align-items: center;
    gap: 4px;
    line-height: 1;
    font-size: calc(0.75rem * var(--wac-scale, 1));
    padding: 2px 8px;
    border-radius: 12px;
    font-weight: 500;
    text-transform: uppercase;
    letter-spacing: 0.5px;
  }
  .severity-badge {
    background: var(--color);
    color: var(--color-on);
    font-weight: 700;
  }
  .certainty-badge {
    background: var(--secondary-background-color);
    color: var(--secondary-text-color);
    border: 1px solid var(--divider-color);
  }
  .phase-badge {
    background: var(--secondary-background-color);
    color: var(--secondary-text-color);
    border: 1px solid var(--divider-color);
  }
  .event-code-badge {
    background: var(--secondary-background-color);
    color: var(--secondary-text-color);
    border: 1px solid var(--divider-color);
    font-family: monospace;
    text-transform: none;
    letter-spacing: 1px;
  }
  .badge-inferred {
    font-style: italic;
  }
  .badge-inferred::before {
    content: '~';
    opacity: 0.6;
    margin-right: 1px;
  }
  .zones-badge {
    background: transparent;
    color: var(--secondary-text-color);
    border: none;
    padding: 2px 0;
    font-weight: 400;
  }
  .zones-badge::before { content: '('; opacity: 0.5; }
  .zones-badge::after { content: ')'; opacity: 0.5; }
  .progress-section {
    padding: 0 16px 16px 16px;
  }
  .progress-labels {
    display: flex;
    justify-content: space-between;
    align-items: stretch;
    font-size: calc(0.85rem * var(--wac-scale, 1));
    color: var(--primary-text-color);
    margin-bottom: 6px;
  }
  .label-left, .label-center, .label-right {
    display: flex;
    flex-direction: column;
    justify-content: space-between;
  }
  .label-sub {
    font-size: calc(0.7rem * var(--wac-scale, 1));
    color: var(--secondary-text-color);
    text-transform: uppercase;
  }
  .label-center {
    text-align: center;
    font-weight: bold;
    color: var(--wac-fg);
    white-space: nowrap;
  }
  .label-right { text-align: right; }
  .progress-track {
    height: 8px;
    background: var(--secondary-background-color);
    border-radius: 4px;
    overflow: hidden;
    position: relative;
  }
  .progress-fill {
    height: 100%;
    position: absolute;
    top: 0;
    overflow: hidden;
    transition: width 0.3s ease;
  }
  .active .progress-fill {
    background-color: var(--wac-progress-fg);
  }
  .expired .progress-fill {
    background-color: var(--divider-color);
  }
  .preparation .progress-fill {
    background-color: var(--wac-progress-fg);
    --wac-flow: -1;
  }
  .deco-striped .progress-fill {
    background-color: transparent;
  }
  .deco-solid .progress-fill,
  .compact .deco-solid.alert-card::before {
    background-image: none;
    animation: none;
  }
  .deco-striped .progress-fill::after,
  .deco-shimmer .progress-fill::after {
    content: "";
    position: absolute;
    top: 0;
    bottom: 0;
    left: -100%;
    right: -100%;
  }
  .deco-striped .progress-fill::after,
  .compact .deco-striped.alert-card::before {
    background-image: linear-gradient(
      -45deg,
      var(--wac-progress-fg) 25%,
      transparent 25%,
      transparent 50%,
      var(--wac-progress-fg) 50%,
      var(--wac-progress-fg) 75%,
      transparent 75%
    );
    background-size: var(--wac-stripe-tile, 24px) var(--wac-stripe-tile, 24px);
    animation: stripe-march var(--wac-stripe-dur, 6s) steps(var(--wac-stripe-steps, 24)) infinite;
  }
  @media (min-resolution: 2dppx) {
    .deco-striped .progress-fill::after { --wac-stripe-steps: 48; }
    .compact .deco-striped.alert-card::before { --wac-stripe-steps: 24; }
  }
  @media (min-resolution: 3dppx) {
    .deco-striped .progress-fill::after { --wac-stripe-steps: 72; }
    .compact .deco-striped.alert-card::before { --wac-stripe-steps: 36; }
  }
  .deco-shimmer .progress-fill::after,
  .compact .deco-shimmer.alert-card::before {
    background-image: linear-gradient(90deg, transparent 0%, rgba(255,255,255,0.3) 50%, transparent 100%);
    background-size: 13.333% 100%;
    background-position: 50% 0;
    background-repeat: no-repeat;
    animation: fill-shimmer 5s ease-in-out infinite;
  }
  .deco-pulse .progress-fill,
  .compact .deco-pulse.alert-card::before {
    animation: ongoing-pulse 5s infinite;
  }
  .alert-details-section {
    border-top: 1px solid var(--divider-color);
    background: rgba(var(--rgb-primary-text-color), 0.02);
  }
  .details-summary {
    padding: 10px 16px;
    font-size: calc(0.9rem * var(--wac-scale, 1));
    font-weight: 500;
    color: var(--secondary-text-color);
    cursor: pointer;
    display: flex;
    justify-content: space-between;
    align-items: center;
    transition: background 0.2s;
    user-select: none;
  }
  .details-summary:hover {
    background: rgba(var(--color-rgb), 0.05);
    color: var(--primary-text-color);
  }
  .chevron {
    transition: transform 0.2s;
  }
  .chevron.expanded {
    transform: rotate(180deg);
  }
  .details-content {
    padding: 16px;
    font-size: calc(0.9rem * var(--wac-scale, 1));
  }
  .meta-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(100px, 1fr));
    gap: 12px;
    margin-bottom: 16px;
    padding-bottom: 12px;
    border-bottom: 1px dashed var(--divider-color);
  }
  .meta-item { display: flex; flex-direction: column; }
  .meta-label {
    font-size: calc(0.7rem * var(--wac-scale, 1));
    color: var(--secondary-text-color);
    text-transform: uppercase;
  }
  .meta-value {
    font-weight: 500;
    color: var(--primary-text-color);
  }
  .area-toggle {
    align-self: flex-start;
    background: transparent;
    border: none;
    padding: 0;
    margin: 0;
    font: inherit;
    font-size: calc(0.8rem * var(--wac-scale, 1));
    color: var(--secondary-text-color);
    cursor: pointer;
    text-decoration: underline dotted;
    text-underline-offset: 2px;
  }
  .area-toggle:hover,
  .area-toggle:focus-visible {
    color: var(--primary-text-color);
    outline: none;
  }
  .meta-relative {
    font-size: calc(0.75rem * var(--wac-scale, 1));
    color: var(--secondary-text-color);
    font-style: italic;
  }
  .alert-geometry {
    display: block;
    width: 100%;
    max-width: 260px;
    height: 120px;
    margin: 0 auto 16px;
    overflow: visible;
  }
  .alert-geometry .geometry-frame {
    fill: rgba(var(--color-rgb), 0.04);
    stroke: var(--divider-color);
    stroke-width: 1px;
    vector-effect: non-scaling-stroke;
  }
  .alert-geometry .geometry-fill {
    fill: rgba(var(--color-rgb), 0.18);
    stroke: none;
  }
  .alert-geometry .geometry-shape {
    fill: none;
    stroke: var(--wac-fg, var(--color));
    stroke-width: 3px;
    stroke-linejoin: round;
    vector-effect: non-scaling-stroke;
  }
  .alert-geometry.point .geometry-frame {
    fill: none;
  }
  .alert-geometry .geometry-marker {
    fill: none;
    stroke: var(--wac-fg, var(--color));
    stroke-width: 10px;
    stroke-linecap: round;
    vector-effect: non-scaling-stroke;
  }
  .alert-geometry .geometry-marker-casing {
    fill: none;
    stroke: rgba(255, 255, 255, 0.85);
    stroke-width: 14px;
    stroke-linecap: round;
    vector-effect: non-scaling-stroke;
  }
  .alert-geometry .geometry-reference-ring {
    fill: none;
    stroke: var(--secondary-text-color);
    stroke-width: 8px;
    stroke-linecap: round;
    vector-effect: non-scaling-stroke;
  }
  .alert-geometry .geometry-reference-core {
    fill: none;
    stroke: var(--wac-surface, var(--card-background-color, #fff));
    stroke-width: 4px;
    stroke-linecap: round;
    vector-effect: non-scaling-stroke;
  }
  .alert-geometry-map {
    position: relative;
    display: block;
    width: 100%;
    max-width: 320px;
    max-height: 220px;
    margin: 0 auto 16px;
    border-radius: 8px;
    overflow: hidden;
    border: 1px solid var(--divider-color);
  }
  .alert-geometry.map {
    display: block;
    width: 100%;
    height: 100%;
    margin: 0;
    max-width: none;
    overflow: hidden;
  }
  .alert-geometry.map image {
    image-rendering: auto;
  }
  .alert-geometry.map .geometry-tiles {
    filter: var(--map-filter, none);
  }
  .alert-geometry.map.dark .geometry-tiles {
    filter: var(--map-filter, invert(0.9) hue-rotate(170deg) brightness(1.5) contrast(1.2) saturate(0.3));
  }
  .alert-geometry.map .geometry-frame {
    fill: none;
    stroke: rgba(var(--rgb-primary-text-color, 128, 128, 128), 0.25);
  }
  .alert-geometry.map .geometry-fill {
    fill: rgba(var(--color-rgb), 0.22);
  }
  .alert-geometry.map .geometry-shape {
    stroke-width: 4px;
  }
  .alert-geometry.map .geometry-shape-casing {
    fill: none;
    stroke: rgba(255, 255, 255, 0.85);
    stroke-width: 8px;
    stroke-linejoin: round;
    vector-effect: non-scaling-stroke;
  }
  .alert-geometry.map .geometry-marker {
    stroke-width: 9px;
  }
  .alert-geometry.map .geometry-reference-core {
    stroke: rgba(255, 255, 255, 0.95);
  }
  .geometry-attrib {
    position: absolute;
    right: 0;
    bottom: 0;
    font-size: 9px;
    line-height: 1.2;
    padding: 1px 4px;
    color: #333;
    background: rgba(255, 255, 255, 0.7);
    border-top-left-radius: 4px;
    pointer-events: none;
  }
  .text-block { margin-bottom: 16px; }
  .text-label {
    font-weight: 600;
    margin-bottom: 4px;
    color: var(--primary-text-color);
  }
  .text-body {
    white-space: pre-wrap;
    color: var(--secondary-text-color);
    line-height: 1.5;
    background: var(--primary-background-color);
    padding: 10px;
    border-radius: 8px;
    border: 1px solid var(--divider-color);
  }
  .provider-hint {
    font-size: calc(0.7rem * var(--wac-scale, 1));
    color: var(--secondary-text-color);
    letter-spacing: 0.5px;
    opacity: 0.5;
    margin-right: 6px;
    flex-shrink: 0;
  }
  .provider-hint::after {
    content: '·';
    margin-left: 6px;
    opacity: 0.6;
  }
  .footer-link { text-align: right; margin-top: 10px; }
  .footer-link a {
    color: var(--wac-fg);
    text-decoration: none;
    font-weight: 500;
    font-size: calc(0.85rem * var(--wac-scale, 1));
  }
  .dismiss-button {
    background: transparent;
    border: none;
    cursor: pointer;
    padding: 0;
    margin: 0;
    flex-shrink: 0;
    width: calc(24px * var(--wac-scale, 1));
    height: calc(24px * var(--wac-scale, 1));
    border-radius: 50%;
    display: inline-flex;
    align-items: center;
    justify-content: center;
    color: var(--secondary-text-color);
    opacity: 0.6;
    transition: opacity 0.2s, background 0.2s;
    --mdc-icon-size: calc(18px * var(--wac-scale, 1));
  }
  .dismiss-button:hover,
  .dismiss-button:focus-visible {
    opacity: 1;
    background: rgba(var(--rgb-primary-text-color, 128, 128, 128), 0.08);
    outline: none;
  }
  .alert-header-row:not(.compact-row) > .dismiss-button {
    position: absolute;
    top: 6px;
    right: 6px;
    margin-left: 0;
  }
  .compact-row > .dismiss-button {
    margin-left: 4px;
  }
  .dismiss-button.labeled {
    border-left: 1px solid var(--divider-color);
    border-bottom: 1px solid var(--divider-color);
    border-radius: 12px;
    padding: 2px 8px 2px 4px;
    color: var(--secondary-text-color);
    opacity: 1;
    gap: 4px;
    font-size: calc(0.78rem * var(--wac-scale, 1));
    width: auto;
    height: auto;
    --mdc-icon-size: calc(16px * var(--wac-scale, 1));
  }
  .dismiss-button.labeled:hover,
  .dismiss-button.labeled:focus-visible {
    background: rgba(var(--rgb-primary-text-color, 128, 128, 128), 0.08);
    opacity: 1;
  }
  .alert-header-row:not(.compact-row) > .dismiss-button.labeled {
    position: absolute;
    top: 0px;
    right: 0px;
    margin-left: 0;
  }
  .compact-row > .dismiss-button.labeled {
    border: none;
    border-radius: 50%;
    padding: 0;
    color: var(--secondary-text-color);
    gap: 0;
    font-size: inherit;
    width: calc(24px * var(--wac-scale, 1));
    height: calc(24px * var(--wac-scale, 1));
    --mdc-icon-size: calc(18px * var(--wac-scale, 1));
  }
  .compact-row > .dismiss-button.labeled span {
    display: none;
  }
  .alert-card.swipe-enabled {
    touch-action: pan-y;
    cursor: grab;
  }
  .alert-card.swiping {
    transition: none !important;
    user-select: none;
    cursor: grabbing;
  }
  .alert-card.swipe-exit {
    transform: translateX(-110%) !important;
    opacity: 0 !important;
    transition: transform 0.2s ease-in, opacity 0.2s ease-in !important;
  }
  @media (prefers-reduced-motion: reduce) {
    .alert-card.swipe-exit {
      transition: none !important;
    }
  }
  .compact .alert-card {
    margin-bottom: var(--wac-alert-gap, 4px);
    border-radius: var(--wac-alert-border-radius, 8px);
  }
  .compact .alert-card:last-child {
    margin-bottom: 0;
  }
  .compact .alert-card::before {
    display: block;
    top: auto;
    bottom: 0;
    left: -100%;
    right: -100%;
    width: auto;
    height: 4px;
    border-radius: 0;
    z-index: 1;
    --wac-stripe-tile: 12px;
    --wac-stripe-steps: 12;
    --wac-stripe-dur: 3s;
  }
  .compact .alert-header-row.compact-row {
    padding: 8px 12px;
    gap: 10px;
    cursor: pointer;
    user-select: none;
  }
  .compact .alert-header-row.compact-row:hover {
    background: rgba(var(--color-rgb), 0.05);
  }
  .compact .icon-box {
    width: calc(32px * var(--wac-scale, 1));
    height: calc(32px * var(--wac-scale, 1));
  }
  .compact .icon-box ha-icon {
    --mdc-icon-size: calc(18px * var(--wac-scale, 1));
  }
  .compact .alert-title {
    font-size: calc(0.95rem * var(--wac-scale, 1));
    flex-grow: 1;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
  }
  .compact-time {
    font-size: calc(0.8rem * var(--wac-scale, 1));
    color: var(--wac-fg);
    font-weight: 600;
    white-space: nowrap;
    flex-shrink: 0;
  }
  .compact-chevron {
    color: var(--secondary-text-color);
    transition: transform 0.2s;
    flex-shrink: 0;
    --mdc-icon-size: calc(20px * var(--wac-scale, 1));
  }
  .compact-chevron.expanded {
    transform: rotate(180deg);
  }
  .compact .alert-expanded {
    padding-top: 4px;
    border-top: 1px solid var(--divider-color);
  }
  .compact .alert-card::after {
    content: "";
    position: absolute;
    bottom: 0;
    left: 0;
    width: var(--progress, 0%);
    height: 4px;
    background: var(--secondary-background-color);
    z-index: 2;
  }
  .compact .ongoing.alert-card::after {
    width: 100%;
    z-index: 0;
  }
  .compact .active.alert-card::before {
    background-color: var(--wac-progress-fg);
  }
  .compact .expired.alert-card::before {
    background-color: var(--divider-color);
  }
  .compact .preparation.alert-card::before {
    background-color: var(--wac-progress-fg);
    --wac-flow: -1;
  }
  .compact .preparation.deco-striped.alert-card::before,
  .compact .active.deco-striped.alert-card::before,
  .compact .ongoing.deco-striped.alert-card::before {
    background-color: var(--secondary-background-color);
  }
  .compact .ongoing.alert-card::before {
    background-color: var(--wac-progress-fg);
  }
  .timeline-body {
    --wac-tl-gutter: clamp(96px, 40%, 280px);
    --wac-tl-row: calc(36px * var(--wac-scale, 1));
    --wac-tl-axis: calc(18px * var(--wac-scale, 1));
    --wac-tl-gap: 4px;
    --wac-tl-bar: calc(10px * var(--wac-scale, 1));
    --wac-tl-arrow-len: calc(7px * var(--wac-scale, 1));
    --wac-tl-now-color: var(--primary-text-color);
    padding: 12px 16px;
    display: flex;
    flex-direction: column;
    gap: var(--wac-tl-gap);
  }
  .timeline-body.headed {
    padding-top: 4px;
  }
  .timeline-axis,
  .timeline .alert-card {
    display: grid;
    grid-template-columns: var(--wac-tl-gutter) minmax(0, 1fr);
    align-items: center;
    column-gap: 10px;
  }
  .timeline-body.dismissable .timeline-axis,
  .timeline-body.dismissable .alert-card {
    grid-template-columns: var(--wac-tl-gutter) minmax(0, 1fr) auto;
  }
  .timeline-dismiss-spacer {
    width: calc(24px * var(--wac-scale, 1));
  }
  .timeline .alert-card {
    margin: 0;
    padding: 0;
    border: none;
    border-radius: var(--wac-alert-border-radius, 8px);
    box-shadow: none;
    background: transparent;
    min-height: var(--wac-tl-row);
    overflow: visible;
  }
  .timeline .alert-card::before,
  .timeline .alert-card::after {
    content: none;
  }
  .timeline .alert-card.tappable:hover {
    background: rgba(var(--color-rgb), 0.05);
  }
  .timeline-gutter {
    display: flex;
    align-items: center;
    gap: 8px;
    min-width: 0;
  }
  .timeline-gutter-text {
    display: flex;
    flex-direction: column;
    min-width: 0;
    line-height: 1.25;
  }
  .timeline-time {
    font-size: calc(0.7rem * var(--wac-scale, 1));
    color: var(--secondary-text-color);
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
  }
  .timeline .icon-box {
    position: relative;
    width: calc(28px * var(--wac-scale, 1));
    height: calc(28px * var(--wac-scale, 1));
  }
  .timeline .icon-box ha-icon {
    --mdc-icon-size: calc(16px * var(--wac-scale, 1));
  }
  .timeline .alert-title {
    font-size: calc(0.9rem * var(--wac-scale, 1));
    font-weight: 500;
    min-width: 0;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
  }
  .timeline .severity-extreme .alert-title,
  .timeline .severity-severe .alert-title {
    font-weight: 600;
  }
  .timeline-lane {
    position: relative;
    height: var(--wac-tl-row);
    min-width: 0;
  }
  .timeline-lane::after {
    content: "";
    position: absolute;
    top: calc(-1 * var(--wac-tl-gap));
    bottom: 0;
    left: var(--wac-tl-now, 11.111%);
    width: 2px;
    margin-left: -1px;
    background: var(--wac-tl-now-color);
    opacity: 0.7;
    pointer-events: none;
    z-index: 2;
  }
  .timeline-bar {
    position: absolute;
    top: 50%;
    height: var(--wac-tl-bar);
    margin-top: calc(var(--wac-tl-bar) / -2);
    min-width: 2px;
    border-radius: calc(var(--wac-tl-bar) / 2);
    background-color: var(--wac-progress-fg);
    z-index: 1;
  }
  .timeline .preparation .timeline-bar {
    background-color: var(--secondary-background-color);
    background-image: linear-gradient(
      -45deg,
      var(--wac-progress-fg) 25%,
      transparent 25%,
      transparent 50%,
      var(--wac-progress-fg) 50%,
      var(--wac-progress-fg) 75%,
      transparent 75%
    );
    background-size: var(--wac-tl-bar) var(--wac-tl-bar);
  }
  .timeline .expired .timeline-bar {
    background-color: var(--divider-color);
  }
  .timeline-span {
    position: absolute;
    top: 0;
    bottom: 0;
    left: calc(-1 * var(--wac-tl-arrow-len));
    right: calc(-1 * var(--wac-tl-arrow-len));
  }
  .timeline-span-lane {
    position: absolute;
    top: 0;
    bottom: 0;
    left: var(--wac-tl-arrow-len);
    right: var(--wac-tl-arrow-len);
  }
  .timeline-row:not(.expired) .timeline-span {
    --wac-tl-elapsed: calc(var(--wac-tl-arrow-len) + (100% - 2 * var(--wac-tl-arrow-len)) * var(--wac-tl-now-f, 0.11111));
    -webkit-mask-image: linear-gradient(to right, rgba(0, 0, 0, 0.4) var(--wac-tl-elapsed), #000 var(--wac-tl-elapsed));
    mask-image: linear-gradient(to right, rgba(0, 0, 0, 0.4) var(--wac-tl-elapsed), #000 var(--wac-tl-elapsed));
  }
  .timeline .severity-extreme,
  .timeline .severity-severe {
    --wac-tl-bar: calc(14px * var(--wac-scale, 1));
  }
  .timeline-day-line {
    position: absolute;
    top: calc(-1 * var(--wac-tl-gap));
    bottom: 0;
    width: 1px;
    background: var(--divider-color);
    pointer-events: none;
  }
  .timeline .ongoing .timeline-span {
    animation: ongoing-pulse 5s infinite;
  }
  .timeline-bar.clip-start {
    border-top-left-radius: 0;
    border-bottom-left-radius: 0;
  }
  .timeline-bar.clip-end {
    border-top-right-radius: 0;
    border-bottom-right-radius: 0;
  }
  .timeline-clip {
    --wac-tl-arrow: calc(var(--wac-tl-bar) / 2 + 2px);
    position: absolute;
    top: 50%;
    z-index: 1;
    width: 0;
    height: 0;
    margin-top: calc(-1 * var(--wac-tl-arrow));
    border-top: var(--wac-tl-arrow) solid transparent;
    border-bottom: var(--wac-tl-arrow) solid transparent;
  }
  .timeline-clip.start {
    left: calc(1px - var(--wac-tl-arrow-len));
    border-right: var(--wac-tl-arrow-len) solid var(--wac-progress-fg);
  }
  .timeline-clip.end {
    right: calc(1px - var(--wac-tl-arrow-len));
    border-left: var(--wac-tl-arrow-len) solid var(--wac-progress-fg);
  }
  .timeline .expired .timeline-clip.start { border-right-color: var(--divider-color); }
  .timeline .expired .timeline-clip.end { border-left-color: var(--divider-color); }
  .timeline-bar.off-axis {
    display: none;
  }
  .timeline-bar.open-end {
    --wac-tl-fade-mid: calc(var(--wac-tl-fade-from, 0%) + (100% - var(--wac-tl-fade-from, 0%)) * 0.25);
    border-top-right-radius: 0;
    border-bottom-right-radius: 0;
    -webkit-mask-image: linear-gradient(to right, #000 var(--wac-tl-fade-from, 0%), rgba(0, 0, 0, 0.35) var(--wac-tl-fade-mid), transparent 100%);
    mask-image: linear-gradient(to right, #000 var(--wac-tl-fade-from, 0%), rgba(0, 0, 0, 0.35) var(--wac-tl-fade-mid), transparent 100%);
  }
  .timeline-axis {
    font-size: calc(0.7rem * var(--wac-scale, 1));
    color: var(--secondary-text-color);
  }
  .timeline-axis .timeline-lane {
    height: var(--wac-tl-axis);
  }
  .timeline-axis .timeline-lane::after {
    content: none;
  }
  .timeline-tick {
    position: absolute;
    top: 0;
    padding-left: 3px;
    line-height: var(--wac-tl-axis);
    white-space: nowrap;
  }
  .timeline-tick::before {
    content: "";
    position: absolute;
    left: 0;
    bottom: 0;
    width: 1px;
    height: 4px;
    background: currentColor;
    opacity: 0.6;
  }
  .timeline-tick.edge {
    padding-left: 0;
    padding-right: 3px;
    transform: translateX(-100%);
  }
  .timeline-tick.edge::before {
    left: auto;
    right: 0;
  }
  .timeline-tick.quiet {
    padding: 0;
  }
  .timeline-tick.day {
    font-weight: 600;
    color: var(--primary-text-color);
  }
  .timeline-now-label {
    position: absolute;
    top: 0;
    left: var(--wac-tl-now, 11.111%);
    padding-left: 6px;
    line-height: var(--wac-tl-axis);
    white-space: nowrap;
    font-weight: 500;
    color: var(--primary-text-color);
  }
  .timeline-now-head {
    position: absolute;
    bottom: -3px;
    left: var(--wac-tl-now, 11.111%);
    width: 0;
    height: 0;
    margin-left: -5px;
    border-left: 5px solid transparent;
    border-right: 5px solid transparent;
    border-top: 6px solid var(--wac-tl-now-color);
    z-index: 3;
  }
  .fill-mode-background:not(.compact) .alert-card::after {
    content: "";
    position: absolute;
    top: 0;
    bottom: 0;
    left: var(--progress, 0%);
    right: 0;
    z-index: 0;
    background: var(--wac-progress-fill-color);
    opacity: var(--wac-progress-fill-opacity);
    transition: left 0.3s ease;
    pointer-events: none;
  }
  .fill-mode-background:not(.compact) .expired.alert-card::after {
    left: 0;
    opacity: var(--wac-progress-fill-expired-opacity);
  }
  .fill-mode-background .progress-track {
    display: none;
  }
  .fill-mode-background.compact .alert-card::before {
    top: 0;
    height: auto;
    left: var(--progress, 0%);
    right: 0;
    transform: none;
    z-index: 0;
    opacity: var(--wac-progress-fill-opacity);
    background-image: none;
    animation: none;
  }
  .fill-mode-background.compact .active.alert-card::before,
  .fill-mode-background.compact .preparation.alert-card::before,
  .fill-mode-background.compact .ongoing.alert-card::before {
    background-color: var(--wac-progress-fill-color);
  }
  .fill-mode-background.compact .expired.alert-card::before {
    left: 0;
    background-color: var(--wac-progress-fill-color);
    opacity: var(--wac-progress-fill-expired-opacity);
  }
  .fill-mode-background.compact .alert-card::after {
    display: none;
  }
  .fill-mode-background .alert-header-row,
  .fill-mode-background .alert-expanded,
  .fill-mode-background .progress-section,
  .fill-mode-background .alert-details-section {
    position: relative;
    z-index: 1;
  }
  .no-animations .alert-card {
    animation: none !important;
  }
  .no-animations .pulse-ring {
    display: none;
  }
  .no-animations .timeline-span {
    animation: none !important;
  }
  .no-animations .progress-fill,
  .no-animations .progress-fill::after,
  .no-animations .alert-card::before,
  .no-animations .alert-card::after {
    animation: none !important;
    transition: none !important;
  }
  .no-animations .deco-shimmer .progress-fill::after,
  .no-animations.compact:not(.fill-mode-background) .deco-shimmer.alert-card::before {
    transform: translateX(calc(var(--wac-flow, 1) * -16.667%)) !important;
  }
  .preview-label {
    text-align: center;
    font-size: calc(0.75rem * var(--wac-scale, 1));
    font-style: italic;
    color: var(--secondary-text-color);
    padding: 8px 16px 0;
    opacity: 0.7;
  }
  dialog.detail-dialog {
    width: min(560px, 92vw);
    max-width: min(560px, 92vw);
    max-height: 86vh;
    padding: 0;
    border: none;
    border-radius: var(--ha-card-border-radius, 12px);
    background: var(--ha-card-background, var(--card-background-color, #fff));
    color: var(--primary-text-color);
    box-shadow: 0 8px 32px rgba(0, 0, 0, 0.35);
    overflow: hidden;
  }
  dialog.detail-dialog::backdrop {
    background: rgba(0, 0, 0, 0.55);
  }
  .detail-dialog-close {
    flex: none;
    display: inline-flex;
    align-items: center;
    justify-content: center;
    width: calc(32px * var(--wac-scale, 1));
    height: calc(32px * var(--wac-scale, 1));
    padding: 0;
    margin: 0;
    border: none;
    border-radius: 50%;
    background: transparent;
    color: var(--secondary-text-color);
    cursor: pointer;
  }
  .detail-dialog-close:hover {
    background: var(--secondary-background-color);
  }
  .detail-dialog-close:focus-visible {
    outline: 2px solid var(--wac-focus-ring, var(--primary-color));
    outline-offset: 2px;
  }
  .detail-dialog-close ha-icon {
    --mdc-icon-size: calc(20px * var(--wac-scale, 1));
  }
  .detail-dialog-body {
    max-height: 86vh;
    overflow-y: auto;
    overscroll-behavior: contain;
  }
  .detail-dialog-body .alert-card {
    margin-bottom: 0;
    border: none;
    border-radius: 0;
    box-shadow: none;
  }
  .no-alerts {
    padding: 20px;
    text-align: center;
    font-style: italic;
    color: var(--secondary-text-color);
  }
  .no-alerts ha-icon {
    margin-bottom: 10px;
  }
  .no-alerts-caveat {
    display: flex;
    justify-content: center;
    align-items: center;
    gap: 6px;
    margin-top: 12px;
    font-style: normal;
    font-size: 0.9em;
    color: var(--primary-text-color);
  }
  .no-alerts-caveat ha-icon {
    color: var(--warning-color);
    --mdc-icon-size: 16px;
    margin-bottom: 0;
  }
`,go=e=>e==null?E:e
/**
* @license
* Copyright 2018 Google LLC
* SPDX-License-Identifier: BSD-3-Clause
*/
;function X(e,t,n,r){return{kind:`toggle`,key:e,panel:t,default:n,on:!0,off:!1,label:r}}function Z(e,t,n,r,i){return{kind:`select`,key:e,panel:t,default:n,label:r,options:i}}const Q=(e,...t)=>t.map(t=>({value:t,label:`${e}${t.replace(/-/g,`_`)}`})),_o=[X(`showProvider`,`appearance`,!1,`editor.show_provider`),X(`providerColors`,`appearance`,!1,`editor.provider_colors`),X(`animations`,`appearance`,!0,`editor.animations`),X(`reformatText`,`advanced`,!0,`editor.reformat_text`),X(`showDetails`,`details`,!0,`editor.show_details`),X(`expandDetails`,`details`,!1,`editor.expand_details`),X(`showMetadata`,`details`,!0,`editor.show_metadata`),X(`showDescription`,`details`,!0,`editor.show_description`),X(`showInstructions`,`details`,!0,`editor.show_instructions`),X(`showGeometry`,`details`,!1,`editor.show_geometry`),X(`showMyLocation`,`details`,!1,`editor.show_my_location`),X(`showSourceLink`,`details`,!0,`editor.show_source_link`),X(`deduplicate`,`advanced`,!0,`editor.deduplicate`),X(`deduplicateHeadlines`,`advanced`,!0,`editor.deduplicate_headlines`),X(`hideExpired`,`behavior`,!0,`editor.hide_expired`),X(`allowDismiss`,`dismissal`,!1,`editor.allow_dismiss`),X(`showDismissUndo`,`dismissal`,!0,`editor.show_dismiss_undo`)],vo=[Z(`provider`,`advanced`,`auto`,`editor.provider`,Q(`editor.provider_`,`auto`,`nws`,`bom`,`meteoalarm`,`dwd`,`nina`,`meteoswiss`,`eccc`,`nsw_rfs`,`inmet`,`pirateweather`,`cap`)),Z(`minSeverity`,`filtering`,`all`,`editor.min_severity`,Q(`editor.severity_`,`all`,`minor`,`moderate`,`severe`,`extreme`)),Z(`colorTheme`,`appearance`,`severity`,`editor.color_theme`,Q(`editor.color_`,`severity`,`nws`,`meteoalarm`,`eccc`)),Z(`enhanceContrast`,`advanced`,`subtle`,`editor.enhance_contrast`,Q(`editor.enhance_contrast_`,`off`,`subtle`,`strict`)),Z(`layout`,`appearance`,`default`,`editor.layout`,Q(`editor.layout_`,`default`,`compact`,`timeline`)),Z(`timelineHorizon`,`appearance`,`auto`,`editor.timeline_horizon`,Q(`editor.timeline_horizon_`,...$e)),Z(`fontSize`,`appearance`,`default`,`editor.font_size`,Q(`editor.font_size_`,`small`,`default`,`large`,`x-large`)),Z(`progressFill`,`appearance`,`track`,`editor.progress_fill`,Q(`editor.progress_fill_`,`track`,`background`)),Z(`geometryStyle`,`details`,`shape`,`editor.geometry_style`,Q(`editor.geometry_style_`,`shape`,`map`)),Z(`sortOrder`,`behavior`,`default`,`editor.sort_order`,Q(`editor.sort_`,`default`,`onset`,`severity`,`distance`)),Z(`timezone`,`advanced`,`server`,`editor.timezone`,Q(`editor.tz_`,`server`,`browser`)),Z(`unavailableBehavior`,`behavior`,`message`,`editor.unavailable_behavior`,Q(`editor.unavailable_`,`message`,`compact`,`hide`)),Z(`dismissTrigger`,`dismissal`,`button`,`editor.dismiss_trigger`,Q(`editor.dismiss_trigger_`,`button`,`swipe`,`both`)),Z(`dismissButtonStyle`,`dismissal`,`icon`,`editor.dismiss_button_style`,Q(`editor.dismiss_button_style_`,`icon`,`labeled`))],yo=Object.fromEntries(_o.map(e=>[e.key,e])),bo=Object.fromEntries(vo.map(e=>[e.key,e])),xo={...yo,...bo},So={source:[`entity`,`entities`,`device`,`devices`,`sources`,`title`],filtering:[`zones`,`eventCodes`,`excludeEventCodes`,`minSeverity`,`maxDistanceKm`,`myLocationEntity`],appearance:[`layout`,`timelineHorizon`,`colorTheme`,`providerColors`,`fontSize`,`animations`,`showProvider`,`progressFill`,`progressStyle`,`iconBorderStyle`],details:[`showDetails`,`expandDetails`,`showMetadata`,`showDescription`,`showInstructions`,`showGeometry`,`geometryStyle`,`showMyLocation`,`showSourceLink`],behavior:[`tap_action`,`sortOrder`,`hideExpired`,`hideNoAlerts`,`unavailableBehavior`],dismissal:[`allowDismiss`,`dismissTrigger`,`dismissButtonStyle`,`showDismissUndo`],advanced:[`provider`,`timezone`,`reformatText`,`deduplicate`,`deduplicateHeadlines`,`enhanceContrast`]},Co={source:`editor.section_source`,filtering:`editor.section_filtering`,appearance:`editor.section_appearance`,details:`editor.section_detail_panel`,behavior:`editor.section_behavior`,dismissal:`editor.section_dismissal`,advanced:`editor.section_advanced`},wo=[`showMetadata`,`showDescription`,`showInstructions`,`showSourceLink`,`showGeometry`],To=[`progressFill`,`progressStyle`,`iconBorderStyle`];function Eo(e,t){var n;return(n=e[t])==null?xo[t].default:n}function Do(e,t){return Eo(e,t)===xo[t].default}function Oo(e,t){return Eo(e,t.key)===t.on}function ko(e,t,n){if(n===Eo(e,t))return e;let r={...e};return n===xo[t].default?delete r[t]:r[t]=n,r}function Ao(e,t){return t.filter(t=>t in xo?!Do(e,t):e[t]!==void 0)}function jo(e,t){return Ao(e,[t]).length===1}const Mo={zones:`editor.zones`,eventCodes:`editor.event_codes`,excludeEventCodes:`editor.exclude_event_codes`,maxDistanceKm:`editor.max_distance`,myLocationEntity:`editor.my_location_entity`,progressStyle:`editor.progress_style`,iconBorderStyle:`editor.icon_border_style`,tap_action:`editor.tap_action`,hideNoAlerts:`editor.hide_no_alerts`};function No(e){return e.replace(/\s*\([^)]*\)\s*$/,``)}var Po;let Fo=Po=class extends O{constructor(...e){super(...e),this._showPreview=!1,this._subscribedDismissalsScope=``,this._registryEntries=null,this._onRestoreAll=()=>{let e=this._currentScopeHash();e&&(Ua(e),this.requestUpdate())}}disconnectedCallback(){var e;super.disconnectedCallback(),(e=this._unsubscribeDismissals)==null||e.call(this),this._unsubscribeDismissals=void 0,this._subscribedDismissalsScope=``,this._teardownRegistrySubscription()}updated(e){super.updated(e);let t=this._currentScopeHash();if(t!==this._subscribedDismissalsScope){var n;(n=this._unsubscribeDismissals)==null||n.call(this),this._unsubscribeDismissals=void 0,this._subscribedDismissalsScope=t,t&&(this._unsubscribeDismissals=Ra(t,()=>this.requestUpdate()))}this.isConnected&&this._maybeSubscribeRegistry()}_maybeSubscribeRegistry(){var e,t;if(q(this._config).length===0){this._teardownRegistrySubscription();return}let n=(e=this.hass)==null?void 0:e.connection;n&&n!==this._subscribedRegistryConn&&((t=this._unsubscribeRegistry)==null||t.call(this),this._unsubscribeRegistry=void 0,this._subscribedRegistryConn=n,Oa(n,e=>{this._registryEntries=e,this.requestUpdate()}).then(e=>{this._subscribedRegistryConn===n?this._unsubscribeRegistry=e:e()}).catch(()=>{this._subscribedRegistryConn===n&&(this._subscribedRegistryConn=void 0)}))}_teardownRegistrySubscription(){var e;(e=this._unsubscribeRegistry)==null||e.call(this),this._unsubscribeRegistry=void 0,this._subscribedRegistryConn=void 0}get _lang(){var e;return((e=this.hass)==null||(e=e.locale)==null?void 0:e.language)||`en`}_selectValue(e){var t,n;return(t=(n=e.detail)==null?void 0:n.value)==null?``:t}_renderSelectItem(e,t){return T`<ha-dropdown-item value=${e}>${t}</ha-dropdown-item>`}get _useHaInput(){if(Po._haInput!==void 0)return Po._haInput;let e=!!customElements.get(`ha-input`),t=!!customElements.get(`ha-textfield`);return e||t?(Po._haInput=e,e):!0}get _useHaFormfield(){return Po._haFormfield||(Po._haFormfield=!!customElements.get(`ha-formfield`))}_renderSwitch(e,t,n){return this._useHaFormfield?T`
        <ha-formfield .label=${e}>
          <ha-switch .checked=${t} @change=${n}></ha-switch>
        </ha-formfield>
      `:T`
        <ha-switch .checked=${t} @change=${n}>
          <span class="switch-label">${e}</span>
        </ha-switch>
      `}_renderTextField(e){var t,n;return this._field(e.changed===!0,this._useHaInput?T`
        <ha-input
          .label=${e.label}
          .value=${e.value}
          .hint=${(t=e.helper)==null?``:t}
          type=${go(e.type)}
          min=${go(e.min)}
          step=${go(e.step)}
          @change=${e.onChange}
        ></ha-input>
      `:T`
        <ha-textfield
          .label=${e.label}
          .value=${e.value}
          .helper=${(n=e.helper)==null?``:n}
          .helperPersistent=${e.helper!==void 0}
          type=${go(e.type)}
          min=${go(e.min)}
          step=${go(e.step)}
          @change=${e.onChange}
        ></ha-textfield>
      `,e.onReset)}setConfig(e){this._config=ar(e),this._showPreview=!!e._preview}_fireConfigChanged(e){this._config=e;let t=new CustomEvent(`config-changed`,{detail:{config:e},bubbles:!0,composed:!0});this.dispatchEvent(t)}_getMatchingEntityIds(){var e,t;let n=q(this._config),r=[...this._getSelectedEntities(),...n.map(e=>`device:${e}`)].join(`,`);if(this._cachedHass===this.hass&&this._cachedConfigKey===r&&this._cachedEntityIds)return this._cachedEntityIds;this._cachedHass=this.hass,this._cachedConfigKey=r;let i=/* @__PURE__ */ new Set;for(let e of n)for(let t of Ea(this.hass,e,this._registryEntries))i.add(t);let a=[];for(let[e,t]of Object.entries(this.hass.states))(e.startsWith(`sensor.`)||e.startsWith(`binary_sensor.`)||e.startsWith(`geo_location.`))&&(i.has(e)||(ya.some(t=>t.test(e))||ba(t.attributes))&&a.push(e));if((e=this._config)!=null&&e.entity&&!a.includes(this._config.entity)&&a.push(this._config.entity),(t=this._config)!=null&&t.entities)for(let e of this._config.entities)e&&!a.includes(e)&&a.push(e);return this._cachedEntityIds=a,a}_getSelectedEntities(){var e,t;let n=[];if((e=this._config)!=null&&e.entity&&n.push(this._config.entity),(t=this._config)!=null&&t.entities)for(let e of this._config.entities)e&&!n.includes(e)&&n.push(e);return n}_hasNoRealAlerts(){var e;if(!this.hass||!((e=this._config)!=null&&e.entity))return!1;let t=this._getSelectedEntities(),n=0;for(let e of t){let t=this.hass.states[e];if(t&&(t.state===`unknown`||t.state===`unavailable`||(n++,t.state!==`0`&&t.state!==`off`)))return!1}return n>0}_isEntityMismatch(){var e,t;if(!((e=this._config)!=null&&e.entity))return!1;let n=(t=this.hass)==null?void 0:t.states[this._config.entity];return!n||ya.some(e=>e.test(this._config.entity))?!1:!ba(n.attributes)}_renderEntityWarning(e){return this._isEntityMismatch()?T`<ha-alert alert-type="warning">${V(`editor.entity_warning`,e)}</ha-alert>`:E}_renderNoEntitiesHint(e){let t=q(this._config);if(t.length>0&&this.hass){let n=this.hass.devices,r=n?t.filter(e=>!n[e]):[],i=r.length>0?T`<ha-alert alert-type="warning"
            >${V(`editor.devices_missing_warning`,e,{ids:r.join(`, `)})}</ha-alert
          >`:E;return t.some(e=>wa(this.hass,e,this._registryEntries).length>0)||r.length===t.length?i:T`${i}<ha-alert alert-type="info">${V(`editor.no_device_alerts_hint`,e)}</ha-alert>`}return this._getMatchingEntityIds().some(e=>{var t;return(t=this.hass)==null?void 0:t.states[e]})?E:T`<ha-alert alert-type="info">${V(`editor.no_entities_hint`,e)} <a href="https://github.com/seevee/weather_alerts_card#supported-providers" target="_blank" rel="noopener">${V(`editor.no_entities_hint_link`,e)}</a></ha-alert>`}_renderSourceHint(e){var t;let n=(t=this._config)==null?void 0:t.sources;if(!n||n.length===0||!this.hass)return E;let r=new Set(n),i=/* @__PURE__ */ new Set,a=0;for(let e of Object.values(this.hass.states)){var o;let t=(o=e.attributes)==null?void 0:o.source;typeof t==`string`&&r.has(t)&&(i.add(t),a++)}let s=n.filter(e=>!i.has(e));if(s.length>0){let t=xa(),n=s.map(n=>{let r=t.find(e=>e.source===n);return r?V(`editor.provider_${r.provider}`,e):n});return T`<ha-alert alert-type="warning"
        >${V(`editor.feeds_missing_warning`,e,{feeds:n.join(`, `)})}</ha-alert
      >`}return T`<ha-alert alert-type="info">${V(`editor.source_hint`,e,{count:a})}</ha-alert>`}_entityChanged(e){let t=e.detail.value,n=Array.isArray(t)?t:t?[t]:[],r={...this._config};if(r.entity=n[0]||``,n.length>1?r.entities=n.slice(1):delete r.entities,r.hideNoAlerts){let e=this._syncMultiEntityVisibility(r);e?r.visibility=e:delete r.visibility}this._fireConfigChanged(r)}_deviceChanged(e){let t=e.detail.value,n=Array.isArray(t)?t:t?[t]:[],r=[];for(let e of n)typeof e==`string`&&e&&!r.includes(e)&&r.push(e);let i=q(this._config);if(r.length===i.length&&r.every((e,t)=>e===i[t]))return;let a={...this._config},[o,...s]=r;o===void 0?delete a.device:a.device=o,s.length>0?a.devices=s:delete a.devices,this._fireConfigChanged(a)}_titleChanged(e){let t=e.target.value;if(t===(this._config.title||``))return;let n={...this._config};t?n.title=t:delete n.title,this._fireConfigChanged(n)}_feedsChanged(e){let t=e.detail.value,n=Array.isArray(t)?t:t?[t]:[],r={...this._config};n.length>0?r.sources=n:delete r.sources,this._fireConfigChanged(r)}_myLocationEntityChanged(e){var t,n;let r=(t=e.detail)==null?void 0:t.value,i=typeof r==`string`?r.trim():``;if(i===((n=this._config.myLocationEntity)==null?``:n))return;let a={...this._config};i?a.myLocationEntity=i:delete a.myLocationEntity,this._fireConfigChanged(a)}_showsMyLocationEntityControl(){var e;return this._showsRadiusControl()||((e=this._config)==null?void 0:e.showGeometry)===!0}_currentScopeHash(){return Fa(this._config)}_getDismissedCount(){let e=this._currentScopeHash();return e?za(e).size:0}_hideNoAlertsChanged(e){this._setHideNoAlerts(e.target.checked)}_setHideNoAlerts(e){if(e===(this._config.hideNoAlerts===!0))return;let t={...this._config};e?t.hideNoAlerts=!0:delete t.hideNoAlerts;let n=this._syncMultiEntityVisibility(t);n?t.visibility=n:delete t.visibility,this._fireConfigChanged(t)}_buildEntityCondition(e){return e.startsWith(`binary_sensor.`)?{condition:`state`,entity:e,state:`on`}:{condition:`state`,entity:e,state_not:`0`}}_isManagedCondition(e,t){if(e.condition===`state`&&typeof e.entity==`string`&&t.has(e.entity)&&(`state_not`in e||`state`in e))return!0;if(e.condition===`or`&&Array.isArray(e.conditions)){let t=e.conditions;return t.length>0&&t.every(e=>e.condition===`state`&&typeof e.entity==`string`&&(`state_not`in e&&e.state_not===`0`||`state`in e&&e.state===`on`))}return!1}_syncMultiEntityVisibility(e){var t;let n=/* @__PURE__ */ new Set;e.entity&&n.add(e.entity),e.entities&&e.entities.forEach(e=>n.add(e));let r=new Set(n),i=this._config;i!=null&&i.entity&&r.add(i.entity),i==null||(t=i.entities)==null||t.forEach(e=>r.add(e));let a=(e.visibility||[]).filter(e=>!this._isManagedCondition(e,r));if(e.hideNoAlerts&&n.size>0){let e=[...n].map(e=>this._buildEntityCondition(e)),[t,...r]=e;t!==void 0&&r.length===0?a.push(t):a.push({condition:`or`,conditions:e})}return a.length>0?a:void 0}_zonesChanged(e){let t=e.target.value,n={...this._config};t.trim()?n.zones=t.split(`,`).map(e=>e.trim()).filter(Boolean):delete n.zones,this._fireConfigChanged(n)}_eventCodesChanged(e){let t=e.target.value,n={...this._config};t.trim()?n.eventCodes=t.split(`,`).map(e=>e.trim().toUpperCase()).filter(Boolean):delete n.eventCodes,this._fireConfigChanged(n)}_excludeEventCodesChanged(e){let t=e.target.value,n={...this._config};t.trim()?n.excludeEventCodes=t.split(`,`).map(e=>e.trim().toUpperCase()).filter(Boolean):delete n.excludeEventCodes,this._fireConfigChanged(n)}_tapActionChanged(e){var t,n;let r=this._selectValue(e);if(r===((t=(n=this._config.tap_action)==null?void 0:n.action)==null?`default`:t))return;let i={...this._config};if(r==="default")delete i.tap_action;else{var a;let e={...(a=i.tap_action)==null?{}:a,action:r};r!==`navigate`&&delete e.navigation_path,r!==`url`&&delete e.url_path,i.tap_action=e}this._fireConfigChanged(i)}_tapNavigationPathChanged(e){this._tapSubFieldChanged(`navigation_path`,e.target.value)}_tapUrlPathChanged(e){this._tapSubFieldChanged(`url_path`,e.target.value)}_tapSubFieldChanged(e,t){let n=this._config.tap_action;if(!n||t===(n[e]||``))return;let r={...n};t?r[e]=t:delete r[e],this._fireConfigChanged({...this._config,tap_action:r})}_progressStyleChanged(e,t){this._setProgressStyle(e,this._selectValue(t))}_setProgressStyle(e,t){var n,r,i;if(t===((n=(r=this._config.progressStyle)==null?void 0:r[e])==null?tt[e]:n))return;let a={...this._config},o={...(i=a.progressStyle)==null?{}:i};t===tt[e]?delete o[e]:o[e]=t,Object.keys(o).length===0?delete a.progressStyle:a.progressStyle=o,this._fireConfigChanged(a)}_iconBorderStyleChanged(e,t){this._setIconBorderStyle(e,this._selectValue(t))}_setIconBorderStyle(e,t){var n,r,i;if(t===((n=(r=this._config.iconBorderStyle)==null?void 0:r[e])==null?nt[e]:n))return;let a={...this._config},o={...(i=a.iconBorderStyle)==null?{}:i};t===nt[e]?delete o[e]:o[e]=t,Object.keys(o).length===0?delete a.iconBorderStyle:a.iconBorderStyle=o,this._fireConfigChanged(a)}_lengthUnit(){var e;return pr((e=this.hass)==null||(e=e.config)==null||(e=e.unit_system)==null?void 0:e.length)}_showsRadiusControl(){var e,t,n,r,i,a,o;if(((e=this._config)==null?void 0:e.maxDistanceKm)!==void 0)return!0;let s=Sa();if((t=this._config)!=null&&t.provider&&s.has(this._config.provider))return!0;let c=new Set((n=(r=this._config)==null?void 0:r.sources)==null?[]:n);if(xa().some(e=>c.has(e.source)&&s.has(e.provider))||((i=this._config)!=null&&i.device||((a=(o=this._config)==null||(o=o.devices)==null?void 0:o.length)==null?0:a)>0)&&s.has(`cap`))return!0;for(let e of this._getSelectedEntities()){var l,u,d;let t=(l=this.hass)==null?void 0:l.states[e];if(t&&s.has(Ca((u=this._config)==null?void 0:u.provider,(d=t.attributes)==null?{}:d).provider))return!0}return!1}_maxDistanceChanged(e){let t=e.target.value,n={...this._config};if(t.trim()===``){if(this._config.maxDistanceKm===void 0)return;delete n.maxDistanceKm,this._fireConfigChanged(n);return}let r=Number(t);if(!Number.isFinite(r)||r<=0)return;let i=fr(r,this._lengthUnit());i!==this._config.maxDistanceKm&&(n.maxDistanceKm=i,this._fireConfigChanged(n))}_previewChanged(e){let t=e.target;this._showPreview=t.checked;let n={...this._config};this._showPreview?n._preview=!0:delete n._preview,this._fireConfigChanged(n)}_writeKey(e,t){let n=ko(this._config,e,t);n!==this._config&&this._fireConfigChanged(n)}_field(e,t,n){return T`
      <div class="field ${e?`changed`:``}">
        ${t}
        ${e&&n?this._resetLink(n):E}
      </div>
    `}_resetLink(e){let t=t=>{t.preventDefault(),e()};return T`
      <a
        class="reset-link"
        role="button"
        tabindex="0"
        @click=${t}
        @keydown=${e=>{(e.key===`Enter`||e.key===` `)&&t(e)}}
      >${V(`editor.reset_default`,this._lang)}</a>
    `}_resetKeys(e){let t=this._config;for(let n of e)n in xo?t=ko(t,n,xo[n].default):t[n]!==void 0&&(t={...t},delete t[n]);t!==this._config&&this._fireConfigChanged(t)}_renderAlsoSet(e,t){let n=Ao(this._config,e);if(n.length===0)return E;let r=n.map(e=>this._keyLabel(e,t)).join(` · `);return T`
      <div class="also-set">
        ${V(`editor.also_set`,t,{names:r})}
        ${this._resetLink(()=>this._resetKeys(n))}
      </div>
    `}_optionLabel(e,t,n){let r=V(e,n);return t&&!e.endsWith(`_default`)?V(`editor.option_default`,n,{label:r}):r}_renderToggle(e){let t=yo[e];return this._field(jo(this._config,e),this._renderSwitch(V(t.label,this._lang),Oo(this._config,t),n=>this._writeKey(e,n.target.checked?t.on:t.off)),()=>this._resetKeys([e]))}_renderSelect(e){let t=bo[e],n=this._lang;return this._field(jo(this._config,e),T`
      <ha-select
        .label=${V(t.label,n)}
        .value=${Eo(this._config,e)}
        @selected=${t=>this._writeKey(e,this._selectValue(t))}
      >
        ${t.options.map(e=>this._renderSelectItem(e.value,this._optionLabel(e.label,e.value===t.default,n)))}
      </ha-select>
    `,()=>this._resetKeys([e]))}_keyLabel(e,t){let n=e in xo?xo[e].label:Mo[e];return No(n?V(n,t,{unit:``}):String(e))}_changedSummary(e,t){let n=Ao(this._config,e);if(n.length===0)return``;let r=n.slice(0,3).map(e=>this._keyLabel(e,t)),i=n.length-r.length;return i>0?`${r.join(` · `)} ${V(`editor.panel_more`,t,{count:i})}`:r.join(` · `)}_renderPanel(e,t,n,r){return T`
      <ha-expansion-panel
        outlined
        .expanded=${t}
        .header=${V(Co[e],n)}
        .secondary=${e===`source`?``:this._changedSummary(So[e],n)}
      >
        <div class="content">${r}</div>
      </ha-expansion-panel>
    `}render(){if(!this.hass||!this._config)return T``;let e=this._lang;return T`
      <div class="editor">
        ${this._renderPreviewTools(e)}
        ${this._renderPanel(`source`,!0,e,this._renderSourceSection(e))}
        ${this._renderPanel(`filtering`,!1,e,this._renderFilteringSection(e))}
        ${this._renderPanel(`appearance`,!1,e,this._renderAppearanceSection(e))}
        ${this._renderPanel(`details`,!1,e,this._renderDetailsSection(e))}
        ${this._renderPanel(`behavior`,!1,e,this._renderBehaviorSection(e))}
        ${this._renderPanel(`dismissal`,!1,e,this._renderDismissalSection(e))}
        ${this._renderPanel(`advanced`,!1,e,this._renderAdvancedSection(e))}
      </div>
    `}_renderPreviewTools(e){return T`
      <div class="preview-tools">
        ${this._renderSwitch(V(`editor.show_preview`,e),this._showPreview,this._previewChanged)}
        ${this._hasNoRealAlerts()&&!this._showPreview?T`<div class="preview-nudge">${V(`editor.preview_nudge`,e)}</div>`:T`<div class="preview-hint">${V(`editor.preview_hint`,e)}</div>`}
      </div>
    `}_renderSourceSection(e){var t,n;let r=/* @__PURE__ */ new Set;for(let e of Object.values(this.hass.states)){var i;let t=(i=e.attributes)==null?void 0:i.source;typeof t==`string`&&r.add(t)}let a=new Set((t=this._config.sources)==null?[]:t),o=xa().filter(e=>r.has(e.source)||a.has(e.source)).map(t=>({value:t.source,label:V(`editor.provider_${t.provider}`,e)}));return T`
      <ha-selector
        .hass=${this.hass}
        .selector=${{entity:{multiple:!0,include_entities:this._getMatchingEntityIds()}}}
        .value=${this._getSelectedEntities()}
        .label=${V(`editor.entities`,e)}
        .required=${!q(this._config).length&&!((n=this._config)!=null&&(n=n.sources)!=null&&n.length)}
        @value-changed=${this._entityChanged}
      ></ha-selector>
      ${this._renderEntityWarning(e)}
      ${this._renderNoEntitiesHint(e)}

      <ha-selector
        .hass=${this.hass}
        .selector=${{device:{multiple:!0,filter:[{integration:`cap_alerts`},{integration:`nina`}]}}}
        .value=${q(this._config)}
        .label=${V(`editor.devices`,e)}
        .helper=${V(`editor.devices_helper`,e)}
        .helperPersistent=${!0}
        @value-changed=${this._deviceChanged}
      ></ha-selector>

      ${o.length>0?T`
            <ha-selector
              .hass=${this.hass}
              .selector=${{select:{multiple:!0,mode:`list`,options:o}}}
              .value=${this._config.sources||[]}
              .label=${V(`editor.feeds`,e)}
              .helper=${V(`editor.feeds_helper`,e)}
              .helperPersistent=${!0}
              @value-changed=${this._feedsChanged}
            ></ha-selector>
            ${this._renderSourceHint(e)}
          `:E}

      ${this._renderTextField({label:V(`editor.title`,e),value:this._config.title||``,onChange:this._titleChanged})}
    `}_renderFilteringSection(e){let t=this._lengthUnit(),n=this._config.zones?this._config.zones.join(`, `):``,r=this._config.eventCodes?this._config.eventCodes.join(`, `):``,i=this._config.excludeEventCodes?this._config.excludeEventCodes.join(`, `):``;return T`
      ${this._renderTextField({label:V(`editor.zones`,e),changed:this._config.zones!==void 0,onReset:()=>this._resetKeys([`zones`]),value:n,helper:V(`editor.zones_helper`,e),onChange:this._zonesChanged})}
      ${this._renderTextField({label:V(`editor.event_codes`,e),changed:this._config.eventCodes!==void 0,onReset:()=>this._resetKeys([`eventCodes`]),value:r,helper:V(`editor.event_codes_helper`,e),onChange:this._eventCodesChanged})}
      ${this._renderTextField({label:V(`editor.exclude_event_codes`,e),changed:this._config.excludeEventCodes!==void 0,onReset:()=>this._resetKeys([`excludeEventCodes`]),value:i,helper:V(`editor.exclude_event_codes_helper`,e),onChange:this._excludeEventCodesChanged})}

      ${this._renderSelect(`minSeverity`)}

      ${this._showsRadiusControl()?this._renderTextField({type:`number`,min:`1`,step:`1`,label:V(`editor.max_distance`,e,{unit:t}),changed:this._config.maxDistanceKm!==void 0,onReset:()=>this._resetKeys([`maxDistanceKm`]),value:this._config.maxDistanceKm===void 0?``:String(dr(this._config.maxDistanceKm,t)),helper:V(`editor.max_distance_helper`,e),onChange:this._maxDistanceChanged}):E}

      ${this._showsMyLocationEntityControl()?this._field(this._config.myLocationEntity!==void 0,T`
        <ha-selector
          .hass=${this.hass}
          .selector=${{entity:{domain:[`device_tracker`,`person`,`zone`]}}}
          .value=${this._config.myLocationEntity||``}
          .label=${V(`editor.my_location_entity`,e)}
          .required=${!1}
          .helper=${V(`editor.my_location_entity_helper`,e)}
          .helperPersistent=${!0}
          @value-changed=${this._myLocationEntityChanged}
        ></ha-selector>
      `,()=>this._resetKeys([`myLocationEntity`])):E}
    `}_renderAppearanceSection(e){return T`
      ${this._renderSelect(`layout`)}
      ${this._config.layout===`timeline`?this._renderSelect(`timelineHorizon`):this._renderAlsoSet([`timelineHorizon`],e)}
      ${this._renderSelect(`colorTheme`)}
      ${this._renderToggle(`providerColors`)}
      ${this._renderSelect(`fontSize`)}
      ${this._renderToggle(`showProvider`)}
      ${this._renderToggle(`animations`)}
      ${this._renderStylingGroup(e)}
    `}_renderStylingGroup(e){return T`
      <ha-expansion-panel
        .expanded=${!1}
        .header=${V(`editor.styling_section`,e)}
        .secondary=${this._changedSummary(To,e)}
      >
        <div class="content">
          ${this._config.layout===`timeline`?T`<div class="preview-hint">${V(`editor.timeline_styling_note`,e)}</div>`:E}
          ${this._renderSelect(`progressFill`)}

          <div class="sub-label">${V(`editor.progress_style`,e)}</div>
          ${this._config.progressFill===`background`?T`<div class="preview-hint">${V(`editor.progress_style_wash_note`,e)}</div>`:E}
          <div class="phase-row">
            ${[`preparation`,`active`,`ongoing`].map(t=>{var n,r;return this._field(((n=this._config.progressStyle)==null?void 0:n[t])!==void 0,T`
              <ha-select
                .label=${V(`editor.progress_style_`+t,e)}
                .value=${((r=this._config.progressStyle)==null?void 0:r[t])||tt[t]}
                @selected=${e=>this._progressStyleChanged(t,e)}
              >
                ${[`solid`,`striped`,`shimmer`,`pulse`].map(n=>this._renderSelectItem(n,this._optionLabel(`editor.deco_`+n,n===tt[t],e)))}
              </ha-select>
            `,()=>this._setProgressStyle(t,tt[t]))})}
          </div>

          <div class="sub-label">${V(`editor.icon_border_style`,e)}</div>
          <div class="phase-row">
            ${[`preparation`,`active`,`ongoing`].map(t=>{var n,r;return this._field(((n=this._config.iconBorderStyle)==null?void 0:n[t])!==void 0,T`
              <ha-select
                .label=${V(`editor.progress_style_`+t,e)}
                .value=${((r=this._config.iconBorderStyle)==null?void 0:r[t])||nt[t]}
                @selected=${e=>this._iconBorderStyleChanged(t,e)}
              >
                ${[`dashed`,`solid`].map(n=>this._renderSelectItem(n,this._optionLabel(`editor.icon_border_`+n,n===nt[t],e)))}
              </ha-select>
            `,()=>this._setIconBorderStyle(t,nt[t]))})}
          </div>
        </div>
      </ha-expansion-panel>
    `}_renderDetailsSection(e){if(this._config.showDetails===!1)return T`
        ${this._renderToggle(`showDetails`)}
        ${this._renderAlsoSet(So.details.filter(e=>e!==`showDetails`),e)}
      `;let t=wo.map(t=>({value:t,label:V(yo[t].label,e)+(jo(this._config,t)?` •`:``)}));return T`
      ${this._renderToggle(`showDetails`)}
      ${this._renderToggle(`expandDetails`)}

      <ha-selector
        .hass=${this.hass}
        .selector=${{select:{multiple:!0,mode:`list`,options:t}}}
        .value=${wo.filter(e=>Oo(this._config,yo[e]))}
        .label=${V(`editor.detail_sections`,e)}
        @value-changed=${this._detailSectionsChanged}
      ></ha-selector>

      ${this._config.showGeometry===!0?T`
        ${this._renderSelect(`geometryStyle`)}
        ${this._renderToggle(`showMyLocation`)}
      `:this._renderAlsoSet([`geometryStyle`,`showMyLocation`],e)}
    `}_detailSectionsChanged(e){var t;let n=(t=e.detail)==null?void 0:t.value,r=new Set(Array.isArray(n)?n:[]),i=this._config;for(let e of wo)i=ko(i,e,r.has(e));i!==this._config&&this._fireConfigChanged(i)}_renderBehaviorSection(e){return T`
      ${this._renderTapAction(e)}

      ${this._renderSelect(`sortOrder`)}
      ${this._renderToggle(`hideExpired`)}

      ${this._field(this._config.hideNoAlerts!==void 0,this._renderSwitch(V(`editor.hide_no_alerts`,e),this._config.hideNoAlerts===!0,this._hideNoAlertsChanged),()=>this._setHideNoAlerts(!1))}

      ${this._renderSelect(`unavailableBehavior`)}
      ${this._config.unavailableBehavior===`hide`?T`<ha-alert alert-type="warning">${V(`editor.unavailable_hide_warning`,e)}</ha-alert>`:``}
    `}_renderTapAction(e){var t,n,r;let i=(t=this._config.tap_action)==null?void 0:t.action;return this._field(this._config.tap_action!==void 0,T`
      <ha-select
        .label=${V(`editor.tap_action`,e)}
        .value=${i==null?`default`:i}
        @selected=${this._tapActionChanged}
      >
        ${this._renderSelectItem(`default`,V(`editor.tap_default`,e))}
        ${this._renderSelectItem(`details`,V(`editor.tap_details`,e))}
        ${this._renderSelectItem(`more-info`,V(`editor.tap_more_info`,e))}
        ${this._renderSelectItem(`navigate`,V(`editor.tap_navigate`,e))}
        ${this._renderSelectItem(`url`,V(`editor.tap_url`,e))}
        ${this._renderSelectItem(`toggle`,V(`editor.tap_toggle`,e))}
        ${this._renderSelectItem(`perform-action`,V(`editor.tap_perform_action`,e))}
        ${this._renderSelectItem(`fire-dom-event`,V(`editor.tap_fire_dom_event`,e))}
        ${i===`call-service`?this._renderSelectItem(`call-service`,V(`editor.tap_call_service`,e)):``}
        ${this._renderSelectItem(`none`,V(`editor.tap_none`,e))}
      </ha-select>
      <div class="helper-text">${V(`editor.tap_action_helper`,e)}</div>
      ${i===`navigate`?this._renderTextField({label:V(`editor.tap_navigation_path`,e),value:((n=this._config.tap_action)==null?void 0:n.navigation_path)||``,onChange:this._tapNavigationPathChanged}):``}
      ${i===`url`?this._renderTextField({label:V(`editor.tap_url_path`,e),value:((r=this._config.tap_action)==null?void 0:r.url_path)||``,onChange:this._tapUrlPathChanged}):``}
      ${i===`perform-action`||i===`call-service`||i===`fire-dom-event`?T`<ha-alert alert-type="info">${V(`editor.tap_yaml_managed`,e)}</ha-alert>`:``}
      ${i===`details`&&this._config.expandDetails!==!0?T`<ha-alert alert-type="info">${V(`editor.tap_details_expand_hint`,e)}</ha-alert>`:``}
    `,()=>this._resetKeys([`tap_action`]))}_renderDismissalSection(e){let t=this._config.allowDismiss===!0;return T`
      ${this._renderToggle(`allowDismiss`)}

      ${t?T`
        ${this._renderSelect(`dismissTrigger`)}
        ${this._config.layout===`timeline`?T`<div class="preview-hint">${V(`editor.timeline_dismiss_note`,e)}</div>`:E}
        ${this._config.dismissTrigger===`swipe`?this._renderAlsoSet([`dismissButtonStyle`],e):this._renderSelect(`dismissButtonStyle`)}
        ${this._renderToggle(`showDismissUndo`)}
      `:this._renderAlsoSet(So.dismissal.filter(e=>e!==`allowDismiss`),e)}

      ${this._renderDismissedStatus(e)}
    `}_renderAdvancedSection(e){return T`
      ${this._renderSelect(`provider`)}
      ${this._renderSelect(`timezone`)}
      ${this._renderSelect(`enhanceContrast`)}
      ${this._renderToggle(`reformatText`)}
      ${this._renderToggle(`deduplicate`)}
      ${this._renderToggle(`deduplicateHeadlines`)}
    `}_renderDismissedStatus(e){if(this._config.allowDismiss!==!0)return E;let t=this._getDismissedCount();return t===0?E:T`
      <div class="dismissed-status">
        ${V(t===1?`editor.dismissed_count_singular`:`editor.dismissed_count`,e,{count:t})}
        <a class="restore-link" @click=${this._onRestoreAll} tabindex="0" role="button">
          ${V(`editor.restore_all`,e)}
        </a>
      </div>
    `}};Fo.styles=o`
    .editor {
      display: flex;
      flex-direction: column;
      gap: 16px;
      padding: 16px 0;
    }
    ha-expansion-panel {
      --expansion-panel-content-padding: 0;
    }
    .content {
      display: flex;
      flex-direction: column;
      gap: 16px;
      padding: 12px;
    }
    .field {
      display: flex;
      flex-direction: column;
      gap: 16px;
      margin-left: -11px;
      padding-left: 8px;
      border-left: 3px solid transparent;
    }
    .field.changed {
      border-left-color: var(--primary-color);
    }
    .sub-label {
      font-size: 0.75rem;
      color: var(--secondary-text-color);
      margin-top: 4px;
    }
    .phase-row {
      display: flex;
      flex-wrap: wrap;
      gap: 8px;
    }
    .phase-row ha-select {
      flex: 1 1 110px;
      min-width: 110px;
    }
    .preview-hint,
    .preview-nudge {
      font-size: 0.8rem;
      color: var(--secondary-text-color);
      padding-left: 48px;
      margin-top: 4px;
    }
    .preview-hint {
      opacity: 0.7;
    }
    .dismissed-status {
      font-size: 0.85rem;
      color: var(--secondary-text-color);
      padding-left: 48px;
    }
    .helper-text {
      font-size: 0.8rem;
      color: var(--secondary-text-color);
      margin-top: 4px;
    }
    .restore-link,
    .reset-link {
      color: var(--primary-color);
      cursor: pointer;
      text-decoration: underline;
      margin-left: 4px;
    }
    .restore-link:hover,
    .reset-link:hover {
      text-decoration: none;
    }
    .field > .reset-link {
      align-self: flex-end;
      font-size: 0.8rem;
      margin: -8px 0 0;
    }
    .switch-label {
      color: var(--primary-text-color);
    }
    .also-set {
      font-size: 0.8rem;
      color: var(--secondary-text-color);
      padding-left: 48px;
      margin-top: -8px;
    }
  `,J([qe({attribute:!1})],Fo.prototype,`hass`,void 0),J([k()],Fo.prototype,`_config`,void 0),J([k()],Fo.prototype,`_showPreview`,void 0),Fo=Po=J([We(`weather-alerts-card-editor`)],Fo);var Io;const Lo=6e4,Ro=10;console.info(`%c  WEATHER-ALERTS-CARD  %c  Version 3.9.2  `,`color: white; background: #555; font-weight: bold;`,`color: white; background: #007acc; font-weight: bold;`);const zo={nws:`NWS`,bom:`BoM`,meteoalarm:`MeteoAlarm`,dwd:`DWD`,meteoswiss:`MeteoSwiss`,eccc:`Environment Canada`,pirateweather:`Pirate Weather`,cap:`CAP`,nsw_rfs:`NSW RFS`,inmet:`INMET`,nina:`NINA`},Bo={nws:`NWS`,bom:`BoM`,meteoalarm:`MA`,dwd:`DWD`,meteoswiss:`MS`,eccc:`EC`,pirateweather:`PW`,cap:`CAP`,nsw_rfs:`RFS`,inmet:`INMET`,nina:`NINA`},Vo=/* @__PURE__ */ new Set([`button`,`scene`,`script`,`input_button`]),Ho=`sensor.nws_alerts_alerts`;function Uo(){let e=Date.now()/1e3,t=3600;return[{id:`preview-1`,event:`Gentle Wind Watch`,severity:`minor`,severityLabel:`Minor`,certainty:`Possible`,urgency:`Future`,sentTs:e-1*t,onsetTs:e+1*t,endsTs:e+6*t,description:`A gentle breeze may arrive later. This is sample data showing an upcoming alert.`,instruction:``,url:``,headline:`Gentle Wind Watch for Sampletown County`,areaDesc:`Sampletown County`,zones:[`SAMPLE02`],eventCode:`WIA`,provider:`nws`,phase:``,severityInferred:!0,certaintyInferred:!1},{id:`preview-2`,event:`Sunshine Heat Advisory`,severity:`moderate`,severityLabel:`Moderate`,certainty:`Likely`,urgency:`Expected`,sentTs:e-2*t,onsetTs:e-1*t,endsTs:e+2*t,description:`This is a sample alert demonstrating the card layout. No action required.`,instruction:`Enjoy the weather! This is placeholder data for the card preview.`,url:``,headline:`Sunshine Heat Advisory for Pleasantville`,areaDesc:`Pleasantville, USA`,zones:[`SAMPLE01`],eventCode:`HTA`,provider:`nws`,phase:`Update`,severityInferred:!1,certaintyInferred:!1},{id:`preview-3`,event:`Frost Advisory`,severity:`minor`,severityLabel:`Minor`,certainty:`Likely`,urgency:`Expected`,sentTs:e-8*t,onsetTs:e-6*t,endsTs:e-2*t,description:`A light frost occurred overnight. This is sample data showing an expired alert.`,instruction:``,url:``,headline:`Frost Advisory expired for Pleasantville`,areaDesc:`Pleasantville, USA`,zones:[`SAMPLE01`],eventCode:`FRA`,provider:`nws`,phase:``,severityInferred:!1,certaintyInferred:!0}]}let $=Io=class extends O{constructor(...e){super(...e),this._expandedAlerts=/* @__PURE__ */ new Map,this._forcePreview=!1,this._detailPopupAlertId=null,this._dismissals=/* @__PURE__ */ new Map,this._dismissalsScope=``,this._swipeState=null,this._swipeStartX=0,this._swipeStartY=0,this._swipeCurrentDx=0,this._swipeRAF=null,this._swipePointerId=null,this._swipeExitTimeout=null,this._swipeJustDragged=!1,this._swipeExiting=null,this._registryEntries=null,this._geometryCache=/* @__PURE__ */ new Map,this._geometryMisses=/* @__PURE__ */ new Map,this._geometryInFlight=/* @__PURE__ */ new Set,this._mapTilesToken=null,this._mapTilesInFlight=!1,this._mapTilesTimer=null,this._onMapTilesReady=()=>this._refreshMapTilesToken(),this._clockTimer=null,this._onClockTick=()=>{this._clockTimer=null,this.requestUpdate()},this._onVisibilityChange=()=>{document.hidden?this._teardownClock():this.requestUpdate()},this._hostPx=0,this._hostObserver=null,this._now=Date.now()/1e3,this._alerts=[],this._timelineLanePx=0,this._timelineLaneObserver=null,this._timelineLaneEl=null,this._motionQuery=window.matchMedia(`(prefers-reduced-motion: reduce)`),this._onMotionChange=()=>this.requestUpdate(),this._pendingDismissals=null,this._dismissalReconcileScheduled=!1}connectedCallback(){super.connectedCallback(),this._motionQuery.addEventListener(`change`,this._onMotionChange),this._config&&(this._dismissalsScope=``,this._reloadDismissalsIfScopeChanged()),this._maybeSubscribeRegistry(),this._maybeAcquireMapTilesToken(),document.addEventListener(`visibilitychange`,this._onVisibilityChange),this._observeHost(),this.hasUpdated&&this.requestUpdate(),this._maybeObserveTimelineLane()}disconnectedCallback(){var e,t;super.disconnectedCallback(),this._motionQuery.removeEventListener(`change`,this._onMotionChange),(e=this._unsubscribeDismissals)==null||e.call(this),this._unsubscribeDismissals=void 0,this._teardownRegistrySubscription(),this._teardownMapTilesToken(),document.removeEventListener(`visibilitychange`,this._onVisibilityChange),this._teardownClock(),(t=this._hostObserver)==null||t.disconnect(),this._hostObserver=null,this._teardownTimelineLaneObserver(),this._geometryInFlight.clear(),this._swipeRAF!==null&&(cancelAnimationFrame(this._swipeRAF),this._swipeRAF=null),this._swipeExitTimeout!==null&&(clearTimeout(this._swipeExitTimeout),this._swipeExitTimeout=null),this._swipeState=null,this._swipeExiting=null,this._hasStateKeySources()&&Io._editorExpandedState.set(this._entityStateKey(),this._expandedAlerts)}willUpdate(e){super.willUpdate(e),this._now=Date.now()/1e3,this._alerts=this._getAlerts(!0,this._now)}updated(e){super.updated(e),(e.has(`hass`)||e.has(`_config`))&&this.isConnected&&(this._maybeSubscribeRegistry(),this._maybeAcquireMapTilesToken()),this.isConnected&&this._maybeFetchGeometry(),this._armClock(),this._maybeObserveTimelineLane();let t=this._detailPopupEl;this._detailPopupAlertId&&!t?this._closeDetailPopup():t&&!t.open&&(typeof t.showModal==`function`?t.showModal():t.setAttribute(`open`,``))}_maybeSubscribeRegistry(){var e,t;if(q(this._config).length===0){this._teardownRegistrySubscription();return}let n=(e=this.hass)==null?void 0:e.connection;n&&n!==this._subscribedRegistryConn&&((t=this._unsubscribeRegistry)==null||t.call(this),this._unsubscribeRegistry=void 0,this._subscribedRegistryConn=n,Oa(n,e=>{this._registryEntries=e,this.requestUpdate()}).then(e=>{this._subscribedRegistryConn===n?this._unsubscribeRegistry=e:e()}).catch(()=>{this._subscribedRegistryConn===n&&(this._subscribedRegistryConn=void 0)}))}_teardownRegistrySubscription(){var e;(e=this._unsubscribeRegistry)==null||e.call(this),this._unsubscribeRegistry=void 0,this._subscribedRegistryConn=void 0}_maybeFetchGeometry(){var e,t;if(((e=this._config)==null?void 0:e.showGeometry)!==!0)return;let n=(t=this.hass)==null?void 0:t.connection;if(!n)return;n!==this._geometryConn&&(this._geometryCache=/* @__PURE__ */ new Map,this._geometryMisses.clear(),this._geometryInFlight.clear(),this._geometryConn=n);let r=/* @__PURE__ */ new Set;for(let e of this._alerts)e.geometryRef&&r.add(e.geometryRef);for(let e of[...this._geometryCache.keys()])r.has(e)||this._geometryCache.delete(e);for(let e of[...this._geometryInFlight])r.has(e)||this._geometryInFlight.delete(e);for(let e of[...this._geometryMisses.keys()])r.has(e)||this._geometryMisses.delete(e);let i=Date.now();for(let e of r){if(this._geometryCache.has(e)||this._geometryInFlight.has(e))continue;let t=this._geometryMisses.get(e);t&&(t.attempts>=10||i-t.at<6e4)||(this._geometryInFlight.add(e),Ga(n,e).then(t=>{if(n===this._geometryConn){if(this._geometryInFlight.delete(e),t===null){var r;let t=this._geometryMisses.get(e);this._geometryMisses.set(e,{at:Date.now(),attempts:((r=t==null?void 0:t.attempts)==null?0:r)+1})}else this._geometryMisses.delete(e),this._geometryCache.set(e,t),this.requestUpdate()}}).catch(()=>{n===this._geometryConn&&this._geometryInFlight.delete(e)}))}}_wantsMapTiles(){var e,t,n;return((e=this._config)==null?void 0:e.showGeometry)===!0&&((t=this._config)==null?void 0:t.geometryStyle)===`map`&&!((n=this._config)!=null&&n.geometryTileUrl)}_maybeAcquireMapTilesToken(){var e;if(!this._wantsMapTiles()){this._teardownMapTilesToken();return}let t=(e=this.hass)==null?void 0:e.connection;t&&t!==this._mapTilesConn&&(this._teardownMapTilesToken(),this._mapTilesConn=t,typeof t.addEventListener==`function`&&t.addEventListener(`ready`,this._onMapTilesReady),this._mapTilesTimer=setInterval(this._onMapTilesReady,12e5),this._refreshMapTilesToken())}_refreshMapTilesToken(){let e=this._mapTilesConn;e&&!this._mapTilesInFlight&&(this._mapTilesInFlight=!0,ao(e).then(t=>{e===this._mapTilesConn&&(this._mapTilesInFlight=!1,t!==null&&t!==this._mapTilesToken&&(this._mapTilesToken=t))}).catch(()=>{e===this._mapTilesConn&&(this._mapTilesInFlight=!1)}))}_teardownMapTilesToken(){let e=this._mapTilesConn;e&&typeof e.removeEventListener==`function`&&e.removeEventListener(`ready`,this._onMapTilesReady),this._mapTilesTimer!==null&&(clearInterval(this._mapTilesTimer),this._mapTilesTimer=null),this._mapTilesConn=void 0,this._mapTilesInFlight=!1,this._mapTilesToken!==null&&(this._mapTilesToken=null)}_armClock(){if(this._teardownClock(),!this.isConnected||document.hidden||this._alerts.length===0)return;let e=Date.now()/1e3,t;if(this._isTimeline){var n;let r=zr(this._alerts,(n=this._config)==null?void 0:n.timelineHorizon,e);t={spanS:r.endTs-r.startTs,lanePx:this._timelineLanePx}}let r=Jr(this._alerts,e,{timeZone:this._locale.timeZone,barPx:t?0:this._hostPx||400,timeline:t});this._clockTimer=setTimeout(this._onClockTick,r)}_teardownClock(){this._clockTimer!==null&&(clearTimeout(this._clockTimer),this._clockTimer=null)}_observeHost(){this._hostObserver||typeof ResizeObserver>`u`||(this._hostObserver=new ResizeObserver(e=>{var t,n;this._hostPx=Math.round((t=(n=e[e.length-1])==null?void 0:n.contentRect.width)==null?0:t)}),this._hostObserver.observe(this))}_maybeObserveTimelineLane(){var e,t;let n=this._isTimeline?(e=(t=this.shadowRoot)==null?void 0:t.querySelector(`.timeline-axis .timeline-lane`))==null?null:e:null;n!==this._timelineLaneEl&&(this._teardownTimelineLaneObserver(),n&&typeof ResizeObserver<`u`&&(this._timelineLaneEl=n,this._timelineLaneObserver=new ResizeObserver(e=>{var t,n;let r=(t=(n=e[e.length-1])==null?void 0:n.contentRect.width)==null?0:t,i=Math.round(r/8)*8;i!==this._timelineLanePx&&(this._timelineLanePx=i)}),this._timelineLaneObserver.observe(n)))}_teardownTimelineLaneObserver(){var e;(e=this._timelineLaneObserver)==null||e.disconnect(),this._timelineLaneObserver=null,this._timelineLaneEl=null}setConfig(e){var t,n,r;if(!(e.entity||(t=e.entities)!=null&&t.length)&&!e.device&&!((n=e.devices)!=null&&n.length)&&!((r=e.sources)!=null&&r.length))throw Error(`You need to define an entity, device, or feed`);let{_preview:i,...a}=e;if(!a.entity&&a.entities&&a.entities.length>0){var o;a.entity=(o=a.entities[0])==null?``:o}this._config=a,this._forcePreview=!!i;let s=this._entityStateKey(),c=Io._editorExpandedState.get(s);c&&(this._expandedAlerts=c),this._reloadDismissalsIfScopeChanged()}_hasStateKeySources(){var e;return!!((e=this._config)!=null&&e.entity)||q(this._config).length>0}get _scopeHash(){return Fa(this._config)}_configuredScopeTokens(){return Pa(this._config)}_reloadDismissalsIfScopeChanged(){let e=this._scopeHash;e!==this._dismissalsScope&&(this._dismissalsScope=e,this._dismissals=e?za(e):/* @__PURE__ */ new Map,this._resubscribeDismissals())}_resubscribeDismissals(){var e;(e=this._unsubscribeDismissals)==null||e.call(this),this._unsubscribeDismissals=void 0,this.isConnected&&this._dismissalsScope&&(this._unsubscribeDismissals=Ra(this._dismissalsScope,()=>{this._dismissals=za(this._dismissalsScope)}))}getCardSize(){let e=this._getAlerts(!1);if(this._isTimeline)return 1+Math.ceil(e.length*36/50);let t=this._isCompact?1:3;return Math.max(1,e.length*t)}static getConfigElement(){return document.createElement(`weather-alerts-card-editor`)}static getStubConfig(e){if(e){let t=Object.keys(e.states).filter(e=>ya.some(t=>t.test(e))).find(t=>{let n=e.states[t];return n?n.state!==`0`&&n.state!==`off`&&n.state!==`unknown`&&n.state!==`unavailable`:!1});if(t)return{entity:t}}return{entity:Ho}}get _inEditor(){return this.preview===!0||this.editMode===!0}_isPickerStub(){var e,t,n;let r=this._config;return this.preview===void 0&&this.editMode===void 0&&r.entity===Ho&&!((e=r.entities)!=null&&e.length)&&q(r).length===0&&!((t=r.sources)!=null&&t.length)&&!((n=this.hass)!=null&&n.states[Ho])}_registryPending(){var e;return q(this._config).length>0&&this._registryEntries===null&&!((e=this.hass)!=null&&e.entities)}_getAllEntities(){if(!this._config)return[];let e=this._config.entity,t=this._config.entities||[],n=/* @__PURE__ */ new Set,r=[];for(let i of[e,...t])i&&!n.has(i)&&(n.add(i),r.push(i));if(this.hass)for(let e of q(this._config))for(let t of wa(this.hass,e,this._registryEntries))n.has(t)||(n.add(t),r.push(t));if(this._config.sources&&this._config.sources.length>0&&this.hass)for(let e of this._resolveSourceEntities(this._config.sources))n.has(e)||(n.add(e),r.push(e));return r}_resolveSourceEntities(e){if(!this.hass)return[];let t=new Set(e),n=[];for(let[e,i]of Object.entries(this.hass.states)){var r;let a=(r=i.attributes)==null?void 0:r.source;typeof a==`string`&&t.has(a)&&ba(i.attributes)&&n.push(e)}return n.sort()}_entityStateKey(){return[...this._configuredScopeTokens()].sort().join(`,`)}_deviceHasAnyEntity(e){return this.hass?Da(this.hass,e,this._registryEntries):!1}_getAlerts(e=!0,t=Date.now()/1e3){if(!this.hass||!this._config)return[];let n=[],r=[],i=/* @__PURE__ */ new Set,a=/* @__PURE__ */ new Set;for(let e of this._getAllEntities()){let t=this.hass.states[e];if(!t)continue;let o=Ca(this._config.provider,t.attributes);i.has(o.provider)||(i.add(o.provider),r.push(o.provider),o.stableIds&&a.add(o.provider));let s=o.parseAlerts(t.attributes);for(let t of s)t.sourceEntityId=e;n.push(...s)}let o=this._filterAndSort(n,{providerPriority:r,stableIdProviders:a,nowTs:t});if(this._config.allowDismiss&&!this._forcePreview&&this._dismissals.size>0){let{visible:t,updatedMap:n}=Wa(o,this._dismissals);e&&n!==this._dismissals&&this._scheduleDismissalReconcile(n),o=t}return o}_scheduleDismissalReconcile(e){this._pendingDismissals=e,this._dismissalReconcileScheduled||(this._dismissalReconcileScheduled=!0,queueMicrotask(()=>{this._dismissalReconcileScheduled=!1;let e=this._pendingDismissals;this._pendingDismissals=null,e&&this._dismissalsScope&&(this._dismissals=e,Ba(this._dismissalsScope,e))}))}_onDismiss(e){var t;if(!this._dismissalsScope)return;let n=Va(this._dismissals,e);this._dismissals=n,Ba(this._dismissalsScope,n),((t=this._config)==null?void 0:t.showDismissUndo)!==!1&&this._fireUndoToast(e)}_onUndo(e){if(!this._dismissalsScope)return;let t=Ha(this._dismissals,e);t!==this._dismissals&&(this._dismissals=t,Ba(this._dismissalsScope,t))}_fireUndoToast(e){let t=this._lang;this.dispatchEvent(new CustomEvent(`hass-notification`,{detail:{message:V(`card.dismissed_toast`,t,{event:e.event}),duration:4e3,action:{text:V(`card.dismissed_toast_undo`,t),action:()=>this._onUndo(e.id)}},bubbles:!0,composed:!0}))}_canDismiss(){var e;return!!((e=this._config)!=null&&e.allowDismiss)&&!this._forcePreview}_swipeEnabled(){var e,t;return this._canDismiss()&&(((e=this._config)==null?void 0:e.dismissTrigger)===`swipe`||((t=this._config)==null?void 0:t.dismissTrigger)===`both`)}_onSwipePointerDown(e,t){if(!this._swipeEnabled()||this._swipeState||t.button!==0)return;this._swipePointerId=t.pointerId,this._swipeStartX=t.clientX,this._swipeStartY=t.clientY,this._swipeCurrentDx=0;let n=t.currentTarget.getBoundingClientRect();this._swipeState={id:e.id,offset:0,locked:!1,cardWidth:n.width}}_onSwipePointerMove(e,t){if(!this._swipeState||this._swipeState.id!==e.id||t.pointerId!==this._swipePointerId)return;let n=t.clientX-this._swipeStartX,r=t.clientY-this._swipeStartY;if(!this._swipeState.locked){if(Math.abs(r)-Math.abs(n)>12||n>=0){this._swipeState=null;return}try{t.currentTarget.setPointerCapture(t.pointerId)}catch{}this._swipeState={...this._swipeState,locked:!0}}this._swipeCurrentDx=Math.min(0,n),this._swipeRAF===null&&(this._swipeRAF=requestAnimationFrame(()=>{this._swipeRAF=null,this._swipeState&&this._swipeState.id===e.id&&(this._swipeState={...this._swipeState,offset:this._swipeCurrentDx},this.requestUpdate())}))}_onSwipePointerUp(e,t){if(!this._swipeState||this._swipeState.id!==e.id||t.pointerId!==this._swipePointerId)return;let n=t.currentTarget;n.hasPointerCapture(t.pointerId)&&n.releasePointerCapture(t.pointerId),this._swipeRAF!==null&&(cancelAnimationFrame(this._swipeRAF),this._swipeRAF=null);let{offset:r,cardWidth:i,locked:a}=this._swipeState;if(this._swipeState=null,this._swipePointerId=null,a&&(this._swipeJustDragged=!0,setTimeout(()=>{this._swipeJustDragged=!1},0)),a&&r<=-(i*.4)){this._swipeExiting=e.id;let t=this._motionQuery.matches?0:200;this._swipeExitTimeout=window.setTimeout(()=>{this._swipeExitTimeout=null,this._swipeExiting=null,this._onDismiss(e)},t)}else this.requestUpdate()}_onSwipePointerCancel(e,t){if(!this._swipeState||this._swipeState.id!==e.id||t.pointerId!==this._swipePointerId)return;let n=t.currentTarget;n.hasPointerCapture(t.pointerId)&&n.releasePointerCapture(t.pointerId),this._swipeRAF!==null&&(cancelAnimationFrame(this._swipeRAF),this._swipeRAF=null),this._swipeState=null,this._swipePointerId=null,this.requestUpdate()}_swipeCardStyle(e,t){var n;if(this._swipeExiting===e.id)return t;if(((n=this._swipeState)==null?void 0:n.id)===e.id){let{offset:e,cardWidth:n}=this._swipeState;return`${t} transform: translateX(${e}px); opacity: ${Math.max(0,1+e/n).toFixed(2)};`}return t}_swipeCardClass(e){var t;let n=[];return this._swipeEnabled()&&n.push(`swipe-enabled`),this._swipeExiting===e.id?n.push(`swipe-exit`):((t=this._swipeState)==null?void 0:t.id)===e.id&&this._swipeState.locked&&n.push(`swiping`),n.join(` `)}_isLabeledDismissActive(){var e,t;return this._canDismiss()&&((e=this._config)==null?void 0:e.dismissTrigger)!==`swipe`&&((t=this._config)==null?void 0:t.dismissButtonStyle)===`labeled`&&!this._isCompact&&!this._isTimeline}_renderDismissButton(e){var t;return!this._canDismiss()||((t=this._config)==null?void 0:t.dismissTrigger)===`swipe`&&!this._isTimeline?E:this._isLabeledDismissActive()?T`
        <button
          type="button"
          class="dismiss-button labeled"
          aria-label=${V(`card.dismiss`,this._lang)}
          title=${V(`card.dismiss`,this._lang)}
          @click=${t=>{t.stopPropagation(),this._onDismiss(e)}}
        >
          <ha-icon icon="mdi:close"></ha-icon>
          <span>${V(`card.dismiss`,this._lang)}</span>
        </button>
      `:T`
      <button
        type="button"
        class="dismiss-button"
        aria-label=${V(`card.dismiss`,this._lang)}
        title=${V(`card.dismiss`,this._lang)}
        @click=${t=>{t.stopPropagation(),this._onDismiss(e)}}
      >
        <ha-icon icon="mdi:close"></ha-icon>
      </button>
    `}_filterAndSort(e,t){if(!this._config)return e;let n=e,r=this._config.maxDistanceKm,i=lr(this.hass,this._config.myLocationEntity);if(typeof r==`number`&&Number.isFinite(r)&&r>0&&i&&(n=n.filter(e=>!e.point||sr(e.point[0],e.point[1],i[0],i[1])<=r)),this._config.deduplicate!==!1&&(n=Rr(n,t==null?void 0:t.providerPriority,t==null?void 0:t.stableIdProviders)),!(t!=null&&t.skipZones)&&this._config.zones&&this._config.zones.length>0){let e=new Set(this._config.zones.map(e=>e.toUpperCase()));n=n.filter(t=>Lr(t,e))}if(this._config.eventCodes&&this._config.eventCodes.length>0){let e=new Set(this._config.eventCodes.map(e=>e.toUpperCase()));n=n.filter(t=>t.eventCode&&e.has(t.eventCode.toUpperCase()))}if(this._config.excludeEventCodes&&this._config.excludeEventCodes.length>0){let e=new Set(this._config.excludeEventCodes.map(e=>e.toUpperCase()));n=n.filter(t=>!t.eventCode||!e.has(t.eventCode.toUpperCase()))}if(this._config.minSeverity){var a;let e={extreme:0,severe:1,moderate:2,minor:3,unknown:4},t=(a=e[this._config.minSeverity])==null?4:a;n=n.filter(n=>{var r;return n.severity===`unknown`||((r=e[n.severity])==null?4:r)<=t})}if(this._config.hideExpired!==!1){var o;let e=(o=t==null?void 0:t.nowTs)==null?Date.now()/1e3:o;n=n.filter(t=>t.endsTs===0||t.endsTs>e)}return Ir(n,this._config.sortOrder||`default`,i)}get _locale(){var e,t;if(!this.hass)return{language:navigator.language||`en`,time_format:`language`,date_format:`language`,timeZone:void 0};let n=((e=this._config)==null?void 0:e.timezone)===`browser`?yr(void 0,{}).resolvedOptions().timeZone:(t=this.hass.config)==null?void 0:t.time_zone;return{...this.hass.locale,timeZone:n}}get _lang(){var e;return((e=this.hass)==null||(e=e.locale)==null?void 0:e.language)||`en`}get _animationsEnabled(){var e,t;return((e=this._config)==null?void 0:e.animations)===!0||((t=this._config)==null?void 0:t.animations)!==!1&&!this._motionQuery.matches}get _isCompact(){var e;return((e=this._config)==null?void 0:e.layout)===`compact`}get _isTimeline(){var e;return((e=this._config)==null?void 0:e.layout)===`timeline`}get _layoutClass(){return this._isTimeline?`timeline`:this._isCompact?`compact`:``}get _colorTheme(){var e;return((e=this._config)==null?void 0:e.colorTheme)||`severity`}get _providerColors(){return!!this._config&&ir(this._config)}get _fontScale(){var e;switch((e=this._config)==null?void 0:e.fontSize){case`small`:return .85;case`large`:return 1.2;case`x-large`:return 1.4;default:return}}get _scaleStyle(){let e=this._fontScale;return e===void 0?``:`--wac-scale: ${e}`}_scaledPx(e){let t=this._fontScale;return t===void 0?e:Math.round(e*t)}get _contrastMode(){var e;return Bn((e=this._config)==null?void 0:e.enhanceContrast)}_resolveEventColor(e,t){if(this._providerColors){let n=rr(e,t);if(n)return n}switch(this._colorTheme){case`nws`:return qn(e.event,t);case`meteoalarm`:return Zn(e.severity,t);case`eccc`:return tr(e.severity,t);default:return}}_alertColorStyle(e){let t=this._resolveEventColor(e,this._contrastMode);if(!t)return``;let{color:n,rgb:r,textColorLight:i,textColorDark:a}=t;return`--color: ${n}; --color-rgb: ${r}; --color-on-light: ${i}; --color-on-dark: ${a};`}_alertBoostClasses(e){let t=this._contrastMode;if(t===`off`)return``;let n=this._resolveEventColor(e,t);if(!n)return``;let r=[];return n.boostLight&&r.push(`boost-light`),n.boostDark&&r.push(`boost-dark`),n.progressBoostLight&&r.push(`progress-boost-light`),n.progressBoostDark&&r.push(`progress-boost-dark`),r.join(` `)}_decoPhase(e){return e.isExpired?null:e.isActive?e.hasEndTime?`active`:`ongoing`:`preparation`}_alertDecoClasses(e,t=!1){var n,r,i,a;let o=this._decoPhase(e);if(!o)return``;let s=(n=(r=this._config)==null||(r=r.progressStyle)==null?void 0:r[o])==null?tt[o]:n,c=(i=(a=this._config)==null||(a=a.iconBorderStyle)==null?void 0:a[o])==null?nt[o]:i;return t?`icon-border-${c}`:`deco-${s} icon-border-${c}`}_renderPulseRing(e){return e.severity===`severe`||e.severity===`extreme`?T`<div class="pulse-ring" aria-hidden="true"></div>`:E}get _themeMode(){var e;let t=(e=this.hass)==null||(e=e.themes)==null?void 0:e.darkMode;return typeof t==`boolean`?t?`dark`:`light`:window.matchMedia(`(prefers-color-scheme: dark)`).matches?`dark`:`light`}_normalizeText(e){return(e||``).replace(/\n{2,}/g,`

`).trim()}_toggleDetails(e){if(this._swipeJustDragged){this._swipeJustDragged=!1;return}let t=new Map(this._expandedAlerts);t.set(e,!t.get(e)),this._expandedAlerts=t,this._hasStateKeySources()&&Io._editorExpandedState.set(this._entityStateKey(),t)}_onCardAction(e){var t,n;if(this._swipeJustDragged){this._swipeJustDragged=!1;return}let r=this._rowAction();r&&r.action!==`none`&&(r.action===`details`?this._openDetailPopup(e):mo(this,this.hass,r,(t=e.sourceEntityId)==null?(n=this._config)==null?void 0:n.entity:t))}_rowAction(){var e,t;return(e=(t=this._config)==null?void 0:t.tap_action)==null?this._isTimeline?Io.TIMELINE_DEFAULT_ACTION:void 0:e}_openDetailPopup(e){this._detailPopupAlertId=e.id}_closeDetailPopup(){this._detailPopupAlertId=null}_onCardActionKeydown(e,t){if(t.key!==`Enter`&&t.key!==` `&&t.key!==`Spacebar`)return;let n=t.target;n&&n!==t.currentTarget&&n.closest(`button, a`)||(t.preventDefault(),this._onCardAction(e))}_sourceLinkLabel(e){let t=zo[e.provider]||`Alert`;return V(`card.open_source`,this._lang,{provider:t})}_isBroken(e){var t;return(e.state===`unavailable`||e.state===`unknown`||na(e.state,e.attributes))&&Ca((t=this._config)==null?void 0:t.provider,e.attributes).parseAlerts(e.attributes).length===0}_friendlyName(e){var t;return((t=this.hass)==null||(t=t.states[e])==null||(t=t.attributes)==null?void 0:t.friendly_name)||e}_deviceName(e){var t;let n=(t=this.hass)==null||(t=t.devices)==null?void 0:t[e];return(n==null?void 0:n.name_by_user)||(n==null?void 0:n.name)||null}_brokenSources(){var e,t;if(!this.hass)return[];let n=[],r=/* @__PURE__ */ new Set;for(let i of[(e=this._config)==null?void 0:e.entity,...((t=this._config)==null?void 0:t.entities)||[]]){if(!i||r.has(i))continue;r.add(i);let e=this.hass.states[i];(!e||this._isBroken(e))&&n.push({name:this._friendlyName(i)})}let i=this.hass.devices;for(let e of q(this._config)){if(i&&!i[e]){n.push({name:null});continue}let t=!1,r=!1;for(let n of Ta(this.hass,e,this._registryEntries)){var a,o;let e=n.entity_id;if(Vo.has((a=e.split(`.`,1)[0])==null?``:a))continue;let i=this.hass.states[e];i&&(Ca((o=this._config)==null?void 0:o.provider,i.attributes).parseAlerts(i.attributes).length>0?t=!0:(i.state===`unavailable`||na(i.state,i.attributes)||i.state===`unknown`&&n.entity_category!==`diagnostic`)&&(r=!0))}!t&&r&&n.push({name:this._deviceName(e)})}return n}_degradedLabel(e){let[t]=e;return t!==void 0&&e.length===1?t.name?V(`card.sources_unavailable_named`,this._lang,{name:t.name}):V(`card.sources_unavailable_one`,this._lang):V(`card.sources_unavailable_count`,this._lang,{count:e.length})}_renderDegradedStrip(e){let t=this._degradedLabel(e);return T`
      <div class="degraded-badge">
        <ha-icon icon="mdi:alert-outline"></ha-icon>
        <span>${t}</span>
      </div>
    `}_renderDegradedDot(e){let t=this._degradedLabel(e);return T`
      <span class="degraded-dot" role="img" title=${t} aria-label=${t}>
        <ha-icon icon="mdi:alert-outline"></ha-icon>
      </span>
    `}render(){if(!this._config)return T``;if(!this.hass)return this._renderPreview();let e=this._getAllEntities().map(e=>this.hass.states[e]).filter(Boolean);if(this._forcePreview&&this._inEditor)return this._renderPreview();let t=q(this._config).some(e=>this._deviceHasAnyEntity(e));if(e.length===0&&!t){if(this._inEditor||this._isPickerStub())return this._renderPreview();if(this._registryPending())return this.style.display=``,T`<ha-card .header=${this._config.title||``}></ha-card>`}let n=this._brokenSources(),r=this._config.unavailableBehavior||`message`,i=n.length>0&&r!==`hide`,a=this._alerts,o=a.length>0;if(!o&&this._config.hideNoAlerts&&!i)return this.style.display=`none`,T``;this.style.display=``;let s=this._animationsEnabled?``:`no-animations`,c=this._layoutClass,l=this._config.progressFill===`background`?`fill-mode-background`:``,u=i&&o&&r===`message`,d=i&&o&&r===`compact`;return T`
      <ha-card .header=${this._config.title||``} class="${s} ${c} ${l}" data-theme-mode=${this._themeMode} style=${this._scaleStyle}>
        ${d?this._renderDegradedDot(n):E}
        ${u?this._renderDegradedStrip(n):E}
        ${o?this._renderAlertList(a):this._renderNoAlerts(i?n:[])}
      </ha-card>
      ${this._renderDetailPopup(a)}
    `}_renderDetailPopup(e){if(!this._detailPopupAlertId)return E;let t=e.find(e=>e.id===this._detailPopupAlertId);if(!t)return E;let n=hr(t,this._now),r=n.isActive&&!n.hasEndTime,i=[`alert-card`,`severity-${t.severity}`,n.phaseText.toLowerCase(),r?`ongoing`:``,this._alertDecoClasses(n),this._alertBoostClasses(t)].filter(Boolean).join(` `),a=`${this._alertColorStyle(t)} --progress: ${r?0:n.progressPct}%;`;return T`
      <dialog
        class="detail-dialog"
        aria-label=${t.event}
        @close=${()=>this._closeDetailPopup()}
        @click=${this._onDetailPopupClick}
      >
        <div
          class="detail-dialog-body ${this._animationsEnabled?``:`no-animations`}"
          data-theme-mode=${this._themeMode}
          style=${this._scaleStyle}
        >
          <div class=${i} style=${a}>
            ${this._renderAlertBody(t,n,{expanded:!0,inPopup:!0})}
          </div>
        </div>
      </dialog>
    `}_onDetailPopupClick(e){e.target===e.currentTarget&&this._dismissDetailPopup(e.currentTarget)}_dismissDetailPopup(e){let t=e==null?this._detailPopupEl:e;t&&typeof t.close==`function`?t.close():this._closeDetailPopup()}_renderDetailPopupClose(){let e=V(`card.close`,this._lang);return T`
      <button
        type="button"
        class="detail-dialog-close"
        aria-label=${e}
        title=${e}
        @click=${()=>this._dismissDetailPopup()}
      >
        <ha-icon icon="mdi:close"></ha-icon>
      </button>
    `}get _detailPopupEl(){var e,t;return(e=(t=this.shadowRoot)==null?void 0:t.querySelector(`dialog.detail-dialog`))==null?null:e}_renderPreview(){var e;let t=this._filterAndSort(Uo(),{skipZones:!0,nowTs:this._now}),n=this._animationsEnabled?``:`no-animations`,r=this._layoutClass,i=((e=this._config)==null?void 0:e.progressFill)===`background`?`fill-mode-background`:``;return T`
      <ha-card .header=${this._config.title||``} class="${n} ${r} ${i}" data-theme-mode=${this._themeMode} style=${this._scaleStyle}>
        <div class="preview-label">${V(`card.preview`,this._lang)}</div>
        ${this._renderAlertList(t)}
      </ha-card>
    `}_renderNoAlerts(e=[]){return T`
      <div class="no-alerts">
        <ha-icon icon="mdi:weather-sunny"></ha-icon><br>
        ${V(`card.no_alerts`,this._lang)}
        ${e.length>0?T`<div class="no-alerts-caveat">
            <ha-icon icon="mdi:alert-outline"></ha-icon>${this._degradedLabel(e)}
          </div>`:E}
      </div>
    `}_renderAlertList(e){return this._isTimeline?this._renderTimeline(e):e.map(e=>this._renderAlert(e))}_renderTimeline(e){var t,n;let r=this._now,i=zr(e,(t=this._config)==null?void 0:t.timelineHorizon,r),a=this._locale,o=this._timelineLanePx,s=o>0?52/o*100:25,c=Ur(i,a.timeZone,Math.floor(100/s)).filter(e=>Math.abs(e.pct-i.nowPct)>=s/2),l=c.filter(e=>!e.minor),u=Wr(r,a),d=i.endTs-i.startTs>=172800?c.filter(e=>e.dayBoundary).map(e=>e.pct):[],f=this._canDismiss(),p=!!((n=this._config)!=null&&n.title);return T`
      <div class="timeline-body ${f?`dismissable`:``} ${p?`headed`:``}" style="--wac-tl-now: ${i.nowPct.toFixed(3)}%; --wac-tl-now-f: ${(i.nowPct/100).toFixed(5)}">
        <div class="timeline-axis">
          <div class="timeline-gutter" aria-hidden="true"></div>
          <div class="timeline-lane">
            ${c.map(e=>{let t=!e.minor&&e.pct>88,n=l.find(t=>t.pct>e.pct),r=e.minor||Math.abs(e.pct-i.nowPct)<s||!t&&n!==void 0&&n.pct>88&&n.pct-e.pct<2*s;return T`
              <span class="timeline-tick ${e.dayBoundary?`day`:``} ${t?`edge`:``} ${r?`quiet`:``} ${e.minor?`minor`:``}" style="left: ${e.pct.toFixed(3)}%" aria-hidden="true">${r?E:Gr(e,a)}</span>
            `})}
            <span class="timeline-now-head" role="img" aria-label="${V(`progress.now`,this._lang)} ${u}"></span>
            <span class="timeline-now-label" aria-hidden="true">${u}</span>
          </div>
          ${f?T`<span class="timeline-dismiss-spacer" aria-hidden="true"></span>`:E}
        </div>
        ${e.map(e=>this._renderTimelineRow(e,i,d))}
      </div>
    `}_renderTimelineRow(e,t,n){var r;let i=this._lang,a=hr(e,this._now),o=Br(a,t),s=a.isActive&&!a.hasEndTime,c=this._rowAction(),l=!!c&&c.action!==`none`,u=[`alert-card`,`timeline-row`,`severity-${e.severity}`,a.phaseText.toLowerCase(),s?`ongoing`:``,this._alertDecoClasses(a,!0),this._alertBoostClasses(e),l?`tappable`:``].filter(Boolean).join(` `),d=[`timeline-bar`,o.clipStart?`clip-start`:``,o.clipEnd?`clip-end`:``,o.openEnd?`open-end`:``,o.offAxis?`off-axis off-${o.offAxis}`:``].filter(Boolean).join(` `),f=`left: ${o.startPct.toFixed(3)}%; width: ${(o.endPct-o.startPct).toFixed(3)}%;`+(o.fadeFromPct===null?``:` --wac-tl-fade-from: ${o.fadeFromPct.toFixed(3)}%;`),p=`${Er(a.onsetTs,this._locale,i,this._now)} – ${a.hasEndTime?Er(a.endsTs,this._locale,i,this._now):V(`progress.ongoing`,i)}`,m=this._phaseTimeLabel(a);return T`
      <div
        class=${u}
        style=${this._alertColorStyle(e)}
        role=${l?`button`:E}
        tabindex=${l?`0`:E}
        aria-label=${l?`${e.event}: ${m}`:E}
        @click=${l?()=>this._onCardAction(e):E}
        @keydown=${l?t=>this._onCardActionKeydown(e,t):E}
      >
        <div class="timeline-gutter" title=${e.event}>
          <div class="icon-box">
            ${this._renderPulseRing(e)}
            <ha-icon icon=${(r=e.providerIcon)==null?Mn(e.iconHint||e.event):r}></ha-icon>
          </div>
          <div class="timeline-gutter-text">
            <span class="alert-title">${this._renderProviderHint(e)}${e.event}</span>
            <span class="timeline-time">${m}</span>
          </div>
        </div>
        <div class="timeline-lane" aria-hidden="true">
          ${n.map(e=>T`<span class="timeline-day-line" style="left: ${e.toFixed(3)}%"></span>`)}
          <div class="timeline-span">
            <div class="timeline-span-lane">
              <div class=${d} style=${f} title=${p}></div>
              ${o.clipStart?T`<span class="timeline-clip start" title=${V(`timeline.clipped_start`,i)}></span>`:E}
              ${o.clipEnd?T`<span class="timeline-clip end" title=${V(`timeline.clipped_end`,i)}></span>`:E}
            </div>
          </div>
        </div>
        ${this._renderDismissButton(e)}
      </div>
    `}_phaseTimeLabel(e){let t=this._lang;return e.isExpired?V(`progress.compact_expired`,t,{time:kr(e.endsTs,e.nowTs)}):e.isActive&&!e.hasEndTime?V(`progress.compact_ongoing`,t):e.isActive?V(`progress.compact_active`,t,{time:kr(e.endsTs,e.nowTs)}):V(`progress.compact_prep`,t,{time:kr(e.onsetTs,e.nowTs)})}_renderAlert(e){let t=`severity-${e.severity}`,n=hr(e,this._now),r=n.phaseText.toLowerCase(),i=this._expandedAlerts.get(e.id)||!1;return this._isCompact?this._renderCompactAlert(e,t,r,n,i):this._renderFullAlert(e,t,r,n,i)}_renderCompactAlert(e,t,n,r,i){var a;let o=r.isActive&&!r.hasEndTime,s=this._phaseTimeLabel(r),c=o?`ongoing`:``,l=this._alertBoostClasses(e),u=this._alertDecoClasses(r),d=o?``:`--progress: ${r.progressPct}%;`,f=this._swipeCardClass(e),p=po(this._config),m=p&&this._config.tap_action.action!==`none`,h=this._swipeCardStyle(e,`${this._alertColorStyle(e)} ${d}`);return T`
      <div
        class="alert-card ${t} ${n} ${c} ${u} ${l} ${f} ${m?`tappable`:``}"
        style=${h}
        role=${m?`button`:E}
        tabindex=${m?`0`:E}
        @pointerdown=${t=>this._onSwipePointerDown(e,t)}
        @pointermove=${t=>this._onSwipePointerMove(e,t)}
        @pointerup=${t=>this._onSwipePointerUp(e,t)}
        @pointercancel=${t=>this._onSwipePointerCancel(e,t)}
        @click=${m?()=>this._onCardAction(e):E}
        @keydown=${m?t=>this._onCardActionKeydown(e,t):E}
      >
        ${this._renderPulseRing(e)}
        <div
          class="alert-header-row compact-row"
          @click=${p?E:()=>this._toggleDetails(e.id)}
        >
          <div class="icon-box">
            <ha-icon icon=${(a=e.providerIcon)==null?Mn(e.iconHint||e.event):a}></ha-icon>
          </div>
          ${this._renderProviderHint(e)}
          <span class="alert-title">${e.event}</span>
          <span class="compact-time">${s}</span>
          ${p?E:T`
          <ha-icon
            icon="mdi:chevron-down"
            class="compact-chevron ${i?`expanded`:``}"
          ></ha-icon>
          `}
          ${this._renderDismissButton(e)}
        </div>
        ${i?this._renderExpandedContent(e,r):E}
      </div>
    `}_renderExpandedContent(e,t){var n,r;return T`
      <div class="alert-expanded">
        ${this._renderHeadline(e)}
        ${e.areaDesc?T`
          <div class="area-desc" title=${e.areaDesc}>
            <ha-icon icon="mdi:map-marker"></ha-icon>
            <span class="area-desc-text">${e.areaDesc}</span>
          </div>
        `:E}
        <div class="badges-row" style="padding: 0 12px 8px;">
          ${this._renderBadgesRow(e,t)}
        </div>

        ${this._renderProgressSection(e,t)}

        ${((n=this._config)==null?void 0:n.showDetails)===!1?E:(r=this._config)!=null&&r.expandDetails?T`
        ${this._renderDetailsContent(e,t)}
        `:T`
        <div class="alert-details-section">
          <div
            class="details-summary"
            @click=${()=>this._toggleDetails(e.id+`_details`)}
          >
            <span>${V(`card.read_details`,this._lang)}</span>
            <ha-icon
              icon="mdi:chevron-down"
              class="chevron ${this._expandedAlerts.get(e.id+`_details`)?`expanded`:``}"
            ></ha-icon>
          </div>
          ${this._expandedAlerts.get(e.id+`_details`)?this._renderDetailsContent(e,t):E}
        </div>
        `}
      </div>
    `}_renderFullAlert(e,t,n,r,i){let a=this._alertBoostClasses(e),o=this._alertDecoClasses(r),s=this._swipeCardClass(e),c=po(this._config)&&this._config.tap_action.action!==`none`,l=r.isActive&&!r.hasEndTime?`--progress: 0%;`:`--progress: ${r.progressPct}%;`,u=this._swipeCardStyle(e,`${this._alertColorStyle(e)} ${l}`);return T`
      <div
        class="alert-card ${t} ${n} ${o} ${a} ${s} ${c?`tappable`:``}"
        style=${u}
        role=${c?`button`:E}
        tabindex=${c?`0`:E}
        @pointerdown=${t=>this._onSwipePointerDown(e,t)}
        @pointermove=${t=>this._onSwipePointerMove(e,t)}
        @pointerup=${t=>this._onSwipePointerUp(e,t)}
        @pointercancel=${t=>this._onSwipePointerCancel(e,t)}
        @click=${c?()=>this._onCardAction(e):E}
        @keydown=${c?t=>this._onCardActionKeydown(e,t):E}
      >
        ${this._renderPulseRing(e)}
        ${this._renderAlertBody(e,r,{expanded:i,inPopup:!1})}
      </div>
    `}_renderAlertBody(e,t,n){var r,i,a,o;let s=po(this._config),c=((r=this._config)==null?void 0:r.showDetails)!==!1;return T`
      <div class="alert-header-row">
        <div class="icon-box">
          <ha-icon icon=${(i=e.providerIcon)==null?Mn(e.iconHint||e.event):i}></ha-icon>
        </div>
        <div class="info-box">
          <div class="title-row">
            ${this._renderProviderHint(e)}
            <span class="alert-title">${e.event}</span>
          </div>
          ${this._renderHeadline(e)}
          ${e.areaDesc?T`
            <div class="area-desc" title=${e.areaDesc}>
              <ha-icon icon="mdi:map-marker"></ha-icon>
              <span class="area-desc-text">${e.areaDesc}</span>
            </div>
          `:E}
          <div class="badges-row">
            ${this._renderBadgesRow(e,t)}
          </div>
        </div>
        ${n.inPopup?this._renderDetailPopupClose():this._renderDismissButton(e)}
      </div>

      ${this._renderProgressSection(e,t)}

      ${n.inPopup?c?this._renderDetailsContent(e,t):E:s?c&&(a=this._config)!=null&&a.expandDetails?this._renderDetailsContent(e,t):E:c?(o=this._config)!=null&&o.expandDetails?T`
      ${this._renderDetailsContent(e,t)}
      `:T`
      <div class="alert-details-section">
        <div
          class="details-summary"
          @click=${()=>this._toggleDetails(e.id)}
        >
          <span>${V(`card.read_details`,this._lang)}</span>
          <ha-icon
            icon="mdi:chevron-down"
            class="chevron ${n.expanded?`expanded`:``}"
          ></ha-icon>
        </div>
        ${n.expanded?this._renderDetailsContent(e,t):E}
      </div>
      `:E}
    `}_renderProviderHint(e){var t;if(((t=this._config)==null?void 0:t.showProvider)!==!0)return E;let n=Bo[e.provider]||e.provider.toUpperCase();return T`<span class="provider-hint">${n}</span>`}_renderHeadline(e){var t;let n=Ar(e,((t=this._config)==null?void 0:t.deduplicateHeadlines)!==!1);return n?T`
      <div class="alert-headline" title=${e.headline}>
        ${n}
      </div>
    `:E}_renderBadgesRow(e,t){var n;let r=(n=e.severityBadgeLabel)==null?V(`badge.severity_`+e.severity,this._lang):n,i=e.certainty?V(`badge.certainty_`+e.certainty.toLowerCase(),this._lang):``;return T`
      <span class="badge severity-badge${e.severityInferred?` badge-inferred`:``}">${r}</span>
      ${e.certainty?T`
        <span class="badge certainty-badge${e.certaintyInferred?` badge-inferred`:``}">
          <ha-icon
            icon=${Pn(e.certainty)}
            style="--mdc-icon-size: ${this._scaledPx(14)}px; width: ${this._scaledPx(14)}px; height: ${this._scaledPx(14)}px;"
          ></ha-icon>
          ${i}
        </span>
      `:E}
      ${e.phase?T`
        <span class="badge phase-badge">${e.phase}</span>
      `:E}
      ${e.eventCode&&e.eventCode.trim().toLowerCase()!==e.event.trim().toLowerCase()?T`
        <span class="badge event-code-badge">${e.eventCode}</span>
      `:E}
      ${e.mergedCount&&e.mergedCount>1?T`<span class="badge zones-badge">${V(`card.zones_count`,this._lang,{count:e.mergedCount})}</span>`:E}
    `}_renderTextBlock(e,t){return t?T`
      <div class="text-block">
        <div class="text-label">${e}</div>
        <div class="text-body">${Qe(An(t))}</div>
      </div>
    `:E}_distanceFromHomeKm(e){var t;if(!e.point)return;let n=lr(this.hass,(t=this._config)==null?void 0:t.myLocationEntity);if(n)return sr(e.point[0],e.point[1],n[0],n[1])}_renderDetailsContent(e,t){var n,r,i,a,o,s,c;let l=((n=this._config)==null?void 0:n.reformatText)!==!1,u=or(e.url),d=this._normalizeText(e.description),f=this._normalizeText(e.instruction);l&&(d=jr(d),f=jr(f));let p=this._lang,m=this._distanceFromHomeKm(e);return T`
      <div class="details-content" @click=${e=>e.stopPropagation()}>
        ${((r=this._config)==null?void 0:r.showMetadata)===!1?E:T`
        <div class="meta-grid">
          ${t.sentTs>100?T`
          <div class="meta-item">
            <span class="meta-label">${V(`detail.issued`,p)}</span>
            <span class="meta-value">${Dr(t.sentTs,this._locale,p)}</span>
          </div>
          `:E}
          <div class="meta-item">
            <span class="meta-label">${V(`detail.onset`,p)}</span>
            <span class="meta-value">${Dr(t.onsetTs,this._locale,p)}</span>
            <span class="meta-relative">${Or(t.onsetTs,t.nowTs,p)}</span>
          </div>
          <div class="meta-item">
            <span class="meta-label">${t.isExpired?V(`progress.expired_label`,p):V(`detail.expires`,p)}</span>
            ${t.hasEndTime?T`<span class="meta-value">${Dr(t.endsTs,this._locale,p)}</span>
            <span class="meta-relative">${Or(t.endsTs,t.nowTs,p)}</span>`:T`<span class="meta-value">${t.isActive?V(`progress.ongoing`,p):V(`progress.tbd`,p)}</span>`}
          </div>
          ${m===void 0?E:T`
            <div class="meta-item">
              <span class="meta-label">${V(`detail.distance`,p)}</span>
              <span class="meta-value">${mr(m,pr((i=this.hass)==null||(i=i.config)==null||(i=i.unit_system)==null?void 0:i.length),p)}</span>
            </div>
          `}
          ${e.areaDesc?this._renderAreaRow(e,p):E}
        </div>
        `}

        ${((a=this._config)==null?void 0:a.showGeometry)===!0?this._renderGeometry(e):E}

        ${((o=this._config)==null?void 0:o.showDescription)===!1?E:this._renderTextBlock(V(`detail.description`,p),d)}
        ${((s=this._config)==null?void 0:s.showInstructions)===!1?E:this._renderTextBlock(V(`detail.instructions`,p),f)}

        ${u&&((c=this._config)==null?void 0:c.showSourceLink)!==!1?T`
          <div class="footer-link">
            <a href=${u} target="_blank" rel="noopener noreferrer">
              ${this._sourceLinkLabel(e)}
              <ha-icon icon="mdi:open-in-new" style="width:${this._scaledPx(14)}px;"></ha-icon>
            </a>
          </div>
        `:E}
      </div>
    `}_renderAreaRow(e,t){let n=Mr(e.areaDesc),r=e.id+`_area`,i=n.more>0&&(this._expandedAlerts.get(r)||!1);return T`
      <div class="meta-item" style="grid-column: 1 / -1;">
        <span class="meta-label">${V(`detail.area`,t)}</span>
        <span class="meta-value">${i?e.areaDesc:n.first}</span>
        ${n.more>0?T`
          <button
            type="button"
            class="area-toggle"
            aria-expanded=${i?`true`:`false`}
            @click=${()=>this._toggleDetails(r)}
          >${i?V(`detail.area_fewer`,t):V(`detail.area_more`,t,{count:n.more})}</button>
        `:E}
      </div>
    `}_geometryPoints(e){var t,n;let r=e.point,i=((t=this._config)==null?void 0:t.showMyLocation)===!0?lr(this.hass,(n=this._config)==null?void 0:n.myLocationEntity):void 0,a=e.bbox;if(!a&&r){let e=i&&sr(r[0],r[1],i[0],i[1])<=150;i&&!e&&(i=void 0),a=Ya(i?[r,i]:[r])}return{bbox:a,point:r,referencePoint:i}}_renderGeometry(e){var t,n;if(((t=this._config)==null?void 0:t.showGeometry)!==!0)return E;let{bbox:r,point:i,referencePoint:a}=this._geometryPoints(e);if(!r)return E;let o=e.geometryRef?this._geometryCache.get(e.geometryRef):void 0;if(((n=this._config)==null?void 0:n.geometryStyle)===`map`){var s;if((s=this._config)!=null&&s.geometryTileUrl||this._mapTilesToken!==null)return this._renderGeometryMap(e,r,o,i,a)}let{viewBox:c,shapePath:l,marker:u,referenceMarker:d}=Za(r,o,i,a);return T`
      <svg
        class="alert-geometry${e.bbox?``:` point`}"
        viewBox=${c}
        preserveAspectRatio="xMidYMid meet"
        role="img"
        aria-label=${this._geometryLabel(e,d!==void 0)}
      >
        <rect class="geometry-frame" x="0" y="0" width="100%" height="100%"></rect>
        ${this._renderGeometryShape(e,c,l,!1)}
        ${this._renderGeometryMarkers(u,d,!1)}
      </svg>
    `}_renderGeometryShape(e,t,n,r){if(!n)return E;let i=eo(e.provider,e.id),a=`url(#${i})`,[,,o,s]=t.split(` `).map(Number),c={x:-o,y:-s,width:3*o,height:3*s};return we`
      <defs>
        <mask id=${i} maskUnits="userSpaceOnUse" x=${c.x} y=${c.y} width=${c.width} height=${c.height}>
          <rect x=${c.x} y=${c.y} width=${c.width} height=${c.height} fill="#fff"></rect>
          <path d=${n} fill="#000" fill-rule="nonzero"></path>
        </mask>
      </defs>
      <path class="geometry-fill" d=${n} fill-rule="nonzero"></path>
      ${r?we`<path class="geometry-shape-casing" d=${n} mask=${a}></path>`:E}
      <path class="geometry-shape" d=${n} mask=${a}></path>
    `}_renderGeometryMarkers(e,t,n){return T`
      ${t?we`
        <path class="geometry-reference-ring" d=${Xa(t)}></path>
        <path class="geometry-reference-core" d=${Xa(t)}></path>
      `:E}
      ${e&&n?we`<path class="geometry-marker-casing" d=${Xa(e)}></path>`:E}
      ${e?we`<path class="geometry-marker" d=${Xa(e)}></path>`:E}
    `}_geometryLabel(e,t){let n=e.areaDesc||V(`detail.area`,this._lang);return t?V(`detail.geometry_with_location`,this._lang,{area:n}):n}_renderGeometryMap(e,t,n,r,i){var a,o,s,c,l;let u=(a=this._config)==null?void 0:a.geometryTileUrl,d=u||io((o=this.hass)==null||(o=o.auth)==null||(o=o.data)==null?void 0:o.hassUrl,(s=this._mapTilesToken)==null?``:s),f=(c=(l=this._config)==null?void 0:l.geometryTileAttribution)==null?u?`© OpenStreetMap`:`© OpenStreetMap contributors`:c,p=!u&&this._themeMode===`dark`,{viewBox:m,aspect:h,tiles:g,shapePath:_,marker:v,referenceMarker:y}=uo(t,n,{tileUrl:d,attribution:f,point:r,referencePoint:i}),b=this._geometryLabel(e,y!==void 0);return T`
      <div class="alert-geometry-map" style="aspect-ratio: ${h};">
        <svg
          class="alert-geometry map${e.bbox?``:` point`}${p?` dark`:``}"
          viewBox=${m}
          preserveAspectRatio="xMidYMid meet"
          role="img"
          aria-label=${b}
        >
          <g class="geometry-tiles">
            ${g.map(e=>we`<image
              href=${e.href}
              x=${e.x}
              y=${e.y}
              width=${e.size}
              height=${e.size}
            ></image>`)}
          </g>
          <rect class="geometry-frame" x="0" y="0" width="100%" height="100%"></rect>
          ${this._renderGeometryShape(e,m,_,!0)}
          ${this._renderGeometryMarkers(v,y,!0)}
        </svg>
        <span class="geometry-attrib">${f}</span>
      </div>
    `}_renderProgressSection(e,t){let{isActive:n,progressPct:r,hasEndTime:i,onsetTs:a,endsTs:o,nowTs:s}=t,c=this._lang,l=t.isExpired?`left: 0; right: 0;`:n&&!i?`width: 100%; left: 0;`:`left: ${r}%; right: 0;`;return T`
      <div class="progress-section">
        <div class="progress-labels">
          <div class="label-left">
            <span class="label-sub">${V(n?`progress.start`:`progress.now`,c)}</span>
            <span>${Er(n?a:s,this._locale,c,s)}</span>
          </div>
          <div class="label-center">
            ${i?t.isExpired?T`<span class="label-sub">${V(`progress.expired_label`,c)}</span><span>${kr(o,s)}</span>`:n?T`<span class="label-sub">${V(`progress.expires_in_label`,c)}</span><span>${kr(o,s)}</span>`:T`<span class="label-sub">${V(`progress.starts_in_label`,c)}</span><span>${kr(a,s)}</span>`:T`<span class="label-sub">${V(`progress.ongoing`,c)}</span>`}
          </div>
          <div class="label-right">
            <span class="label-sub">${V(`progress.end`,c)}</span>
            <span>${i?Er(o,this._locale,c,s):V(`progress.tbd`,c)}</span>
          </div>
        </div>
        <div class="progress-track">
          <div class="progress-fill" style=${l}></div>
        </div>
      </div>
    `}};$.styles=ho,$._editorExpandedState=/* @__PURE__ */ new Map,$.TIMELINE_DEFAULT_ACTION={action:`details`},J([qe({attribute:!1})],$.prototype,`hass`,void 0),J([qe({attribute:!1})],$.prototype,`preview`,void 0),J([qe({attribute:!1})],$.prototype,`editMode`,void 0),J([k()],$.prototype,`_config`,void 0),J([k()],$.prototype,`_expandedAlerts`,void 0),J([k()],$.prototype,`_forcePreview`,void 0),J([k()],$.prototype,`_detailPopupAlertId`,void 0),J([k()],$.prototype,`_dismissals`,void 0),J([k()],$.prototype,`_swipeExiting`,void 0),J([k()],$.prototype,`_geometryCache`,void 0),J([k()],$.prototype,`_mapTilesToken`,void 0),J([k()],$.prototype,`_timelineLanePx`,void 0),$=Io=J([We(`weather-alerts-card`)],$);const Wo=window;Wo.customCards=Wo.customCards||[],Wo.customCards.push({type:`weather-alerts-card`,name:`Weather Alerts Card`,preview:!0,description:`Weather and hazard alerts from eleven integrations (NWS, ECCC, MeteoAlarm, DWD, MeteoSwiss, NINA, NSW RFS, INMET, BoM, PirateWeather, CAP Alerts), rendered one way: severity color, time progress, the agency's text, and a map where the feed has one.`});export{Lo as GEOMETRY_MISS_COOLDOWN_MS,Ro as GEOMETRY_MISS_MAX_ATTEMPTS,$ as WeatherAlertsCard,wa as resolveDeviceAlertEntities,Oa as subscribeEntityRegistry};