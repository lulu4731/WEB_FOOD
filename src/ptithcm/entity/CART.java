package ptithcm.entity;

import java.io.Serializable;


import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "CART")
public class CART implements Serializable{	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@ManyToOne
	@JoinColumn(name="ID_FOOD", nullable = false)
	private FOOD foodCart;
	private byte QUANTITY;
	
	@Id
	@ManyToOne
	@JoinColumn(name="ID_ACCOUNT")
	private ACCOUNT accountCart;
	public FOOD getFoodCart() {
		return foodCart;
	}
	public void setFoodCart(FOOD foodCart) {
		this.foodCart = foodCart;
	}
	public byte getQUANTITY() {
		return QUANTITY;
	}
	public void setQUANTITY(byte qUANTITY) {
		QUANTITY = qUANTITY;
	}
	public ACCOUNT getAccountCart() {
		return accountCart;
	}
	public void setAccountCart(ACCOUNT accountCart) {
		this.accountCart = accountCart;
	}
	
	
}
