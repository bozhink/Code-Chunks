class ShowBitsDemo {
    public static void main(String args[])
    {
        ShowBits b = new ShowBits(8);
        ShowBits i = new ShowBits(32);
        ShowBits li = new ShowBits(64);
        
        byte B = 123;
        int I  = 87987;
        long LI = 237658768;
        System.out.print("\n" + B + " = ");
        b.show(B);
        System.out.print("\n" + I + " = ");
        i.show(I);
        System.out.print("\n" + LI + " = ");
        li.show(LI);
        System.out.println();
    }
}