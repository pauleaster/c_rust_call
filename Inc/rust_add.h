#include <cstdarg>
#include <cstdint>
#include <cstdlib>
#include <ostream>
#include <new>

#define rust_add_API __declspec(dllimport)

extern "C" {

    rust_add_API int8_t add(int8_t left, int8_t right);

} // extern "C"


// extern "C" {

//     int8_t add(int8_t left, int8_t right);

// } // extern "C"
