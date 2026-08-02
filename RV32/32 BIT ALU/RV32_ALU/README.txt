# 32-bit RV32I Arithmetic Logic Unit (ALU)

A synthesizable 32-bit Arithmetic Logic Unit (ALU) designed in **Verilog HDL** for the **RISC-V RV32I Base Integer Instruction Set**. The ALU was functionally verified using **SystemVerilog** and synthesized using **Xilinx Vivado**.

---

## Overview

This project implements the ALU required for a **32-bit RV32I Single-Cycle RISC-V Processor**. It performs arithmetic, logical, shift, and comparison operations defined in the RV32I ISA.

The project follows a standard digital design flow:

- RTL Design (Verilog)
- Functional Verification (SystemVerilog)
- RTL Elaboration
- FPGA Synthesis
- Resource Utilization Analysis
- Timing Analysis

---

## Features

- 32-bit data path
- Combinational ALU
- Zero flag generation
- Synthesizable RTL
- SystemVerilog testbench

---

## Supported Instructions

| ALU Control | Operation | RV32I Instruction |
|-------------|-----------|------------------|
| 0000 | ADD | ADD, ADDI |
| 0001 | SUB | SUB |
| 0010 | AND | AND, ANDI |
| 0011 | OR | OR, ORI |
| 0100 | XOR | XOR, XORI |
| 0101 | SLL | SLL, SLLI |
| 0110 | SRL | SRL, SRLI |
| 0111 | SRA | SRA, SRAI |
| 1000 | SLT | SLT, SLTI |
| 1001 | SLTU | SLTU, SLTIU |

---

## Inputs

| Signal | Width | Description |
|--------|------:|-------------|
| A | 32 | Operand A |
| B | 32 | Operand B |
| ALU_Control | 4 | Selects the ALU operation |

---

## Outputs

| Signal | Width | Description |
|--------|------:|-------------|
| Result | 32 | ALU result |
| Zero | 1 | High when Result equals zero |

---

## Project Structure

```
RV32I_ALU/
│
├── rtl/
│   └── alu.v
│
├── tb/
│   └── alu_tb.sv
│
├── README.md
└── .gitignore
```

---

## Verification

The ALU was verified using a SystemVerilog testbench.

The following operations were tested:

- ADD
- SUB
- AND
- OR
- XOR
- SLL
- SRL
- SRA
- SLT
- SLTU

Behavioral simulation completed successfully in Vivado.

---

## RTL Flow

```
Specification
      │
      ▼
Architecture
      │
      ▼
RTL Coding (Verilog)
      │
      ▼
SystemVerilog Testbench
      │
      ▼
Behavioral Simulation
      │
      ▼
RTL Elaboration
      │
      ▼
Synthesis
      │
      ▼
Resource Utilization
      │
      ▼
Timing Analysis
```

---

## Synthesis Results

Tool: **Xilinx Vivado**

| Resource | Utilization |
|----------|------------:|
| Slice LUTs | 362 |
| F7 MUXes | 2 |
| Bonded IOBs | 101 |

---

## Timing Analysis

The ALU is implemented as a **pure combinational circuit**.

- No clock signal
- No sequential elements
- No setup/hold timing paths
- Timing analysis completed without violations

---

## Tools Used

- Verilog HDL
- SystemVerilog
- Xilinx Vivado
- Vivado Simulator

---

## Future Improvements

- Parameterizable ALU width
- Overflow and Carry flags
- Integration into a complete RV32I processor
- FPGA implementation
- ASIC synthesis and physical design using OpenROAD/OpenLane

---

## Author

**Naghul Pranav B S**

Electronics and Communication Engineering  
Manipal Institute of Technology