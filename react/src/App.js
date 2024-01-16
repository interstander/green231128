/* eslint-disable */
// warning를 더이상 안보여줌
import logo from './logo.svg';
import 'bootstrap/dist/css/bootstrap.min.css';
import './App.css';
import {Container,Nav,Navbar,Row,Col,Card} from 'react-bootstrap';
import { Route,Routes,Link, useNavigate,Outlet } from 'react-router-dom';


import bg from './images/european-shorthair.jpg';
import {a,b} from './data2.js';
import data from './data.js';

/**
 *   2) 이미지 삽입 :  화면에 이미지 넣는 방법
 *     - CSS 파일을 이용하는 방법(백그라운드 이미지)
 *     - div 태그의 스타일(백그라운드 이미지)
 *     - img 태그를 이용한 방법
 * 
 *  = 이미지 위치
 *    -> src폴더에 작성하면 import같은 방식으로 이미지를 읽어올 수 있다!
 *   => 리액트 프로그램은 개발이 끝나면 배포를 위한 빌드작업!
 *      - 빌드 작업이 일어나는 동안 자바스크립트 소스 폴더(src)내용이 적절하게 압축되는 형태로 구성
 *      - public 폴더의 내용을 보존이 된다.
 *      - 형태를 온전히 보존하고 싶은 파일은 public에 가급적 보관하는 권장!
 *    
 *    => 이미지를  public에 보관하면 작업중인 src폴더에서는 읽을 수가 없다..
 *      http://www.green.com/blog/~~~
 *     
 *      public 보관 폴더에 접근하기 위한 방법은 process.env.PUBLIC_URL + '/img/logo.png'
 *      (https://create-react-app.dev/docs/using-the-public-folder/)
 
      3) 외부 데이터를 이용하는 방법
      하나의 파일에 모든 데이터나 컴포넌트를 작성하면 관리에 불편함이 생긴다.
        => 관리에 도움을 주고자 별도의 파일로 분리해서 관리하면 유지보수에 도움을 준다.
      예 : data.js
      외부 파일에 생성된 데이터를 가져오는 방법
        (a) 외부파일에서 데이터를 내보내기 : export default 변수명;
        (b) 외부파일에서 데이터를 받아오기 : import 변수명 from '경로/외부파일명';

      => 두개 이상의 데이터를 보낼때는 객체 형태로 전송
         이때 반드시 전달 받기 위한 변수는 보낸 변수명을 그대로 사용해야 한다.

      [미니 과제] : 외부파일로 부터 객체와 배열을 데이터로 작성후 이미지와 함께 화면 구성을 해봅시다.
         1) 데이터를 구성해 봅니다.
         2) 데이터를 전송합니다.
         3) 이미지를 다운받습니다.
         4) 데이터와 이미지로 화면을 구성해 봅시다.  (부트스트랩 - grid 활용)
------------------------------------------------------------------------------------------
      4) 리액트 라우터
      리액트 - SPA (모든 페이지 구성을 하나의 HTML에 담아서 처리하는 기술)
         => 페이지 이동을 브라우저에서는 경로를 통해서 처리
        예  홈페이지 : www.green.com
            정보보기 : www.green.com/info
            상세보기 : www.green.com/detail
        => 리액트에서도 경로가 입력되면 페이지에 해당하는 컴포넌트를 보여주는 방식으로 동작
        
        라우터 기능 : npm install react-router-dom
      
        리액트의 모든 페이지는 index.html에서 구현되기 때문에
        - index.js에서 각 경로를 제어하기 위한 컴포넌트(BrowserRouter)

        - App.js에서 라우팅 기능을 이용한 컴포넌트 (Routes, Route, Link)
          => Route가 경로와 컴포넌트를 매핑 시켜주는 기능

        - navigate()를 이용한 페이지 이동

  */


function App() {

    let navigate = useNavigate();

    return(
        <div>
          <Navbar expand="lg" className="bg-body-tertiary">
          <Container>
            <Navbar.Brand href="#home">그린 아카데미</Navbar.Brand>
            <Navbar.Toggle aria-controls="basic-navbar-nav" />
            <Navbar.Collapse id="basic-navbar-nav">
              <Nav className="me-auto">
                <Nav.Link onClick={()=>{navigate('/')}}>홈</Nav.Link>
                <Nav.Link onClick={()=>{navigate('/detail')}}>상세보기</Nav.Link>
                <Nav.Link onClick={()=>{navigate('/info')}}>정보보기</Nav.Link>
              </Nav>
            </Navbar.Collapse>
          </Container>
        </Navbar>

      <Routes>
        <Route path='/' element={<Main />}/>
        <Route path='/detail' element={<div>상세페이지</div>}/>


        <Route path='/info' element={<Info />}>
          <Route path='member' element={<div>회원 정보</div>}/>
          <Route path='location' element={<div>위치 정보</div>}/>
        </Route>

        <Route path='*' element={<div>404 에러페이지</div>}/>
      </Routes>
      </div>
    )
}
function Info(){
  return(
    <div className='info'>
      <p>정보 페이지</p>
      하위컴포넌트를 보여주는 키워드
      <Outlet></Outlet>
    </div>
  );
}

function Main(props){
  return(
    <div>
        <div className='bg' style={{backgroundImage:'url('+bg+')'}} ></div>
        {/* <img className='bg' src={process.env.PUBLIC_URL+'/images/european-shorthair.jpg'}/> */}
        {/* <img className='bg' src={bg}/> */}
        <Container>
          <Row>
            {
              data.map((item,idx)=>{
                return(
                  <Col key={idx}>
                    <Card style={{ width: '18rem' }}>
                      <Card.Img variant="top" src={process.env.PUBLIC_URL+"/images/item"+(idx+1)+".jpg"} height='300px'/>
                      <Card.Body>
                        <Card.Title>{item.title}</Card.Title>
                        <Card.Text>
                          {item.content}
                        </Card.Text>
                      </Card.Body>
                    </Card>
                  </Col>
                );
              })
            }
            {/* 
            <Col>
              <h4>{data[0].title}</h4>
              <p>{data[0].content}</p>
            </Col>
            <Col>
              <h4>{data[1].title}</h4>
              <p>{data[1].content}</p>
            </Col>
            <Col>
              <h4>{data[2].title}</h4>
              <p>{data[2].content}</p>
            </Col> */}
          </Row>
        </Container>
    </div>
  );
}


export default App;