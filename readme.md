# Arbitrators

This repository contains Verilog implementations of two common types of arbiters: fixed-priority and round-robin. Arbiters are essential components in digital systems that manage access to shared resources, ensuring that only one requester is granted access at a time.

## Table of Contents

- [Introduction](#introduction)
- [Arbitrator Types](#arbitrator-types)
    - [Fixed Priority Arbiter](#fixed-priority-arbiter)
    - [Round Robin Arbiter](#round-robin-arbiter)
- [File Structure](#file-structure)
- [How to Simulate](#how-to-simulate)
- [Testbenches](#testbenches)
- [Future Enhancements](#future-enhancements)
- [License](#license)

## Introduction

This repository provides clear and well-documented Verilog code for fixed-priority and round-robin arbiters. The designs are parameterized for the number of ports, making them easily adaptable to different applications. Each arbiter type includes both the Verilog design (`.v`) file and a corresponding testbench (`_tb.v`) file.

## Arbitrator Types

### Fixed Priority Arbiter

The fixed-priority arbiter grants access to the requester with the highest priority. Priority is assigned statically, with lower port numbers having higher priority.

- `fixed_priority_arbitrator.v`: Verilog implementation of the fixed-priority arbiter.
- `fixed_priority_arbitrator_tb.v`: Testbench for the fixed-priority arbiter.

### Round Robin Arbiter

The round-robin arbiter grants access to requesters in a circular fashion. Each port gets a turn, and the arbiter cycles through the ports, ensuring fairness.

- `round_robin_arbitrator.v`: Verilog implementation of the round-robin arbiter.
- `round_robin_arbitrator_tb.v`: Testbench for the round-robin arbiter.

## File Structure

```
Arbitrators/
├── fixed_priority/
│   ├── fixed_priority_arbitrator.v
│   └── fixed_priority_arbitrator_tb.v
└── round_robin/
    ├── round_robin_arbitrator.v
    └── round_robin_arbitrator_tb.v
README.md
```

## How to Simulate

1. **Clone the repository:** `git clone https://github.com/devadutt-github/Arbitrators.git` (Replace with your actual repository URL)
2. **Navigate to the directory:** `cd Arbitrators`
3. **Choose the arbiter type:** `cd fixed_priority` or `cd round_robin`
4. **Use a Verilog simulator:** You will need a Verilog simulator (e.g., ModelSim, Icarus Verilog, Xilinx ISim/Vivado simulator) to compile and simulate the code.
5. **Compile:** Compile both the design file (`.v`) and the testbench file (`_tb.v`). The exact commands will depend on your simulator. For example, with Icarus Verilog:
   ```bash
   iverilog -o <output_name> *.v
   vvp <output_name>
   ```

## Testbenches

The testbenches are designed to thoroughly verify the functionality of the arbiters. They apply various test cases, including:

- Single port requests
- Multiple port requests
- No requests
- All ports requesting

## Future Enhancements

- Implement a parameterized arbiter that can switch between fixed priority and round robin.
- Add support for different arbitration algorithms (e.g., weighted round robin).
- Include more comprehensive test cases.
- Add formal verification scripts.

## License

MIT License

```
MIT License

Copyright (c) 2025 | devadutt-github
```
