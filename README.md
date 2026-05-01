# 4-Bit Carry Lookahead Adder (CLA)

This repository contains the implementation and documentation of a 4-bit Carry Lookahead Adder (CLA). The goal of the project is to design a faster alternative to ripple carry adders by computing carry signals in parallel.

The repo includes the design files, test setup, and a report describing the approach and results.

---

## What this project does

A Carry Lookahead Adder avoids the delay of sequential carry propagation by computing carry signals using generate and propagate logic.

Instead of waiting for each bit to pass its carry forward, all carries are computed upfront based on the inputs. This significantly improves speed, especially as the number of bits increases.

---

## Repository Structure

```text
4-Bit-CLA/
├── report.pdf
├── README.md
├── <design files>
├── <simulation files>
└── <any additional scripts or outputs>
