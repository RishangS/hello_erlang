-module(post_handler).
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

			{ok, Data, _Req} = cowboy_req:read_body(Var),
			io:format("Data = ~s \n", [Data]),
			Data1 = lists:flatten(io_lib:format("~p", [Data])),

			io:format("Data1 = ~s \n", [Data1]),

			erlang:binary_to_list(Data).

