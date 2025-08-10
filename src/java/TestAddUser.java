public class TestAddUser {
    public static void main(String[] args) {
        com.pahanaedu.dao.UserDAO dao = new com.pahanaedu.dao.UserDAO();
        boolean added = dao.addUser("testuser", "test123", "staff");
        System.out.println("User added? " + added);
    }
}
