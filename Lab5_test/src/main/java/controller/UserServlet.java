package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import dao.UserDAO;
import model.User;

/**
 * Servlet implementation class UserServlet
 */
@WebServlet({"/userList","/user/delete", "/user/add","/user/edit"})
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    @Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String uri = request.getRequestURI();
		
		if (uri.contains("userList")) {
			doUserList(request, response);
		}else if (uri.contains("user/delete")){
			try {
				doUserDelete(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} if (uri.contains("user/add")){
			doUserAdd(request, response);
			
		}else if(uri.contains("/user/edit")) {
			doUserUpdate(request, response);
		}
		request.getRequestDispatcher("/views/index.jsp").forward(request, response);
	}

	private void doUserUpdate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getMethod().equals("POST")) {
			if(request.getParameter("updateUserButton") != null) {
				String id = request.getParameter("id");
				String fullName = request.getParameter("fullname");
				String email = request.getParameter("email");
				String userType = request.getParameter("userType");
				String password = request.getParameter("password");
				UserDAO userDAO = new UserDAO();
				User user = new User(id, password, email, fullName, Boolean.parseBoolean(userType));
				userDAO.update(user);
				String message = "Edit user " + id + "has been updated successfully!";
				System.out.println("Update: " + message);
				request.setAttribute("message", message);
				request.getRequestDispatcher("/userList").forward(request, response);
			}else
				request.getRequestDispatcher("/userList").forward(request, response);
		}else { //GET METHOD
			String userId = request.getParameter("id");
			UserDAO userDAO = new UserDAO();
			User user = userDAO.findById(userId);
			if(user != null) {
				request.setAttribute("user", user);
				request.getRequestDispatcher("/views/updateUser.jsp").forward(request, response);
			}else
				request.getRequestDispatcher("/userList").forward(request, response);

		}
	}

	private void doUserAdd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		    if (request.getMethod().equals("POST")) {
		        if (request.getParameter("addUserButton") != null) {
		            String id = request.getParameter("id");
		            String fullName = request.getParameter("fullname");
		            String email = request.getParameter("email");
		            String userType = request.getParameter("userType");
		            String password = request.getParameter("password");
		            
		            UserDAO userDAO = new UserDAO();
		            
		            // Check if the ID already exists in the database
		            User existingUser = userDAO.findById(id);
		            if (existingUser != null) {
		                String message = "ID already exists. Please choose a different ID.";
		                request.setAttribute("message", message);
		                request.getRequestDispatcher("/views/addUser.jsp").forward(request, response);
		                return;
		            }
		            
		            User user = new User(id, password, email, fullName, Boolean.parseBoolean(userType));
		            userDAO.create(user);
		            
		            String message = "Add user: " + id + " successfully!";
		            request.setAttribute("message", message);
		            request.getRequestDispatcher("/views/addUser.jsp").forward(request, response);
		        } else {
		            request.getRequestDispatcher("/userList").forward(request, response);
		        }
		    } else {
		        // GET METHOD
		        request.getRequestDispatcher("/views/addUser.jsp").forward(request, response);
		    }
		
	}

	private void doUserDelete(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String userId = request.getParameter("id");
		if(userId != null) {
			UserDAO userDAO = new UserDAO();
			userDAO.delete(userId);
			String message = "Delete user: " + userId + "has been added successfully!";
			request.setAttribute("message", message);
			request.getRequestDispatcher("/userList").forward(request, response);
		}
		request.getRequestDispatcher("/userList").forward(request, response);

	}

	private void doUserList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserDAO userDAO = new UserDAO();
		List<User> listUsers = userDAO.findAll();
		request.setAttribute("listUsers", listUsers);
		request.getRequestDispatcher("/views/listUser.jsp").forward(request, response);
	}
	


}
