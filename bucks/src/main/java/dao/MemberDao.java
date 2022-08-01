package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspWriter;

public class MemberDao {

	Connection conn;
	PreparedStatement pstmt;
	
	public MemberDao() throws Exception {
		Class.forName("com.mysql.jdbc.Driver");
		String db = "jdbc:mysql://localhost:3306/bucks";
		conn = DriverManager.getConnection(db, "root", "5032");
	}
	
	public void close() throws Exception {
		pstmt.close();
		conn.close();
	}
	
	public void signup(HttpServletRequest req, HttpServletResponse res) throws Exception {
		req.setCharacterEncoding("utf-8");
		String birth, email;
		birth = req.getParameter("birth1")+"-"+req.getParameter("birth2")+"-"+req.getParameter("birth3");
		if(req.getParameter("email1").trim() == "")
			email = "";
		else
			email = req.getParameter("email1")+"@"+req.getParameter("email2");
		
		String sql = "insert into member";
		sql += "(userid, pwd, username, nickname, birth, phone, email, writeday) ";
		sql += "values(?,?,?,?,?,?,?,now())";
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, req.getParameter("userid"));
		pstmt.setString(2, req.getParameter("pwd2"));
		pstmt.setString(3, req.getParameter("username"));
		pstmt.setString(4, req.getParameter("nickname"));
		pstmt.setString(5, birth);
		pstmt.setString(6, req.getParameter("phone"));
		pstmt.setString(7, email);
		pstmt.executeUpdate();
		//System.out.println(pstmt.toString());
		
		close();
		res.sendRedirect("member_join.jsp");
	}
	
	public void signup_idcheck(HttpServletRequest req, JspWriter out) throws Exception {
		req.setCharacterEncoding("utf-8");
		String sql = "select count(*) cnt from member where userid=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, req.getParameter("userid"));
		ResultSet rs = pstmt.executeQuery();
		rs.next();
		out.print(rs.getInt("cnt"));
	}
	public void signup_phonecheck(HttpServletRequest req, JspWriter out) throws Exception {
		String sql = "select count(*) cnt from member where phone=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, req.getParameter("phone"));
		ResultSet rs = pstmt.executeQuery();
		rs.next();
		out.print(rs.getInt("cnt"));
	}
	
	public void signin(HttpServletRequest req, HttpServletResponse res, HttpSession session) throws Exception {
		String id = req.getParameter("userid");
		String sql = "select * from member where userid=? and pwd=? and state=0";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, req.getParameter("pwd"));
		ResultSet rs = pstmt.executeQuery();
		//System.out.println(pstmt.toString());
		
		if(rs.next()) {
			session.setAttribute("userid", rs.getString("userid"));
			session.setAttribute("nickname", rs.getString("nickname"));
			session.setAttribute("star", rs.getInt("star"));
			session.setAttribute("level", rs.getInt("level"));
			//System.out.println("userid 세션"+session.getAttribute("userid"));
			
			rs.close();
			close();
			res.sendRedirect("../main/index.jsp");
		} else {
			rs.close();
			close();
			res.sendRedirect("login.jsp?err=1");
		}
	}
	
	public void logout(HttpServletResponse res, HttpSession session) throws Exception {
		session.invalidate();
		res.sendRedirect("../main/index.jsp");
	}
	
	public void find_id(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String sql = "select userid from member where phone=? and state=0";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, req.getParameter("phone"));
		ResultSet rs = pstmt.executeQuery();
		
		if(rs.next()) {
			String id = rs.getString("userid");
			rs.close();
			close();
			res.sendRedirect("member_find_id.jsp?userid="+id);
		} else {
			rs.close();
			close();
			res.sendRedirect("member_find_id.jsp?err=1");
		}
		
	}
	
	
	
	
	
	
	
	
	
	
	
}
