#!/bin/sh

TOP = counter

SRC = $(TOP).v
TB = $(TOP)_tb.cpp

VCD = $(TOP).vcd
PREFIX = V$(TOP)
CPP_ARGS = -CFLAGS -DVCD_FILE=\"$(VCD)\"
V_ARGS = $(CPP_ARGS) -Wall --cc --trace --top-module $(TOP) --prefix $(PREFIX)
VIEWER = gtkwave


# run Verilator to create the translated C++ project
obj_dir/$(PREFIX): $(SRC) $(TB)
	verilator $(V_ARGS) $(SRC) --exe $(TB)
	make -j -C obj_dir/ -f $(PREFIX).mk $(PREFIX)

# run executable simulation
$(VCD): obj_dir/$(PREFIX)
	obj_dir/$(PREFIX)

run: obj_dir/$(PREFIX)
	obj_dir/$(PREFIX)

# will view waveforms with gtkwave
# this assumes a TOP.sav will be used as the gtkwave save file
view: $(VCD)
	$(VIEWER) $(VCD) $(TOP).sav &

clean:
	rm -rf obj_dir
	rm -f  $(VCD)

.PHONY: clean view
