package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspWriter;

import dto.CartDto;

public class CartDao {

	Connection conn;
	PreparedStatement pstmt;
	
	public CartDao() throws Exception {
		Class.forName("com.mysql.jdbc.Driver");
		String db = "jdbc:mysql://localhost:3306/bucks";
		conn = DriverManager.getConnection(db, "root", "5032");
	}
	
	public void close() throws Exception {
		pstmt.close();
		conn.close();
	}
	
	// orderSheet에서 결정한 메뉴 카트에 담기
	public void insert_cart(HttpServletRequest req, HttpServletResponse res, HttpSession session, JspWriter out) throws Exception {
		req.setCharacterEncoding("utf-8");
//			String userid = req.getParameter("userid");
//			String cate1 = req.getParameter("cate1");
//			String cate2 = req.getParameter("cate2");
//			int ss = Integer.parseInt(req.getParameter("size"));
//			int uu = Integer.parseInt(req.getParameter("unit"));
//			int cc = Integer.parseInt(req.getParameter("cost"));
		String prod_name = "";
		String size = "";
		String unit = "";
		String cost = "";
		if(session.getAttribute("prod_name") == "") {
			prod_name = req.getParameter("name") +",";
			size = req.getParameter("size") +",";
			unit = req.getParameter("unit") +",";
			cost = req.getParameter("cost") +",";
		} else {
			prod_name = session.getAttribute("prod_name") +","+ req.getParameter("name") +",";
			size = session.getAttribute("size") +","+ req.getParameter("size") +",";
			unit = session.getAttribute("unit") +","+ req.getParameter("unit") +",";
			cost = session.getAttribute("cost") +","+ req.getParameter("cost") +",";
		}
		
		
		System.out.println(prod_name+"/"+size+"/"+unit+"/"+cost);
		
		session.setAttribute("prod_name", prod_name);
		session.setAttribute("size", size);
		session.setAttribute("unit", unit);
		session.setAttribute("cost", cost);
		
//		out.print("1");
		
		res.sendRedirect("ordersheet_ok.jsp");
	}
	
	public void get_cart(HttpServletRequest req, HttpSession session) throws Exception {
		
		String pname = session.getAttribute("prod_name").toString();
		String[] prod_name = pname.split(",");
		String ss = session.getAttribute("size").toString();
		String[] size = ss.split(",");
		String uu = session.getAttribute("unit").toString();
		String[] unit = uu.split(",");
		String cc = session.getAttribute("cost").toString();
		String[] cost = cc.split(","); 
		
		int total_unit = 0;
		int total_cost = 0;
		ArrayList<CartDto> list = new ArrayList<CartDto>();
		for(int i=0; i<prod_name.length; i++) {
			CartDto dto = new CartDto();
			dto.setProd_code(prod_name[i]);
			dto.setProd_unit(unit[i]);
			dto.setProd_size(size[i]);
			dto.setProd_cost(cost[i]);
			list.add(dto);
			total_unit += Integer.parseInt(unit[i]);
			total_cost += Integer.parseInt(cost[i]);
		}
		
		req.setAttribute("list", list);
		req.setAttribute("total_unit", total_unit);
		req.setAttribute("total_cost", total_cost);
		
	}
	
	public void insert_order(HttpServletRequest req, HttpServletResponse res, HttpSession session) throws Exception {
		req.setCharacterEncoding("utf-8");
		
		String sql = "insert into cart";
		sql += "(userid, prod_code, prod_unit, prod_size, prod_cost, total_unit, total_cost, writeday) ";
		sql += "values(?,?,?,?,?,?,?,now())";
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, session.getAttribute("userid").toString());
		pstmt.setString(2, req.getParameter("prod_code"));
		pstmt.setString(3, req.getParameter("prod_unit"));
		pstmt.setString(4, req.getParameter("prod_size"));
		pstmt.setString(5, req.getParameter("prod_cost"));
		pstmt.setString(6, req.getParameter("prod_unit"));
		pstmt.setString(7, req.getParameter("total_cost"));
		pstmt.executeUpdate();
		
		close();
		res.sendRedirect("../menu/order_info.jsp");
	}
		
}
