package org.opensourcephysics.sip.ch13.percolation.rg;import org.opensourcephysics.display2d.*;public class RG {public int L;public BinaryLattice s;public double p;public RG(int _L, double _p) {  L = _L;  p = _p;  setSites();}public RG(RG b) {  block(b.s,b.L);}public void setSites() {   s = new BinaryLattice(L,L);   s.setBlock(0,0,new int[L][L]);   for(int i = 0; i < L; i++)    for(int j = 0; j < L; j++)      if(Math.random() < p) s.setValue(i,j,1);}public void block(BinaryLattice w, int Lw) {   L = Lw/2;   s = new BinaryLattice(L,L);   s.setBlock(0,0,new int[L][L]);   for(int ib = 0; ib < L; ib++)     for(int jb = 0; jb < L; jb++)       if((w.getValue(2*ib,2*jb)*w.getValue(2*ib,2*jb+1) == 1) ||          (w.getValue(2*ib+1,2*jb)*w.getValue(2*ib+1,2*jb+1) == 1))          s.setValue(ib,jb,1);}}