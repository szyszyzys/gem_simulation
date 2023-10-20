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
    "sim_seconds": r'simSeconds.*',
    "instruction_type": r"system\.cpu\.exec_context\.thread_0\.statExecutedInstType::(IntAlu|IntMult|MemRead|MemWrite).*",
    "miss_rate": r'system\.cpu\.dcache\.demandMissRate::total.*',
    "memory_accesses": r'system\.cpu\.dcache\.overallAccesses::total.*',
    "energy": r'^(system\.mem_ctrls\.dram\.rank[01]\.totalEnergy).*',
    "warmup_tick": r'system\.cpu\.dcache\.tags\.warmupTick.*',
    "total_tick": r'simTicks.*'
}

# Initialize variables to store statistics
statistics = {key: [] for key in stat_regex.keys()}
# Read and parse the stats.txt file
with open(stats_file_path, "r") as stats_file:
    for line in stats_file:
        for key, regex in stat_regex.items():
            match = re.match(regex, line)
            if match:
                tmp = statistics.get(key, [])
                tmp.append(line.strip())

                statistics[key] = tmp


def print_list(a):
    for i in a:
        print(i)


# Calculate CPU utilization

for k, v in statistics.items():
    print_list(v)
