<!-- 레시피 수정 폼 @author seop -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>

<style>
.recipeInsertForm {
	display:flex;
	flex-direction:column;
	margin: 6px;
}
.recipeInsertLabel{
  display: flex;
  flex-direction: column;
  font-weight: bold;
}

</style>
</head>
<body>
	 <div>
	 	<form name="form" method="post" action="app?command=recipe_update" onsubmit="return recipeInsertSubmit()">
	 		<input type="hidden" name="recipeId" value="${recipeVO.id}">
	 		<div class="recipeInsertForm">
	 			<label class="recipeInsertLabel"> 레시피 제목
	 				<input class="recipeInput"type="text" name="title" value="${recipeVO.title}" placeholder="레시피 제목을 입력하세요" />
	 			</label>
	 			
	 			<label class="recipeInsertLabel"> 레시피 소개
	 				<textarea class="recipeInput" name="intro" placeholder="레시피 소개 입력하세요">${recipeVO.intro}</textarea>
	 			</label>
	 			<label class="recipeInsertLabel"> 레시피 분류
	 				 <select class="bikeStyle" name="category">
                        <option>-- 레시피 분류 선택 --</option>
                        <option value="한식" <c:if test="${recipeVO.category == '한식'}"> selected</c:if>>한식</option>
                        <option value="양식" <c:if test="${recipeVO.category == '양식'}"> selected</c:if>>양식</option>
                        <option value="일식" <c:if test="${recipeVO.category == '일식'}"> selected</c:if>>일식</option>
                        <option value="중식" <c:if test="${recipeVO.category == '중식'}"> selected</c:if>>중식</option>
                        <option value="분식" <c:if test="${recipeVO.category == '분식'}"> selected</c:if>>분식</option>
                        <option value="간식" <c:if test="${recipeVO.category == '간식'}"> selected</c:if>>간식</option>
                        <option value="디저트" <c:if test="${recipeVO.category == '디저트'}"> selected</c:if>>디저트</option>
                        
                    </select>
	 			</label>
	 			
	 			<label class="recipeInsertLabel"> 레시피 재료
	 				<input class="recipeInput" type="text" name="ingredients" value="${recipeVO.ingredients}" placeholder="레시피 재료을 입력하세요" />
	 			</label>
	 			
	 			<label class="recipeInsertLabel"> 레시피 설명
	 				<textarea class="recipeInput" name="details" placeholder="레시피를 설명해주세요"><c:out value="${recipeVO.details}"></c:out></textarea>
	 			</label>  
	 			<label class="recipeInsertLabel"> 이미지
	 				<input class="recipeInput" type="text" name="image" value="${recipeVO.image}" placeholder="이미지" />
	 			</label>
	 		</div>
	 		<div>
	 			<button type="submit">수정하기</button>
	 		</div>
	 	</form>
	 </div>
</body>
<script>
	/* submit 유효성 검사 @author seop */
	function recipeInsertSubmit(e) {
		var title = $('input[name=title]').val();
		var intro = $('textarea[name=intro]').val();
		var category = $('select[name=category]').val();
		var ingredients = $('input[name=ingredients]').val();
		var details = $('textarea[name=details]').val();
		var image = $('input[name=image]').val();
		
		if(title == null || title == "") {
			alert('제목을 입력해주세요.');
			$('input[name=title]').focus();
			return false;
		}
		else if(intro == null || intro == ""){
			alert('레시피 소개를 입력해주세요.');
			$('input[name=intro]').focus();
			return false;
		}
		else if(category == null || category == ""){
			alert('레시피 분류 골라주세요.');
			$('input[name=category]').focus();
			return false;
		}
		else if(ingredients == null || ingredients == ""){
			alert('레시피 재료를 입력해주세요.');
			$('input[name=ingredients]').focus();
			return false;
		}
		else if(details == null || details == ""){
			alert('레시피 설명을 입력해주세요.');
			$('input[name=details]').focus();
			return false;
		}
		else if(image == null || image == ""){
			if(confirm('이미지 없이 레시피를 생성할까요?')){
				return true;
			}
			$('input[name=image]').focus();
			return false;
		}
		else{
			if(confirm('레시피를 수정 할까요?')){
				return true;
			}
			return false;
		}
	}

</script>
</html>