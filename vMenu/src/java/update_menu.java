import java.io.*;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.*;
import javax.servlet.http.*;

public class update_menu extends HttpServlet {

	boolean check(String name, String cost, String category, String description) {
		int i;
		char m[] = cost.toCharArray();
		char n[] = name.toCharArray();
		if (!cost.equals("")) {
			for (i = 0; i < m.length; i++) {
				if ((!Character.isDigit(m[i]))) {
					return false;
				}
			}
		} else {
			return false;
		}
		if (!name.equals("")) {
			for (i = 0; i < n.length; i++) {
				if ((!Character.isAlphabetic(n[i])) && (!Character.isWhitespace(n[i]))) {
					return false;
				}
			}
		} else
			return false;
		if (!category.equals("")) {
			if (!category.equals("Soup") && !category.equals("Salad") && !category.equals("Starter")
					&& !category.equals("Sizzler") && !category.equals("Pasta") && !category.equals("Roll & Sandwich")
					&& !category.equals("Main Course") && !category.equals("Dessert") && !category.equals("Beverages"))
				return false;
		}
		if (description.equals("")) {
			return false;
		}
		return true;
	}

	boolean check1(String name) {
		int i;
		char n[] = name.toCharArray();
		if (!name.equals("")) {
			for (i = 0; i < n.length; i++) {
				if ((!Character.isAlphabetic(n[i])) && (!Character.isWhitespace(n[i]))) {
					return false;
				}
			}
		} else
			return false;
		return true;
	}

	boolean check2(String name, String cost) {
		int i;
		char m[] = cost.toCharArray();
		char n[] = name.toCharArray();
		if (!cost.equals("")) {
			for (i = 0; i < m.length; i++) {
				if ((!Character.isDigit(m[i]))) {
					return false;
				}
			}
		} else {
			return false;
		}
		if (!name.equals("")) {
			for (i = 0; i < n.length; i++) {
				if ((!Character.isAlphabetic(n[i])) && (!Character.isWhitespace(n[i]))) {
					return false;
				}
			}
		} else
			return false;

		return true;
	}

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, ClassNotFoundException, SQLException {
		response.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = response.getWriter()) {

			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "root");
			Statement st = con.createStatement();

			String operation = request.getParameter("id");

			if (operation.equals("add")) {
				String name = request.getParameter("menuname");
				String cost = request.getParameter("mcost");
				String category = request.getParameter("category");
				String description = request.getParameter("desc");
				int id = 1;

				if (check(name, cost, category, description)) {
					ResultSet rs = st.executeQuery("select * from menu_items");
					if (rs.last()) {
						id = rs.getInt("m_id") + 1;
					}

					int status = st.executeUpdate("insert into menu_items values(" + id + ",'" + name + "','" + cost
							+ "','" + category + "','" + description + "')");
					if (status == 1) {
						response.sendRedirect("Admin_update_msg.jsp?id=MenuAdded");
					} else {
						response.sendRedirect("Admin_update_msg.jsp?id=MenuNotAdded");
					}
				} else {
					response.sendRedirect("Admin_update_msg.jsp?id=IncorrectDetails");
				}
			} else if (operation.equals("delete")) {
				String name = request.getParameter("menuname");

				if (check1(name)) {
					int status = st.executeUpdate("delete from menu_items where m_name='" + name + "'");
					if (status == 1) {
						response.sendRedirect("Admin_update_msg.jsp?id=MenuDeleted");
					} else {
						response.sendRedirect("Admin_update_msg.jsp?id=MenuNotDeleted");
					}
				} else {
					response.sendRedirect("Admin_update_msg.jsp?id=IncorrectDetails");
				}
			} else if (operation.equals("update")) {
				String name = request.getParameter("menuname");
				String cost = request.getParameter("cost");

				if (check2(name, cost)) {
					int status = st
							.executeUpdate("update menu_items set m_cost='" + cost + "' where m_name='" + name + "'");
					if (status == 1) {
						response.sendRedirect("Admin_update_msg.jsp?id=MenuUpdated");
					} else {
						response.sendRedirect("Admin_update_msg.jsp?id=MenuNotUpdated");
					}
				} else {
					response.sendRedirect("Admin_update_msg.jsp?id=IncorrectDetails");
				}
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			processRequest(request, response);
		} catch (ClassNotFoundException ex) {
			Logger.getLogger(update_staff.class.getName()).log(Level.SEVERE, null, ex);
		} catch (SQLException ex) {
			Logger.getLogger(update_staff.class.getName()).log(Level.SEVERE, null, ex);
		}
	}

	public String getServletInfo() {
		return "Short description";
	}

}
