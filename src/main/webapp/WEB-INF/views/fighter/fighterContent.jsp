
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<style>
	#formMatch {
		border: 1px solid black;
		margin-bottom: 3px;
	}
</style>
    
	<h1>선수상세정보</h1>
	
	<img src="../member/${content.cPhotoPath }" alt="photo" width="200" height="200">
	<br>
	 아이디 &emsp; ${content.mId }
	 <br>
	 이름 &emsp; ${content.mName }
	 <br>
	 성별 &emsp; ${content.cSex }
	 <br>
	 나이 &emsp; ${content.cAge }
	 <br>
	 지역 &emsp; ${content.mArea }
	 <br>
	 전적 &emsp; ${content.cWin } / ${content.cDraw } / ${content.cLose }
	 <br>
	 체급 &emsp; ${content.cHeight } / ${content.cWeight } / ${content.cwClass }
	 <br>
	 스포츠종목 &emsp; ${content.mSports }
	 <br>
	 자기소개 &emsp; ${content.mIntro }
	 <br>
				
	<c:forEach items="${GYMLIST }" var="GYMLIST">
	<form action="matching.match" method="post">
	<div id="formMatch">
	 	<input type="hidden" name="gymSeqno" value="${GYMLIST.mSeqno }">
		<input type="hidden" name="rivalId" value="${content.mId }">
		<input type="hidden" name="myId" value="${loginId }"> 
		<div>		
			 체육관 이름 : ${GYMLIST.mName } &emsp;
			 체육관 주소 : ${GYMLIST.gAddress } &emsp;
			 체육관 비용 : ${GYMLIST.gRentalPrice } &emsp;
			<input type="submit" value="스파링 신청하기">
		</div>
		<div>
			체육관 가능한 시간 : <input type="text" value="${GYMLIST.tTimeTable1 }" readonly="readonly" size="3"> ~ 
			<input type="text" value="${GYMLIST.tTimeTable2 }" readonly="readonly" size="3" >			
		</div>
		<div>
			날짜 : <select name="month">
					<option value="01" selected="selected">1</option>
					<option value="02">2</option>
					<option value="03">3</option>
					<option value="04">4</option>
					<option value="05">5</option>
					<option value="06">6</option>
					<option value="07">7</option>
					<option value="08">8</option>
					<option value="09">9</option>
					<option value="10">10</option>
					<option value="11">11</option>
					<option value="12">12</option>
				</select>
				월	
				<select name="day">
					<option value="01" selected="selected">1</option>
					<option value="02">2</option>
					<option value="03">3</option>
					<option value="04">4</option>
					<option value="05">5</option>
					<option value="06">6</option>
					<option value="07">7</option>
					<option value="08">8</option>
					<option value="09">9</option>
					<option value="10">10</option>
					<option value="11">11</option>
					<option value="12">12</option>
					<option value="13">13</option>
					<option value="14">14</option>
					<option value="15">15</option>
					<option value="16">16</option>
					<option value="17">17</option>
					<option value="18">18</option>
					<option value="19">19</option>
					<option value="20">20</option>
					<option value="21">21</option>
					<option value="22">22</option>
					<option value="23">23</option>
					<option value="24">24</option>
					<option value="25">25</option>
					<option value="26">26</option>
					<option value="27">27</option>
					<option value="28">28</option>
					<option value="29">29</option>
					<option value="30">30</option>
					<option value="31">31</option>
				</select>	
				일
				<select name="hour">
					<option value="01" selected="selected">1</option>
					<option value="02">2</option>
					<option value="03">3</option>
					<option value="04">4</option>
					<option value="05">5</option>
					<option value="06">6</option>
					<option value="07">7</option>
					<option value="08">8</option>
					<option value="09">9</option>
					<option value="10">10</option>
					<option value="11">11</option>
					<option value="12">12</option>
					<option value="13">13</option>
					<option value="14">14</option>
					<option value="15">15</option>
					<option value="16">16</option>
					<option value="17">17</option>
					<option value="18">18</option>
					<option value="19">19</option>
					<option value="20">20</option>
					<option value="21">21</option>
					<option value="22">22</option>
					<option value="23">23</option>
					<option value="24">24</option>
				</select>
				시
				<select name="minute">
					<option value="00">0</option>
					<option value="01">1</option>
					<option value="02">2</option>
					<option value="03">3</option>
					<option value="04">4</option>
					<option value="05">5</option>
					<option value="06">6</option>
					<option value="07">7</option>
					<option value="08">8</option>
					<option value="09">9</option>
					<option value="10">10</option>
					<option value="11">11</option>
					<option value="12">12</option>
					<option value="13">13</option>
					<option value="14">14</option>
					<option value="15">15</option>
					<option value="16">16</option>
					<option value="17">17</option>
					<option value="18">18</option>
					<option value="19">19</option>
					<option value="20">20</option>
					<option value="21">21</option>
					<option value="22">22</option>
					<option value="23">23</option>
					<option value="24">24</option>
					<option value="25">25</option>
					<option value="26">26</option>
					<option value="27">27</option>
					<option value="28">28</option>
					<option value="29">29</option>
					<option value="30">30</option>
					<option value="31">31</option>
					<option value="32">32</option>
					<option value="33">33</option>
					<option value="34">34</option>
					<option value="35">35</option>
					<option value="36">36</option>
					<option value="37">37</option>
					<option value="38">38</option>
					<option value="39">39</option>
					<option value="40">40</option>
					<option value="41">41</option>
					<option value="42">42</option>
					<option value="43">43</option>
					<option value="44">44</option>
					<option value="45">45</option>
					<option value="46">46</option>
					<option value="47">47</option>
					<option value="48">48</option>
					<option value="49">49</option>
					<option value="50">50</option>
					<option value="51">51</option>
					<option value="52">52</option>
					<option value="53">53</option>
					<option value="54">54</option>
					<option value="55">55</option>
					<option value="56">56</option>
					<option value="57">57</option>
					<option value="58">58</option>
					<option value="59">59</option>
				</select>
				분
		</div>				
	</div>		
	</form>
	</c:forEach>