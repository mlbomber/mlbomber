SRC=display/bomb/bomb.opa\
	display/commom/common.opa\
	display/map/map.opa\
	display/player/player.opa\
	game/generator/map-generator.opa\
	game/rule/rule.opa\
	game/state/state.opa\
	game/type/type.opa\
	profile/access/getset.opa\
	profile/admin/admin.opa\
	server/main/main.opa

OPT=--parser js-like

CONF=conf.conf

calc.exe: $(SRC) $(CONF)
	opa $(SRC) $(CONF) $(OPT) $(OPT2)
