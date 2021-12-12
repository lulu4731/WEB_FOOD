package ptithcm.entity;

import java.util.Collection;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.DecimalMin;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.NotEmpty;


@Entity
@Table(name = "FOOD")
public class FOOD {
	@Id
	@GeneratedValue
	private int ID_FOOD;
	@NotBlank(message="Không được để trống tên món ăn!")
	private String NAME;
	@NotNull(message="Không được để trống giá món ăn!")
	private Double PRICE;
	@NotNull(message="Không được để trống số lượng món ăn !")
	private int AMOUNT;
	private Boolean STATUS;
	private String DESCRIBE;
	private int NUMBER;
	private float SCORE;
	private String IMAGE;
	@NotNull(message="Không được để trống số lượng hiện tại của món ăn !")
	private int AMOUNT_DEFAULT;
	
	@OneToMany(mappedBy = "foodOrderItem", fetch = FetchType.EAGER, cascade = {CascadeType.ALL})
	private Collection<ORDER_ITEM> item;
	
	@OneToMany(mappedBy = "foodCart", fetch = FetchType.EAGER, cascade = {CascadeType.ALL})
	private Collection<CART> cart;
	
//	@OneToMany(mappedBy = "foodRate", fetch = FetchType.EAGER, cascade = {CascadeType.ALL})
//	private Collection<RATE> rate;

	public int getID_FOOD() {
		return ID_FOOD;
	}

	public int getNUMBER() {
		return NUMBER;
	}

	public void setNUMBER(int nUMBER) {
		NUMBER = nUMBER;
	}

	public float getSCORE() {
		return SCORE;
	}

	public void setSCORE(float sCORE) {
		SCORE = sCORE;
	}

	public void setID_FOOD(int iD_FOOD) {
		ID_FOOD = iD_FOOD;
	}

	public String getNAME() {
		return NAME;
	}

	public void setNAME(String nAME) {
		NAME = nAME;
	}

	public Double getPRICE() {
		return PRICE;
	}

	public void setPRICE(Double pRICE) {
		PRICE = pRICE;
	}

	public int getAMOUNT() {
		return AMOUNT;
	}

	public void setAMOUNT(int aMOUNT) {
		AMOUNT = aMOUNT;
	}

	public Boolean getSTATUS() {
		return STATUS;
	}

	public void setSTATUS(Boolean sTATUS) {
		STATUS = sTATUS;
	}

	public String getDESCRIBE() {
		return DESCRIBE;
	}

	public void setDESCRIBE(String dESCRIBE) {
		DESCRIBE = dESCRIBE;
	}

	public String getIMAGE() {
		return IMAGE;
	}

	public void setIMAGE(String iMAGE) {
		IMAGE = iMAGE;
	}

	public int getAMOUNT_DEFAULT() {
		return AMOUNT_DEFAULT;
	}

	public void setAMOUNT_DEFAULT(int aMOUNT_DEFAULT) {
		AMOUNT_DEFAULT = aMOUNT_DEFAULT;
	}

	public Collection<ORDER_ITEM> getItem() {
		return item;
	}

	public void setItem(Collection<ORDER_ITEM> item) {
		this.item = item;
	}

	public Collection<CART> getCart() {
		return cart;
	}

	public void setCart(Collection<CART> cart) {
		this.cart = cart;
	}

//	public Collection<RATE> getRate() {
//		return rate;
//	}
//
//	public void setRate(Collection<RATE> rate) {
//		this.rate = rate;
//	}

	
	
	
}
