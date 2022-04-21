package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.beans.Product;
import com.beans.User;
import com.beans.Orders;
import com.beans.OrderDetail;


public class DB {
	
	
	ArrayList<Orders> orders = new ArrayList<>();
	ArrayList<Product> list = new ArrayList<>();
	ArrayList<User> userList = new ArrayList<>();
	List<Integer> orderedlist = new ArrayList<Integer>();
	List<Integer> ordersid = new ArrayList<Integer>();
	
	int userid;
	int numberpage;
	
	private Connection con;
	private void dbConnect() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/myproject?autoReconnect=true&useSSL=false", "root", "admin");
			//								  "jdbc:mysql://localhost:3306/mysql"
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	
	protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/myproject?useSSL=false", "root", "admin");
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return connection;
    }
	
	private void dbClose() {
		try {
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	public void addUser(User user) throws SQLException {
		dbConnect();
		Connection connection = getConnection();
		String sql = "Insert into user(name,email,username,address,password) values(?,?,?,?,?)";
		PreparedStatement st = con.prepareStatement(sql);
		
		st.setString(1, user.getName());
		st.setString(2, user.getEmail());
		st.setString(3, user.getUsername());
		st.setString(4, user.getAddress());
		st.setString(5, user.getPassword());
		
		
		st.executeUpdate();
		dbClose();
	}

	public boolean checkUser(String username, String password) throws SQLException {
		dbConnect();
		int count = 0;
		String sql = "Select * from user where username = ? and password = ?";
		PreparedStatement st = con.prepareStatement(sql);
		
		st.setString(1, username);
		st.setString(2, password);
		
		ResultSet rs = st.executeQuery();
		
		while(rs.next()) {
			count = 1;
		}
		
		dbClose();
		if(count == 0)
			return false;
		
		return true;
	}

	public ArrayList<Product> fetch() throws SQLException {
		dbConnect();
		String sql = "Select * from product"; 
		PreparedStatement st = con.prepareStatement(sql);
		ResultSet rs = st.executeQuery();
		while(rs.next()) {
			int id=rs.getInt("productid");
			String name= rs.getString("name");
			String category= rs.getString("category");
			String price= rs.getString("price");
			String featured= rs.getString("featured");
			String image= rs.getString("image");
			
			Product p = new Product();
			p.setCategory(category);
			p.setFeatured(featured);
			p.setId(id);
			p.setImage(image);
			p.setName(name);
			p.setPrice(price);
			list.add(p);
			p=null;
			
		}
		
		dbClose();
		return list;
	}

	public ArrayList<User> fetchUser() throws SQLException {
		dbConnect();
		String sql = "Select * from user";
		PreparedStatement st = con.prepareStatement(sql);
		ResultSet rs = st.executeQuery();
		
		while(rs.next()) {
			String address = rs.getString("address");
			String user = rs.getString("username");
			String email = rs.getString("email");
			String name = rs.getString("name");
			int id = rs.getInt("userid");
			String password = rs.getString("password");
			
			User u = new User();
			u.setAddress(address);
			u.setEmail(email);
			u.setId(id);
			u.setName(name);
			u.setUsername(user);
			u.setPassword(password);
			userList.add(u);
			u=null;
				
		}
		
		dbClose();
		return userList;
	}

	public void deleteProduct(String id) throws SQLException {
		
		dbConnect();
		String sql = "Delete from product where productid=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, id);
		st.executeUpdate();
		dbClose();
		
	}

	public Product fetchProduct(String id) throws SQLException {
		dbConnect();
		String sql = "select * from product where productid=?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, id);
		ResultSet rst = pstmt.executeQuery();
		Product p = new Product();
		while(rst.next()){
			
			p.setId(rst.getInt("productid"));
			p.setName(rst.getString("name"));
			p.setPrice(rst.getString("price"));
			p.setCategory(rst.getString("category"));
			p.setFeatured(rst.getString("featured"));
			p.setImage(rst.getString("image"));
		}
		dbClose();
		return p;
	}

	public void updateProduct(Product p) throws SQLException {
		dbConnect();
		String sql = "update product set name=?,price=?,category=?,featured=? where productid=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, p.getName());
		st.setString(2, p.getPrice());
		st.setString(3, p.getCategory());
		st.setString(4, p.getFeatured());
		st.setInt(5, p.getId());
		st.executeUpdate();
		dbClose();
	}

	public void addProduct(Product p) throws SQLException {
		dbConnect();
		String sql = "Insert into product(name,price,category,featured,image) values(?,?,?,?,?)";
		PreparedStatement st = con.prepareStatement(sql);
		
		st.setString(1, p.getName());
		st.setString(2, p.getPrice());
		st.setString(3, p.getCategory());
		st.setString(4, p.getFeatured());
		st.setString(5, p.getImage());
		
		
		st.executeUpdate();
		dbClose();
	}

	
	public void addOrder(Orders order) throws SQLException {
		dbConnect();
		Connection connection = getConnection();
		String sql = "Insert into orders(orderid,userid,totalprice,amount,date) values(?,?,?,?,?)";
		PreparedStatement st = con.prepareStatement(sql);
		
		st.setInt(1, order.getOrderid());
		st.setInt(2, order.getUserid());
		st.setString(3, order.getTotalprice());
		st.setString(4, order.getAmount());
		st.setString(5, order.getDate());
		
		
		st.executeUpdate();
		dbClose();
	}
	
	
	public int findUser(String username) throws SQLException {
		dbConnect();
		String sql = "select userid from user where username=?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, username);
		ResultSet rst = pstmt.executeQuery();
		while(rst.next()){	
			userid = rst.getInt("userid");
		}
		dbClose();
		return userid;
	}
	
	public boolean checkOrder(int orderid) throws SQLException {
		dbConnect();
		int count = 0;
		String sql = "Select * from orders where orderid = ?";
		PreparedStatement st = con.prepareStatement(sql);
		
		st.setInt(1, orderid);
		
		ResultSet rs = st.executeQuery();
		
		while(rs.next()) {
			count = 1;
		}
		
		dbClose();
		if(count == 0)
			return false;
		
		return true;
	}
	
	public void addOrderDetail(OrderDetail orderdetail) throws SQLException {
		dbConnect();
		Connection connection = getConnection();
		String sql = "Insert into orderdetail(orderid,productid) values(?,?)";
		PreparedStatement st = con.prepareStatement(sql);
		
		st.setInt(1, orderdetail.getOrderid());
		st.setInt(2, orderdetail.getProductid());

		st.executeUpdate();
		dbClose();
	}
	
	public User findUserInfor(String username) throws SQLException {
		dbConnect();
		User userinfo = new User();
		String sql = "select * from user where username=?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, username);
		ResultSet rst = pstmt.executeQuery();
		
		while(rst.next()){	
			
			int id = rst.getInt("userid");
			//String username = rst.getString("username");
			String name = rst.getString("name");
			String address = rst.getString("address");
			String email = rst.getString("email");
			
			userinfo.setId(id);
			userinfo.setUsername(username);
			userinfo.setName(name);
			userinfo.setAddress(address);
			userinfo.setEmail(email);
		}
		dbClose();
		return userinfo;
	}
	
	public List<Integer> getOrdersid(String userid) throws SQLException {
		dbConnect();
		String sql = "Select * from orders where userid = ?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, userid);
		ResultSet rst = pstmt.executeQuery();
		
		while(rst.next()) {
			ordersid.add(rst.getInt("orderid"));
		}
		
		dbClose();
		return ordersid;
	}
	
	public List<Integer> getOrderedlist(int orderid) throws SQLException{
		dbConnect();
		Product product = new Product();
		String sql = "select * from orderdetail where orderid=?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, orderid);
		ResultSet rst = pstmt.executeQuery();
		
		while(rst.next()){	
			orderedlist.add(rst.getInt("productid"));
		}
		dbClose();
		return orderedlist;
	}
	
	public int getnumberpage(ArrayList<Product> list)throws SQLException{
		numberpage = 0;
		dbConnect();
		Product product = new Product();
		String sql = "select * from product";
		PreparedStatement pstmt = con.prepareStatement(sql);
		ResultSet rst = pstmt.executeQuery();
		while(rst.next()){	
			numberpage +=1;
		}
		if(numberpage%9==0) {
			return numberpage=numberpage/9;
		}
		return numberpage=numberpage/9+1;
	}
	
	public ArrayList<Orders> fetchOrders() throws SQLException{
		dbConnect();
		String sql = "Select * from orders";
		PreparedStatement st = con.prepareStatement(sql);
		ResultSet rs = st.executeQuery();
		while(rs.next()) {
			int orderid=rs.getInt("orderid");
			int userid=rs.getInt("userid");
			String totalprice=rs.getString("totalprice");
			String amount=rs.getString("amount");
			String date=rs.getString("date");
			Boolean deliverycheck =rs.getBoolean("deliverycheck");
			
			Orders p = new Orders();
			p.setOrderid(orderid);
			p.setUserid(userid);
			p.setTotalprice(totalprice);
			p.setAmount(amount);
			p.setDate(date);
			p.setDeliverycheck(deliverycheck);
			orders.add(p);
			p=null;	
		}
		dbClose();
		return orders;
	}
	
	public void updateDelivery(int orderid) throws SQLException {
		dbConnect();
		String sql = "update orders set deliverycheck = 1 where orderid=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setInt(1, orderid);
		st.executeUpdate();
		System.out.println("2");
		dbClose();
	}

	public ArrayList<Product> searchProduct (String searchstring) throws SQLException  {
		ArrayList<Product> searchproduct = new ArrayList<>();
		dbConnect();
		String sql = "select * from product where name LIKE ?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, "%"+searchstring+"%");
		
		ResultSet rst = pstmt.executeQuery();
		while(rst.next()){
			
			Product p = new Product();
			p.setId(rst.getInt("productid"));
			p.setName(rst.getString("name"));
			p.setPrice(rst.getString("price"));
			p.setCategory(rst.getString("category"));
			p.setFeatured(rst.getString("featured"));
			p.setImage(rst.getString("image"));
			
			
			searchproduct.add(p);
			p=null;
		}
		dbClose();
		
		return searchproduct;
	}

	
}
