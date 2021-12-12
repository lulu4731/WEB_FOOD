package ptithcm.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "FEEDBACK")
public class FEEDBACK {
	@Id
	@GeneratedValue
	private int ID_FEEDBACK;
	@ManyToOne
	@JoinColumn(name="ID_ACCOUNT")
	private ACCOUNT accountFeed;	
	private Byte SCORE;
	private String COMMENT;
	@DateTimeFormat(pattern = "dd-MM-yyyy")
	@Temporal(TemporalType.DATE)
	private Date DATE_TIME;
	public int getID_FEEDBACK() {
		return ID_FEEDBACK;
	}
	public void setID_FEEDBACK(int iD_FEEDBACK) {
		ID_FEEDBACK = iD_FEEDBACK;
	}
	public ACCOUNT getAccountFeed() {
		return accountFeed;
	}
	public void setAccountFeed(ACCOUNT accountFeed) {
		this.accountFeed = accountFeed;
	}
	public Byte getSCORE() {
		return SCORE;
	}
	public void setSCORE(Byte sCORE) {
		SCORE = sCORE;
	}
	public String getCOMMENT() {
		return COMMENT;
	}
	public void setCOMMENT(String cOMMENT) {
		COMMENT = cOMMENT;
	}
	public Date getDATE_TIME() {
		return DATE_TIME;
	}
	public void setDATE_TIME(Date dATE_TIME) {
		DATE_TIME = dATE_TIME;
	}
} 
