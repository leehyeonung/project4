<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
detail 페이지입니다.
아이디 : ${ses.mem_id}
게시판제목 : ${board.brd_title}

<table border="1">
	<tr>
		<th>번호</th>
		<td>${board.brd_num}</td>
	</tr>
	<tr>
		<th>제목</th>
		<td>${board.brd_title}</td>
	</tr>
	<tr>
		<th>작성자</th>
		<td>${board.brd_writer}</td>
	</tr>
	<tr>
		<th>작성일</th>
		<td>${board.brd_regdate}</td>
	</tr>
	<tr>
		<th>내용</th>
		<td>${board.brd_content}</td>
	</tr>
	<tr>
		<th>조회수</th>
		<td>${board.brd_views}</td>
	</tr>
</table>

<a href="/board/modify?brd_num=${board.brd_num}">수정</a><br>
<a href="/board/remove?brd_num=${board.brd_num}">삭제</a><br>
<a href="/board/list">1대1문의 리스트</a><br>

<c:if test="${ses.mem_auth eq 0}">
<div class="container">
		<div class="input-group my-3">
			<span class="input-group-text" id="cmtWriter">${ses.mem_id }</span>
			<input type="text" class="form-control" id="cmtText" placeholder="Test Add Comment ">
			<button class="btn btn-success" id="cmtPostBtn" type="button">Post</button>
		</div>
		<ul class="list-group list-group-flush" id="cmtListArea">
		  <li class="list-group-item d-flex justify-content-between align-items-start">
		    <div class="ms-2 me-auto">
		      <div class="fw-bold">Writer</div>
		      Content for Comment
		    </div>
		    <span class="badge bg-dark rounded-pill">modAt</span>
		  </li>
		</ul>
	</div>
	
	<script type="text/javascript">
	const bnoVal = '<c:out value="${board.brd_num}" />';
	console.log(bnoVal);
	</script>
	<script type="text/javascript" src="/resources/js/boardComment.js"></script>
	<script type="text/javascript">
	getCommentList(bnoVal);
	</script>
</c:if>


</body>
</html>