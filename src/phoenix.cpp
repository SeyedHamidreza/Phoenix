#include <iostream>
#include <fstream>
#include <cstring>
#include <chrono>       /// time
#include <iomanip>      /// setw, setprecision
#include <cmath>
#include <stdint.h>
#define __STDC_FORMAT_MACROS
#include <inttypes.h>
#if defined(_MSC_VER)
    #include <io.h>
#else
    #include <unistd.h>
#endif

#include "def.h"
#include "functions.h"

using std::cout;
using std::chrono::high_resolution_clock;
using std::setprecision;


///////////////////////////////////////////////////////////
/////////                 M A I N                 /////////
///////////////////////////////////////////////////////////
#include <thread>
void foo(){cout<<"foo";}
void bar(int i){cout<<"bar "<<i;}

int32_t main (int argc, char *argv[])
{
    
    std::thread first(foo);
    std::thread second(bar,2);
    
//    std::cout << "main, foo and bar now execute concurrently...\n";
    
    // synchronize threads:
    first.join();                // pauses until first finishes
    second.join();               // pauses until second finishes
    
//    std::cout << "foo and bar completed.\n";
    
    
    
    
    
    
    
    
    
    
//    /// Record start time
//    high_resolution_clock::time_point exeStartTime = high_resolution_clock::now();
//
//    /// for access to Functions (object 'function' on memory stack)
//    Functions function;
//    function.commandLineParser(argc, argv); /// parse the command line
//
//
//
//
//
//
//    /// Record end time
//    high_resolution_clock::time_point exeFinishTime = high_resolution_clock::now();
//
//    /// calculate and show duration in seconds
//    std::chrono::duration< double > elapsed = exeFinishTime - exeStartTime;
//
//    cout << '\t' << std::fixed << setprecision(2) << elapsed.count() << '\n';
    
    
    return 0;
}
