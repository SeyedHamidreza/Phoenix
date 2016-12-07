#ifndef PHOENIX_FCM_H
#define PHOENIX_FCM_H


#include <iostream>

#include "def.h"


class FCM
{
public:
    FCM ();                                     // constructor
    
    void buildHashTable ();                     // build hash table
    uint8_t symCharToInt (char) const;          // ACNGT -> 01234
    void printHashTable (htable_t) const;       // print hash table
    
    char getTargetOrReference () const;         // getter of target or reference
    void setTargetOrReference (char);           // setter of target or reference
    uint8_t getContextDepth () const;           // getter of context depth
    void setContextDepth (uint8_t);             // setter of context depth
    uint32_t getAlphaDenom () const;            // getter of alpha denominator
    void setAlphaDenom (uint32_t);              // setter of alpha denominator
    bool getInvertedRepeat () const;            // getter of inverted repeat
    void setInvertedRepeat (bool);              // setter of inverted repeat
    const htable_t &getHashTable () const;      // getter of hash table
    void setHashTable (const htable_t&);        // setter of hash table
    const std::string &getFileAddress () const; // getter of file address
    void setFileAddress (const std::string&);   // setter of file address

private:
    char targetOrReference;                     // target or reference
    uint8_t contextDepth;                       // context depth (SIZE <= 255)
    uint32_t alphaDenom;                        // alpha denominator
    bool invertedRepeat;                        // inverted repeat
    htable_t hashTable;                         // hash table
    std::string fileAddress;                    // file address
};


#endif //PHOENIX_FCM_H