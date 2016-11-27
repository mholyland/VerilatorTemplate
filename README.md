# VerilatorTemplate

A template for starting a new project with [Verilator](http://www.veripool.org/wiki/verilator).

To build the project:
```
make
```
To run the simulation:
```
make run
#which runs: ./obj_dir/Vcounter
```

To view the VCD:
```
make view
#which runs: gtkviewer counter.vcd counter.sav &
```

To clean:
```
make clean
#which runs: rm -rf obj_dir \
             rm -f counter.vcd
```
