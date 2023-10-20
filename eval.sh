#!/bin/bash

# CPU models to test
CPU_MODELS=("X86TimingSimpleCPU" "X86MinorCPU")

# CPU clock frequencies (in Hz)
CPU_CLOCKS=("1GHz" "1.5GHz" "2GHz" "2.5GHz" "3GHz")

# Memory configurations to test
MEMORY_CONFIGS=("DDR3_1600_8x8" "DDR3_2133_8x8" "LPDDR2_S4_1066_1x32")


# Function to run simulations
run_simulations() {
    local cpu_model="$1"
    local cpu_clock="$2"
    local memory_config="$3"

    # Construct a unique directory name based on the configuration
    file_name="states_150k_new/${cpu_model}_${cpu_clock}_${memory_config}.txt"
    # Run the simulation with the given configuration
    python analyze.py "$file_name"
}

# Ask for user input
read -p "Enter specific CPU model (press Enter for all): " selected_cpu_model
read -p "Enter specific CPU clock (press Enter for all): " selected_cpu_clock
read -p "Enter specific memory configuration (press Enter for all): " selected_memory_config

# Iterate over CPU models
for cpu_model in "${CPU_MODELS[@]}"; do
    if [[ -z "$selected_cpu_model" || "$selected_cpu_model" == "$cpu_model" ]]; then
        # Iterate over CPU clock frequencies
        for cpu_clock in "${CPU_CLOCKS[@]}"; do
            if [[ -z "$selected_cpu_clock" || "$selected_cpu_clock" == "$cpu_clock" ]]; then
                # Iterate over memory configurations
                for memory_config in "${MEMORY_CONFIGS[@]}"; do
                    if [[ -z "$selected_memory_config" || "$selected_memory_config" == "$memory_config" ]]; then
                        # Run the simulation for the current configuration
                        run_simulations "$cpu_model" "$cpu_clock" "$memory_config"
                        echo =========================================
                    fi
                done
            fi
        done
    fi
done


##!/bin/bash
#
#
## CPU models to test
#CPU_MODELS=("X86TimingSimpleCPU" "X86MinorCPU")
#
## CPU clock frequencies (in Hz)
#CPU_CLOCKS=("1GHz" "1.5GHz" "2GHz" "2.5GHz" "3GHz")
#
## Memory configurations to test
#MEMORY_CONFIGS=("DDR3_1600_8x8" "DDR3_2133_8x8" "LPDDR2_S4_1066_1x32")
#
## Loop over CPU models
#for cpu_model in "${CPU_MODELS[@]}"; do
#    # Loop over CPU clock frequencies
#    for cpu_clock in "${CPU_CLOCKS[@]}"; do
#        # Loop over memory configurations
#        for memory_config in "${MEMORY_CONFIGS[@]}"; do
#            # Construct a unique directory name based on the configuration
#            file_name="states/${cpu_model}_${cpu_clock}_${memory_config}.txt"
#            python3 analyze.py file_name
#        done
#    done
#done
