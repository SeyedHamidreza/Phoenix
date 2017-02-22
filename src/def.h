#ifndef PHOENIX_DEF_H
#define PHOENIX_DEF_H


#include <unordered_map>    /// hash table

using std::string;
using std::unordered_map;
using std::array;


/***********************************************************
    About PHOENIX
************************************************************/
#define VERSION_PHOENIX 1
#define RELEASE_PHOENIX 0


/***********************************************************
    constants
************************************************************/
#define ALPH_SIZE       5           /// alphabet {A, C, N, G, T}
#define ALPH_SUM_SIZE   6           /// ALPHABET_SIZE+1: one more column for 'sum'
#define LOG2_ALPH_SIZE  2.321928095 /// log2 of 5 (ALPHABET_SIZE)
#define TABLE_MAX_CTX   12          /// max context depth for building table

#define DEFAULT_N_THREADS   2
#define N_FREE_THREADS      1


/***********************************************************
    typedef
************************************************************/
/// vaghti bishtar az 65,535 (uint16_t max) shod, hameye adad ha nesf mishan.
/// ye variable ro ham tanzim kon ke maloom she chand bar nesf kardim
//typedef unordered_map< string, array< uint64_t, ALPH_SIZE > > htable_str_t;
typedef unordered_map< uint64_t , array< uint64_t, ALPH_SIZE > > htable_t;

typedef uint8_t UI8;
typedef uint64_t UI64;


#endif //PHOENIX_DEF_H