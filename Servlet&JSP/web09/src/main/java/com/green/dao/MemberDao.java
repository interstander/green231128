package com.green.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.green.dto.MemberDto;

public class MemberDao {  // DAO : 데이터 액세스 오브젝트
						  //  데이터베이스와 데이터를 주고 받기 위한 클래스
	
	
	private MemberDao() {}
	private static MemberDao dao = new MemberDao();
	public static MemberDao getInstance() {
		return dao;
	}
	
	public List<MemberDto> selectAllMember(){
		List<MemberDto> memberLists = new ArrayList<>();
		
		String sql = "SELECT * FROM memberTbl";
		
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;

		try{
			Context initContext = new InitialContext();
			Context envContext  = (Context)initContext.lookup("java:/comp/env");
			DataSource ds = (DataSource)envContext.lookup("jdbc/myoracle");
			conn = ds.getConnection();

			stmt = conn.createStatement();	
			rs = stmt.executeQuery(sql);	
			while(rs.next()){
				MemberDto mto = new MemberDto();
				mto.setName(rs.getString("name"));
				mto.setUserid(rs.getString("userid"));
				mto.setUserpwd(rs.getString("userpwd"));
				mto.setEmail(rs.getString("email"));
				mto.setPhone(rs.getString("phone"));
				mto.setAdmin(rs.getInt("admin"));
				memberLists.add(mto);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				if(rs!=null)rs.close();
				if(stmt!=null)stmt.close();
				if(conn!=null)conn.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		
		return memberLists;
	}
//	
//	public MemberDto selectMember() {}
//	
//	public void insertMember(MemberDto mto) {}
	
}
