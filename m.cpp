#include <iostream>
#include "time.h"
#include "sys/time.h"
#include <random>
#include <bits/stdc++.h>
#include <stdio.h>
#include <unistd.h>
#include <sys/types.h>

using namespace std;

int dirty=0;
// test if a nyumber exists in queue
bool search(queue<int> queue, int number)
{

    while (!queue.empty()) {
        if (number == queue.front())
            return true;
        queue.pop();
    }
    return false;
}
unordered_map<int, vector<int> > umap;

int LRU(int numbers[], int n, int workingset,int mode[])
{
    unordered_set<int> s;
	dirty=0;
    unordered_map<int, int> in;
	unordered_map<int, int> sFlag;
    int page_faults = 0;
    for (int i = 0; i < n; i++) {
        if ((int)s.size() < workingset) {
            if (s.find(numbers[i]) == s.end()) {
                s.insert(numbers[i]);
				sFlag[numbers[i]] = mode[i];
                page_faults++;
            }else if(mode[i]==1)sFlag[numbers[i]] = 1;
			
            
			in[numbers[i]] = i;
			
        }
        else {
            if (s.find(numbers[i]) == s.end()) {
                int lru = INT_MAX, val;
                for (auto it = s.begin(); it != s.end(); it++) {
					
                    if (in[*it] < lru) {
                        lru = in[*it];
                        val = *it;
                    }
                }
                s.erase(val);
				if(sFlag[val]==1) dirty++;
				std::unordered_map<int,int>::iterator it;
				it=sFlag.find(val);
				sFlag.erase (it); 
				
                s.insert(numbers[i]);
				sFlag[numbers[i]] = mode[i];
				
                page_faults++  ;       
			}
			if(mode[i]==1)sFlag[numbers[i]] = 1;
			in[numbers[i]] = i;
        }
    }

    return page_faults;
}
// Function to check whether a page exists
// in a frame or not
int searchopt(int key, vector<int>& memory)
{
    for (int i = 0; i < (int)memory.size(); i++)
        if (memory[i] == key)
            return i;
    return -1;
}

// Function to find the frame that will not be used
// recently in future after given index in accesses[0.._size-1]
int evictFrame(int accesses[],int mode[], vector<int>& memory, vector<int>& memoryFlag, int _size, int index)
{

    // Store the index of pages which are going
    // to be used recently in future
    int res = -1, farthest = index;
    
    for (int i = 0; i < (int)memory.size(); i++) {
        int j=_size;

	
	for (int ih : umap[memory[i]]) {
		if (ih>=index ) {
					if( ih > farthest){
                    farthest = ih;
					j=ih;
                    res = i;}
					j=ih;break;
                }//else remove.push_back(ih);
	}

        // If a page is never referenced in future,
        // return it.
        if (j == _size)
	{
	    //umap.erase(memory[i]);
            return i;
	 }
    }

    // If all of the frames were not in future,
    // return any of them, we return 0. Otherwise
    // we return res.
    return (res == -1) ? 0 : res;
}

int OPT(int accesses[], int _size, int frames,int mode[])
{
    // Create an array for given number of
    // frames and initialize it as empty.
    umap=unordered_map<int, vector<int> > ();
	dirty=0;
	vector<int> memory;
	vector<int> memoryFlag;
    // created inverse dictionary for fast access to indexes
    for (int i = 0; i < _size; i++) {
		umap[accesses[i]]= vector<int>();
    }
	// fill the inverse dictionary with indexes
    for (int i = 0; i < _size; i++) {
        umap[accesses[i]].push_back (i);

    }

    int hit = 0;
    for (int i = 0; i < _size; i++) {
	/*if(i%30000==0)
	{
		printf("%d/%d\n",i,(_size));
	}*/
		int cc=searchopt(accesses[i], memory);
        // Page found in a frame : HIT
        if (cc!=-1) {
            hit++;
			if(mode[i]==1)memoryFlag[cc]=1; 
            continue;
        }

        // Page not found in a frame : MISS

        // If there is space available in frames.
        if ((int)memory.size() < frames)
		{
			memory.push_back(accesses[i]);
			memoryFlag.push_back(mode[i]);
		}

        // Find the page to be replaced.
        else {
            int j = evictFrame(accesses,mode, memory,memoryFlag, _size, i + 1);
            memory[j] = accesses[i];
			if(memoryFlag[j]==1) dirty++;
			memoryFlag[j] = mode[i];
			
        }
    }
    return _size - hit;
}

int main(int argc,  char *argv[])
{
	
	int algorithm=1;//1 LRU , 2 OPT
	int nframes=16; 
	int pagesize=4;
	int total;
	int process1=1;
	int process2=1;
	int nframes1=8;
	int nframes2=8;
	string traceFile="1.trace";
	
	if(argc>2 && strcmp(argv[2],"opt")==0) algorithm=2; else algorithm=1;
	if(argc>4 ) nframes=atoi (argv[4]);
	if(argc>6 ) pagesize=atoi (argv[6]);
	if(argc>8 ){
		 std::stringstream ss(argv[8]);
		 std::vector<int> vect;

		 for (int i; ss >> i;) {
			vect.push_back(i);    
			if (ss.peek() == ':')
					ss.ignore();
		}
		process1=vect[0];
		process2=vect[1];
		nframes1=(int)((double)nframes*(double)process1)
									/
					((double)process1+(double)process2);
		
		nframes2=nframes-nframes1;
	}
	if(argc>9 ) traceFile=argv[9];
    unsigned int address;
    char mode;
    int process;
    int n1 = 0;
	int n2 = 0;
    int* pages1=new int[2000000];
    int* pages2=new int[2000000];
    int* mode1=new int[2000000];
    int* mode2=new int[2000000];
    FILE* fp = fopen(traceFile.c_str(), "r");
    if (fp == NULL) {
        printf("Could not open trace file\n");
        return 0;
    }
    while (fscanf(fp, "%c %x %d", &mode, &address, &process) != EOF) {
        if(process==1)
		{
			pages1[n1] = address/(pagesize*1024);
			mode1[n1]=(mode==108)?0:1;
			n1++;
		}
		else
		{
			pages2[n2] = address/(pagesize*1024);
			mode2[n2]=(mode==108)?0:1;
			n2++;
		}
        
    }

	int faults=0;
	int writes=0;

	total=n1+n2;
	if(algorithm==1){
		faults += (double)LRU(pages1, n1, nframes1,mode1);
		writes+=dirty;
		faults += (double)LRU(pages2, n2, nframes2,mode2);
		writes+=dirty;
	}else {
		faults += (double)OPT(pages1, n1, nframes1,mode1);
		writes+=dirty;
		faults += (double)OPT(pages2, n2, nframes2,mode2);
		writes+=dirty;
		
	}
	
	if(algorithm==1)printf("Algorithm: LRU\n");
	else printf("Algorithm: OPT\n");
	printf("Number of frames: %d\n",nframes);
	printf("Page size: %d KB\n",pagesize);
	printf("Total memory accesses: %d\n",total);
	printf("Total page faults: %d\n",faults);
	printf("Total writes to disk: %d\n",writes);


    return 0;
}
