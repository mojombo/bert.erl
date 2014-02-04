-include_lib("eunit/include/eunit.hrl").

%% encode

encode_list_nesting_test() ->
  Bert = term_to_binary([foo, {bert, true}]),
  Bert = encode([foo, true]).

encode_tuple_nesting_test() ->
  Bert = term_to_binary({foo, {bert, true}}),
  Bert = encode({foo, true}).

encode_dict_test() ->
  Bert = term_to_binary({ bert, dict,
                          dict:to_list(dict:store(foo, true, dict:new())) }),
  Bert = encode(dict:store(foo, true, dict:new())).

%% decode

decode_list_nesting_test() ->
  Bert = term_to_binary([foo, {bert, true}]),
  Term = [foo, true],
  Term = decode(Bert).

decode_tuple_nesting_test() ->
  Bert = term_to_binary({foo, {bert, true}}),
  Term = {foo, true},
  Term = decode(Bert).

decode_dict_test() ->
  Bert = term_to_binary({ bert, dict,
                          dict:to_list(dict:store(foo, true, dict:new())) }),
  Term = dict:store(foo, true, dict:new()),
  Term = decode(Bert).

