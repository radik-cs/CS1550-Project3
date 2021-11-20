# the compiler: gcc for C program, define as g++ for C++
CC = g++
# the build target executable:
TARGET = m

all: $(TARGET).cpp
	$(CC)  -o vmsim $(TARGET).cpp 
test: all 
	echo "./vmsim -a lru -n 16 -p 4 -s 1:1 1.trace"
	./vmsim -a lru -n 16 -p 4 -s 1:1 1.trace
	echo "./vmsim -a lru -n 16 -p 4 -s 1:3 1.trace"
	./vmsim -a lru -n 16 -p 4 -s 1:3 1.trace
	echo "./vmsim -a lru -n 16 -p 4 -s 3:1 1.trace"
	./vmsim -a lru -n 16 -p 4 -s 3:1 1.trace
	echo "./vmsim -a lru -n 16 -p 4 -s 3:5 1.trace"
	./vmsim -a lru -n 16 -p 4 -s 3:5 1.trace
	echo "./vmsim -a lru -n 16 -p 4 -s 5:3 1.trace"
	./vmsim -a lru -n 16 -p 4 -s 5:3 1.trace
	echo "./vmsim -a lru -n 16 -p 4 -s 7:9 1.trace"
	./vmsim -a lru -n 16 -p 4 -s 7:9 1.trace
	echo "./vmsim -a lru -n 16 -p 4 -s 9:7 1.trace"
	./vmsim -a lru -n 16 -p 4 -s 9:7 1.trace
	echo "./vmsim -a opt -n 16 -p 4 -s 1:1 1.trace"
	./vmsim -a opt -n 16 -p 4 -s 1:1 1.trace
	echo "./vmsim -a opt -n 16 -p 4 -s 1:3 1.trace"
	./vmsim -a opt -n 16 -p 4 -s 1:3 1.trace
	echo "./vmsim -a opt -n 16 -p 4 -s 3:1 1.trace"
	./vmsim -a opt -n 16 -p 4 -s 3:1 1.trace
	echo "./vmsim -a opt -n 16 -p 4 -s 3:5 1.trace"
	./vmsim -a opt -n 16 -p 4 -s 3:5 1.trace
	echo "./vmsim -a opt -n 16 -p 4 -s 5:3 1.trace"
	./vmsim -a opt -n 16 -p 4 -s 5:3 1.trace
	echo "./vmsim -a opt -n 16 -p 4 -s 7:9 1.trace"
	./vmsim -a opt -n 16 -p 4 -s 7:9 1.trace
	echo "./vmsim -a opt -n 16 -p 4 -s 9:7 1.trace"
	./vmsim -a opt -n 16 -p 4 -s 9:7 1.trace
	echo -------------------------------------
	echo "./vmsim -a opt -n 1024 -p 4 -s 1:1 1.trace"
	./vmsim -a opt -n 1024 -p 4 -s 1:1 1.trace
	echo "./vmsim -a opt -n 1024 -p 4 -s 1:3 1.trace"
	./vmsim -a opt -n 1024 -p 4 -s 1:3 1.trace
	echo "./vmsim -a opt -n 1024 -p 4 -s 3:1 1.trace"
	./vmsim -a opt -n 1024 -p 4 -s 3:1 1.trace
	echo "./vmsim -a opt -n 1024 -p 4 -s 3:5 1.trace"
	./vmsim -a opt -n 1024 -p 4 -s 3:5 1.trace
	echo "./vmsim -a opt -n 1024 -p 4 -s 5:3 1.trace"
	./vmsim -a opt -n 1024 -p 4 -s 5:3 1.trace
	echo "./vmsim -a opt -n 1024 -p 4 -s 7:9 1.trace"
	./vmsim -a opt -n 1024 -p 4 -s 7:9 1.trace
	echo "./vmsim -a opt -n 1024 -p 4 -s 9:7 1.trace"
	./vmsim -a opt -n 1024 -p 4 -s 9:7 1.trace
	echo "./vmsim -a lru -n 1024 -p 4 -s 1:1 1.trace"
	./vmsim -a lru -n 1024 -p 4 -s 1:1 1.trace
	echo "./vmsim -a lru -n 1024 -p 4 -s 1:3 1.trace"
	./vmsim -a lru -n 1024 -p 4 -s 1:3 1.trace
	echo "./vmsim -a lru -n 1024 -p 4 -s 3:1 1.trace"
	./vmsim -a lru -n 1024 -p 4 -s 3:1 1.trace
	echo "./vmsim -a lru -n 1024 -p 4 -s 3:5 1.trace"
	./vmsim -a lru -n 1024 -p 4 -s 3:5 1.trace
	echo "./vmsim -a lru -n 1024 -p 4 -s 5:3 1.trace"
	./vmsim -a lru -n 1024 -p 4 -s 5:3 1.trace
	echo "./vmsim -a lru -n 1024 -p 4 -s 7:9 1.trace"
	./vmsim -a lru -n 1024 -p 4 -s 7:9 1.trace
	echo "./vmsim -a lru -n 1024 -p 4 -s 9:7 1.trace"
	./vmsim -a lru -n 1024 -p 4 -s 9:7 1.trace
	echo -------------------------------------
	echo "./vmsim -a opt -n 16 -p 4096 -s 1:1 1.trace"
	./vmsim -a opt -n 16 -p 4096 -s 1:1 1.trace
	echo "./vmsim -a opt -n 16 -p 4096 -s 1:3 1.trace"
	./vmsim -a opt -n 16 -p 4096 -s 1:3 1.trace
	echo "./vmsim -a opt -n 16 -p 4096 -s 3:1 1.trace"
	./vmsim -a opt -n 16 -p 4096 -s 3:1 1.trace
	echo "./vmsim -a opt -n 16 -p 4096 -s 3:5 1.trace"
	./vmsim -a opt -n 16 -p 4096 -s 3:5 1.trace
	echo "./vmsim -a opt -n 16 -p 4096 -s 5:3 1.trace"
	./vmsim -a opt -n 16 -p 4096 -s 5:3 1.trace
	echo "./vmsim -a opt -n 16 -p 4096 -s 7:9 1.trace"
	./vmsim -a opt -n 16 -p 4096 -s 7:9 1.trace
	echo "./vmsim -a opt -n 16 -p 4096 -s 9:7 1.trace"
	./vmsim -a opt -n 16 -p 4096 -s 9:7 1.trace
	echo "./vmsim -a lru -n 16 -p 4096 -s 1:1 1.trace"
	./vmsim -a lru -n 16 -p 4096 -s 1:1 1.trace
	echo "./vmsim -a lru -n 16 -p 4096 -s 1:3 1.trace"
	./vmsim -a lru -n 16 -p 4096 -s 1:3 1.trace
	echo "./vmsim -a lru -n 16 -p 4096 -s 3:1 1.trace"
	./vmsim -a lru -n 16 -p 4096 -s 3:1 1.trace
	echo "./vmsim -a lru -n 16 -p 4096 -s 3:5 1.trace"
	./vmsim -a lru -n 16 -p 4096 -s 3:5 1.trace
	echo "./vmsim -a lru -n 16 -p 4096 -s 5:3 1.trace"
	./vmsim -a lru -n 16 -p 4096 -s 5:3 1.trace
	echo "./vmsim -a lru -n 16 -p 4096 -s 7:9 1.trace"
	./vmsim -a lru -n 16 -p 4096 -s 7:9 1.trace
	echo "./vmsim -a lru -n 16 -p 4096 -s 9:7 1.trace"
	./vmsim -a lru -n 16 -p 4096 -s 9:7 1.trace
	echo -------------------------------------
	echo "./vmsim -a opt -n 1024 -p 4096 -s 1:1 1.trace"
	./vmsim -a opt -n 1024 -p 4096 -s 1:1 1.trace
	echo "./vmsim -a opt -n 1024 -p 4096 -s 1:3 1.trace"
	./vmsim -a opt -n 1024 -p 4096 -s 1:3 1.trace
	echo "./vmsim -a opt -n 1024 -p 4096 -s 3:1 1.trace"
	./vmsim -a opt -n 1024 -p 4096 -s 3:1 1.trace
	echo "./vmsim -a opt -n 1024 -p 4096 -s 3:5 1.trace"
	./vmsim -a opt -n 1024 -p 4096 -s 3:5 1.trace
	echo "./vmsim -a opt -n 1024 -p 4096 -s 5:3 1.trace"
	./vmsim -a opt -n 1024 -p 4096 -s 5:3 1.trace
	echo "./vmsim -a opt -n 1024 -p 4096 -s 7:9 1.trace"
	./vmsim -a opt -n 1024 -p 4096 -s 7:9 1.trace
	echo "./vmsim -a opt -n 1024 -p 4096 -s 9:7 1.trace"
	./vmsim -a opt -n 1024 -p 4096 -s 9:7 1.trace
	echo "./vmsim -a lru -n 1024 -p 4096 -s 1:1 1.trace"
	./vmsim -a lru -n 1024 -p 4096 -s 1:1 1.trace
	echo "./vmsim -a lru -n 1024 -p 4096 -s 1:3 1.trace"
	./vmsim -a lru -n 1024 -p 4096 -s 1:3 1.trace
	echo "./vmsim -a lru -n 1024 -p 4096 -s 3:1 1.trace"
	./vmsim -a lru -n 1024 -p 4096 -s 3:1 1.trace
	echo "./vmsim -a lru -n 1024 -p 4096 -s 3:5 1.trace"
	./vmsim -a lru -n 1024 -p 4096 -s 3:5 1.trace
	echo "./vmsim -a lru -n 1024 -p 4096 -s 5:3 1.trace"
	./vmsim -a lru -n 1024 -p 4096 -s 5:3 1.trace
	echo "./vmsim -a lru -n 1024 -p 4096 -s 7:9 1.trace"
	./vmsim -a lru -n 1024 -p 4096 -s 7:9 1.trace
	echo "./vmsim -a lru -n 1024 -p 4096 -s 9:7 1.trace"
	./vmsim -a lru -n 1024 -p 4096 -s 9:7 1.trace
	echo -------------------------------------
	
