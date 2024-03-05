package com.green.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.green.dto.MemberDto;

public class MemberDao {
	
	// 싱글턴 패턴
	private MemberDao() {}
	private static MemberDao dao = new MemberDao();
	public static MemberDao getInstance() {
		return dao;
	}
	
//--------------------------------------------------------------------
	// DB 연결및 해제 관련 기능
	private Connection getConnection() throws Exception{
		Connection conn = null;
		Context initContext = new InitialContext();
		Context envContext  = (Context)initContext.lookup("java:/comp/env");
		DataSource ds = (DataSource)envContext.lookup("jdbc/myoracle");
		conn = ds.getConnection();

		return conn;
	}
	
	private void close(Connection conn, Statement stmt, ResultSet rs) {
		try {
			if(rs!=null)rs.close();
			if(stmt!=null)stmt.close();
			if(conn!=null)conn.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	private void close(Connection conn, Statement stmt) {
		try {
			if(stmt!=null)stmt.close();
			if(conn!=null)conn.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	
//--------------------------------------------------------------------
	// 사용자 인증 처리 메서드,
	public int userCheck(String userid, String userpwd) {
		int result = -1;
		
		String sql = "SELECT userpwd FROM memberTbl WHERE userid=?";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, userid);
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				if(rs.getString("userpwd") !=null 
					&& rs.getString("userpwd").equals(userpwd)) {
					// 로그인 성공
					result = 1;
				}else {// 아이디는 있지만 비밀번호가 null이거나 일치하지 않는 경우
					result = 0;
				}
			}else {// 아이디를 찾을 수 없는 경우
				result = -1;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(conn, psmt, rs);
		}
		return result;
	}
//--------------------------------------------------------------------
	// 아이디로 회원 정보 얻어오기
	public MemberDto getMember(String userid) {
		MemberDto mto = null;
		String sql = "SELECT * FROM memberTbl WHERE userid=?";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, userid);
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				mto = new MemberDto();
				
				mto.setName(rs.getString("name"));
				mto.setUserid(rs.getString("userid"));
				mto.setUserpwd(rs.getString("userpwd"));
				mto.setEmail(rs.getString("email"));
				mto.setPhone(rs.getString("phone"));
				mto.setAdmin(rs.getInt("admin"));
				
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(conn,psmt,rs);
		}
		return mto;
	}
//---------------------------------------------------------------------------
	// 회원 정보 수정
	public void updateMember(MemberDto member) {

		String sql = " UPDATE memberTbl SET userpwd=?, email=?, phone=?, admin=? "
				+ " WHERE userid=?";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, member.getUserpwd());
			psmt.setString(2, member.getEmail());
			psmt.setString(3, member.getPhone());
			psmt.setInt(4, member.getAdmin());
			psmt.setString(5, member.getUserid());
			
			psmt.executeUpdate(); // 누락 실수X
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(conn,psmt);
		}
	}
//----------------------------------------------------------------------------------
	// 회원 가입 기능
	public int insertMember(MemberDto member) {
		int result = 0;
		String sql = "INSERT INTO memberTbl(name,userid,userpwd,email,phone,admin) VALUES(?,?,?,?,?,?)";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, member.getName());
			psmt.setString(2, member.getUserid());
			psmt.setString(3, member.getUserpwd());
			psmt.setString(4, member.getEmail());
			psmt.setString(5, member.getPhone());
			psmt.setInt(6, member.getAdmin());
			
			result = psmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(conn, psmt);
		}
		
		return result;
	}
//-------------------------------------------------------------
	// 아이디가 있는지 없는지 체크
	public int confirmId(String userid) {
		int result = 0;
		
		String sql = "SELECT userid FROM memberTbl WHERE userid='"+userid+"'";
		
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			
			rs = stmt.executeQuery(sql);
			
			if(rs.next()) {
				// 아이디가 존재 (=> 아이디를 사용할 수 없음)
				result = 1;
			}else {
				// 아이디가 없음 (=> 아이디를 사용할 수 있음)
				result = -1;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(conn, stmt, rs);
		}
		
		return result;
	}
	
	
	
	
	
	
	
	
	
	
	
}
