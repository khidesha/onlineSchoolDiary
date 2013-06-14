package classes;

import java.util.Comparator;


public class MarkComperator implements Comparator<Mark> {
	@Override
    public int compare(Mark o1, Mark o2) {
        return o1.getMarkDate().compareTo(o2.getMarkDate());
    }
}