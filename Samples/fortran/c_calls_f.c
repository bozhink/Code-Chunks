/*This is the file c_calls_f.c */
/*gcc -c c_calls_f.c           */
/*F -c cfsub.f95               */
/*gcc c_calls_f.o cfsub.o      */

main () {
int k=3;
printf("%d\n",fmod_MP_ffunc(&k));
}
