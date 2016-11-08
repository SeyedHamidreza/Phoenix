#include <iostream>
#include <unistd.h>
#include <vector>
#include <array>
#include <string>

#include "def.h"
#include "messages.h"




/* Flag set by ‘--verbose’. */
static int verbose_flag;




////  command line parser ////////////////////////////////////////////
int32_t CommandLineParser (int argc, char **argv)
{
    int index;
    int c;
    
    
    std::string numberStr;
    
    opterr = 0;
    while ((c = getopt(argc, argv, "hVvn:")) != -1)
        switch (c)
        {
            case 'h':
                PrintUsageGuide();
                break;
            
            case 'V':
                PrintVersion();
                break;
            
            case 'v':
                break;
            
            case 'n':
                numberStr = optarg;
                break;
            
            
            
            
            case '?':
                if (optopt == 'c')
                    fprintf(stderr, "Option -%c requires an argument.\n", optopt);
                else if (isprint(optopt))
                    fprintf(stderr, "Unknown option `-%c'.\n", optopt);
                else
                    fprintf(stderr,
                            "Unknown option character `\\x%x'.\n",
                            optopt);
                return 1;
            
            default:
                abort();
        }
    
    std::cout << numberStr;
    
    
    
    
    for (index = optind; index < argc; index++)
        printf("Non-option argument %s\n", argv[ index ]);
}



///////////////////////////////////////////////////////////////
///////////                 M A I N                 ///////////
///////////////////////////////////////////////////////////////

int32_t main (int argc, char *argv[])
{
    CommandLineParser(argc, argv);
    
    
    

//
//    int aflag = 0;
//    int bflag = 0;
//    char *cvalue = NULL;
//    int index;
//    int c;
//
//    opterr = 0;
//    while ((c = getopt (argc, argv, "abc:")) != -1)
//        switch (c)
//        {
//            case 'a':
//                aflag = 1;
//                break;
//            case 'b':
//                bflag = 1;
//                break;
//            case 'c':
//                cvalue = optarg;
//                break;
//            case '?':
//                if (optopt == 'c')
//                    fprintf (stderr, "Option -%c requires an argument.\n", optopt);
//                else if (isprint (optopt))
//                    fprintf (stderr, "Unknown option `-%c'.\n", optopt);
//                else
//                    fprintf (stderr,
//                             "Unknown option character `\\x%x'.\n",
//                             optopt);
//                return 1;
//            default:
//                abort ();
//        }
//    printf ("aflag = %d, bflag = %d, cvalue = %s\n",
//            aflag, bflag, cvalue);
//
//    for (index = optind; index < argc; index++)
//        printf ("Non-option argument %s\n", argv[index]);
    
    
    
    
    
    return 0;
}