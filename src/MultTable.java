public class MultTable {
    public static void main(String[] args) {
        int x = 1;
        int y = 1;
        System.out.println("MULTIPLICATION TABLE");
        System.out.println("----------------------------");
        System.out.println("\t1\t2\t3\t4\t5\t");
        do {
            do {
                if (x == 1) {
                    System.out.print(y+ "\t");
                }
                System.out.print(x * y + "\t");
                ++x;
            } while (x < 6);
            System.out.print("\n");
            x = 1;
            ++y;
        } while (y < 6);
    }
}
