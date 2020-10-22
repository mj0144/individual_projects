/**
 * 
 */
function checkImageType(fileName){
	var pattern = /jpg|gif|png|jpeg/i;
	return fileName.match(pattern);
}

function getFileInfo(fullName){
	//fileName : 경로,UUID값이 제외된 파일의 이름
	//imgsrc : 화면상에 보여주는 썸네일 또는 파일 이미지의 경로
	//getLink : 화면에서 원본파일을 볼수 있는 링크를 위한 변수
	var fileName, imgsrc, getLink;
	
	var fileLink;
	
	
	//이미지일 때
	if(checkImageType(fullName)){
		imgsrc = "displayFile?fileName=" + fullName;
		fileLink = fullName.substr(14);
		
		//'년/월/일'경로 추출.
		var front = fullName.substr(0,12);
		
		//파일이름 앞에 썸네일을 의미하는 's_'을 제거. 
		var end = fullName.substr(14);
		
		getLink = "/displayFile?fileName="+front + end;
		
	}else{ //이지지가 아닐 때
		imgsrc="resource/img/defaultImg/file.png";
		fileLink = fullName.substr(12);
		getLink = "displayFile?fileName=" + fullName;
	}
	
	fileName=fileLink.substr(fileLink.indexOf("_")+1);
	
	//javascript객체로 생성해서 반환.
	return {fileName:fileName, imgsrc:imsrc, getLink:getLink, fullName:fullName};
}