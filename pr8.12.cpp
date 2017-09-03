#include <pthread.h>
#include <unistd.h>
#include <stdio.h>
#include <iostream>

void* consumer(void*);
void* producer(void*);
char buffer[80];
int full = 0;
int thread_exit;
pthread_rwlock_t rw_lock = PTHREAD_RWLOCK_INITIALIZER;

int main() {
	pthread_t tid1, tid2;
	pthread_create(&tid1, NULL, producer, NULL);
	pthread_create(&tid2, NULL, consumer, NULL);
	pthread_join(tid1, NULL);
	pthread_join(tid2, NULL);
	pthread_rwlock_destroy(&rw_lock);
	pthread_exit(NULL);
	
	return 0;
}

void* producer(void*) {
	while (1) {
		if (pthread_rwlock_wrlock(&rw_lock)) {
			perror("rwlock_wrlock");
		}
		
		if (full == 0) {
			std::cerr << "Insert:\n";
			std::cin >> buffer;
			if (std::cin.eof()) {
				thread_exit = 1;
				pthread_rwlock_unlock(&rw_lock);
				pthread_exit(0);
			}
			
			full = 1;
		}
		
		if (pthread_rwlock_unlock(&rw_lock)) {
			perror("rwlock_unlock");
		}
		
		sched_yield();
	}
}

void* consumer(void*) {
	while (!thread_exit) {
		if (pthread_rwlock_rdlock(&rw_lock)) {
			perror("rwlock_rdlock");
		}
		
		if (full == 1) {
			std::cerr << buffer << std::endl;
			full = 0;
		}
		
		if (pthread_rwlock_unlock(&rw_lock)) {
			perror("rwlock_unlock");
		}
		
		sched_yield();
	}
	
	pthread_rwlock_unlock(&rw_lock);
}
