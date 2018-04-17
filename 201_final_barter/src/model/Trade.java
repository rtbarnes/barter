package model;
import java.sql.Date;

public class Trade {
	
	private int tradeId;
	
	private User reqUser;
	private User recUser;
	
	private Item reqItem;
	private Item recItem;
	
	private Date date;
	private int status;
	
	private Chat chat;

	public Trade(int tradeId, User reqUser, User recUser, Item reqItem, Item recItem, Date date, int status,
			Chat chat) {
		super();
		this.tradeId = tradeId;
		this.reqUser = reqUser;
		this.recUser = recUser;
		this.reqItem = reqItem;
		this.recItem = recItem;
		this.date = date;
		this.status = status;
		this.chat = chat;
	}
	
	public int getTradeId() {
		return tradeId;
	}
	public void setTradeId(int tradeId) {
		this.tradeId = tradeId;
	}
	public User getReqUser() {
		return reqUser;
	}
	public void setReqUser(User reqUser) {
		this.reqUser = reqUser;
	}
	public User getRecUser() {
		return recUser;
	}
	public void setRecUser(User recUser) {
		this.recUser = recUser;
	}
	public Item getReqItem() {
		return reqItem;
	}
	public void setReqItem(Item reqItem) {
		this.reqItem = reqItem;
	}
	public Item getRecItem() {
		return recItem;
	}
	public void setRecItem(Item recItem) {
		this.recItem = recItem;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public Chat getChat() {
		return chat;
	}
	public void setChat(Chat chat) {
		this.chat = chat;
	}
}
