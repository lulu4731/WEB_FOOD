package ptithcm.entity;

import java.util.Collection;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "ROLE")
public class ROLE {
	@Id
	@GeneratedValue
	private int ID_ROLE;
	private String NAME;
	
	@OneToMany(mappedBy = "role", fetch = FetchType.EAGER)
	private Collection<ACCOUNT> account;

	public int getID_ROLE() {
		return ID_ROLE;
	}

	public void setID_ROLE(int iD_ROLE) {
		ID_ROLE = iD_ROLE;
	}

	public String getNAME() {
		return NAME;
	}

	public void setNAME(String nAME) {
		NAME = nAME;
	}

	public Collection<ACCOUNT> getAccount() {
		return account;
	}

	public void setAccount(Collection<ACCOUNT> account) {
		this.account = account;
	}
}
