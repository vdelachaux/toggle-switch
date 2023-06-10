// ----------------------------------------------------
// Form method : HDI_TOGGLE_SWITCH
// ID[6D9CAD00290A41158375FE261CDE6A46]
// Created 21-4-2017 by Vincent de Lachaux
// ----------------------------------------------------
var $e : Object

$e:=FORM Event:C1606

Case of 
		
		//______________________________________________________
	: ($e.code=On Load:K2:1)
		
		SET TIMER:C645(-1)
		
		//______________________________________________________
	: ($e.code=On Timer:K2:25)
		
		SET TIMER:C645(0)
		
		(OBJECT Get pointer:C1124(Object named:K67:5; "toggle_2"))->:=True:C214
		
		//______________________________________________________
End case 