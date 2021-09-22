Angular notes from Pragim tech.com 2021

1) What is advantages of angular 2+
-- 	a) Performance: Angular 2 in 5 time faster then angular 1 
	b) Mobile Support: With angular 2 we ca build single application that can work across mobile and desktop devices
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
		  template: `<h1>This is {{name }}</h1>`,
		})
		export class AppComponent{
		  name:string ="aniket pallavi"
		}
--------------------------------------------------------------------------------------------------------------------------------------------------
4) What is Nested Component?

	
	
	