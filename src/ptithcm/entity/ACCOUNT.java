package ptithcm.entity;

import java.util.Collection;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "ACCOUNT")
public class ACCOUNT {
	@Id
	@GeneratedValue
	private int ID_ACCOUNT;
	private String NAME;
	private String EMAIL;
	private String PASSWORD;
	private String PHONE_NUMBER;
	private String CARD_NUMBER;
	private String CODE;
	@ManyToOne
	@JoinColumn(name="ID_ROLE")
	private ROLE role;
	private String ADDRESS;
	private Boolean IS_ACTIVE;
//	private String SESSION;
	
	@OneToMany(mappedBy = "accountOrder", fetch = FetchType.EAGER)
	private Collection<ORDER> order;

	@OneToMany(mappedBy = "accountCart", fetch = FetchType.EAGER)
	private Collection<CART> cart;
	
	@OneToMany(mappedBy = "accountFeed", fetch = FetchType.EAGER)
	private Collection<FEEDBACK> feed;

	public int getID_ACCOUNT() {
		return ID_ACCOUNT;
	}

	public void setID_ACCOUNT(int iD_ACCOUNT) {
		ID_ACCOUNT = iD_ACCOUNT;
	}

	public String getNAME() {
		return NAME;
	}

	public String getCODE() {
		return CODE;
	}

	public void setCODE(String cODE) {
		CODE = cODE;
	}

	public void setNAME(String nAME) {
		NAME = nAME;
	}

	public String getEMAIL() {
		return EMAIL;
	}

	public void setEMAIL(String eMAIL) {
		EMAIL = eMAIL;
	}

	public String getPASSWORD() {
		return PASSWORD;
	}

	public void setPASSWORD(String pASSWORD) {
		PASSWORD = pASSWORD;
	}

	public String getPHONE_NUMBER() {
		return PHONE_NUMBER;
	}

	public void setPHONE_NUMBER(String pHONE_NUMBER) {
		PHONE_NUMBER = pHONE_NUMBER;
	}

	public String getCARD_NUMBER() {
		return CARD_NUMBER;
	}

	public void setCARD_NUMBER(String cARD_NUMBER) {
		CARD_NUMBER = cARD_NUMBER;
	}

	public ROLE getRole() {
		return role;
	}

	public void setRole(ROLE role) {
		this.role = role;
	}

	public String getADDRESS() {
		return ADDRESS;
	}

	public void setADDRESS(String aDDRESS) {
		ADDRESS = aDDRESS;
	}

	public Boolean getIS_ACTIVE() {
		return IS_ACTIVE;
	}

	public void setIS_ACTIVE(Boolean iS_ACTIVE) {
		IS_ACTIVE = iS_ACTIVE;
	}

//	public String getSESSION() {
//		return SESSION;
//	}
//
//	public void setSESSION(String sESSION) {
//		SESSION = sESSION;
//	}

	public Collection<ORDER> getOrder() {
		return order;
	}

	public void setOrder(Collection<ORDER> order) {
		this.order = order;
	}

	public Collection<CART> getCart() {
		return cart;
	}

	public void setCart(Collection<CART> cart) {
		this.cart = cart;
	}

	public Collection<FEEDBACK> getFeed() {
		return feed;
	}

	public void setFeed(Collection<FEEDBACK> feed) {
		this.feed = feed;
	}
	
	
	
}
