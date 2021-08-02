#CXX = CC
#CXXFLAGS = -qopenmp

CXX = g++
CXXFLAGS = -fopenmp

OBJS = main.o

TARGET = hello_affinity

all: $(TARGET)

main.o : main.cpp
	$(CXX) $(CFLAGS) -c main.cpp -o $@

$(TARGET) : $(OBJS)
	$(CXX) $(CFLAGS) $(OBJS) -o $@

clean :
	rm -rf *.o hello_affinity
