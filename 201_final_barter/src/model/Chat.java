package model;

import java.util.ArrayList;

public class Chat {
	
	private int chatId;
	private ArrayList<String> messages;
	
	public Chat(int chatId, ArrayList<String> messages) {
		super();
		this.chatId = chatId;
		this.messages = messages;
	}
	
	
	public int getChatId() {
		return chatId;
	}
	public void setChatId(int chatId) {
		this.chatId = chatId;
	}
	public ArrayList<String> getMessages() {
		return messages;
	}
	public void setMessages(ArrayList<String> messages) {
		this.messages = messages;
	}
}
