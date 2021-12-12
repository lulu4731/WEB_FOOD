package ptithcm.entity;

import java.util.Collection;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "`ORDER`")
public class ORDER {
	@Id
	@GeneratedValue
	private int ID_ORDER;
	@ManyToOne
	@JoinColumn(name="ID_ACCOUNT")
	private ACCOUNT accountOrder;
	
	private Double TOTAL_PRICE;
	@DateTimeFormat(pattern = "dd-MM-yyyy")
	@Temporal(TemporalType.DATE)
	private Date DATE_TIME;
	private String ADDRESS;
	private String NOTE;
	private Byte STATUS;
	
	@OneToMany(mappedBy = "order", fetch = FetchType.EAGER)
	private Collection<ORDER_ITEM> item;

	public int getID_ORDER() {
		return ID_ORDER;
	}

	public void setID_ORDER(int iD_ORDER) {
		ID_ORDER = iD_ORDER;
	}

	public ACCOUNT getAccountOrder() {
		return accountOrder;
	}

	public void setAccountOrder(ACCOUNT accountOrder) {
		this.accountOrder = accountOrder;
	}

	public Double getTOTAL_PRICE() {
		return TOTAL_PRICE;
	}

	public void setTOTAL_PRICE(Double tOTAL_PRICE) {
		TOTAL_PRICE = tOTAL_PRICE;
	}

	public Date getDATE_TIME() {
		return DATE_TIME;
	}

	public void setDATE_TIME(Date dATE_TIME) {
		DATE_TIME = dATE_TIME;
	}

	public String getADDRESS() {
		return ADDRESS;
	}

	public void setADDRESS(String aDDRESS) {
		ADDRESS = aDDRESS;
	}

	public String getNOTE() {
		return NOTE;
	}

	public void setNOTE(String nOTE) {
		NOTE = nOTE;
	}

	public Byte getSTATUS() {
		return STATUS;
	}

	public void setSTATUS(Byte sTATUS) {
		STATUS = sTATUS;
	}

	public Collection<ORDER_ITEM> getItem() {
		return item;
	}

	public void setItem(Collection<ORDER_ITEM> item) {
		this.item = item;
	}
	
	
}
