#ifndef PHOENIX_FUNCTIONS_H
#define PHOENIX_FUNCTIONS_H


#include <iostream>

using std::string;


class Functions
{
public:
    Functions ();                               // constructor
    
    void commandLineParser (int, char**);       // parse command line
    static bool isFileCorrect (const string &); // check if file opened correctly
};


#endif //PHOENIX_FUNCTIONS_H