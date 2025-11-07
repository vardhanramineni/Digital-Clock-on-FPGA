# Digital-Clock-on-FPGA



# 🕒 Digital Clock on FPGA (Datapath + Control Path)

![Architecture](assets/architecture.png)

## 📘 Overview
This project implements a **Digital Clock on FPGA** using a **modular Datapath and Control Path** design approach.  
The clock displays **Hours, Minutes, and Seconds**, with functionalities for **Set**, **Adjust**, and **Run** modes.  
It has been **simulated, synthesized, and tested on FPGA hardware**.

---

## ⚙️ Design Highlights

- Separation of **Datapath** (operations, counters, registers) and **Control Path** (FSM, enable signals)
- **Real-time clock** counting in HH:MM:SS
- **Push-button inputs** for mode switching and increment
- **Debouncing logic** for stable user input
- **BCD conversion** for seven-segment display
- **Fully synthesizable Verilog HDL**
- Verified on simulation tools (Xlinx Vivado) and implemented on FPGA (Artrix 7)

---

## 🧩 Project Structure
\`\`\`
├── rtl/
│   ├── top.v               # Top-level module
│   ├── datapath.v          # Datapath: registers, counters, display logic
│   └── control.v           # Control path: FSM, enable & control signals
├── tb/
│   └── tb_top.v            # Testbench for simulation
├── constraints/
│   └── board_example.xdc   # FPGA pin constraints
├── scripts/
│   ├── vivado_run.tcl      # Synthesis & bitstream generation script
│   └── run_sim.sh          # Optional simulation script
├── assets/
│   ├── architecture.png
│   ├── schematic.png
│   ├── simulation_waveform.png
│   └── fpga_photo.jpg
├── results/
│   ├── simulation.vcd
│   ├── waveform.wcfg
│   └── timing_summary.rpt
└── README.md
\`\`\`

---

## 🧠 Architecture & Schematic

### 🔹 Architecture
The **Datapath** includes:
- Second, minute, and hour counters  
- BCD converter and multiplexer for display  
- Display driver and registers  

The **Control Path** is an FSM that:
- Handles mode switching (Run / Set / Adjust)  
- Generates enable signals for each counter  
- Manages button debouncing and control pulses  

**Block Diagram:**  
![Architecture](assets/architecture.png)

**Schematic / Board Connections:**  
![Schematic](assets/schematic.png)

---

## 🧪 Simulation Results

### Functional Simulation
- Tool used: *ModelSim / Vivado Simulator*  
- Inputs: Clock, Reset, Mode, Increment  
- Output: Time updates in HH:MM:SS format

**Sample Waveform:**  
![Waveform](assets/simulation_waveform.png)

---

## 💡 FPGA Implementation

- Toolchain: *Xilinx Vivado*  
- Device: *Basys3 (XC7A35T)* or equivalent  
- Display: *Four 7-segment LEDs*  
- Clock Source: *100 MHz onboard oscillator (divided internally)*

**Real Hardware Output:**  
![FPGA Result](assets/fpga_photo.jpg)

The bitstream was successfully generated and downloaded to FPGA.  
The 7-segment display updates each second and supports *mode switching* via buttons.

---

## 🛠️ How to Run

### Simulation
\`\`\`bash
# Using Icarus Verilog
iverilog -o tb_top.out tb/tb_top.v rtl/*.v
vvp tb_top.out
gtkwave results/simulation.vcd
\`\`\`

### Synthesis & Implementation (Vivado)
\`\`\`tcl
read_verilog rtl/*.v
read_xdc constraints/board_example.xdc
synth_design -top top -part xc7a35ticsg324-1L
opt_design
place_design
route_design
write_bitstream -force results/digital_clock.bit
\`\`\`

### Program FPGA
\`\`\`bash
open_hw
connect_hw_server
open_hw_target
program_hw_devices
\`\`\`

---

## 📊 Results Summary
| Parameter | Description |
|------------|-------------|
| Clock Frequency | 100 MHz |
| Logic Utilization | ~3% (depends on FPGA) |
| Power Consumption | Minimal |
| Simulation Time | 60 seconds |
| Operating Modes | Run / Set / Adjust |
| Verified On | Vivado / Basys3 FPGA Board |

---

## 🧾 License
This project is released under the **MIT License**.  
You are free to use, modify, and distribute it with proper attribution.

---

## 👨‍💻 Authors
**Project Team:**  
- [Your Name / Team Name]  
- [Institution / Course / Batch]  
- [GitHub Profile Link]

---

## 🌟 Acknowledgements
Special thanks to:
- *Xilinx Vivado Tools*
- *Faculty / Mentors who guided the project*
- *Open-source FPGA and HDL communities*
EOF

git add README.md
git commit -m "Added complete project README with architecture, schematic, and results"
git push
