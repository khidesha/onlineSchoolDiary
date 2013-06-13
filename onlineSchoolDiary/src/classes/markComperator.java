package classes;

import java.util.Comparator;


public class markComperator implements Comparator<Mark> {
	@Override
    public int compare(Mark o1, Mark o2) {
        return o1.mark_date.compareTo(o2.mark_date);
    }
}