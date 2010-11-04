all: compile

compile:
	@ ./rebar compile

tests:
	@ ./rebar eunit

clean:
	@ ./rebar clean
