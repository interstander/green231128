package com.green.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.green.dao.MemberDao;
import com.green.dto.MemberDto;


@WebServlet("/memberList")
public class SelectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 요청
		//    1. 응답하기 위한 데이터를 가공
		//    2. 가공된 데이터를 가지고 화면 출력을 위한 JSP로 넘겨준다.
//		String sql = "SELECT * FROM memberTbl";
//		
//		Connection conn = null;
//		Statement stmt = null;
//		ResultSet rs = null;
//		
//		List<MemberDto> memberLists = new ArrayList<>();
//		
//		try{
//			Context initContext = new InitialContext();
//			Context envContext  = (Context)initContext.lookup("java:/comp/env");
//			DataSource ds = (DataSource)envContext.lookup("jdbc/myoracle");
//			conn = ds.getConnection();
//
//			stmt = conn.createStatement();	
//			rs = stmt.executeQuery(sql);	
//			while(rs.next()){
//				MemberDto mto = new MemberDto();
//				mto.setName(rs.getString("name"));
//				mto.setUserid(rs.getString("userid"));
//				mto.setUserpwd(rs.getString("userpwd"));
//				mto.setEmail(rs.getString("email"));
//				mto.setPhone(rs.getString("phone"));
//				mto.setAdmin(rs.getInt("admin"));
//				memberLists.add(mto);
//			}
//		}catch(Exception e){
//			e.printStackTrace();
//		}finally{
//			try{
//				if(rs!=null)rs.close();
//				if(stmt!=null)stmt.close();
//				if(conn!=null)conn.close();
//			}catch(Exception e){
//				e.printStackTrace();
//			}
//		}
		
		MemberDao dao = MemberDao.getInstance();  //new MemberDao();
		List<MemberDto> memberLists = dao.selectAllMember();
		
		request.setAttribute("memberLists", memberLists);
		request.getRequestDispatcher("ex02_select.jsp").forward(request, response);
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
