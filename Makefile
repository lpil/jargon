PREFIX:=../
DEST:=$(PREFIX)$(PROJECT)

REBAR=rebar3

.PHONY: all clean test release-prod release-dev

all:
	(cd argon2;make all;cd ..;cp argon2/libargon2.so.1 argon2/libargon2.a priv)
	@$(REBAR) compile

clean:
	(cd argon2;make clean;cd ..;rm -f priv/libargon2.so.1 priv/libargon2.a priv/kat-argon2*)
	@$(REBAR) clean

test:
	@$(REBAR) eunit

release-prod:
	@$(REBAR) release -n jargon_prod

release-dev:
	@$(REBAR) release -n jargon_dev
