package ptithcm.bean;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotBlank;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class FoodBean {
	private int ID_FOOD;
	@NotBlank(message="Không được để trống tên món ăn!")
	private String NAME;
	@NotNull(message="Không được để trống giá món ăn!")
	private Double PRICE;
	@NotNull(message="Không được để trống số lượng món ăn !")
	private int AMOUNT;
	private Boolean STATUS;
	private String DESCRIBE;
	private CommonsMultipartFile IMAGE;
	@NotNull(message="Không được để trống số lượng hiện tại của món ăn !")
	private int AMOUNT_DEFAULT;
	public int getID_FOOD() {
		return ID_FOOD;
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
	public CommonsMultipartFile getIMAGE() {
		return IMAGE;
	}
	public void setIMAGE(CommonsMultipartFile iMAGE) {
		IMAGE = iMAGE;
	}
	public int getAMOUNT_DEFAULT() {
		return AMOUNT_DEFAULT;
	}
	public void setAMOUNT_DEFAULT(int aMOUNT_DEFAULT) {
		AMOUNT_DEFAULT = aMOUNT_DEFAULT;
	}
	
	
}
