// ----------------------------------------------------
// Form method : w_toggle_switch
// ID[9989B2AEC3484EE5BED219BB7FE37294]
// Created 4-5-2017 by Vincent de Lachaux
// ----------------------------------------------------
var $l : Integer
var $ptr : Pointer
var $e : Object

$e:=FORM Event:C1606

// ----------------------------------------------------

Case of 
		
		//______________________________________________________
	: ($e.code=On Load:K2:1)
		
		SET TIMER:C645(-1)
		
		//______________________________________________________
	: ($e.code=On Timer:K2:25)
		
		SET TIMER:C645(0)
		
		SVG GET ATTRIBUTE:C1056(*; "toggle"; "back"; "state"; $l)
		SVG SET ATTRIBUTE:C1055(*; "toggle"; "back"; "fill"; Choose:C955(Is macOS:C1572; "dodgerblue"; Bool:C1537($l) ? "deepskyblue" : "white"))
		SVG SET ATTRIBUTE:C1055(*; "toggle"; "button"; "cx"; Bool:C1537($l) ? 30 : 10.5)
		
		//______________________________________________________
	: ($e.code=On Bound Variable Change:K2:52)
		
		$ptr:=OBJECT Get pointer:C1124(Object subform container:K67:4)
		$l:=Type:C295($ptr->)=Is boolean:K8:9 ? Num:C11($ptr->) : $ptr->
		SVG SET ATTRIBUTE:C1055(*; "toggle"; "back"; "state"; $l)
		
		SET TIMER:C645(-1)
		
		//______________________________________________________
End case 