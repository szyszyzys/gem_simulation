#!/bin/bash

# Set the path to the GEM5 binary
GEM5_BINARY="/home/other/CSE530-FA2022/gem5/build/X86/gem5.opt"

# Set the path to the GEM5 configuration script
GEM5_CONFIG_SCRIPT="./a3.cfg.py"

BINARY_PATH="./a.out"
# Set the output directory where results will be saved
OUTPUT_DIR="experiment_results"

# Create the output directory if it doesn't exist
mkdir -p "$OUTPUT_DIR"

# CPU models to test
CPU_MODELS=("X86TimingSimpleCPU" "X86MinorCPU")

# CPU clock frequencies (in Hz)
CPU_CLOCKS=("1000000000" "1500000000" "2000000000" "2500000000" "3000000000")

# Memory configurations to test
MEMORY_CONFIGS=("DDR3_1600_8x8" "DDR3_2133_8x8" "LPDDR2_S4_1066_1x32")

# Loop over CPU models
for cpu_model in "${CPU_MODELS[@]}"; do
    # Loop over CPU clock frequencies
    for cpu_clock in "${CPU_CLOCKS[@]}"; do
        # Loop over memory configurations
        for memory_config in "${MEMORY_CONFIGS[@]}"; do
            # Construct a unique directory name based on the configuration
            OUTPUT_SUBDIR="${OUTPUT_DIR}/${cpu_model}_${cpu_clock}Hz_${memory_config}"

            # Create the output subdirectory
            mkdir -p "$OUTPUT_SUBDIR"

            # Run GEM5 with the specified configuration
            $GEM5_BINARY -d "$OUTPUT_SUBDIR" $GEM5_CONFIG_SCRIPT --cpu-model="$cpu_model" --cpu-clock="$cpu_clock" --memory-config="$memory_config" --caches --l2cache

            # Optionally, you can save any relevant observations or results here
            # For example, you can save simulation statistics or logs

            # Add your custom observation and result saving logic here
            # For example:
            # cp "$OUTPUT_SUBDIR/stats.txt" "$OUTPUT_SUBDIR/observations.txt"
        done
    done
done

echo "Experiment completed. Results saved in $OUTPUT_DIR"
