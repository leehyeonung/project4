<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="/board/register" method="post">
제목:<input type="text" name="brd_title" ><br>
작성자:<input type="text" name="brd_writer" value="${ses.mem_id}" readonly><br>
내용:<textarea rows="3" cols="30" name="brd_content"></textarea><br>
카테고리:	<select name="brd_category">
    			<option>카테고리</option>
    			<option>질문</option>
    			<option>자유</option>
    			<option>테스트</option>
  			</select>
  			

<div name="brd_mem_num" value="${ses.mem_num}" hidden></div>

<button type="submit">작성하기</button>
</body>
</html>