-module(maths_tests).

-include_lib("eunit/include/eunit.hrl").

add_test() ->

	?assert(maths:add(5,10) == 15),
	?assertEqual(20,maths:add(8,12)),
	?assertMatch({nope,_},maths:add(a,2)),
	?assertError(badarith, 1/0).


add_gen_test_() ->
	[?_assert(maths:add(5,10) == 15),
	 ?_assertEqual(20,maths:add(8,12)),
	 ?_assertMatch({nope,_},maths:add(a,2))
	].
