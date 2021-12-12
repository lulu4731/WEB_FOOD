package ptithcm.bean;

public class FoodItem {
	private String name;
	private long count;
	private long countFood;
	public FoodItem(String name, long count, long countFood) {
		super();
		this.name = name;
		this.count = count;
		this.countFood = countFood;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public long getCount() {
		return count;
	}
	public void setCount(long count) {
		this.count = count;
	}
	public long getCountFood() {
		return countFood;
	}
	public void setCountFood(long countFood) {
		this.countFood = countFood;
	}
	
	
	
	
	
}
