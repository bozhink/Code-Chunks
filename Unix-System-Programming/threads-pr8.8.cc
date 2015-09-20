#define _REENTRANT
#include <stdio.h>
#include <iostream>
#include <unistd.h>
#include <stdlib.h>
#include <sys/types.h>
#include <pthread.h>
#include <errno.h>

using namespace std;
#define NUMB_THREADS 4

void *thr_func(void *arg);     // Функция, изпълнявана от потоците
void cleanup_func(void *arg);  // Изчистваща функция при завършване на поток

pthread_t threads[NUMB_THREADS]; // Идентификатори на потоците
pthread_mutex_t lock=PTHREAD_MUTEX_INITIALIZER; // Инициализация

int main () // Основен поток
{
    int i;
    for (i=0; i<NUMB_THREADS; i++) // Създаване на потоците
        pthread_create (&threads[i], NULL, thr_func, (void *)i);
    
    for (i=0; i<NUMB_THREADS; i++) // Изчакване на завършването им
        pthread_join (threads[i], NULL);
    
    pthread_mutex_destroy (&lock);  // Унищожаане на блокиравката
    pthread_exit((void*)0);         //  Завършване на оновния поток
}


void cleanup_func (void*arg) // Почистваща функция, извиквана при завършване
{
    pthread_t thread_id = pthread_self(); // Запомня идентификатора на потока
    cerr << "Thread with ID = " << thread_id << "& number = " << *(int*)arg << " was canceled.\n";
}


void *thr_func(void*arg) // Изпълнява се от всички потоци
{
    int thr_number = (int) arg; // Запомня алгумента-номер на поток
    int i;
    pthread_t thread_id = pthread_self(); // Запомня идентификатора на поток
    
    /* Установяване на параметрите на унищожаване на потоци */
    pthread_setcancelstate (PTHREAD_CANCEL_ENABLE, NULL);
    pthread_setcanceltype  (PTHREAD_CANCEL_DEFERRED, NULL);
    
    /* Записва почистващата функция в специален стек на потока */
    pthread_cleanup_push(cleanup_func, (void*) &thr_number);
    
    while (1) {
        /* Опитва се да установи блокировката и ако вече е установена,
           проверява дали потокът не е унищожен, иначе продълава */
        while (pthread_mutex_trylock(&lock) == EBUSY) pthread_testcancel();
        cerr << "Insert thread number" << endl;
        int ch;
        cin >> ch; // Чете номер на поток (от 0 до NUMMB_THREADS-1)
        while (ch >= NUMB_THREADS) {
            cerr << "Wring number" << endl;
            cin >> ch;
        }
        
        cerr << "Thread with ID = " << thread_id << "& number = " <<
                 thr_number << "is running\n";
        if (thr_number == ch) /* Ако номерът на текущо изпълняван поток съвпада
                                 с въведения, той унищожава останалите потоци */
        {
            for (i=0; i<NUMB_THREADS; i++)
                if (threads[i] != thread_id) pthread_cancel(threads[i]);
            break; // Излиза то цикъла след унищожаването на другите потоци
        }
        
        // Когато номерът на изпълнявания поток не съвпада с въведенияследва:
        pthread_mutex_unlock(&lock); // Снема блокировката
        pthread_testcancel(); // Проверява дали потокът не е унищожен и ако не е,
        sched_yield();        // предава управлението на друг поток
    }
    
    /* Потокът, унищожил останалите, продължава оттук и не трябва да
       изпълнява почистващата функция cleanup_func - тя сямо се изважда от стека */
    pthread_cleanup_pop(0); // Трабвя да е на едно лексическо ниво с push
    pthread_exit((void*)0);
}

