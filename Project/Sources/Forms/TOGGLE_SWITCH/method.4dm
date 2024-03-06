// ----------------------------------------------------
// Form method : TOGGLE_SWITCH
// ID[9989B2AEC3484EE5BED219BB7FE37294]
// Created 4-5-2017 by Vincent de Lachaux
// ----------------------------------------------------
var $t : Text
var $toggle : Picture
var $value
var $e; $o : Object

$e:=FORM Event:C1606

Case of 
		
		//______________________________________________________
	: ($e.code=On Load:K2:1)
		
		Form:C1466.state:=False:C215
		Form:C1466.isDark:=FORM Get color scheme:C1761="dark"
		
		If (Is macOS:C1572)
			
			Form:C1466.toggle:={r: 6.5}
			
			If (Form:C1466.isDark)
				
				Form:C1466.off:={\
					back: {fill: "none"; stroke: "gray"}; \
					toggle: {fill: "gainsboro"}\
					}
				
				Form:C1466.on:={\
					back: {fill: "royalblue"; stroke: "deepskyblue"}; \
					toggle: {fill: "gainsboro"}\
					}
				
			Else 
				
				Form:C1466.off:={\
					back: {fill: "none"; stroke: "silver"}; \
					toggle: {fill: "white"}\
					}
				
				Form:C1466.on:={\
					back: {fill: "dodgerblue"; stroke: "silver"}; \
					toggle: {fill: "white"}\
					}
				
			End if 
			
		Else 
			
			Form:C1466.toggle:={r: 5.5}
			
			If (Form:C1466.isDark)
				
				Form:C1466.off:={\
					back: {fill: "none"; stroke: "dimgray"}; \
					toggle: {fill: "whitesmoke"}\
					}
				
				Form:C1466.on:={\
					back: {fill: "paleturquoise"; stroke: "paleturquoise"}; \
					toggle: {fill: "black"}\
					}
				
			Else 
				
				Form:C1466.off:={\
					back: {fill: "none"; stroke: "dimgray"}; \
					toggle: {fill: "dimgray"}\
					}
				
				Form:C1466.on:={\
					back: {fill: "mediumblue"; stroke: "dimgray"}; \
					toggle: {fill: "white"}\
					}
			End if 
		End if 
		
		$o:=Form:C1466.off
		
		$t:="<?xml version='1.0' encoding='UTF-8' standalone='yes' ?>"
		$t+="<svg xmlns='http://www.w3.org/2000/svg' transform='translate(0.5,0.5)'>"
		$t+="<g id='back' fill='"+$o.back.fill+"' stroke='"+$o.back.stroke+"' stroke-width='1'>"
		$t+="<rect x='0' y='0' height='14' width='26' rx='6'/>"
		$t+="</g>"
		$t+="<circle id='button' cx='7.5' cy='7' r='"+String:C10(Form:C1466.toggle.r)+"' fill='"+$o.toggle.fill+"'/>"
		$t+="</svg>"
		
		$t:=DOM Parse XML variable:C720($t)
		
		If (Bool:C1537(OK))
			
			SVG EXPORT TO PICTURE:C1017($t; $toggle; Own XML data source:K45:18)
			OBJECT SET VALUE:C1742("toggle"; $toggle)
			
		End if 
		
		SET TIMER:C645(-1)
		
		//______________________________________________________
	: ($e.code=On Clicked:K2:4)
		
		Form:C1466.state:=Not:C34(Form:C1466.state)
		
		$value:=OBJECT Get subform container value:C1785
		OBJECT SET SUBFORM CONTAINER VALUE:C1784(Value type:C1509($value)=Is boolean:K8:9 ? Form:C1466.state : Num:C11(Form:C1466.state))
		
		SET TIMER:C645(-1)
		
		//______________________________________________________
	: ($e.code=On Timer:K2:25)
		
		SET TIMER:C645(0)
		
		$o:=Form:C1466.state ? Form:C1466.on : Form:C1466.off
		
		SVG SET ATTRIBUTE:C1055(*; "toggle"; "back"; \
			"fill"; $o.back.fill; \
			"stroke"; $o.back.stroke)
		
		SVG SET ATTRIBUTE:C1055(*; "toggle"; "button"; \
			"fill"; $o.toggle.fill; \
			"cx"; Form:C1466.state ? 19 : 7)
		
		//______________________________________________________
	: ($e.code=On Bound Variable Change:K2:52)
		
		$value:=OBJECT Get subform container value:C1785
		Form:C1466.state:=Value type:C1509($value)=Is boolean:K8:9 ? $value : Bool:C1537(Num:C11($value))
		
		SET TIMER:C645(-1)
		
		//______________________________________________________
End case 