public class hw2_2 {
    public static double max (double a, double b) {
        return (a > b)? a : b;
    }
    public static void q1 () {
        System.out.print("q1.\n");
        double a = -2.0;
        double b = -0.0;
        if (a / max(b, 0.0) < 0) {
            System.out.print("True\n");
        } else {
            System.out.print("False\n");
        }
    }
    public static void q2 () {
        System.out.print("q2.\n");
        double a =  0.0,
               b = -0.0;
        System.out.print(a + "\n");
        System.out.print(b + "\n");
        System.out.print(Math.signum(a) + "\n");
        System.out.print(Math.signum(b) + "\n");
    }
    public static void q3 () {
        System.out.print("q3.\n");
        System.out.print(max(-0.0, 0.0) + "\n");
        System.out.print(max(0.0, -0.0) + "\n");
        System.out.print(max(0.0, 0.0) + "\n");
        System.out.print(max(-0.0, -0.0) + "\n");
    }
    public static void main (String[] args) {
        q1();
        System.out.print("\n");
        q2();
        System.out.print("\n");
        q3();
        System.out.print("\n");
    }
}
