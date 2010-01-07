Erlang BERT encoder/decoder. See http://bert-rpc.org for full spec.

Watch and contribute to this module at http://github.com/mojombo/bert.erl.

This module is Semantic Versioning (http://semver.org) compliant.

The following types can be automatically encoded and decoded.
See http://www.erlang.org/eeps/eep-0008.html for type definitions.

  integer() -> BERT integer
  float()   -> BERT float
  atom()    -> BERT atom
  tuple()   -> BERT tuple
  list()    -> BERT list or BERT bytelist
  string()  -> BERT list or BERT bytelist (you probably want binary)
  binary()  -> BERT binary
  []        -> BERT nil (complex)
  bool()    -> BERT boolean (complex)
  dict()    -> BERT dict (complex)

Because times and regular expressions types cannot be automatically
detected, you must encode and decode those types manually.

To encode Erlang terms to BERT binaries, use:

    encode(term()) -> binary().

To decode BERT binaries to Erlang terms, use:

    decode(binary()) -> term().

Examples

    % Encode a variety of literal Erlang terms:
    bert:encode([42, 3.14, banana, {xy, 5, 10}, <<"robot">>, true, false]).
    % -> <<131,108,0,0,0,7,97,42,99,51,46,49,52,48,48,48,48,48,48,...>>

    % Encode an Erlang dict() record:
    D0 = dict:new().
    D1 = dict:store(apple, red, D0).
    bert:encode(D1).
    % -> <<131,104,9,100,0,4,100,105,99,116,97,0,97,16,97,16,97,8,...>>

    % Decode a BERT binary:
    bert:decode(<<131,108,0,0,0,7,97,42,99,51,46,49,52,...>>).
    % -> [42, 3.14, banana, {xy, 5, 10}, <<"robot">>, true, false]