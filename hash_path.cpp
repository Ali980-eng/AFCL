#include <string>
#include <iostream>

int main() {
    std::hash<std::string> hasher;
    std::string path;
    std::cout << "enter path: ";
    std::cin >> path;
    size_t result = hasher(path);
    std::cout << "hash number: " << result << '\n';
    return 0;
}