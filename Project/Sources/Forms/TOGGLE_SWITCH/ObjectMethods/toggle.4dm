// ----------------------------------------------------
// Object method : w_toggle_switch.toggle
// ID[86346C2061574365B3E489917850B77B]
// Created 4-5-2017 by Vincent de Lachaux
// ----------------------------------------------------
var $t : Text
var $l : Integer
var $ptr : Pointer
var $e : Object

$e:=FORM Event:C1606

Case of 
		
		//______________________________________________________
	: ($e.code=On Load:K2:1)
		
		$t:="<?xml version='1.0' encoding='UTF-8' standalone='yes' ?>"
		$t+="<svg xmlns='http://www.w3.org/2000/svg' transform='translate(0.5,0.5)'>"
		$t+="<g fill='white' id='back' state='0'>"
		$t+="<rect height='20' rx='9' stroke='dimgray' stroke-width='0.5' width='40' x='0' y='0'/>"
		$t+="</g>"
		$t+="<circle cx='10' cy='10' fill='white' id='button' r='9' stroke='dimgray' stroke-width='1'/>"
		$t+="</svg>"
		
		$t:=DOM Parse XML variable:C720($t)
		
		If (Bool:C1537(OK))
			
			SVG EXPORT TO PICTURE:C1017($t; Self:C308->; Own XML data source:K45:18)
			
		End if 
		
		//______________________________________________________
	: ($e.code=On Clicked:K2:4)
		
		$t:=OBJECT Get name:C1087(Object current:K67:2)
		
		SVG GET ATTRIBUTE:C1056(*; $t; "back"; "state"; $l)
		
		$l:=Abs:C99(1-$l)
		
		SVG SET ATTRIBUTE:C1055(*; $t; "back"; "state"; $l; *)
		
		$ptr:=OBJECT Get pointer:C1124(Object subform container:K67:4)
		$ptr->:=Type:C295($ptr->)=Is boolean:K8:9 ? Bool:C1537($l) : $l
		
		SET TIMER:C645(-1)
		
		//______________________________________________________
End case 