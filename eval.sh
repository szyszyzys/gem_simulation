#!/bin/bash


# CPU models to test
CPU_MODELS=("X86TimingSimpleCPU" "X86MinorCPU")

# CPU clock frequencies (in Hz)
CPU_CLOCKS=("1GHz" "1.5GHz" "2GHz" "2.5GHz" "3GHz")

# Memory configurations to test
MEMORY_CONFIGS=("DDR3_1600_8x8" "DDR3_2133_8x8" "LPDDR2_S4_1066_1x32")

# Loop over CPU models
for cpu_model in "${CPU_MODELS[@]}"; do
    # Loop over CPU clock frequencies
    for cpu_clock in "${CPU_CLOCKS[@]}"; do
        # Loop over memory configurations
        for memory_config in "${MEMORY_CONFIGS[@]}"; do
            # Construct a unique directory name based on the configuration
            file_name="states/${cpu_model}_${cpu_clock}_${memory_config}.txt"
            python3 analyze.py file_name
        done
    done
done


#
#system.cpu.dcache.demandHits::cpu.data       99049537                       # number of demand (read+write) hits (Count)
#system.cpu.dcache.demandHits::total          99049537                       # number of demand (read+write) hits (Count)
#system.cpu.dcache.overallHits::cpu.data      99049537                       # number of overall hits (Count)
#system.cpu.dcache.overallHits::total         99049537                       # number of overall hits (Count)
#system.cpu.dcache.demandMisses::cpu.data         2605                       # number of demand (read+write) misses (Count)
#system.cpu.dcache.demandMisses::total            2605                       # number of demand (read+write) misses (Count)
#system.cpu.dcache.overallMisses::cpu.data         2605                       # number of overall misses (Count)
#system.cpu.dcache.overallMisses::total           2605                       # number of overall misses (Count)
#system.cpu.dcache.demandMissLatency::cpu.data     80533000                       # number of demand (read+write) miss ticks (Tick)
#system.cpu.dcache.demandMissLatency::total     80533000                       # number of demand (read+write) miss ticks (Tick)
#system.cpu.dcache.overallMissLatency::cpu.data     80533000                       # number of overall miss ticks (Tick)
#system.cpu.dcache.overallMissLatency::total     80533000                       # number of overall miss ticks (Tick)
#system.cpu.dcache.demandAccesses::cpu.data     99052142                       # number of demand (read+write) accesses (Count)
#system.cpu.dcache.demandAccesses::total      99052142                       # number of demand (read+write) accesses (Count)
#system.cpu.dcache.overallAccesses::cpu.data     99052142                       # number of overall (read+write) accesses (Count)
#system.cpu.dcache.overallAccesses::total     99052142                       # number of overall (read+write) accesses (Count)
#system.cpu.dcache.demandMissRate::cpu.data     0.000026                       # miss rate for demand accesses (Ratio)
#system.cpu.dcache.demandMissRate::total      0.000026                       # miss rate for demand accesses (Ratio)
#system.cpu.dcache.overallMissRate::cpu.data     0.000026                       # miss rate for overall accesses (Ratio)
#system.cpu.dcache.overallMissRate::total     0.000026                       # miss rate for overall accesses (Ratio)
#system.cpu.dcache.demandAvgMissLatency::cpu.data 30914.779271                       # average overall miss latency in ticks ((Tick/Count))
#system.cpu.dcache.demandAvgMissLatency::total 30914.779271                       # average overall miss latency in ticks ((Tick/Count))
#system.cpu.dcache.overallAvgMissLatency::cpu.data 30914.779271                       # average overall miss latency ((Tick/Count))
#system.cpu.dcache.overallAvgMissLatency::total 30914.779271                       # average overall miss latency ((Tick/Count))
