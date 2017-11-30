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

		PUBLIC FUNCTION("","constructor") { 
			DEBUG(#, "OO_FORM::constructor")
		};

		PUBLIC FUNCTION("","getThis") FUNC_GETVAR("this");
		PUBLIC FUNCTION("","getMyVariable") FUNC_GETVAR("myvariable");

		PUBLIC FUNCTION("","setMyVariable") {
			DEBUG(#, "OO_FORM::setMyVariable")
		};

		PUBLIC FUNCTION("","deconstructor") { 
			DELETE VARIABLE("this");
		};
	ENDCLASS;