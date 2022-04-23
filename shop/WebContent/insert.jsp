<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ResultSet rs = null;
	PreparedStatement psmt = null;
	try{
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
		String sql  = "select to_char(sysdate, 'YYYY-mm-dd'),lpad(sale_sq.nextval, 4, '0') from dual";
		
		psmt = con.prepareStatement(sql);
		rs = psmt.executeQuery();	
		rs.next();
	}catch(Exception e){
		e.printStackTrace();
	}
	 
%>
<%@ include file="header.jsp"%>
<section id="insert">
	<form action="inser_action.jsp" name="insert_form" method="post" onsubmit="return chk();">
		<table border="1px">
			<tr>
				<td>판매번호(자동발생)</td>
				<td><input type="text" value="<%=rs.getString(2) %>" readonly name="num"></td>
			</tr>		
			<tr>
				<td>판매일자(자동발생)</td>
				<td><input type="text"  readonly name="date"value="<%=rs.getString(1)%>"></td>
			</tr>		
			<tr>
				<td>판매구분</td>
				<td>
					<select name="tf">
						<option value="">선택</option>
						<option value="1">판매</option>
						<option value="2">판매취소</option>
					</select>
				</td>
			</tr>		
			<tr>
				<td>판매점포</td>
				<td>
					<select name="shop">
						<option value="">선택</option>
						<option value="A001">이태원점</option>
						<option value="A002">한남점</option>
						<option value="A003">도원점</option>
						<option value="B001">혜화점</option>
						<option value="C001">방배점</option>
						<option value="D001">사당점</option>
						<option value="D002">흑성점</option>
						<option value="E001">금호점</option>
					</select>
				</td>
			</tr>		
			<tr>
				<td>판매상품</td>
				<td>
					<select name="product">
						<option value="">선택</option>
						<option value="110001">라면</option>
						<option value="110002">빵</option>
						<option value="110003">과자</option>
						<option value="110004">탄산음료</option>
						<option value="110005">삼각김밥</option>
						<option value="110006">초콜릿</option>
						<option value="110007">우유</option>
					</select>
				</td>
			</tr>		
			<tr>
				<td>판매수량</td>
				<td><input type="number" name="cnt"></td>
			</tr>		
			<tr>
				<td>수취구분</td>
				<td>
					<select name="cash">
						<option value="">선택</option>
						<option value="1">현금</option>
						<option value="2">카드</option>
					</select>
				</td>
			</tr>		
			
			<tr >
				<td colspan="2">
					<center>
					<button type="submit">등록</button>
					<button type="button"><a href="select.jsp">조회</a></button>
					</center>
				</td>
			</tr>		
			
		</table>
	</form>
</section>
<%@ include file="footer.jsp"%>