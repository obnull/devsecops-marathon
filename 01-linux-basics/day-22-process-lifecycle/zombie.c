#include <stdlib.h>
#include <unistd.h>

int main() {
    pid_t pid = fork();

    if (pid == 0) {
        // Child process
        exit(0);
    } else {
        // Parent process sleeps and does NOT call wait()
        sleep(60);
    }

    return 0;
}
