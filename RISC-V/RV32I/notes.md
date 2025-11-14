<!-- @format -->

# RV32I

RV32I was designed to be sufficient to form a compiler target and to support modern operating system environments.

RV32I contains 40 unique instructions

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
