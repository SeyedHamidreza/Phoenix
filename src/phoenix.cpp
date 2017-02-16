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
void foo(){ cout<<"foo"<<'\n';  }
void bar(int i){    cout<<"bar "<<i<<'\n';  }

int32_t main (int argc, char *argv[])
{
    
    std::thread first(foo);
    std::thread second(bar,3);

//    std::cout << "main, foo and bar now execute concurrently...\n";

    
    
    // synchronize threads:
    first.join();                // pauses until first finishes
    second.join();               // pauses until second finishes

//    std::cout << "foo and bar completed.\n";
    
    
    
    
    
    
    
    high_resolution_clock::time_point exeStartTime = high_resolution_clock::now();  /// Record start time

    /// for access to Functions (object 'function' on memory stack)
    Functions function;
//    function.commandLineParser(argc, argv); /// parse the command line

    

   
    high_resolution_clock::time_point exeFinishTime = high_resolution_clock::now(); /// Record end time

    /// calculate and show duration in seconds
    std::chrono::duration< double > elapsed = exeFinishTime - exeStartTime;

    cout << "Elapsed time: " << std::fixed << setprecision(3) << elapsed.count() << '\n';
    
    
    return 0;
}
