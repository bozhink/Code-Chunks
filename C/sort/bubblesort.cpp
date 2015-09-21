void bubblesort() {
  node *temp, *temp1, *temp2;
  int sss;
 
  temp=head;
  temp1=head;
 
  for( ; temp->next!=NULL ; temp=temp->next) {
    for(;temp1->next!=NULL;) {
      temp2=temp1;
      temp1=temp1->next;
 
      if(temp2->data>temp1->data) {
        sss=temp2->data;
        temp2->data=temp1->data;
        temp1->data=sss;
      }
    }
 
    temp2=head; 
    temp1=head; // reinitialize after exiting first loop
  }
}
