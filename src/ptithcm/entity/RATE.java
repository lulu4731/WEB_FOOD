//package ptithcm.entity;
//
//import javax.persistence.Entity;
//import javax.persistence.GeneratedValue;
//import javax.persistence.Id;
//import javax.persistence.JoinColumn;
//import javax.persistence.ManyToOne;
//import javax.persistence.Table;
//
//@Entity
//@Table(name = "RATE")
//public class RATE {
//	@Id
//	@GeneratedValue
//	private int ID_RATE;
//	@ManyToOne
//	@JoinColumn(name="ID_FOOD", nullable = false)
//	private FOOD foodRate;
//	private byte NUMBER;
//	private Float SCORE;
//	public int getID_RATE() {
//		return ID_RATE;
//	}
//	public void setID_RATE(int iD_RATE) {
//		ID_RATE = iD_RATE;
//	}
//	public FOOD getFoodRate() {
//		return foodRate;
//	}
//	public void setFoodRate(FOOD foodRate) {
//		this.foodRate = foodRate;
//	}
//	public byte getNUMBER() {
//		return NUMBER;
//	}
//	public void setNUMBER(byte nUMBER) {
//		NUMBER = nUMBER;
//	}
//	public Float getSCORE() {
//		return SCORE;
//	}
//	public void setSCORE(Float sCORE) {
//		SCORE = sCORE;
//	}
//	
//	
//	
//}
