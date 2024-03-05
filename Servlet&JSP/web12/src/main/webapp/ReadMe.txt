쇼핑몰 관리자 페이지
 1. 라이브러리 복사---------------------------------완
    - ojdbc, cos, jstl
 2. 데이터베이스 구축 (=> 데이블 생성, 시퀀스 생성)-------완
 3. 샘플 데이터 삽입 (샘플 이미지도 지정된 장소에 업로드)---완
    -Z:\upload
 4. 톰캣 서버에 DBCP 을 셋팅-------------------------완
 5. VO 객체를 생성(테이블에 맞춰서)--------------------완
 6. DBManager 객체에 연결, 해제 메서드----------------완
 7. DAO 객체를 싱글턴 패턴으로 제작--------------------완
 
 8. 모든 JSP 파일에 공통으로 적용할 CSS 작성 -----------완
    -> web.xml에 디폴트 서블릿 등록
--------------------------------------------------------------
 9. 상품 리스트을 보여주는 페이지를 제작-----------------완
 	- index.jsp
 	- 서블릿 : ProductListServlet
 	- DAO : selectAllProduct()
 	- JSP : productList.jsp
 	
 10. 상품 등록 기능을 제작
 	- productList.jsp -> 링크
 	- 서블릿 : ProductWriteServlet
 	     - doGet()
 	- JSP : productWrite.jsp
 	- 서블릿 : ProductWriteServlet
 	     - doPost()
 	- DAO : insertProduct()
 	
 11. 상품 수정 기능을 제작    
 	- productList.jsp -> 링크
 	- 서블릿 : ProductUpdateServlet
 	      -doGet()
 	- DAO : selectProductByCode()
 	- JSP : productUpdate.jsp
 	- 서블릿 : ProductUpdateServlet
 	      -doPost()
 	- DAO : updateProduct()
 
 12. 상품 삭제 기능을 제작
 	- productList.jsp -> 링크
 	- 서블릿 : ProductDeleteServlet
 		- doGet()
 	- DAO : deleteProduct()
 	
 13. 상품 상세정보를 보여주는 페이지 제작  => 수정, 삭제 이동 가능
 	- productList.jsp -> 링크
 	- 서블릿 : ProductDetailServlet
 		- doGet()
 	- DAO : selectProductByCode() : Update에서 만든 코드 사용
 	- JSP : productDetail.jsp
 	
 
---------------------------------------------------------------
테스트 상품 정보
1
이름 : 파이썬 데이터 사이언스 핸드북
price : 34200
pictureUrl : 01_python.jpg
Description : 파이썬을 활용한 데이터 과학 입문서

2
이름 : 코틀린을 활용한 안드로이드 프로그래밍 
price : 34000
pictureUrl : 02_android.jpg
Description : 코틀린 언어를 통한 안드로이드 개발서

3
이름 : Node.js 교과서
price : 32400
pictureUrl : 03_nodejs.jpg
Description : 기본기에 충실한 노드.js 학습서

4
이름 : 자바 웹을 다루는 기술
price : 40500
pictureUrl : 04_javaWebBook.jpg
Description : JSP,서블릿,스프링까지 실무에 알아야 할 기술서

5
이름 : 토비의 스프링 3.1
price : 67500
pictureUrl : 05_spring.jpg
Description : 스프링의 원리와 이해를 충실히 가르쳐줄 교과서

데이터 등록 테스트
6
이름 : Do it! 리액트 프로그래밍 정석 
price : 32400
pictureUrl : 06_reAct.jpg
Description : 리액트 입문

데이터 수정 테스트
7 
이름 : 실전 리액트 프로그래밍
price : 28800
pictureUrl : 07_reAct.jpg
Description : 리액트 실무 지침서

===================================================================










