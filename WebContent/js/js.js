function invailCheck(){
	if(document.getElementById("id").value==0){
		alert("교과목 코드를 입력해주세요");
		document.getElementById("id").focus();
		return false;
	}
	if(document.getElementById("name").value==0){
		alert("과목명을 입력해주세요");
		document.getElementById("name").focus();
		return false;
	}
	if(document.getElementById("lecturer").value==0){
		alert("담당강사를 입력해주세요");
		document.getElementById("lecturer").focus();
		return false;
	}
	if(document.getElementById("credit").value==0){
		alert("학점을 입력해주세요");
		document.getElementById("credit").focus();
		return false;
	}
	if(document.getElementById("start_hour").value==0){
		alert("시작시간을 입력해주세요");
		document.getElementById("start_hour").focus();
		return false;
	}
	if(document.getElementById("end_hour").value==0){
		alert("종료시간을 입력해주세요");
		document.getElementById("end_hour").focus();
		return false;
	}
	return true;
}

function insert(){
	if(invailCheck()){
		alert("교과목 추가가 완료되었습니다.");
		document.getElementById("join").submit();
	}
}

function updateList(){
	if(invailCheck()){
		alert("수정이 완료되었습니다.");
		document.getElementById("update").submit();
	}
}