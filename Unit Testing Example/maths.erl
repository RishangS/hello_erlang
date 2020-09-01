-module(maths).
-export([add/2]).

add(A, B)->
	if (is_integer(A)) andalso (is_integer(B))->
		A + B;
	true -> 
		{nope,os:timestamp()}
	end.
	
	
	


