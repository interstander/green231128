/* eslint-disable */
import './App.css';
import React, { useState } from 'react';

function App3(){
    let [boardList,setBoardList] = 
    useState([{
        boardNo:1,
        title:"첫번째 글",
        writer:"홍길동",
        content:"안녕 반가워!"
    },{
        boardNo:2,
        title:"두번째 글",
        writer:"김길동",
        content:"오래간만!"
    },{
        boardNo:3,
        title:"세번째 글",
        writer:"홍길동",
        content:"안녕 또왔어!"
    }]);
    let [writeForm, setWriteForm] = useState(false);
    return(
        <div>
            <h3>게시판</h3>
            <button onClick={(e)=>{
                setWriteForm(true);
            }}>글 작성하기</button>
    {
        writeForm ? <WriteForm boardList={boardList} setBoardList={setBoardList} 
            setWriteForm={setWriteForm}/> : null
    }
           
            <table border='1'>
                <thead>
                    <tr>
                        <th>글번호</th>
                        <th>글 제목</th>
                        <th>작성일</th>
                    </tr>
                </thead>
                <tbody>
                    {
                        boardList.map(function(b,i){
                            return(
                                <BoardList key={i} board={b}/>
                            )

                        })
                    }
                </tbody>
            </table>
        </div>
    );
}

function WriteForm(props){
    return(
        <form id="register">
            <label>작성자 : <input type='text' id='writer'/> </label><br/>
            <label>글제목 : <input type='text'  id='title'/> </label><br/>
            <label>글내용 : <textarea id='content'></textarea> </label><br/>
            <button type='button' onClick={()=>{
                let writer = document.getElementById('writer').value;
                let title = document.getElementById('title').value;
                let content = document.getElementById('content').value;
                let boardNo = props.boardList.length+1;
                console.log('배열 길이 : '+boardNo);

                let copyboardList = 
                    [...props.boardList,{'boardNo':boardNo,'writer':writer,'title':title,'content':content}];
                props.setBoardList(copyboardList);

                document.getElementById('register').reset();
                props.setWriteForm(false);
            }}>글 등록</button>
            <button type='button' onClick={()=>{
                props.setWriteForm(false);
            }}>취소</button>
        </form>
    );
}

function BoardList(props){
    return(
        <tr>
            <td>{props.board.boardNo}</td>
            <td>{props.board.title}</td>
            <td>{props.board.writer}</td>
        </tr>
    );
}

function Detail(){
    return(
        <></>
    );
}

export default App3;