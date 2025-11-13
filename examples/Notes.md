<!-- @format -->

# Notes

wire should use "assign" statement.
Can be assigned to multiple drivers.

```Verilog
wire w0, w1
wire[7:0] w_7_0
```

reg (register) should be set inside always block or initial block.

```Verilog
reg r0, r1
reg[7:0] r_7_0
```
