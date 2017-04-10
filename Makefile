.PHONY: all clean deps distclean doc test compile ui

# allow rebar binary to be set via environment variable
REBAR ?= ./rebar

all:
	@$(REBAR) get-deps compile

test: compile
	@$(REBAR) skip_deps=true eunit

deps:
	@$(REBAR) get-deps

clean:
	@$(REBAR) clean

distclean: clean
	@$(REBAR) delete-deps

doc:
	@$(REBAR) doc

compile:
	@$(REBAR) compile

rebar:
	curl https://raw.githubusercontent.com/wiki/rebar/rebar/rebar > rebar
	chmod +x $@

ui:
	rm -rf apps/epl/priv/htdocs
	cd ui && yarn && yarn build && cd ../
	mv ui/build apps/epl/priv/htdocs
