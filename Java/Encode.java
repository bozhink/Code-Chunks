class Encode {
    public static void main(String args[]) {
        String msg = "This is a test";
        String encmsg = "";
        String decmsg = "";
        int key = 88;
        
        if (args.length == 1) msg = args[0];
        
        System.out.print("Original message: ");
        System.out.println(msg);
        
        //encoding
        for (int i=0; i<msg.length(); i++)
            encmsg += (char) (msg.charAt(i) ^ key);
        
        System.out.print("Encoded message: ");
        System.out.println(encmsg);
        
        //decoding
        for (int i=0; i<encmsg.length(); i++)
            decmsg += (char) (encmsg.charAt(i)^key);
        
        System.out.print("Decoded message: ");
        System.out.println(decmsg);
    }
}