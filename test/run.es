#!/usr/bin/env escript
%% -*- erlang -*-
%%! -pa ./ebin -sasl -boot start_sasl -noshell

main(_) ->
  bert:test().
