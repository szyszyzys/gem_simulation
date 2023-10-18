all:
	gcc quicksort.c /home/other/CSE530-FA2022/gem5/util/m5/src/m5_mmap.c /home/other/CSE530-FA2022/gem5/util/m5/src/abi/x86/m5op.S -I. -I/home/other/CSE530-FA2022/gem5/include -L/home/other/CSE530-FA2022/gem5/util/m5/build/x86/out -lm5 -DFRMWRK=1

rungem5_help:
	/home/other/CSE530-FA2022/gem5/build/X86/gem5.opt /home/other/CSE530-FA2022/gem5/configs/example/se.py --help

rungem5_example:
	/home/other/CSE530-FA2022/gem5/build/X86/gem5.opt /home/other/CSE530-FA2022/gem5/configs/example/se.py --cmd=/home/other/CSE530-FA2022/gem5/tests/test-progs/matadd/a.out --options="80 80" --cpu-type=DerivO3CPU --caches --l2cache --cpu-clock="1GHz" --mem-type=DDR3_2133_8x8 

