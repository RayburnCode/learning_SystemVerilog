<!-- @format -->

# RV32I

RV32I was designed to be sufficient to form a compiler target and to support modern operating system environments.

RV32I contains 40 unique instructions

## Base instruction formats

(The RISC-V Instruction Set Manual Volume I, p.25-26 )

rs1 & rs2 = source

rd = destination register

- R = Register-Register [31:0]

**Algorithmic and Logic operations**

| [31:25] | [24:20] | [19:15] | [14:12] | [11:7] | [6:0]  |
| ------- | ------- | ------- | ------- | ------ | ------ |
| funct7  | rs2     | rs1     | funct3  | rd     | opcode |

**Functions:**

| category   | name | assembly          | opcode  | funct3 | funct7  | description            |
| ---------- | ---- | ----------------- | ------- | ------ | ------- | ---------------------- |
| Arithmetic | ADD  | add rd, rs1, rs2  | 0110011 | 000    | 0000000 | Addition               |
| Arithmetic | SUB  | sub rd, rs1, rs2  | 0110011 | 000    | 0100000 | Subtraction            |
| Logical    | AND  | and rd, rs1, rs2  | 0110011 | 111    | 0000000 | AND                    |
| Logical    | OR   | or rd, rs1, rs2   | 0110011 | 110    | 0000000 | OR                     |
| Logical    | XOR  | xor rd, rs1, rs2  | 0110011 | 100    | 0000000 | XOR                    |
| Shifts     | SLL  | sll rd, rs1, rs2  | 0110011 | 001    | 0000000 | Shift Left Logical     |
| Shifts     | SRL  | srl rd, rs1, rs2  | 0110011 | 101    | 0000000 | Shift Right Logical    |
| Shifts     | SRA  | sra rd, rs1, rs2  | 0110011 | 101    | 0100000 | Shift Right Arithmetic |
| Comparison | SLT  | slt rd, rs1, rs2  | 0110011 | 010    | 0000000 | Set Less Than          |
| Comparison | SLTU | sltu rd, rs1, rs2 | 0110011 | 011    | 0000000 | Set Less Than Unsigned |

- I = Immediate
  immediate is a constant

  | [31:20]   | [19:15] | [14:12] | [11:7] | [6:0]  |
  | --------- | ------- | ------- | ------ | ------ |
  | imm[11:0] | rs1     | funct3  | rd     | opcode |

  | category   | name | assembly | opcode | funct3 | funct7 | description |
  | ---------- | ---- | -------- | ------ | ------ | ------ | ----------- |
  | Arithmetic | SLLI |          |        |        |        |             |
  | Arithmetic | SRLI |          |        |        |        |             |
  | Arithmetic | SRAI |          |        |        |        |             |

- S = Store

| [31:25]    | [24:20] | [19:15] | [14:12] | [11:7]   | [6:0]  |
| ---------- | ------- | ------- | ------- | -------- | ------ |
| imm[11:15] | rs2     | rs1     | funct3  | imm[4:0] | opcode |

- U

  | [31:12]    | [11:7] | [6:0]  |
  | ---------- | ------ | ------ |
  | imm[31:12] | rd     | opcode |

- B = Branch
- J

CSR?

## Models

Clock and Reset
Instruction Memory -> Instruction Fetch Unit -> Control Unit -> Data Path

Data Path Unit = ALU -> Register File & Data Memory

---

Register File: 32 Bit, 32 Registers

## High Level Overview

┌─────────────────────────────────────────────────┐
│ Control Unit │
│ (generates control signals for everything) │
└─────────────────────────────────────────────────┘
↓ (control signals)
┌─────────────────────────────────────────────────┐
│ Datapath │
│ ┌──────────────┐ ┌─────────────┐ │
│ │ Instruction │ │ Data │ │
│ │ Memory │ │ Memory │ │
│ └──────────────┘ └─────────────┘ │
│ │
│ ┌──────────────┐ ┌─────────────┐ │
│ │ Register │ │ ALU │ │
│ │ File │ │ │ │
│ └──────────────┘ └─────────────┘ │
│ │
│ [PC, Adders, Muxes, other logic...] │
└─────────────────────────────────────────────────┘

## Pipelining

Classic 5-Stage RISC-V Pipeline

1. IF (Instruction Fetch)

Fetch the instruction from memory using the Program Counter (PC)

2. ID (Instruction Decode)

Decode the instruction to determine what operation to perform
Read the required registers

3. EX (Execute)

Perform the actual computation (ALU operations, address calculation)

4. MEM (Memory Access)

Access data memory for load/store instructions
Other instructions pass through without doing anything

5. WB (Write Back)

Write results back to the destination register
