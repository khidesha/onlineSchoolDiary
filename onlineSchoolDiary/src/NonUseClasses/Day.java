package user;

public class Day {
	public int day_id;
	public String day_data;
	
	public Day(int dayId, String dayData) {
		this.day_id = dayId;
		this.day_data = dayData;
	}
	
	public int getDayId() {
		return day_id;
	}
	
	public String getDayData() {
		return day_data;
	}
	
}
