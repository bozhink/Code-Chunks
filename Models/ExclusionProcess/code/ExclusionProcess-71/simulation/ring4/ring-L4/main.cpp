#include <stdlib.h>
#include <stdio.h>
#include <iostream>
#include "node.h"
#define L 4
#define N 3
#define NITER 250

int main(int argc, char **argv) {
    double p;
    if (argc < 2) {
        std::cerr << "Ussage: " << argv[0] << " <probability>\n";
        exit(2);
    }
    p = atof(argv[1]);
    
    link head, tail, next, x, t;
    // Configuration 0111
    head = (link) malloc(sizeof(*head)); head->hist = 0; head->J = 0; head->next = head;
    x = head;
    for (int i=2; i<=4; i++)
    {
        x = (x->next = (link) malloc (sizeof (*x)));
        x->hist = 0; x->J = 0;
        x->next = head;
    }
    
    for (int iter=0; iter<NITER; iter++)
    {
        head->occupied = false;
        head->next->occupied = true;
        head->next->next->occupied = true;
        head->next->next->next->occupied = true;
        
        tail = head;
        next = head->next->next->next;
        
        if (tail->occupied) {
            if ( (!(next->occupied)) && (p < 1.0*rand()/RAND_MAX) ) {
                tail->occupied=false;
                next->occupied=true;
                next->hist++;
                tail->J++;
            } else {
                tail->hist++;
            }
        }
        next = tail;
        tail = tail->next;
        
    }
    
    
    
    
    // Finalization method
    while (x != x->next)
    {
        t = x->next; x->next = x->next->next; free(t);
    }
    free(head);
    return 0;
}
