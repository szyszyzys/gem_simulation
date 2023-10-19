import re
import sys  # Import the sys module to access command-line arguments
# Define regular expressions to match relevant statistics



# Check if the user provided an argument (path to stats.txt)
if len(sys.argv) != 2:
    print("Usage: python script.py <path_to_stats.txt>")
    sys.exit(1)

stats_file_path = sys.argv[1]  # Get the path to stats.txt from the command-line argument

print(f'current file ')
stat_regex = {
    "sim_seconds": r"simSeconds",
    "instruction_type": r"system.cpu.exec_context.thread_0.statExecutedInstType",
    "l2_cache_miss_rate": r"system\.l2\.ReadMisses\s*:\s*(\d+)",
    "memory_accesses": r"system\.mem_ctrl\.reads\s*:\s*(\d+)",
    "energy": r"system.mem_ctrls.dram.rank0.totalEnergy"
}

# Initialize variables to store statistics
statistics = {key: None for key in stat_regex.keys()}

# Read and parse the stats.txt file
with open(stats_file_path, "r") as stats_file:
    for line in stats_file:
        for key, regex in stat_regex.items():
            match = re.match(regex, line)
            if match:
                statistics[key] = match.group(1)

# Calculate CPU utilization
sim_seconds = statistics["sim_seconds"]
sim_ops = statistics["sim_ops"]
cpu_utilization = sim_ops / (sim_seconds * 1e9)  # Convert cycles to seconds

# Print the collected statistics
print("Simulation Time (seconds):", sim_seconds)
print("CPU Operations (insts):", sim_ops)
print("CPU Utilization (%):", cpu_utilization * 100)
print("L1 Instruction Cache Miss Rate (%):", (statistics["l1i_cache_miss_rate"] / sim_ops) * 100)
print("L1 Data Cache Miss Rate (%):", (statistics["l1d_cache_miss_rate"] / sim_ops) * 100)
print("L2 Cache Miss Rate (%):", (statistics["l2_cache_miss_rate"] / sim_ops) * 100)
print("Memory Accesses:", statistics["memory_accesses"])
print("Energy (Joules):", statistics["energy"])
