#include <pthread.h>
#include <iostream.h>
#include <unistd.h>

void* consumer(void*);
void* producer(void*);
char buffer[80];
int full = 0;
int thread_exit;
pthread_rwlock_t rw_lock = PTHREAD_RWLOCK_INITIALIZER;
