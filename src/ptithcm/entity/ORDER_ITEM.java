package ptithcm.entity;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "ORDER_ITEM")
public class ORDER_ITEM implements Serializable{
	@Id
	@ManyToOne
	@JoinColumn(name="ID_ORDER")
	private ORDER order;
	
	@Id
	@ManyToOne
	@JoinColumn(name="ID_FOOD")
	private FOOD foodOrderItem;
	private int SCORE;
	public int getSCORE() {
		return SCORE;
	}
	public void setSCORE(int sCORE) {
		SCORE = sCORE;
	}
	private byte QUANTITY;
	private Double ITEM_PRICE;
	public ORDER getOrder() {
		return order;
	}
	public void setOrder(ORDER order) {
		this.order = order;
	}
	public FOOD getFoodOrderItem() {
		return foodOrderItem;
	}
	public void setFoodOrderItem(FOOD foodOrderItem) {
		this.foodOrderItem = foodOrderItem;
	}
	public byte getQUANTITY() {
		return QUANTITY;
	}
	public void setQUANTITY(byte qUANTITY) {
		QUANTITY = qUANTITY;
	}
	public Double getITEM_PRICE() {
		return ITEM_PRICE;
	}
	public void setITEM_PRICE(Double iTEM_PRICE) {
		ITEM_PRICE = iTEM_PRICE;
	}
	
	
	
}
