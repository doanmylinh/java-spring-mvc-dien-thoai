package com.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;
import javax.servlet.http.HttpSession;

import com.beans.Orders;
import com.beans.Product;
import com.model.DB;

public class AdminController extends HttpServlet {
	ArrayList<Orders> orders = new ArrayList<>();
	HttpSession session;
	private static final long serialVersionUID = 1L;
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String page = request.getParameter("page");
		if(page == null) {
			request.getRequestDispatcher("admin/login.jsp").forward(request, response);;
		}else {
			doPost(request, response);
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String page = request.getParameter("page");
		if(page.equals("admin-login-form")) {
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			
			
			if(username.equals("admin") && password.equals("admin")) {
				request.getRequestDispatcher("admin/index.jsp").forward(request, response);

			}
			else {
				request.setAttribute("msg", "Invalid Crediantials");
				request.setAttribute("username", username);
				request.getRequestDispatcher("admin/login.jsp").forward(request, response);

			}
		}
		
		if(page.equals("delete")) {
			String id = request.getParameter("id");
			DB db = new DB();
			try {
				db.deleteProduct(id);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			JOptionPane.showMessageDialog(null, "Product deleted successfully", "Info", JOptionPane.INFORMATION_MESSAGE);
			request.getRequestDispatcher("admin/index.jsp").forward(request, response);

		}
		
		if(page.equals("index")) {
			request.getRequestDispatcher("admin/index.jsp").forward(request, response);
		}
		
		if(page.equals("addproduct")) {
			request.getRequestDispatcher("admin/addProduct.jsp").forward(request, response);
		}
		
		if(page.equals("edit")) {
			String id = request.getParameter("id");
			DB account = new DB();
			Product p = null;
			try {
				 p = account.fetchProduct(id);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			request.setAttribute("p", p);
			request.getRequestDispatcher("admin/editProduct.jsp").forward(request, response);
		}
		
		if(page.equals("edit_product")){
			String id = request.getParameter("id");
			String name = request.getParameter("name");
			String price = request.getParameter("price");
			String category = request.getParameter("category");
			String featured = request.getParameter("featured");
			Product p = new Product();
			p.setId(Integer.parseInt(id));
			p.setName(name);
			p.setPrice(price);
			p.setCategory(category);
			p.setFeatured(featured);
			
			DB account = new DB();
			try {
				account.updateProduct(p);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			JOptionPane.showMessageDialog(null, "Product details updated successfully", "Info", JOptionPane.INFORMATION_MESSAGE);
			request.getRequestDispatcher("admin/index.jsp").forward(request, response);
		}
		
		if(page.equals("add_product")){
			String name = request.getParameter("name");
			String price = request.getParameter("price");
			String category = request.getParameter("category");
			String featured = request.getParameter("featured");
			String image = request.getParameter("image");
			Product p = new Product();
			p.setName(name);
			p.setPrice(price);
			p.setCategory(category);
			p.setFeatured(featured);
			p.setImage("img/"+image);
			
			DB account = new DB();
			try {
				account.addProduct(p);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			JOptionPane.showMessageDialog(null, "Product added Successfully", "Info", JOptionPane.INFORMATION_MESSAGE);
			request.getRequestDispatcher("admin/index.jsp").forward(request, response);
		}
		
		
		if(page.equals("orders")) {
			DB db = new DB();
			try {
				orders=db.fetchOrders();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			session = request.getSession();
			session.setAttribute("orders", orders);
			request.getRequestDispatcher("admin/orders.jsp").forward(request, response);

		}
		
		

		if(page.equals("check")) {
			DB db = new DB();
			String checkid = request.getParameter("id");
			int check= Integer.parseInt(checkid);  
			try {
				System.out.println(check);
				db.updateDelivery(check);
				
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			session = request.getSession();
			session.setAttribute("orders", orders);
			request.getRequestDispatcher("admin/orders.jsp").forward(request, response);

		}
		if(page.equals("checkedorders")) {
			DB db = new DB();
			try {
				orders=db.fetchOrders();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			session = request.getSession();
			session.setAttribute("orders", orders);
			request.getRequestDispatcher("admin/checkedorders.jsp").forward(request, response);

		}

	}

}
