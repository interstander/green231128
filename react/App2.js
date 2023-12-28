/* eslint-disable */
import './App.css';
import React, { useState } from 'react';

//   App2 : 주석과 안쓰는 코드를 최대한 배제한 완성본
// 적용 방법
//  1) index.js의 root.render 함수 부분의 내용을 아래와 같이 바꾼다.
//    <App2 />
//  2) index.js의  최상단 import App from './App.js' 이부분을 아래와 같이 바꾼다.
//    import App2 from './App2.js';

function App2() {
    let [data,alt] = useState('데이터');
    let [title,setTitle] = useState(['자바스크립트 공부','제이쿼리 공부','리액트 공부']);

    function change(){  // 외부함수
        console.log('제목 변경1');
    }

    let [fover,setFover] = useState([0,0,0]);
    let [datail,setDetail]= useState(0);  
    let [titleName, setTitleName] = useState('');  
    let [titleIndex, setTitleIndex] = useState();  
    let [inputData,setInputData] = useState('');


  return (
    <>
      <div className="App">
        <header className="header">
          <h3>내 {data}</h3>
        </header>

        <button onClick={function aa(){
          let copyTitle = [...title]; 
          copyTitle[0] = '자바 공부';
          setTitle(copyTitle);
        }}>수정</button>

        <button onClick={function(){
          let copyTitle = [...title];  
          copyTitle.sort();           
          setTitle(copyTitle);         
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
          setInputData(e.target.value); 
          console.log(inputData);
        }}/>

        {
          title.map(function(t,i){
            return(
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
          props.setDetail(1);
          props.setTitleIndex(props.index);
        }}>
        
        {props.titleName[props.index]}

        <span onClick={function(e){
            e.stopPropagation();
            console.log('좋아요!!');
            let copyFover = [...props.fover];
            copyFover[props.index] +=1;
            props.setFover(copyFover);

          }}>👍</span>
        
        {props.fover[props.index]}
      </h4>

      <p>{props.month}월 {props["day"]}일</p>  
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

class Detail2 extends React.Component{
  constructor(props){
    super();
    this.state = {
      name:'park',
      age:25
    }
  }

  render(){
    return(
      <div>
        <h3>클래스형 컴포넌트 예제</h3>
        <p>Hello! {this.state.name}</p>
         <button onClick={()=>{
          this.setState({name:'홍길동'});
        }}>이름변경</button>
        <p>Props 데이터 출력 : {this.props.text}</p>
      </div>
    );
  };

}

export default App2;
