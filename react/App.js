/* eslint-disable */
// warning를 더이상 안보여줌
import logo from './logo.svg';
import './App.css';
import { useState } from 'react';

function App() {
    // 화면에 끼워 넣을 함수의 반환값 : HTML스럽지만 HTML(X) => JSX
    //   함수호출 -> JSX 반환 -> HTML로 변환 -> index.html에 끼워넣기
    // [JSX]의 특징
    //   1) XML문법을 따른다. (닫기 태그가 반드시 필요하다 ex. <br></br> or <br /> )
    //   2) 함수의 반환값은 무조건 하나의 태그 덩어리로 구성해야한다. 
    //   3) class 속성 => className이라는 속성으로 작성해야함
    //   4) 변수의 값을 JSX에 끼워 넣어서 출력할 때는 {변수명} 형태로 바인딩 해야 한다.
    //   5) 스타일의 경우 css파일을 import로 가져올수 있다.
    //      => 직접 태그에 스타일을 부여하고 싶은 경우 객체 형태로 부여해야 함(이름에 -기호 사용 불가)
    //      ex.  <div style={color:"blue",backgroundColor:"black"}>

    // 2. 데이터 => 변수
    //   일반적인 변수는 변경사항에 대해 실시간으로 반영하지 못한다.
    //   let data = "데이터";
    // setTimeout(function(){
    //   data = "정보"; 
    // },1000)

    //  - 변경 사항을 감지하고 즉각 화면에 반영할수 있는 새로운 저장공간 : state
    //   사용법 : 
    //       저장법 : useState(저장할 정보);
    //       조회방법 : let data = useState(저장할 정보);
//    let data = useState('데이터');
    //       변경 방법 : let [data,setData] = useState(저장할 정보);
    //                  setData('변경할 정보');

    //      es6 버전 Destructuring 문법 :  
    //        배열이나 객체의 요소를 각각의 변수에 담는 방법
    // [기존]let names = ['홍길동','고길동','차길동'];
    //        let n1 = names[0];   // n1 = '홍길동';
    //        let n2 = names[1];   // n2 = '고길동';
    //        let n3 = names[2];   // n3 = '차길동';

    //[새로운방법 ] let names = ['홍길동','고길동','차길동'];
    //        let [n1,n2,n3] = names;
    let [data,alt] = useState('데이터');

    // setTimeout(function(){
    //   alt('세이프 하우스'); 
    // },2000);

    // let [title1,setTitle1] = useState('자바스크립트 공부');
    // let [title2,setTitle2] = useState('제이쿼리 공부');
    // let [title3,setTitle3] = useState('리액트 공부');
    let [title,setTitle] = useState(['자바스크립트 공부','제이쿼리 공부','리액트 공부']);

    // 이벤트 : 속성으로 붙이는 방법 : 
    //     ->  HTML : <div onclick="실행할 함수">
    //     ->  JSX  : <div onClick={실행할 함수}>
    //                               => 1. 외부함수
    //                               => 2. 콜백함수
    //                               => 3. 화살표함수

    function change(){  // 외부함수
        console.log('제목 변경1');
    }
    //  좋아요 버튼 
    //  좋아요 누를때마다 증가하는 값을 저장하는 state
    let [fover,setFover] = useState(0);

    //[미니과제] : 수정 버튼을 누르면 첫번째 글 제목을 "자바 공부"로 바꿔 봅시다.
    //  title[0] = '자바 공부';
    
    //  state의 값이 배열인 경우 
    //    일반적으로 state를 변경하는 경우 새로운 데이터로 교체을 방식을 사용

    // - 원본 데이터를 손상시키는 코딩방법 X => 새로운 배열로 복사한 후 데이터 변경하는 방식 권장

    // - state의 특징 :  변경된 데이터가 기존의 데이터와 동일하다면 렌더링하지 않는다!!

    // [미니 과제] : 수정 버튼 옆에 '정렬'버튼을 만들고 각 게시글의 제목을 기준으로 오름차순 정렬하세요.

  return (
    <>
      <div className="App">
        <header className="header">
          <h3>내 {data}</h3>
        </header>

        <button onClick={function(){
          // 1. 배열의 값만 바꿔서는 변경 안됨 title[0] = '자바 공부';
          // 2. 배열 내부의 값만 바꿔서는 배열의 주소가 그대로 이므로 변경 안됨
          // title[0] = '자바 공부';
          // console.log(title);
          // setTitle(title);

          // 3. 배열을 통째로 복사한 카피본을 활용
          let copyTitle = [...title];  //  ...은 배열이나 객체를 각 요소로 분리하는 연산
          copyTitle[0] = '자바 공부';
          setTitle(copyTitle);
        }}>수정</button>

        <div className="list">
          <h4>{title[0]} <span onClick={function(){
                console.log('좋아요!!');
                setFover(fover+1);
          }}>👍</span>{fover}</h4>
          <p>10월 15일</p>
        </div>

        <div className="list">
          <h4>{title[1]}</h4>
          <p>11월 15일</p>
        </div>

        <div className="list">
          <h4>{title[2]}</h4>
          <p>12월 15일</p>
        </div>

      </div>
    </>
  );
}
// 실행시 error / warning
//    error 치명적 오류 :  실행 안됨!
//    warning : 단순 경고 : 실행은 되지만 뭔가 문제가 있는거 같아!
export default App;
