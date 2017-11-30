	/*
	Author: code34 nicolas_boiteux@yahoo.fr
	Copyright (C) 2014-2018 Nicolas BOITEUX

	CLASS OO_FORM
	
	This program is free software: you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation, either version 3 of the License, or
	(at your option) any later version.
	
	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU General Public License for more details.
	
	You should have received a copy of the GNU General Public License
	along with this program.  If not, see <http://www.gnu.org/licenses/>. 
	*/

	#include "oop.h"

	CLASS("OO_FORM")
		PRIVATE VARIABLE("code","this");
		PRIVATE VARIABLE("display", "display");
		PRIVATE VARIABLE("control", "btn_dep");
		PRIVATE VARIABLE("control", "btn_ret");
		PRIVATE VARIABLE("control", "btn_end");
		PRIVATE VARIABLE("control", "text_cash");
		PRIVATE VARIABLE("control", "text_bank");
		
		PUBLIC FUNCTION("","constructor") { 
			DEBUG(#, "OO_FORM::constructor")
			MEMBER("display", findDisplay 19319);
			MEMBER("btn_dep", _display displayCtrl 2400);
			MEMBER("btn_ret", _display displayCtrl 2401);
			MEMBER("btn_end", _display displayCtrl 2402);
			MEMBER("text_cash", _display displayCtrl 1101);
			MEMBER("text_bank", _display displayCtrl 1104);
		};

		PUBLIC FUNCTION("","pressBtn_ret") { 
			DEBUG(#, "OO_FORM::pressBtn_ret")
			private _depot=parseNumber(ctrlText(1400));
			if (DA3F_Cash < _depot) exitWith {[1,"Opération impossible"]call DA3F_fnc_hint};
			DA3F_Cash = DA3F_Cash - _depot;
			DA3F_Bank = DA3F_Bank + _depot;
			[1,format ["Vous avez fait un dépôt de : <br/>%1 %2",[_depot]call DA3F_fnc_numberText,_deviseUtilise]]call DA3F_fnc_hint;
			[false] call DA3F_fnc_SaveStats;
			MEMBER("text_cash", nil) ctrlSetStructuredText parseText format["%1",[DA3F_Cash]call DA3F_fnc_numberText];
			MEMBER("text_bank", nil) ctrlSetStructuredText parseText format["%1",[DA3F_Bank]call DA3F_fnc_numberText];
		};

		PUBLIC FUNCTION("","pressBtn_dep") { 
			DEBUG(#, "OO_FORM::pressBtn_dep")
			private _depot=parseNumber(ctrlText(1400));
			if (DA3F_Bank < _depot) exitWith {[1,"Opération impossible"]call DA3F_fnc_hint};
			DA3F_Cash = DA3F_Cash + _depot;
			DA3F_Bank = DA3F_Bank - _depot;
			[1,format ["Vous avez fait un retrait de : <br/>%1 %2",[_depot]call DA3F_fnc_numberText,_deviseUtilise]]call DA3F_fnc_hint;
			[false] call DA3F_fnc_SaveStats;
			MEMBER("text_cash", nil) ctrlSetStructuredText parseText format["%1",[DA3F_Cash]call DA3F_fnc_numberText];
			MEMBER("text_bank", nil) ctrlSetStructuredText parseText format["%1",[DA3F_Bank]call DA3F_fnc_numberText];
		};

		PUBLIC FUNCTION("","deconstructor") { 
			DEBUG(#, "OO_FORM::deconstructor")
			DELETE_VARIABLE("this");
			DELETE_VARIABLE("display");
			DELETE_VARIABLE("btn_dep");
			DELETE_VARIABLE("btn_rep");
			DELETE_VARIABLE("btn_end");
			DELETE_VARIABLE("text_cash");
			DELETE_VARIABLE("text_bank");
		};
	ENDCLASS;