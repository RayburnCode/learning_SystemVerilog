<!-- @format -->

# Tools to Install

- **Verilator**: Run your code, check if it works
- **GTKWave**: Debug by viewing signals over time
- **Yosys**: See what hardware your code creates
- **RISC-V toolchain**: Compile test programs for your core
- **Spike**: Compare your core's behavior to reference
- **riscv-tests**: Verify ISA compliance
- **VS Code**: Write code comfortably with syntax highlighting

## Simulation & Verification

### Verilator

Compiles into multithreaded C++, or SystemC

### GTKWave

Waveform viewer for analyzing signal traces (.vcd, .fst files)

### Surfer

Modern open-source waveform viewer (alternative to GTKWave)

## Synthesis & FPGA Tools

### Yosys

Open-source synthesis tool. Converts RTL to gate-level netlists.
Essential for understanding what your code becomes in hardware

## RISC-V Specific

### RISC-V GNU Toolchain

Cross-compiler (gcc/g++) and binutils for compiling C/C++ to RISC-V assembly.
Essential for writing programs to test your core.

- `riscv64-unknown-elf-gcc`
- `riscv64-unknown-elf-objdump` (disassembler)

### RISC-V Spike Simulator

Official RISC-V ISA simulator. Use as golden reference to verify your design.

### RISC-V Proxy Kernel (pk)

Minimal execution environment for running programs on your core.

### RISC-V Tests

Official compliance tests from riscv-tests repository.
Verify your core implements ISA correctly.

## Code Quality & Development

### Visual Studio Code

With extensions:

- SystemVerilog (by eirikpre)
- Verilog-HDL/SystemVerilog (by mshr-h)
- WaveTrace (view waveforms in VS Code)
