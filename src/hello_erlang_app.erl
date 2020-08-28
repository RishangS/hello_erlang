-module(hello_erlang_app).
-behaviour(application).

-export([start/2]).
-export([stop/1]).

start(_Type, _Args) ->

	Routes = [	{"/a/[:firstname]/[:lastname]", get_handler,[]},
				{"/b/", post_handler, []},
				{"/c", header_handler, []}
			   	],
    
	Dispatch = cowboy_router:compile([
		{'_', Routes }]),

	    {ok, _} = cowboy:start_clear(my_http_listener,
		[{port, 8080}],
		#{env => #{dispatch => Dispatch}}
	    ),
	    hello_erlang_sup:start_link().


stop(_State) ->
	ok.
