TOP=.

include $(TOP)/Make.rules

ic_2504x4_tb.vvp: ic_2504x4_tb.v ic_2504x4.v ram.v
	iverilog -o $@ $^

ic_2504x8_tb.vvp: ic_2504x8_tb.v ic_2504x8.v ram.v
	iverilog -o $@ $^

ic_2504_tb.vvp: ic_2504_tb.v ic_2504.v
	iverilog -o $@ $^

video_terminal_tb.vvp: src/test/video_terminal_tb.v $(FILES)
	iverilog -s video_terminal_tb -o sim/$@ $^

plot: ic_2504x4.vcd
	gtkwave $^
