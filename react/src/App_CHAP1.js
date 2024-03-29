/* eslint-disable */
// warning를 더이상 안보여줌
import logo from './logo.svg';
import './App.css';
import React, { useState } from 'react';

function AppBackUp() {

// --------- [리액트 학습 내용] --------------
//  (12.26)
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
    let [fover,setFover] = useState([0,0,0]);

    //[미니과제] : 수정 버튼을 누르면 첫번째 글 제목을 "자바 공부"로 바꿔 봅시다.
    //  title[0] = '자바 공부';
    
    //  state의 값이 배열인 경우 
    //    일반적으로 state를 변경하는 경우 새로운 데이터로 교체을 방식을 사용

    // - 원본 데이터를 손상시키는 코딩방법 X => 새로운 배열로 복사한 후 데이터 변경하는 방식 권장

    // - state의 특징 :  변경된 데이터가 기존의 데이터와 동일하다면 렌더링하지 않는다!!

    // [미니 과제] : 수정 버튼 옆에 '정렬'버튼을 만들고 각 게시글의 제목을 기준으로 오름차순 정렬하세요.
    //     => 힌트 : 배열의 정렬 메서드 sort()

    // (12.27)
    //   컴포넌트 : 
    //  화면의 구조가 복잡해지면 JSX자체로 복잡해젝 된다.
    //    JSX의 반복적인 구조를 별도의 함수로 추출해서 사용할 수 있다. 
    //     이런 함수를 컴포넌트 라고 부른다.

    //  컴포넌트 만드는 방법
    //    1. 함수를 생성
    //    2. 함수의 return 부분에 JSX 작성
    //    3. 함수의 결과(JSX)가 반영되어야 할 위치에 <함수명></함수명>

    // 게시글 상세보기를 컴포넌트로 만들어 봅시다.
    //     => <Detail />  ~~  function Detail(){}
    //
    //  - 컴포넌트 만들 때 주의점
    //    1. 함수 이름을 대문자로 시작하도록  생성
    //    2. return 내부에 JSX가 작성되어야 하며, HTML요소가 평행하게 들어가서는 안된다.
    //    3. 다른 컴포넌트 내부에 만들면 안된다.
    //    4. 컴포넌트 사용시 닫기 태그도 만들어야 한다.
    //        <Detail></Detail> , <Detail />

    //  - 어떤 태그 묶음을 컴포넌트로 만들면 좋은지
    //    1. 반복적으로 출현하는 HTML 덩어리
    //    2. 내용이 자주 변경될거 같은 HTML 덩어리
    //    3. 전혀 다른 내용의 페이지를 구성할 때
    //    4. 협업시 업무 분장할 때

    //  - 컴포넌트의 단점
    //    1. 컴포넌트를 과도하게 사용하면 관리가 어려워진다.
    //    2. 함수간 데이터 공유가 안된다!

    // [미니과제] : 게시글 목록 하나하나(총3개)를 컴포넌트로 바꿔봅시다.
    //               단, state는 공유가 안되므로 글 제목을 직접 작성하는 것으로

    // 동적 UI를 제작해보자
    //   동적 UI? : 유저가 조작하는 대로 형태가 바뀌는 구조의 UI
    //      ex) 모달창, 탭, 서브메뉴...

    //   동적 UI를 만들기 위한 단계
    //     1. 기본 UI 디자인하기 : HTML, CSS
    //     2.  UI의 현재 상태를 state에 저장
    //     3.  state에 따라서 UI가 어떻게 보일지 조건문 작성하기
    //                                   (JSX 내부에는  if 조건을 사용할 수가 없다.)

    //   예제 : 상세 보기 
    //     1. 기본 디자인 하기
    //     2. UI 현재 상태를 state에 저장
    let [datail,setDetail]= useState(0);  // 1이면 표시, 0이면 미표시
    //     3. 조건문 작성하기

    //  [미니 과제1] : 버튼[상세보기]을 클릭하면 상세보기가 화면에 보이도록 코드를 작성하세요.

    //  [미니 과제2] : 버튼[상세보기]을 클릭하면 상세보기가 켜졌다, 꺼졌다 할 수 있는 코드를 작성하세요.

    // 반복을 통한 동적 UI만들기
    //   - JSX내부에는 일반적인 자바스크립트의 반복문을 사용할 수 없기 때문에 배열의 함수를 활용한다.
    //  arr.map()
    // setTimeout(function(){
    //   // [배열의 반복문 연습]
    //   let arr = [2,4,6];
    //   arr.map(function(a){  // 배열의 각각의 요소가 첫번째 파라미터로 전달된다.
    //     console.log(a); 
    //   });
    //   let dArr=arr.map(function(a){  //콜백함수의 반환값에 의해 새로운 배열 형성
    //             return a*2;
    //           });
    //   arr.map(function(a,b){  // 두번째 파라미터는 인덱스값이 전달된다.
    //     console.log(b+" : "+a); //  0:2   1:4   2:6 
    //   });   


    // },5000);

    // [미니과제 ] 각 게시글 목록을 반복을 통해서 출력해보자.(컴포넌트 없이)

    // props  : 컴포넌트간 데이터를 보낼수 있는 방법
    //    1. 컴포넌트를 호출할 때 속성값으로 데이터를 전송
    //    2. 호출받은 컴포넌트는 파라미터로 props 객체를 전달 받는다.
    //    3.  props.속성이름 => 데이터 조회가 가능

    //   컴포넌트에 넘겨주는 속성값의 개수만큼 데이터를 전송할 수 있다.

    //  단점 : 부모컴포넌트에서 자식컴포넌트로만 전송이 가능!!
    //        자식컴포넌트에서 부모컴포넌트로 전송 불가능!!
    //        형제 컴포넌트에게도 전송 불가능!!  
    //  
    //   - 전달된 state는 자식컴포넌트에서 변경 가능!!


    // [미니 과제]  각 게시글 목록에서 제목을 누를 때 마다 게시글의 상세 내용이 하단에 출력되도록 만들어 보세요,.
    let [titleName, setTitleName] = useState('');  // 상세보기의 제목을 저장할 스테이트
    let [titleIndex, setTitleIndex] = useState();  // 상세보기의 제목 인덱스 번호를 저장할 스테이트  
    
    // [미니 과제]  목록에서 각 게시글 마다 좋아요 버튼을 만들고 
    //              각 버튼이 클릭 될때 마다 별개의 카운트가 올라갈 수 있도록 코드를 작성해 봅시다.

    // (12.28)
    // 입력 요소 : HTML 입력 요소를 사용하면 된다.
    let [inputData,setInputData] = useState('');
    // 스테이트 변경 작업은 비동기로 처리가 된다.
    //   비동기로 처리된다.
    //    -> 자바스크립트의 동작방법
    //       [기본] 위에서 아래로 순서대로 (동기방식)
    //       [예외] 백그라운드 동작 => 대기열(큐 Queue) (비동기 방식)

    // [미니 과제] 사용자로 부터 글을 입력받아서 글 목록에 등록해 봅시다.(좋아요 기능도 동작하도록)
//                          => 배열의 마지막에 끼워넣기
 

    // [미니 과제] 게시글 목록마다 삭제버튼을 만들어서 삭제버튼을 누를 때 마다 해당 게시글을 삭제해봅시다.
//                          => 배열내에서 잘라내기


    // 컴포넌트
    //  new => 함수로 컴포넌트를 만드는 방식
    //  old => 클래스로 컴포넌트를 만드는 방식

    // 1. class형 포넌트 생성
    // 2. 생성자 필요
    // 3. render()함수를 이용한 JSX 반환
    // 4. 생성자 내부에 state 생성
    // 5. state데이터 사용 : this.state.프로퍼티명
    // 6. state 데이터 변경 : this.setState({프로퍼티명:바꿀 데이터});
    // 7. 생성자 매개값을 통해서 props 객체 받기
    // 8. props 데이터 사용 : this.props.프로퍼티명


    let now = new Date();
// --------- [리액트 학습 내용 끝] --------------
  return (
    <>
      <div className="App">
        <header className="header">
          <h3>내 {data}</h3>
          {now.toLocaleDateString()}
        </header>

        <button onClick={function aa(){
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

        <button onClick={function(){
          let copyTitle = [...title];  // 1. 배열 복사
          copyTitle.sort();            // 2. 배열 정렬
          setTitle(copyTitle);         // 3. 정렬된 배열을 state에 저장
        }}>
          정렬
        </button>

        <button onClick={function(){
          if(datail == 1){
            setDetail(0);
          }else{
            setDetail(1);
          }
        }}>
          상세보기
        </button>
        <br/>
        <input type='text' onChange={function(e){
          // 입력된 데이터를 자바스크립트 데이터로 읽어오기 위함
          // input태그의 value 파라미터 데이터를 읽어와야 함
          //  e => 이벤트 객체
          // console.log(e.target.value);
          setInputData(e.target.value); 
          console.log(inputData);
        }}/>
        <button type='button' onClick={function(e){
          // 글목록(title)에 작성된 글(inputData) 를 추가
          let copyTitle = [...title];  // 기존 글 목록에 새로운 목록 생성
          //copyTitle.push(inputData);   // 새로운 목록에 새로운 글 추가
          copyTitle.unshift(inputData);  // -> 배열에 가장 앞에서 데이터를 끼워 넣는 메서드(unshfit)
          setTitle(copyTitle);   // 새로운 글이 추가된 목록을 스테이트에 반영

          //  새로 등록된 글에도 좋아요 버튼 생성
          let copyFover = [...fover];
          //copyFover.push(0);
          copyFover.unshift(0);
          setFover(copyFover);

        }}>글 등록</button>

        {/* <div className="list">
          <h4 onClick={function(){
            setDetail(1); // 상세보기 표시
            // 제목-----> Detail컴포넌트에 넘겨주고 싶다!
            //          1. props  (1) 제목 자체, (2) 제목배열+인덱스
            //  2. 선택이 발생한 제목이 무엇인가?

            // (1)
            setTitleName(title[0]);
            //  (2)
            setTitleIndex(0);  // 글 제목이 있는 인덱스만 전송
            

          }}>{title[0]} <span onClick={function(){
                console.log('좋아요!!');
                setFover(fover+1);
          }}>👍</span>{fover}</h4>
          <p>10월 15일</p>
        </div>

        <div className="list">
          <h4 onClick={function(){
            setDetail(1); // 상세보기 표시
            setTitleName(title[1]);
            setTitleIndex(1);
          }}>{title[1]}</h4>
          <p>11월 15일</p>
        </div>

        <div className="list">
          <h4 onClick={function(){
            setDetail(1); // 상세보기 표시
            setTitleName(title[2]);
            setTitleIndex(2);
          }}>{title[2]}</h4>
          <p>12월 15일</p>
        </div> */}

        {/* <div className='detail'>
          <h4>제목</h4>
          <p>날짜</p>
          <p>상세내용</p>
        </div> */}
        {/* <Title1 />
        <Title2 />
        <Title3 /> */}

        {
          title.map(function(t,i){
            return(
              //JSX 출력
              // <div className="list" key={i}>
              //   <h4>{t}</h4>
              //   <p>12월 15일</p>
              // </div>
              <Title1 key={i} title={t} month='12' 
                  index={i} day={15} 
                  setTitle={setTitle} setDetail={setDetail} setTitleIndex={setTitleIndex}
                  setFover={setFover} fover={fover} titleName={title}></Title1>
            );
          }) 
        }
        
        {
          datail == 1? 
            <Detail titleName={titleName} title={title} titleIndex={titleIndex} ></Detail> :
            null
        }
        <Detail2 text={'고길동'}></Detail2>

        
      </div>
    </>
  );
}  // function App(){~~~'}'


function Title1(props){
  
  return(
    <div className="list">
      <h4 onClick={function(){
          props.setDetail(1); // 상세보기 표시
          // setTitleName(title[2]);
          props.setTitleIndex(props.index);
        }}>
        
        {props.titleName[props.index]}

        <span onClick={function(e){
            e.stopPropagation();
            console.log('좋아요!!');
            // props.setFover(props.fover+1);
            let copyFover = [...props.fover];
            copyFover[props.index] +=1;
            props.setFover(copyFover);

          }}>👍</span>
        
        {props.fover[props.index]}
      </h4>

      <p>{props.month}월 {props["day"]}일</p>  
      <button type='button' onClick={()=>{
        // 글삭제 대상 => 글 목록 배열 

        let copyTitle = [...props.titleName];
        let copyFover = [...props.fover];
        //  배열.splice(인덱스번호, 개수) ;  인덱스번호에 해당하는 요소부터 개수만큼 배열에 잘라내기
        copyTitle.splice(props.index,1);
        copyFover.splice(props.index,1);

        props.setTitle(copyTitle);
        props.setFover(copyFover);
        props.setDetail(0);

      }}>글 삭제</button>
    </div>
  );
}

function Title2(){
  return(
    <div className="list">
      <h4>제이쿼리 공부</h4>
      <p>12월 15일</p>
    </div>
  );
}

function Title3(){
  return(
    <div className="list">
      <h4>리액트 공부</h4>
      <p>12월 15일</p>
    </div>
  );
}

function Detail(props){

  return(
    <div className='detail'>
      <h4>{props.title[props.titleIndex]}</h4>
      <p>날짜</p>
      <p>상세내용</p>
    </div>
  );
}

// 클래스형 컴포넌트 (class 예약어)   
//  1.  React.Component를 상속받아서 만든다.   =>  <Detail2></Detail2>
class Detail2 extends React.Component{
  // 2. 반드시 생성자 함수를 만들어야 한다.
  constructor(props){  // 7. props 데이터 받는 방법
    super();
    // 4. state 생성 => 생성자 내부에 this.state에 객체를 넣음으로 state 생성
    this.state = {
      name:'park',
      age:25
    }
  }

  // 3. JSX를 생성해야 한다.
  render(){
    return(
      <div style={{display:'none'}}>
        <h3>클래스형 컴포넌트 예제</h3>
        {/*5. state 사용방법 : this.state.프로퍼티명 */}
        <p>Hello! {this.state.name}</p>
        {/*6. state 변경방법 : this.setState({프로퍼티명:바꿀데이터}) */}
        <button onClick={()=>{
          this.setState({name:'홍길동'});
        }}>이름변경</button>
        {/* 8. props 데이터 사용방법 : this.props.프로퍼티명 */}
        <p>Props 데이터 출력 : {this.props.text}</p>
      </div>
    );
  };

}





// 실행시 error / warning
//    error 치명적 오류 :  실행 안됨!
//    warning : 단순 경고 : 실행은 되지만 뭔가 문제가 있는거 같아!
export default AppBackUp;
