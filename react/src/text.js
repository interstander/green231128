import { useState } from "react";


function test1(){

    let [a,setA] = 
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

    return(
        <>
            {

            }
            <test2 name={a} ></test2>
        </>
    )

}

function test2(props){

    return(
        <>
            {props.name} 
        </>
    );

}

e