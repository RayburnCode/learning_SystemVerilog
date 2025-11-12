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

| 0 | Logic state 0 - variable/net is at 0 volts |
| 1 | Logic state 1 - variable/net is at some value > 0.7 volts |
| x or X | Logic state X - variable/net has either 0/1 - we just don't know |
| z or Z | Logic state Z - net has high impedence - maybe the wire is not connected and is floating |

## Structures

A structure represents a collection of data-types that are stored together and be referenced via the structure variable.

```Verilog
typedef struct {
    int     coins;
    real    dollars;
} s_money;
```
