#define STRINGIZE(x) #x
#define STRINGIZE_VALUE_OF(x) STRINGIZE(x)

#include "Vcounter.h"
#include "verilated.h"
#include "verilated_vcd_c.h"
#include <iostream>


int main(int argc, char **argv, char **env) {
  Verilated::commandArgs(argc, argv);
  Verilated::traceEverOn(true);

  Vcounter* top = new Vcounter;
  VerilatedVcdC* tfp = new VerilatedVcdC;

  top->trace (tfp, 99);
  tfp->open (STRINGIZE_VALUE_OF(VCD_FILE));

  //init module
  top->clk = 0;
  top->rst = 0;

  std::cout << "-------------- Simulation Started ---------------" << '\n';
  for (int cycles = 0; cycles < 20; cycles++) {
    top->rst = (cycles < 2);
    top->clk = !top->clk;

    top->eval ();
    tfp->dump (cycles);

    if (Verilated::gotFinish()){
      exit(0);
    }
  }
  tfp->close();
  std::cout << "-------------- Simulation Finished --------------" << '\n';

  delete top;
  delete tfp;

  exit(0);
}
