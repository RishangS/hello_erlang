-module(get_handler).
-behavior(cowboy_handler).

-export([init/2]).

init(Req0, State) ->
	% 
	io:format("Module = ~s \n", [?MODULE]),
	Header_format = #{<<"content-type">> => <<"text/plain">>},
    Req = cowboy_req:reply(200,
         Header_format,
         content_for(Req0),
         Req0),
    {ok, Req, State}.


content_for(Var)->

			QsVals = cowboy_req:parse_qs(Var),

			{_, FN} = lists:keyfind(<<"firstname">>, 1, QsVals),
				
				io:format("FN = ~s \n", [FN]),
			{_, LN} = lists:keyfind(<<"lastname">>, 1, QsVals),
				io:format("LN = ~s \n", [LN]),
				
				"Hello " ++erlang:binary_to_list(FN)++ " " ++erlang:binary_to_list(LN).

