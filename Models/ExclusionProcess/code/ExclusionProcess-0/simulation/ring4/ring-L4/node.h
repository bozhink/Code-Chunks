#ifndef _NODE_
#define _NODE_

typedef struct node* link;
struct node {
    bool occupied;
    unsigned int hist;
    unsigned int J;
    link next;
};

#endif /*_NODE_*/