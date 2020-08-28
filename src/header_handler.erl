-module(header_handler).
-behavior(cowboy_handler).

-export([init/2]).

init(Req0, State) ->
	% 
	io:format("Module = ~s \n", [?MODULE]),
	% io:format("Req0 = ~s \n", [Req0]),
	Header_format = #{<<"content-type">> => <<"text/plain">>},
    Req = cowboy_req:reply(200,
         Header_format,
         content_for(Req0),
         Req0),
    {ok, Req, State}.


content_for(Var)->
				#{headers := AllHeaders} = Var,

				AllHeaders,
				Headers_as_list = maps:to_list(AllHeaders),
				Headers = [[erlang:binary_to_list(X),erlang:binary_to_list(Y)] || {X,Y} <- Headers_as_list, X>0 ],
				io:format("Accept = ~p \n", [Headers]),

				Headers.
