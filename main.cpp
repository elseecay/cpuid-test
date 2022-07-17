#include <iostream>
#include <map>

using namespace std;

extern "C"
{
    bool cpuid_support();
    const char* manufacturer();
    void cache_size_level_1();
    void print_rdi(std::uint64_t x){ cout << std::hex << x << endl; }
}

int main()
{
    if (!cpuid_support())
        return cout << "cpuid not supported" << endl, 0;
    cout << "Manufacturer: " << manufacturer() << endl;
    cache_size_level_1();
    return 0;
}
