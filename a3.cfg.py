import m5
from m5.objects import *

# Create the system
system = System()

# Set the clock frequency of the system (default is 1GHz)
system.clk_domain = SrcClockDomain(clock='1GHz', voltage_domain=VoltageDomain())

# Create the CPU
system.cpu = TimingSimpleCPU()

# Create the memory system
system.mem_mode = 'timing'
system.mem_ranges = [AddrRange('512MB')]

# Configure L1 instruction and data caches (change the cache sizes here)
system.cpu.icache = L1Cache(
    size='32kB',  # Set the L1 instruction cache size here
    assoc=4,      # Set the associativity of the cache
    tag_latency=1,
    data_latency=1,
    response_latency=1,
    mshrs=20,
    tgts_per_mshr=12
)
system.cpu.dcache = L1Cache(
    size='32kB',  # Set the L1 data cache size here
    assoc=4,
    tag_latency=1,
    data_latency=1,
    response_latency=1,
    mshrs=20,
    tgts_per_mshr=12
)

# Configure L2 cache (change the cache size here)
system.l2bus = L2XBar()
system.l2_cache = L2Cache(
    size='256kB',  # Set the L2 cache size here
    assoc=8,       # Set the associativity of the L2 cache
    tag_latency=10,
    data_latency=10,
    response_latency=10,
    mshrs=20,
    tgts_per_mshr=12
)

# Create a process
process = Process()

# Specify the binary to run and its arguments
process.cmd = ['./a.out']

# Set the process to run on the CPU
system.cpu.workload = process

# Create the root SimObject and start the simulation
root = Root(full_system=False, system=system)
m5.instantiate()

# Simulate for a specified number of instructions or time (e.g., 10 billion instructions)
sim_end = m5.MaxTick
exit_event = m5.simulate(sim_end)

# Exit the simulation
exit_code = m5.CpuExitEvent.getExitCode()
m5.stats.dump()
exit(exit_code)
