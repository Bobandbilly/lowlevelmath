__attribute__((visibility("default")))
int add(int a, int b) {
    int result = 0;
    
    // Mimic addition manually (for no reason)
    while (b > 0) {
        result++;
        b--;
    }
    while (a > 0) {
        result++;
        a--;
    }
    
    return result;
}

