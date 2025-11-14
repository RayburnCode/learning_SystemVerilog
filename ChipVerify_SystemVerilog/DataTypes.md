<!-- @format -->

# Data Types

reg, wire,integer, and real are the only types available in Verilog.

| Data Type | 2-State/4-State | # Bits | (Un)Signed |
| --------- | --------------- | ------ | ---------- |
| reg       | 4               | >=1    | Unsigned   |
| wire      | 4               | >=1    | Unsigned   |
| integer   | 4               | 32     | Signed     |
| real      | --              | --     | --         |
| --        | --              | --     | --         |
| logic     | 4               | >=1    | unsigned   |
| bit       | 2               | >=1    | unsigned   |
| byte      | 2               | 8      | signed     |
| shortint  | 2               | 16     | signed     |
| int       | 2               | 32     | signed     |
| longint   | 2               | 64     | signed     |
| shortreal | --              | --     | --         |

## States

| State  | Description                                                                              |
| ------ | ---------------------------------------------------------------------------------------- |
| 0      | Logic state 0 - variable/net is at 0 volts                                               |
| 1      | Logic state 1 - variable/net is at some value > 0.7 volts                                |
| x or X | Logic state X - variable/net has either 0/1 - we just don't know                         |
| z or Z | Logic state Z - net has high impedence - maybe the wire is not connected and is floating |

## Structures

A structure represents a collection of data-types that are stored together and be referenced via the structure variable.

```Verilog
typedef struct {
    int     coins;
    real    dollars;
} s_money;
```

### Logic

Can be driven in both procedural blocks and continuous assign statements. However, a signal with more than one driver needs to be declared a net-type such as wire so that SystemVerilog can resolve the final value based on strength.

```SystemVeilog
module tb;
    logic [3:0]  my_data; // Declare a 4-bit logic type variable
    logic        en; // Declare a 1-bit logic type variable

    initial begin
        $display ("my_data=0x%0h en=%0b", my_data, en);   // Default value of logic type is X
        my_data = 4'hB;  // logic datatype can be driven in initial/always blocks
        $display ("my_data=0x%0h en=%0b", my_data, en);
        #1;
        $display ("my_data=0x%0h en=%0b", my_data, en);
    end

    assign en = my_data[0];       // logic datatype can also be driven via assign statements
endmodule
```

### bit

A range specification ([MSB:LSB]) should be provided to make it represent and store multiple bits.

- LSB: Least Significant Bit
- MSB: Most Significant Bit

```SystemVerilog
  bit       var_a;       // Declare a 1 bit variable of type "bit"
  bit [3:0] var_b;       // Declare a 4 bit variable of type "bit"

  logic [3:0] x_val;     // Declare a 4 bit variable of type "logic"
```
