## 8-Bit Calculator System-on-Chip (SoC)

A synthesizable 8-bit calculator processor built with **Verilog HDL** and implemented on an **AMD/Xilinx Spartan-7 FPGA** (`xc7s25csga324-1`) using the **Vivado Design Suite**. The architecture features a decoupled control unit and datapath verified via cycle-accurate behavioral simulation.

---

## Architecture & Features

* **Finite State Machine (`fsm_controller.v`):** Synchronous control unit directing operand loading (`SAVE_A`, `SAVE_B`) and execution flow.
* **Arithmetic Logic Unit (`alu.v`):** 8-bit combinational engine performing Addition, Subtraction, bitwise AND, and bitwise OR.
* **Register File (`registers.v`):** Dedicated storage holding input operands and calculation outputs.
* **Display Driver (`seven_seg_decoder.v`, `calculator_top.v`):** 7-segment decoder coupled with a dynamic 20-bit refresh counter to prevent display flickering.

---

## FPGA Synthesis & Timing Results

* **Target Device:** Spartan-7 (`xc7s25csga324-1`)
* **Clock Frequency:** 100 MHz (10 ns period)
* **Worst Negative Slack (WNS):** +7.007 ns (Timing Met)
* **Worst Hold Slack (WHS):** +0.237 ns

| Resource | Used | Available | Utilization % |
| :--- | :--- | :--- | :--- |
| **Slice LUTs** | 20 | 14,600 | < 1% |
| **Slice Registers (FFs)** | 14 | 29,200 | < 1% |
| **Bonded IOB (Pins)** | 21 | 150 | 14% |
| **Clock Buffers (BUFG)** | 1 | 32 | 3% |

---

## Verification & Hardware Diagrams

### Elaborated RTL Schematic
![RTL Schematic](docs/rtl_schematic.png)

### Behavioral Simulation Waveform
![Simulation Waveform](docs/simulation_waveform.png)

### Resource Utilization Report
![Utilization Summary](docs/utilization_summary.png)

### Timing Summary Report
![Timing Summary](docs/timing_summary.png)

---

## Repository Structure

```text
.
├── .gitignore
├── README.md
├── constraints/
│   └── constraints.xdc
├── docs/
│   ├── rtl_schematic.png
│   ├── sim_waveform.png
│   ├── timing_summary.png
│   └── utilization_summary.png
├── testbench/
│   └── tb_calculator.v
└── rtl/
    ├── alu.v
    ├── calculator_top.v
    ├── fsm_controller.v
    ├── registers.v
    └── seven_seg_decoder.v