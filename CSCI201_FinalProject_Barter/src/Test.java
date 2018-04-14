
public class Test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		DBUtil dbUtil = new DBUtil();
//		int latestUserId = dbUtil.addUser("reed", "bb", "rrr@123.com", "a", "90007", "user1", "pass");
//		System.out.println("latest User:" + latestUserId);
//		dbUtil.updateUserPicture(8, "tttttest");
		User user = dbUtil.getUserByUserId(10);
		System.out.println(user.getFirstName());
		System.out.println(user.getLastName());
		System.out.println(user.getEmail());
		System.out.println(user.getLocation());
		System.out.println(user.getPassword());
		System.out.println(user.getProfileImage());
		System.out.println(user.getUsername());
	}

}
