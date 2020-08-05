<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전국 TOP3</title>
</head>
<body>

<center>
	<c:forEach items="${list}" var="dto" begin="0" end="0"> <!-- var = dto가 dto랑은 상관없이 그냥 값을 주는 거 아무거나 써도 ㄱㅊ -->
		<h1>1위</h1>
		<h4><table>
			<tr>
				<td>
					아이디 : ${dto.mId}
				</td>
			</tr>
			<tr>
				<td>
					전적 : ${dto.cWin}승 / ${dto.cDraw}무 / ${dto.cLose}패
				</td>
			</tr>
			<tr>
				<td>
					체급 : ${dto.cHeight}cm / ${dto.cWeight}kg
				</td>
			</tr>
			<tr>
				<td>
					나이 : ${dto.cAge}
				</td>
			</tr>
			<tr>
				<td>
					주특기 : ${dto.mSports} <br>
				</td>
			</tr>
		</table></h4>
	</c:forEach> <!-- TSTL for문 -->
	<c:forEach items="${list}" var="dto" begin="1" end="1"> <!-- var = dto가 dto랑은 상관없이 그냥 값을 주는 거 아무거나 써도 ㄱㅊ -->
		<h1>2위</h1>
		<h4><table>
			<tr>
				<td>
					아이디 : ${dto.mId}
				</td>
			</tr>
			<tr>
				<td>
					전적 : ${dto.cWin}승 / ${dto.cDraw}무 / ${dto.cLose}패
				</td>
			</tr>
			<tr>
				<td>
					체급 : ${dto.cHeight}cm / ${dto.cWeight}kg
				</td>
			</tr>
			<tr>
				<td>
					나이 : ${dto.cAge}
				</td>
			</tr>
			<tr>
				<td>
					주특기 : ${dto.mSports} <br>
				</td>
			</tr>
		</table></h4>
	</c:forEach> <!-- TSTL for문 -->
	<c:forEach items="${list}" var="dto" begin="2" end="2"> <!-- var = dto가 dto랑은 상관없이 그냥 값을 주는 거 아무거나 써도 ㄱㅊ -->
		<h1>3위</h1>
		<h4><table>
			<tr>
				<td>
					아이디 : ${dto.mId}
				</td>
			</tr>
			<tr>
				<td>
					전적 : ${dto.cWin}승 / ${dto.cDraw}무 / ${dto.cLose}패
				</td>
			</tr>
			<tr>
				<td>
					체급 : ${dto.cHeight}cm / ${dto.cWeight}kg
				</td>
			</tr>
			<tr>
				<td>
					나이 : ${dto.cAge}
				</td>
			</tr>
			<tr>
				<td>
					주특기 : ${dto.mSports} <br>
				</td>
			</tr>
		</table></h4>
	</c:forEach> <!-- TSTL for문 -->
</center>

	
</body>
</html>