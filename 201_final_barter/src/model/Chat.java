package model;

import java.util.ArrayList;

public class Chat {
	
	private int chatId;
	//each message looks like this = "username: message text"
	private ArrayList<String> messages;
	
	public Chat() {
		this.chatId = -1;
		this.messages = new ArrayList<String>();
	}
	
	public Chat(int chatId, ArrayList<String> messages) {
		this.chatId = chatId;
		this.messages = messages;
	}
	
	public void addMessage(String messagebody) {
		this.messages.add(messagebody);
	}
	public void removeMessage(int index) {
		this.messages.remove(index);
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
