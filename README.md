# 4-Bit Carry Look-Ahead Adder (CLA)

This repository contains the complete design, simulation, and implementation of a 4-bit Carry Look-Ahead (CLA) adder using 180 nm CMOS technology. The project follows a full VLSI workflow, including schematic design, simulation, layout creation, post-layout verification, and FPGA implementation.

The goal of the project is to design a high-speed adder that minimizes propagation delay compared to conventional ripple carry adders.

---

## Overview

Carry Look-Ahead Adders are designed to eliminate the delay caused by sequential carry propagation. Instead of waiting for each bit to compute its carry, the CLA computes all carry signals in parallel using propagate and generate logic.

This project explores the CLA design across multiple stages:
- Circuit-level design
- NGSPICE simulation
- MAGIC layout implementation
- Post-layout extraction
- Verilog verification
- FPGA-based validation

---

## Repository Structure

```
4-Bit-CLA/
├── VLSI_PROJ-1-3.pdf     # Complete project report
├── README.md             # Project documentation
├── ngspice/              # Simulation files and outputs
├── magic/                # Layout files
├── verilog/              # Verilog code and testbench
├── results/              # Waveforms and outputs
└── diagrams/             # Circuit diagrams and figures
```

---

## Design Details

### Propagate and Generate Logic

For inputs $a_i$ and $b_i$:

- $p_i = a_i \oplus b_i$
- $g_i = a_i \cdot b_i$

These signals determine whether a carry is propagated or generated at each stage.

---

### Carry Computation

The carry signals are computed as:

- $c_1 = g_0 + p_0 c_0$
- $c_2 = g_1 + p_1 g_0 + p_1 p_0 c_0$
- $c_3 = g_2 + p_2 g_1 + p_2 p_1 g_0 + p_2 p_1 p_0 c_0$
- $c_4 = g_3 + p_3 g_2 + p_3 p_2 g_1 + p_3 p_2 p_1 g_0 + p_3 p_2 p_1 p_0 c_0$

This allows all carries to be computed in parallel, significantly reducing delay.

---

## Tools Used

- NGSPICE for circuit simulation
- MAGIC for layout design
- Verilog HDL for functional verification
- GTKWave for waveform visualization
- FPGA board for hardware validation

---

## Simulation and Results

### D Flip-Flop Timing

- Setup time: 0.11 ns
- Propagation delay (min): 0.139 ns
- Propagation delay (max): 0.205 ns

---

### Maximum Clock Frequency

- Pre-layout: 401.6 MHz
- Post-layout: 370.37 MHz

The reduction in clock speed is due to additional delays introduced during layout.

---

## Layout and Post-Layout Analysis

- Layout implemented using MAGIC
- Post-layout extraction performed to account for parasitic effects

### Worst-case Delay Comparison

| Component | Pre-layout Delay | Post-layout Delay |
|-----------|-----------------|------------------|
| D Flip-Flop | 5.1 × 10⁻⁹ s | 2.36 × 10⁻⁸ s |
| Propagate/Generate | 1.55 × 10⁻⁸ s | 3.01 × 10⁻⁸ s |
| Carry | 6.4 × 10⁻¹¹ s | 4 × 10⁻⁸ s |
| Sum | 1.54 × 10⁻⁸ s | 3.01 × 10⁻⁸ s |
| Total | 3.5 × 10⁻⁸ s | 1.23 × 10⁻⁷ s |

The carry path shows the largest increase in delay after layout.

---

## Verilog Verification

The CLA was implemented in Verilog and tested with multiple input combinations.

Example:
- Input: a = 0001, b = 1111
- Output: sum = 1000, carry = 1

Waveforms were verified using GTKWave.

---

## FPGA Implementation

- Implemented on an FPGA board
- Outputs verified using a Digital Storage Oscilloscope (DSO)
- Hardware results matched simulation outputs

---

## Key Takeaways

- CLA reduces propagation delay by computing carries in parallel
- Faster than ripple carry adders but more complex
- Post-layout effects significantly impact timing
- Hardware validation confirms correctness of the design

---

## References

[1] Hasan, M. et al. "High-Performance Design of a 4-Bit Carry Look-Ahead Adder in Static CMOS Logic."

[2] IEEE Xplore. "Designing and Implementation of 4-Bit Carry Look Ahead Adder Using CMOS Logic."

[3] Mehedi, H. et al. "Performance Improvement in Conventional 4-bit Static CMOS Carry Look Ahead Adder," IJEEI, 2020.

[4] Springer. "Design a 4-Bit Carry Look-Ahead Adder Using Pass Transistor for Less Power."

---

## Acknowledgment

This project was completed as part of the VLSI Design course at IIIT Hyderabad under the guidance of Prof. Abhishek Srivastava.
