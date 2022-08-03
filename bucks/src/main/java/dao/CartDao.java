package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.DecimalFormat;
import java.time.LocalDate;
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
	public void insert_cart(HttpServletRequest req, HttpServletResponse res, HttpSession session) throws Exception {
		req.setCharacterEncoding("utf-8");
		int unit = Integer.parseInt(req.getParameter("unit"));
		
		String sql = "select code, price from menu where name=? and size=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, req.getParameter("name"));
		pstmt.setString(2, req.getParameter("size"));
//		System.out.println("code/price 가져오기 : " + pstmt.toString());
		ResultSet rs = pstmt.executeQuery();
		rs.next();
		String code = rs.getString("code");
		int price = rs.getInt("price");
		
		int total = price * unit;
		
		sql = "insert into cart";
		sql += "(userid, code, unit, prod_cost, total_cost, writeday) ";
		sql += "values(?,?,?,?,?,now())";
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, session.getAttribute("userid").toString());
		pstmt.setString(2, code);
		pstmt.setInt(3, unit);
		pstmt.setInt(4, price);
		pstmt.setInt(5, total);
		pstmt.executeUpdate();
//		System.out.println("insert문 : " + pstmt.toString());
		
		
		res.sendRedirect("cart_view.jsp");
	}
	
	
	public void get_cart(HttpServletRequest req, HttpSession session) throws Exception {
		
//		String sql = "select * from cart where userid=? and state=0";
		String sql = "SELECT A.*, B.name, B.type, B.size, B.img ";
		sql += "FROM cart A INNER JOIN menu B ";
		sql += "ON A.userid=? and B.code=A.code and A.state=0";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, session.getAttribute("userid").toString());
		ResultSet rs = pstmt.executeQuery();
		
		ArrayList<CartDto> list = new ArrayList<CartDto>();
		while(rs.next()) {
			CartDto dto = new CartDto();
			dto.setId(rs.getInt("id"));
			dto.setCode(rs.getString("code"));
			dto.setProd_cost(rs.getInt("prod_cost"));
			dto.setStore_id(rs.getInt("store_id"));
			dto.setTotal_cost(rs.getInt("total_cost"));
			dto.setUnit(rs.getInt("unit"));
			dto.setWriteday(rs.getString("writeday"));
			dto.setName(rs.getString("name"));
			dto.setType(rs.getInt("type"));
			dto.setSize(rs.getInt("size"));
			dto.setImg(rs.getString("img"));
			list.add(dto);
		}
		
		req.setAttribute("list", list);
		rs.close();
	}
	
	
	public void cart_delete(HttpServletRequest req) throws Exception {
		String sql = "";
		
		sql = "update cart set state=9 where id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, req.getParameter("id"));
		pstmt.executeUpdate();
		
	}
	
	
	public void insert_order(HttpServletRequest req, HttpServletResponse res, HttpSession session) throws Exception {
		String sql = "";
		
//		String[] ids = req.getParameterValues("cartid");
		String[] codes = req.getParameterValues("prod_code");
		String[] units = req.getParameterValues("prod_unit");
		
		/*
		 * A. 주문번호 구성 : YYYYMMDD + 일련번호 4자리 (ex. 202208030001)
		 * B. 주문번호 만들기
		 * 	1. 날짜객체를 이용하여 오늘 날짜 구하기
		 * 	2. DB에 오늘날짜의 주문번호가 있는지 확인
		 * 		2-1. 없다면, 주문번호를 '오늘날짜0001' 설정
		 * 		2-2. 있다면, 가장 큰 값 가져와서 +1로 설정 
		 */
		
		// 주문번호 만들기1. 날짜객체를 통해 오늘 날짜 구하기 
		LocalDate today = LocalDate.now();
		DecimalFormat dmFormat = new DecimalFormat("00");
		int year = today.getYear();
		String month = dmFormat.format(Double.valueOf(today.getMonthValue()));
		String day = dmFormat.format(Double.valueOf(today.getDayOfMonth()));
		
		String orderCode = year + month + day;
			//System.out.println("오늘날짜:"+orderCode);
		
		// 주문번호 만들기2. 오늘날짜의 주문번호가 있는지 확인
		sql = "select ifnull(max(order_code),0) code from purchase where order_code like '"+orderCode+"____'";
		pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
			//System.out.println("SQL문:"+pstmt.toString());
		rs.next();
		
		// 없다면 0001 설정하기
		if(rs.getLong("code") == 0) {
			orderCode += "0001";
		}
		// 있다면 가장 큰 값에 +1 설정하기
		else {			
			Long codeNum = rs.getLong("code") + 1;
			orderCode = Long.toString(codeNum);
		}
			//System.out.println("주문번호 만들기:"+orderCode);
		

		for(int i=0; i<codes.length; i++) {
			sql = "insert into purchase";
			sql += "(order_code, userid, prod_code, unit, writeday) ";
			sql += "values(?,?,?,?,now())";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, orderCode);
			pstmt.setString(2, session.getAttribute("userid").toString());
			pstmt.setString(3, codes[i]);
			pstmt.setString(4, units[i]);
			pstmt.executeUpdate();
		}
		
		rs.close();
		close();
		res.sendRedirect("order_view.jsp");
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
