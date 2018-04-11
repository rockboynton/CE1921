
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.concurrent.TimeUnit;

public class VHDLUtils {

    public static void main(String[] args) {
//        List<String> inputs = new ArrayList<>();
//        inputs.add("CLK");
//        inputs.add("RST");
//        inputs.add("A1");
//        inputs.add("A2");
//        inputs.add("A3");
//        inputs.add("WD3");
//        inputs.add("WE3");
//        inputs.add("RD1");
//        inputs.add("RD2");
//        System.out.println(portMap(inputs));
//        System.out.println(countSequence(4, 1, "ms"));
//        System.out.println(randomSequence(1, 1, "ms", 10));
        System.out.println(TimeUnit.SECONDS.toNanos(1));
        System.out.println(TimeUnit.MILLISECONDS.toNanos(1));
    }

    public static String portMap(List<String> inputs) {
        String res = "";
        for (String port : inputs) {
            res += port + "=>" + port + ",";
        }
        res = res.substring(0,res.length() - 1);
        return res;
    }

    public static List<String> getBus(String name, int width) {
        List<String> res = new ArrayList<>();
        for (int i = width - 1; i >= 0; i--) {
            res.add(name + i);
        }
        return res;
    }

    public static String countSequence(int bits, int clockPeriod, String clockUnits) {
        String res = "";
        double vals = Math.pow(2, bits);
        res += "B\"" + String.format("%" + bits + "s", Integer.toBinaryString(0)).replace
                (" ", "0") + "\"";
        for (int i = 1, j = clockPeriod; i < vals; i++, j += clockPeriod) {
            res += ", B\"" + String.format("%" + bits + "s", Integer.toBinaryString(i)).replace
                    (" ", "0") + "\" after " + j + clockUnits;
        }
        res += ";";
        return res;
    }

    public static String randomSequence(int bits, int clockPeriod, String clockUnits, int cycles) {
        String res = "";
        int vals = (int) Math.pow(2, bits);
        Random r = new Random();
        if (bits < 5) {
            res += "B\"" + String.format("%" + bits + "s", Integer.toBinaryString(0)).replace
                    (" ", "0") + "\"";
            for (int i = 1, j = clockPeriod; i < cycles; i++, j += clockPeriod) {
                res += ", B\"" + String.format("%" + bits + "s", Integer.toBinaryString(
                        r.nextInt() % vals)).replace(" ", "0") + "\" after " +
                        j + clockUnits;
            }
        } else {
            res += "X\"" + String.format("%" + (bits / 4) + "s", Integer.toHexString(0)).replace
                    (" ", "0") + "\"";
            for (int i = 1, j = clockPeriod; i < cycles; i++, j += clockPeriod) {
                res += ", X\"" + String.format("%" + (bits / 4) + "s", Integer.toHexString(
                        r.nextInt() % vals)).replace(" ", "0") + "\" after " +
                        j + clockUnits;
            }
        }
        res += ";";
        return res;
    }
}
