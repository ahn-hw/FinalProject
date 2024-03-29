<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Gamja+Flower&family=Jua&family=Noto+Serif+KR&display=swap">
<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<script src="https://kit.fontawesome.com/4f8084f592.js" crossorigin="anonymous"></script>
<title>Insert title here</title>
<style type="text/css">
div.all {
background-color: #f8f8f8;
}

input[type=text], select {
  width: 300px;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border-top:none;
  border-left:none;
  border-right:none;
  border-bottom: 2px solid gray;
  border-radius: 4px;
  box-sizing: border-box;
}

input[type=submit] {
  width: 100%;
  background-color: #4CAF50;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

input[type=submit]:hover {
  background-color: #45a049;
}

 .test_obj input[type="radio"] {
        display: none;
    }
 
    .test_obj input[type="radio"] + span {
        display: inline-block;
        padding: 15px 10px;
        border: 1px solid #dfdfdf;
        background-color: #ffffff;
        text-align: center;
        cursor: pointer;
        width: 100px;
    }
 
     .test_obj input[type="radio"]:checked + span {
        background-color: blue;
        color: #ffffff;
    }  
    
div.box{

margin: 10px 400px;
margin-bottom:10px;
padding: 50px;
border-radius: 20px;
background-color: white;
}

div.box1{

margin: 100px 400px;
margin-bottom:10px;
padding: 50px;
border-radius: 20px;
background-color: white;
border: none;
}

body * { font-family: 'Spoqa Han Sans Neo', 'sans-serif'; }

div.jiwon{

   margin-left: 400px;
   margin-top: 100px;
   font-size: 50px;

}

 input[type=checkbox], input[type=radio] {
     accent-color: blue;
    
    width: 20px;
    height: 20px;
    border: 1px;
}

#showimg{
  position: relative;
  border: 1px solid gray;
  left: 160px;
  width: 200px;
  height: 160px;
}

#myform fieldset{
    display: inline-block; /* 하위 별점 이미지들이 있는 영역만 자리를 차지함.*/
    border: 0; /* 필드셋 테두리 제거 */
}
#myform input[type=radio]{
    display: none; /* 라디오박스 감춤 */
}
#myform label{
    font-size: 3em; /* 이모지 크기 */
    color: transparent; /* 기존 이모지 컬러 제거 */
    text-shadow: 0 0 0 #f0f0f0; /* 새 이모지 색상 부여 */
}
#myform label:hover{
    text-shadow: 0 0 0 #a00; /* 마우스 호버 */
}
#myform label:hover ~ label{
    text-shadow: 0 0 0 #a00; /* 마우스 호버 뒤에오는 이모지들 */
}
#myform fieldset{
    display: inline-block; /* 하위 별점 이미지들이 있는 영역만 자리를 차지함.*/
    direction: rtl; /* 이모지 순서 반전 */
    border: 0; /* 필드셋 테두리 제거 */
}
#myform fieldset legend{
    text-align: left;
}
#myform input[type=radio]:checked ~ label{
    text-shadow: 0 0 0 #a00; /* 마우스 클릭 체크 */
}

</style>
<script type="text/javascript">

//사진 불러오면 이미지 미리보기
function readURL(input) {
	  if (input.files && input.files[0]) {
	    var reader = new FileReader();
	    reader.onload = function(e) {
	      document.getElementById('showimg').src = e.target.result;
	    };
	    reader.readAsDataURL(input.files[0]);
	  } else {
	    document.getElementById('showimg').src = "";
	  }
}

$(function(){
	
	$("input[name='res_visit']").change(function(){
		var res_visit = $("input[name='res_visit']:checked").val();
		
		if(res_visit=="일반 방문"){
			$("div.norm").show();
			$("div.rout").hide();
		}else{
			$("div.norm").hide();
			$("div.rout").show();
		}
	});

});
</script>
</head>
<body>
<form action="/review/insert" method="post" enctype="multipart/form-data">

<!-- 로그인한 id에 따른 mem_num, ani_num 숨기기 -->
<input type="hidden" name="mem_num" value="${mem_num }">
<input type="hidden" name="ani_num" value="${ani_num }">


  <div class="jiwon" style="border: none;">
  <b>후기 작성하기</b>
  </div>

