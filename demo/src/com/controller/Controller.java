package com.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;
import java.util.concurrent.ThreadLocalRandom;

import com.beans.Product;
import com.beans.User;
import com.beans.Orders;
import com.beans.OrderDetail;
import com.model.DB;

public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ArrayList<Product> list = new ArrayList<>();
	ArrayList<Product> listpage = new ArrayList<>();
	static ArrayList<String> cartlist = new ArrayList<>();
	ArrayList<User> userList = new ArrayList<>();
	int userid;
	int pagenumber;
	HttpSession session;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String page = request.getParameter("page");
		if(page == null || page.equals("index")) {
			String action = request.getParameter("currentpage");
			//int currentpage=Integer.parseInt(action);  ;
			DB db = new DB();
			ArrayList<Product> emptylist = new ArrayList<>();
			listpage=emptylist;
			
			 try {
				list = db.fetch();
				if(list.size()>9) {
					for (int counter = 0; counter < 9; counter++) { 		      
				          listpage.add(list.get(counter)); 		
					}
				}
				else listpage = list;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		 
			 
			 try {
				pagenumber = db.getnumberpage(list);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			 session = request.getSession();
			 session.setAttribute("list", list);
			 session.setAttribute("listpages", listpage);
			 session.setAttribute("cartlist", cartlist);
			 session.setAttribute("pagenumber", pagenumber);
 
			request.getRequestDispatcher("index.jsp").forward(request, response);
			
			
		}else {
			doPost(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String page = request.getParameter("page");
		if(page.equals("login")) {
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
		
		if(page.equals("sign-up")) {
			request.getRequestDispatcher("signup.jsp").forward(request, response);
		}
		
		if(page.equals("sign-up-form")) {
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String username = request.getParameter("username");
			String address = request.getParameter("address");
			String password_1 = request.getParameter("password_1");
			String password_2 = request.getParameter("password_2");
			
			if(password_1.equals(password_2)) {
				
				User user = new User();
				user.setAddress(address);
				user.setEmail(email);
				user.setName(name);
				user.setUsername(username);
				user.setPassword(password_1);
				
				DB db = new DB();
				try {
					db.addUser(user);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				
				request.setAttribute("username", username);
				request.setAttribute("msg", "Account created successfully, Please Login!");
				request.getRequestDispatcher("login.jsp").forward(request, response);
				
			}else {
				request.setAttribute("msg", "The two passwords do not match");
				request.setAttribute("name", name);
				request.setAttribute("address", address);
				request.setAttribute("email", email);
				request.setAttribute("username", username);
				request.getRequestDispatcher("signup.jsp").forward(request, response);
			}
			
		}
		
		if(page.equals("login-form")) {
			
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			
			DB db = new DB();
			User user = new User();
			boolean status = false;
			try {
				status = db.checkUser(username,password);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			if(status) {
				session = request.getSession();
				session.setAttribute("session", session);
				
				try {
					userList = db.fetchUser();
				} catch (SQLException e) {
					e.printStackTrace();
				}
				session.setAttribute("address", user.fetchadd(userList,username));
				session.setAttribute("email", user.fetchemail(userList,username));
				session.setAttribute("name", user.fetchname(userList,username));
				session.setAttribute("username", username);
				request.getRequestDispatcher("index.jsp").forward(request, response);
			}else {
				request.setAttribute("msg", "Invalid Crediantials");
				request.setAttribute("username", username);
				request.getRequestDispatcher("login.jsp").forward(request, response);
			}
			
		}
		
		if(page.equals("logout")) {
			session = request.getSession();
			session.invalidate();
			
			 session = request.getSession();
			 cartlist.clear();
			 session.setAttribute("cartlist", cartlist);
			 session.setAttribute("list", list);
			
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
		
		if(page.equals("mobiles") || page.equals("laptops")) {
			DB db = new DB();
			 try {
				list = db.fetch();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			request.setAttribute("list", list);
			
			if(page.equals("mobiles"))
				request.getRequestDispatcher("mobiles.jsp").forward(request, response);
			if(page.equals("laptops"))
				request.getRequestDispatcher("laptops.jsp").forward(request, response);
			
		}
		
		if(page.equals("all-products"))
			request.getRequestDispatcher("index.jsp").forward(request, response);
		
		if(page.equals("showcart")) {
			request.getRequestDispatcher("cart.jsp").forward(request, response);
		}
		
		if(page.equals("addtocart")) {
			String id = request.getParameter("id");
			String action = request.getParameter("action");
			Product p = new Product();
			boolean check = p.check(cartlist,id);
			
			if(check)
				JOptionPane.showMessageDialog(null, "Product is already added to Cart", "Info", JOptionPane.INFORMATION_MESSAGE);
			else {
				cartlist.add(id);
			}
			
			if(action.equals("index"))
				request.getRequestDispatcher("index.jsp").forward(request, response);
			if(action.equals("allproducts"))
				request.getRequestDispatcher("all-products.jsp").forward(request, response);
			if(action.equals("clothing"))
				request.getRequestDispatcher("clothing.jsp").forward(request, response);
			if(action.equals("home-decor"))
				request.getRequestDispatcher("home-decor.jsp").forward(request, response);
			if(action.equals("laptops"))
				request.getRequestDispatcher("laptops.jsp").forward(request, response);
			if(action.equals("mobiles"))
				request.getRequestDispatcher("mobiles.jsp").forward(request, response);
		}
		
		if(page.equals("success")) {

			String username = request.getParameter("username");
			String price = request.getParameter("total");
			
			int randomOrderId = ThreadLocalRandom.current().nextInt(1, 2147483600);
			DB find = new DB();
			
			try {
				while(find.checkOrder(randomOrderId)){
					randomOrderId = ThreadLocalRandom.current().nextInt(1, 2147483600);
				}
			} catch (SQLException e2) {
				// TODO Auto-generated catch block
				e2.printStackTrace();
			};
			try {
				userid = find.findUser(username);
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			String x  =request.getParameter("x");
			String date = new SimpleDateFormat("dd-MM-yyyy").format(new Date());
			Orders p = new Orders();
			
			p.setOrderid(randomOrderId);
			p.setUserid(userid);
			p.setTotalprice(price);
			p.setAmount(x);
			p.setDate(date);
			
			DB order = new DB();
			try {
				order.addOrder(p);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			

			for(int i = 0;i<cartlist.size();i++) {
				OrderDetail detail = new OrderDetail();
				int intid = Integer.parseInt(cartlist.get(i));  
				
				detail.setOrderid(randomOrderId);
				detail.setProductid(intid);
				
				DB orderdetail = new DB();
				try {
					orderdetail.addOrderDetail(detail);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();}
			}
			

			/*session = request.getSession();
			 cartlist.clear();
			 session.setAttribute("cartlist", cartlist);*/
			request.getRequestDispatcher("success.jsp").forward(request, response);
			cartlist.clear();
		}
		
		if(page.equals("remove")) {
			String id = request.getParameter("id");
			Product p = new Product();
			cartlist = p.remove(cartlist,id);
			
			session = request.getSession();
			session.setAttribute("cartlist", cartlist);
			request.getRequestDispatcher("cart.jsp").forward(request, response);
		}
		
		if(page.equals("price-sort")) {
			String price = request.getParameter("sort");
			String action = request.getParameter("action");
			Product p = new Product();
			if(price.equals("low-to-high"))
				list = p.lowtohigh(list);
			else
				list = p.hightolow(list);
			
			session.setAttribute("list", list);
			
			if(action.equals("index"))
				request.getRequestDispatcher("index.jsp").forward(request, response);
			if(action.equals("all-products"))
				request.getRequestDispatcher("all-products.jsp").forward(request, response);
			if(action.equals("mobiles"))
				request.getRequestDispatcher("mobiles.jsp").forward(request, response);
			if(action.equals("laptops"))
				request.getRequestDispatcher("laptops.jsp").forward(request, response);

		}
		
		if(page.equals("userinfo")) {
			String username = request.getParameter("username");
			DB find = new DB();
			User userinfo = new User();
			try {
				userinfo = find.findUserInfor(username);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			try {
				userid = find.findUser(username);
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			request.setAttribute("userid", userid);
			request.setAttribute("name", userinfo.getName());
			request.setAttribute("address", userinfo.getAddress());
			request.setAttribute("email", userinfo.getEmail());
			
			request.getRequestDispatcher("userinfo.jsp").forward(request, response);
		}
		
		if(page.equals("showorders")) {
			String userid = request.getParameter("userid");
			List<Integer> ordersid = new ArrayList<Integer>();
			List<Integer> orderedlist = new ArrayList<Integer>();
			DB find = new DB();
			try {
				ordersid = find.getOrdersid(userid);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	      for (Integer num : ordersid) { 		      
	           try {
				orderedlist=find.getOrderedlist(num);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}	
	      }
	      
	      session.setAttribute("orderedlist", orderedlist);
	      for (Integer num : orderedlist) { 		      
	      }	
	      request.getRequestDispatcher("orderedlist.jsp").forward(request, response);
		}
		
		if(page.equals("pagination")) {
			String currentpage = request.getParameter("currentpage");
			int pageid=Integer.parseInt(currentpage);
			DB db = new DB();
			ArrayList<Product> emptylist = new ArrayList<>();
			listpage=emptylist;
			
			
			if(list.size()%9==0 || (pageid*9-list.size())<0) {
				System.out.print("1");
				 try {
					list = db.fetch();

					for (int counter = 9*(pageid-1); counter < 9*pageid; counter++) { 		      
					          listpage.add(list.get(counter)); 		   
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			if((pageid*9-list.size())>0){
				System.out.print("2");
				 try {
						list = db.fetch();
						for (int counter = 9*(pageid-1); counter < ( (9*(pageid-1)) + (list.size()%9) ) ; counter++) { 		      
						          listpage.add(list.get(counter)); 		   
						}
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}

			}
			 
			 try {
				pagenumber = db.getnumberpage(list);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			 session = request.getSession();
			 session.setAttribute("cartlist", cartlist);
			 session.setAttribute("list", listpage);
			 session.setAttribute("pagenumber", pagenumber);
 
			request.getRequestDispatcher("pagination.jsp").forward(request, response);	
		}
		
		if(page.equals("searchpage")) {
			String searchstring = request.getParameter("searchstring");
			DB find = new DB();
			ArrayList<Product> searchlist = new ArrayList<>();
			try {
				searchlist= find.searchProduct(searchstring);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			session = request.getSession();
			request.setAttribute("searchlist", searchlist);
			request.getRequestDispatcher("searchpage.jsp").forward(request, response);
		}
	}

}
