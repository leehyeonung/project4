<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/resources/css/main.css">
</head>
<body>
<jsp:include page="../layout/header.jsp"></jsp:include>
<div class="main">
	<table class="table table-striped">
			<tr>
				<th>글번호</th>
				<th>제목</th>
				<th>카테고리</th>
				<th>글쓴이</th>
				<th>작성일자</th>
				<th>조회수</th>
			</tr>
						<c:forEach items="${list}" var="board">
				<c:choose>
					    <c:when test="${ses.mem_auth == '0'|| ses.mem_id == board.brd_writer}">
							<tr>
					   		<td>${board.brd_num}</td>			
							<td><a href="/board/detail?brd_num=${board.brd_num}">${board.brd_title}</a></td>				
							<td>${board.brd_category}</td>
					   		<td>${board.brd_writer}</td>
							<td>${board.brd_regdate}</td>
							<td>${board.brd_views}</td>		   		
							</tr>
					    </c:when>
					    <c:otherwise>
						
							<tr>
								<td>${board.brd_num}</td>			
								<td>

									<c:choose>
								 <c:when test="${ses.mem_id eq board.brd_writer}">
							${board.brd_title}
								  </c:when>
								   <c:otherwise>
										${board.brd_title}	
								    </c:otherwise>
								</c:choose>
								</td>				
								<td>${board.brd_category}</td>
								<c:choose>
								    <c:when test="${ses.mem_id eq board.brd_writer}">
								   		<td>${board.brd_writer}</td>
								    </c:when>
								    <c:otherwise>
										<td>******</td>		
								    </c:otherwise>
								</c:choose>
								<td>${board.brd_regdate}</td>
								<td>${board.brd_views}</td>
							</tr>
					    </c:otherwise>    
					</c:choose>
					    </c:forEach>
					
					
			<div>
			<c:if test="${pgh.prev}">
			<a href="/board/list?pageNo=${pgh.startPage-1}&qty=${pgh.pgvo.qty}&type=${pgh.pgvo.type}&keyword=${pgh.pgvo.keyword}">prev</a>
			</c:if>
			<c:forEach begin="${pgh.startPage }" end="${pgh.endPage }" var="i">
				<a href="/board/list?pageNo=${i}&qty=${pgh.pgvo.qty}&type=${pgh.pgvo.type}&keyword=${pgh.pgvo.keyword}">${i} ｜ </a>
			</c:forEach>
			<c:if test="${pgh.next}">
			<a href="/board/list?pageNo=${pgh.endPage+1}&qty=${pgh.pgvo.qty}&type=${pgh.pgvo.type}&keyword=${pgh.pgvo.keyword}">next</a>
			</c:if>
			</div>
	</table>
	<!-- search -->

 <div class="col-sm-12 col-md-6">
	<form action="/board/list" method="get">
		<div class="input-group mb-3">
		<!-- 값을 별도 저장 -->
		<c:set value="${pgh.pgvo.type}" var="typed"/>
  			<select class="form-select" name="type">
    			<option ${typed == null ? 'selected':'' }>항목</option>
    			<option value="t" ${typed eq 't' ? 'selected':'' }>제목</option>
    			<option value="c" ${typed eq 'c' ? 'selected':'' }>내용</option>
    			<option value="w" ${typed eq 'w' ? 'selected':'' }>작성자</option>
  			</select>
  			<input class="form-control" type="text" name="keyword" placeholder="포함해서찾기" value="${pgn.pgvo.keyword }">
  			<input type="hidden" name="pageNo" value="1">
  			<input type="hidden" name="qty" value="${pgh.pgvo.qty }">
  			<button type="submit" class="btn btn-success position-relative">
  			결과
  			<span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
    		${pgh.totalCount}개
    		<span class="visually-hidden">unread messages</span></span>
  			</button>
		</div>
	</form>
	</div>
<a href="/board/register"><button class="btn btn-secondary">1대1문의 작성하기</button></a>
</div>
<jsp:include page="../layout/footer.jsp"></jsp:include>
</body>
</html>