<div class="all" style="border: none;">

 <div class="box1">
	<fieldset>
	<legend style="font-size: 30px;">예약 정보</legend><br><br>
		<label for="name"><b style="font-size: 20px;">어디로 방문했나요?</b> &nbsp;<span style="color: red; font-size: 25px;">*</span></label><br>
			 <input type="text" name="mem_addr" value="${mem_addr }" class="form-control" required="required"><br><br>
					 
		<input type="radio" name="res_visit" value="일반 방문">&nbsp;&nbsp;일반 방문&nbsp;&nbsp;
		<input type="radio" name="res_visit" value="정기 방문">&nbsp;&nbsp;정기 방문&nbsp;&nbsp;<br><br>
			 
		<!-- 일반 방문 -->
		<div class="norm">
		<label for="name"><b style="font-size: 20px;">방문 날짜</b> &nbsp;<span style="color: red; font-size: 25px;">*</span></label><br><br>	
		<input type="date" name="res_norm_date" class="form-control"><br><br>
		</div>
		
		<!-- 정기 방문 -->
		<div class="rout">
		<label for="name"><b style="font-size: 20px;">방문 요일</b> &nbsp;<span style="color: red; font-size: 25px;">*</span></label><br><br>
		<input type="checkbox" name="res_rout_date" value="월"> 월&nbsp;&nbsp;
		<input type="checkbox" name="res_rout_date" value="화"> 화&nbsp;&nbsp;
		<input type="checkbox" name="res_rout_date" value="수"> 수&nbsp;&nbsp;
		<input type="checkbox" name="res_rout_date" value="목"> 목&nbsp;&nbsp;
		<input type="checkbox" name="res_rout_date" value="금"> 금&nbsp;&nbsp;
		<input type="checkbox" name="res_rout_date" value="토"> 토&nbsp;&nbsp;
		<input type="checkbox" name="res_rout_date" value="일"> 일&nbsp;&nbsp;<br><br><br>
		
		<label for="name"><b style="font-size: 20px;">시작 날짜</b> &nbsp;<span style="color: red; font-size: 25px;">*</span></label><br><br>
		<input type="date" name="res_rout_start" class="form-control"><br><br>
		</div>
		
		<label for="name"><b style="font-size: 20px;">방문 시간</b> &nbsp;<span style="color: red; font-size: 25px;">*</span></label><br><br>
	    <select name="res_time">
	      <option value="8:00">8:00
	      <option value="9:00">9:00
	      <option value="10:00">10:00
	      <option value="11:00">11:00
	      <option value="12:00">12:00
	      <option value="13:00">13:00
	      <option value="14:00">14:00
	      <option value="15:00">15:00
	      <option value="16:00">16:00
	      <option value="17:00">17:00
	      <option value="18:00">18:00
	      <option value="19:00">19:00
	      <option value="20:00">20:00
	      <option value="21:00">21:00
	    </select>
	    <br><br>
	    
		</fieldset>		
 </div>
 
 <div class="box">
	<fieldset>
	<legend style="font-size: 30px;">반려동물 정보</legend><br><br>
	 
	  <div>
	      <label for="name" style="width: 150px;">
	      <b style="font-size: 20px;">사진</b> &nbsp;<span style="color: red; font-size: 25px;">*</span>&nbsp;&nbsp;
	      <img src="../photo/${ani_photo }" id="showimg">
		  </label>
	  </div><br>
	  
		<label for="name"><b style="font-size: 20px;">이름</b> &nbsp;<span style="color: red; font-size: 25px;">*</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			 &emsp;&emsp;&emsp;&emsp;&emsp;
			 <input type="text" value="${ani_name }" class="form-control" readonly="readonly"></label><br><br>	
					
        <label class="test_obj"><b style="font-size: 20px;">성별</b> &nbsp;<span style="color: red; font-size: 25px;">*</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &emsp;&emsp;&emsp;&emsp;&emsp; 
             <input type="text" value="${ani_gender }" class="form-control" readonly="readonly"></label><br><br> 
	   
	    <label class="test_obj"><b style="font-size: 20px;">종류</b> &nbsp;<span style="color: red; font-size: 25px;">*</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &emsp;&emsp;&emsp;&emsp;&emsp; 
             <input type="text" value="${ani_type }" class="form-control" readonly="readonly"></label><br><br> 
	   	    
		</fieldset>
 </div>

	<div class="box">
 	<fieldset>
	<legend style="font-size: 30px;">이용 후기 작성</legend><br><br>
    <label for="name"><b style="font-size: 20px;">사진</b> &nbsp;<span style="color: red; font-size: 25px;">*</span></label><br>
			<br>  <input type="file" class="form-control" name="upload" style="width: 800px;"> 
			<br>
			
	<label for="name"><b style="font-size: 20px;">별점</b> &nbsp;<span style="color: red; font-size: 25px;">*</span></label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		 &emsp;&emsp;&emsp;&emsp;&emsp; 	
	<form name="myform" id="myform">
    <fieldset>
        <input type="radio" name="rev_star" value="5" id="rate1"><label for="rate1">⭐</label>
        <input type="radio" name="rev_star" value="4" id="rate2"><label for="rate2">⭐</label>
        <input type="radio" name="rev_star" value="3" id="rate3"><label for="rate3">⭐</label>
        <input type="radio" name="rev_star" value="2" id="rate4"><label for="rate4">⭐</label>
        <input type="radio" name="rev_star" value="1" id="rate5"><label for="rate5">⭐</label>
    </fieldset>
	</form>
		
		<label for="name"><b style="font-size: 20px;">상세 후기 작성</b> &nbsp;<span style="color: red; font-size: 25px;">*</span> </label><br><br>		
		<textarea style="width: 800px; height:100px;" placeholder="이곳에 직접 입력해주세요" name="rev_content" class="form-control" required="required"></textarea>
	
	</fieldset>
	</div><br>
		
	 <button type="submit" class="btn btn-primary" style="margin-left: 570px; width: 300px; height: 80px; font-size: 25px;">후기 작성 완료</button>
 	</div>	

   
  
  
</form>
</body>
</html>