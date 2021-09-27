Angular notes from Pragim tech.com 2021

1) What is advantages of angular 2+
-- 	a) Performance: Angular 2 in 5 time faster then angular 1 
	b) Mobile Support: With angular 2 we can build single application that can work across mobile and desktop devices
	c) Component base development: In angular 2, everything is component. Component are building blocks of angular application
	d) More language choices:
		1) ECMAScript5
		2) ECMAScript6(also called ES 2015)
		3) Typescript (This is very popular language, Angular itself is build using Typescript. Typescript has great support for ECMAScript6 standard)
		4) Dart
		5) PureScript
		6) Elm,etc
--------------------------------------------------------------------------------------------------------------------------------------------------
2) What is typescript and ECMAScript?
	ECMAScript:
		1) The JavaScript language standard are officially called ECMAScript
		2) ECMAScript 1 till ECMAScript 7 where release over past several years
		3) Most modern browser available today support ECMAScript5
		4) Transpilation compiles ECMAScript 6 to ECMAScript 5 which most browser can understand
		5) ECMAScript6 is officially known as ECMAScript 2015
		6) New feature in ECMAScript 2015 - Classes, modules, Arrow function etc
	
	Typescript:
		1) Free and open source programming language developed by Microsoft
		2) It is superset of JavaScript
		3) Transpilation compiles Typescript to JavaScript
		4) It is supported by several code editor like VisualStudio, VisualStudio Code, Eclipse, Atom, etc
		5) Benefits
			a) Intellisense
			b) Auto completion
			c) Code navigation
			d) Advanced refactoring
			e) Strong Typing
			f) Support ECMAScript6 features like classes, interfaces & inheritance
--------------------------------------------------------------------------------------------------------------------------------------------------
3) What is component in angular 2
	1) A component is a class with template and decorator
	2) Component is compose for 3 thing
		a) Template - Defines the user interface. contains HTML, directive, and data binding
		b) Class - contains properties and method. Properties contains data for view template and method contains logic for view
		c) Decorator - It will add meta data to the class making it an angular component 
	3) e.g:
		import {Component} from '@angular/core';
	
		@Component({
		  selector: "app-root",
		  template: `<h1>This is {{name}}</h1>`,
		})
		export class AppComponent{
		  name:string ="aniket pallavi"
		}
--------------------------------------------------------------------------------------------------------------------------------------------------
4) What is Nested Component?
	1) Nested component means component inside component
	(Will add more info later)
--------------------------------------------------------------------------------------------------------------------------------------------------
5) How to add styling component and what are the various way to add style to component?
	A) Inside external style sheet:style.css
		a) Advantages:
			1) Editor intelligence and auto formating of css code
			2) This style.css file is common for each component so if we want to make any change we can make it in only one place
		b) Disadvantages:
			1) This is global file so if we make any changes in file will impact other component as well which we might not want
	B) Style in-line in the component html file
		a) Advantages:
			1) If we write style in html file so it is very component specific so we can easily reuse this component
			2) Style will not impact other component
		b) Disadvantages:
			1) Application maintenance: if we have to change anything we might have to do it in multiple places
			
			2) It is not standard way to write style inside html pages
	C) Style in the component html file using style tag
	D) Specify the styles using the @component decorator "styles" property
	E) Specify the styles using the @component decorator "styleUrls" property
--------------------------------------------------------------------------------------------------------------------------------------------------
6) What is Interpolation in angular?
	A) Interpolation means data binding in angular
	B) There are 3 way of data binding in angular
		1) One way data binding (From component to view template)
			Example
				a) <h1>{{firstName}}</h1> //firstName is a property in component
				b) <h1>{{'Name = '+ name }}</h1>  //name is a property in component
				c) <h1>{{ 10+20+30 }}</h1> 
				d) <h1>{{ firstName? firstName : 'No name specified'}}</h1> 
				e) <img src='{{imgPath}}'>
				f) <h1>{{'Full Name='+getFullName()}}</h1>
		2) One way data binding (from view template to component)
		
		3) Two way data binding (From component to view and vice-versa)

			
--------------------------------------------------------------------------------------------------------------------------------------------------
7) What us property binding in angular?
	A) Property binding deals with one why data binding i.e. component class property to HTML element 
	B) To use property binding we enclose html element in square bracket []
		e.g. <img [src]="imgPath"  class="logoStyle">
	C) we can also use alternative syntax for property binding bind- prefix. This is known as canonical form
		e.g.1) <button bind-disabled='isDisabled'>Click me</button>
			2) <img bind-src="imgPath"  class="logoStyle">
--------------------------------------------------------------------------------------------------------------------------------------------------
8) What is difference between interpolation and property binding?
	1) Interpolation is special syntax that convert interpolation to property binding
	2) If we have to concatenate string with hard coded value then we have to use interpolation
		e.g. <img src="http://www.pragimtech.com/{{imageUrl}}"/>
	3) To set element property value to non string value use property binding
		e.g. <button [disabled]="isDisabled">Click me</button>
--------------------------------------------------------------------------------------------------------------------------------------------------
9) Difference between HTML attribute and dom property
	1) DOM stands for document object model. When browser loads a web page, the browser creates DOM object for it
	2) Attribute are defined by HTML and property are defined by DOM
	3) Attribute initialize DOM properties. Once initialization done then attribute job is done
	4) Property value can change, where attribute can't
	
	Note: 1) HTML attribute and dom property are different thing
		  2) Angular binding work with properties and event, and not with attribute
--------------------------------------------------------------------------------------------------------------------------------------------------
10) Attribute binding in angular?
	1) Interpolation and property binding deals with binding component class property to HTML element property not attribute
	2) But not all HTML element attribute having it's corresponding DOM property. For example colspan attribute does not have its corresponding dom property
	3) In situation like this we want to be able to bind to HTML element attribute
	4) Hence angular provide attribute binding
		e.g. 
			<th [attr.colspan]="columnSpan">{{tableHeader}}</th>
			alternate to above is
			<th attr.colspan="{{columnSpan}}">{{tableHeader}}</th>
--------------------------------------------------------------------------------------------------------------------------------------------------
11) Class binding?
	1) Replace all the existing CSS classes with one or more classes
		HTML: <button [class]="classesToApply">Click me</button>
		Typescript: classesToApply:string="boldClass italicClass"
	2) Add or remove single class
		HTML: <button [class.boldClass]="applyBoldClass">Click me</button>
		Typescript: applyBoldClass:boolean=false
	3) Add or remove multiple classes
		HTML: <button [ngClass]="applyClassToButton()">Click me</button>
		Typescript: applyBoldClass: boolean = true;
					applyItalicClass: boolean = true;
					applyColorClass: boolean = true;

					applyClassToButton(): any {
						let classes = {
							boldClass: this.applyBoldClass,
							italicClass: this.applyItalicClass,
							colorClass: this.applyColorClass
						}
						return classes
					}
		
--------------------------------------------------------------------------------------------------------------------------------------------------
12) Style binding?
	1) Setting single inline style using style binding
		HTML: <button [style.font-weight]="isBold? 'bold' :'normal' ">Click me</button>
		Typescript: isBold:boolean=true;
	2) Multiple inline style using ngStyle directive
		HTML: <button [ngStyle]="getStyle()">Click me</button>
		Typescript: getStyle():any{
						let styles={
							'font-size':'30px',
							'font-weight':'bold',
							'font-style': 'italic' 
						}
						return styles;
					}
--------------------------------------------------------------------------------------------------------------------------------------------------
13) Event binding?
	
	
					
		

 