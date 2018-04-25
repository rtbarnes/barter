package servlets;
import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;

import com.google.gson.annotations.Until;

import helpers.DBUtil;
import helpers.Util;
import model.Item;
import model.Trade;

public class Test {

	public static void main(String[] args) {
		
		
		// TODO Auto-generated method stub
		DBUtil dbUtil = new DBUtil();
		Util util = new Util();
		
//		int latestUserId = dbUtil.addUser("reed", "bb", "rrr@123.com", "a", "90007", "user1", "pass");
//		System.out.println("latest User:" + latestUserId);
//		dbUtil.updateUserPicture(8, "tttttest");
//		User user = dbUtil.getUserByUserId(10);
//		System.out.println(user.getFirstName());
//		System.out.println(user.getLastName());
//		System.out.println(user.getEmail());
//		System.out.println(user.getLocation());
//		System.out.println(user.getPassword());
//		System.out.println(user.getProfileImage());
//		System.out.println(user.getUsername());
		
//		Util util = new Util();
//		ArrayList<Item> items = util.getItemsByUserId(1);
//		for(Item item : items) {
//			System.out.println("item_id: " + item.getItemId());
//			System.out.println("user_id: " + item.getUserId());
//			System.out.println("item_name: " + item.getItemName());
//			System.out.println("description: " + item.getDescription());
//			System.out.println("image: " + item.getImage());
//			System.out.println("category_id: " + item.getCategoryId());
//			System.out.println("sold: " + item.isSold());
//			System.out.println("----------------------------------------");
//		}
//		
//		dbUtil.changePassword(1, "123");
//		System.out.println(util.getTradeByTradeId(1).getDate());
//		DateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");
//		String dateStr = dateFormat.format(util.getTradeByTradeId(1).getDate());
//		System.out.println(dateStr);
		
//		dbUtil.addTrade(1, 1, 1, 1, new Date(Calendar.getInstance().getTime().getTime()), 0);
//		ArrayList<String> chat = util.getMessagesByTradeId(1);
//		Trade trade = util.getTradeByTradeId(1);
//		System.out.println(trade.getTradeId());
//		System.out.println(trade.getReqUser().getUsername());
//		System.out.println(trade.getReqItem().getItemName());
//		System.out.println(trade.getRecUser().getUsername());
//		System.out.println(trade.getRecItem().getItemName());
//		System.out.println(trade.getChat());
		
//		util.getAllTradesForUser(2);
//		dbUtil.editUserInfo(2, "123", "123", "456fasd@123", "999");
		
//		ArrayList<Item> items = dbUtil.getItemsByKeyWord("board");
//		for(Item item : items) {
//			System.out.println(item.getItemName());
//			System.out.println(item.getDescription());
//		}
//		dbUtil.updateItemStatus(1, false);
		
//		dbUtil.addMessageToTrade(1, "neeeeeewww message!!");
		
		System.out.println(dbUtil.getMessagesByTradeId(1));
		util.close();
		dbUtil.close();
		
	}

}
