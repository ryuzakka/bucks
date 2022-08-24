package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspWriter;

import dto.CartDto;
import dto.MenuDto;

public class MenuDao {

	Connection conn;
	PreparedStatement pstmt;
	
	public MenuDao() throws Exception {
		Class.forName("com.mysql.jdbc.Driver");
		String db = "jdbc:mysql://localhost:3306/bucks";
		conn = DriverManager.getConnection(db, "root", "5032");
	}
	
	public void close() throws Exception {
		pstmt.close();
		conn.close();
	}
	
	public void list(HttpServletRequest req) throws Exception {
		
		String sql = "select distinct name from menu where cate1='01' and state=1";
		pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		ArrayList<MenuDto> list = new ArrayList<MenuDto>();
		
		while(rs.next()) {
			MenuDto dto = new MenuDto();
			//dto.setCode(rs.getString("code"));
			//dto.setId(rs.getInt("id"));
			dto.setName(rs.getString("name"));
			list.add(dto);
		}
		req.setAttribute("list", list);
		rs.close();
	}
	
	public void content(HttpServletRequest req) throws Exception {
		req.setCharacterEncoding("utf-8");
		String name = req.getParameter("name");
		
		String sql = "select * from menu where name=? and state=1";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, name);
		ResultSet rs = pstmt.executeQuery();
		ArrayList<MenuDto> list = new ArrayList<MenuDto>();
		
		while(rs.next()) {
			MenuDto dto = new MenuDto();
			dto.setId(rs.getInt("id"));
			dto.setName(rs.getString("name"));
			dto.setType(rs.getInt("type"));
			dto.setSize(rs.getInt("size"));
			dto.setPrice(rs.getInt("price"));
			list.add(dto);
		}
		req.setAttribute("list", list);
		//rs.close();
		
		sql = "select cate1,cate2,img from menu where name=? limit 1";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, name);
		rs = pstmt.executeQuery();
		rs.next();
		String cate1 = rs.getString("cate1");
		String cate2 = rs.getString("cate2");
		req.setAttribute("cate1", cate1);
		req.setAttribute("cate2", cate2);
		req.setAttribute("img", rs.getString("img"));
		//rs.close();
		
		sql = "select B.catename from menu A, menu_cate B where B.cate1=? and B.cate2=? and A.name=? limit 1";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, cate1);
		pstmt.setString(2, cate2);
		pstmt.setString(3, name);
		rs = pstmt.executeQuery();
		rs.next();
		req.setAttribute("category", rs.getString("catename"));
		
		rs.close();
	}
	
	// 메뉴명과 사이즈로 1잔 가격 가져오기
	public void get_price(HttpServletRequest req, JspWriter out) throws Exception {
		String name = req.getParameter("name");
		
		String sql = "select price from menu where name=? and size=?"; 
		pstmt = conn.prepareStatement(sql); 
		pstmt.setString(1, name); 
		pstmt.setString(2, req.getParameter("size")); 
		ResultSet rs = pstmt.executeQuery();
		rs.next();
		out.print(rs.getInt("price"));
		
		rs.close();
		close();
	}
	
	
	
	
	
	
	
}
