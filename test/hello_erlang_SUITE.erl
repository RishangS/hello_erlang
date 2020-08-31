-module(hello_erlang_SUITE).
-include_lib("common_test/include/ct.hrl").
-export([all/0]).
-export([get_test/1, post_test/1,
		 init_per_suite/1, end_per_suite/1]).
 
all() -> [get_test,post_test].

 
init_per_suite(Config) ->
  _ = application:ensure_all_started(hello_erlang),
  	erlang:display(self()),
  inets:start(),
  Config.

end_per_suite(_Config)->
  ok.

get_test(_Config) ->
  {ok,{{_,200,_},_,_}} = httpc:request(get,{"http://localhost:8080/a?firstname=Rishang&lastname=Santhpale", []}, [], []),
  {ok,{{_,404,_},_,_}} = httpc:request(get,{"http://localhost:8080/r?firstname=Rishang&lastname=Santhpale", []}, [], []).

post_test(_Config) ->
  {ok,{{_,200,_},_,_}} = httpc:request(post,{"http://localhost:8080/b",[],[],"hello"},[],[]),
  {ok,{{_,404,_},_,_}} = httpc:request(post,{"http://localhost:8080/x",[],[],"hello"},[],[]).
