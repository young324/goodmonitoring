<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.goodmonitoring.util.Util"%>		
<%@ include file="../../m/includes/contants.jspf" %>  
<style>
.file-attachment-wrap{
float: left;
width: 100%;
}
.font-blue  a{
	float: right;
}
.box-content .attachment{
	margin-right: 2px;
}
.file-remove{
	margin-right: 25px;
	cursor: pointer;
	color: red;
}
</style>
<c:choose>
	<c:when test="${ actionStatus eq 'view'}"> <!-- 상세보기 -->
	       <c:if test="${not empty attachList }">
	        <div class="box-wrap file-attachment-wrap">			  
			  <div class="box-content">			 	

		  	      		  				    
				<c:forEach items="${attachList}" var="row">							
					
						<c:choose>
							<c:when test="${Util.getFileType(row.FILE_NAME) eq 'I' }">
				<a href="#" onclick="getFileDownload('${row.FILE_PATH }', '${row.FILE_NAME}');return false;"							   		
							      class="attachment font-gray icon-img ">
					      		  <span class="text">${row.FILE_NAME }</span>					      	
					     	  </a>
							</c:when>
							<c:otherwise>
<a href="#" onclick="getFileDownload('${row.FILE_PATH }', '${row.FILE_NAME}');return false;"	 class="attachment font-gray icon-file ">
					      		  <span class="text">${row.FILE_NAME }</span>
					      	
					     	  </a>
							</c:otherwise>
						</c:choose>
					</c:forEach> 	
  			
  			  	<div id="fileDisplay">	
  				</div>							
  											    
			  </div>
			</div>
    	 </c:if>
	
	</c:when>
	
	
	
	
	<c:otherwise>
	        <div class="box-wrap file-attachment-wrap">			  
			  <div class="box-content">
			 
				 
			 <div class="clear">
		      <p class="title font-gray"> <span class="font-blue">
		       &nbsp;<a href="#"  title="첨부 파일 초기화" onclick="attachReset(); return false" ><i class="fa fa-refresh fa-spin fa-2x fa-fw margin-bottom"></i></a>
		      </span></p>
		      <button  class="btn btn-primary pull-right btn-file f-r" type="button" onclick="fileUpload()">파일 불러오기</button>
			  <input multiple="multiple"  type="file"  name="files" id="files" style="display: none;" onchange="fileCheck(this)">
		    </div>
						    
				<c:forEach items="${attachList}" var="row">							
						<c:choose>
							<c:when test="${Util.getFileType(row.FILE_NAME) eq 'I' }">
							   <a href="#" onclick="getFileDownload('${row.FILE_PATH }', '${row.FILE_NAME}');return false;" class="attachment font-gray icon-img ">
					      		  <span class="text">${row.FILE_NAME }</span>
					      		</a>					      		
					      		  <span class="file-remove" onclick="attachDelete('${row.FILE_NO}');return false;"><i class="fa fa-trash"></i></span>				     	 
							</c:when>
							<c:otherwise>
								<a href="#" onclick="getFileDownload('${row.FILE_PATH }', '${row.FILE_NAME}');return false;" class="attachment font-gray icon-file ">
					      		  <span class="text">${row.FILE_NAME }</span>
					      		 </a>  					      		  
					      		 <span class="file-remove" onclick="attachDelete('${row.FILE_NO}');return false;"><i class="fa fa-trash"></i></span>					     	 
							</c:otherwise>
						</c:choose>
					</c:forEach> 	
  				
  				
  				 <div id="fileDisplay">	
  				</div>							
  											    
			  </div>
		</div>
 
	    
	
	</c:otherwise>
</c:choose>   

	    
<script>
var count = '${attachList.size()}';


//파일 업데이트 로드
function fileUpload(){
	$("#files").click();
}

function fileCheck(e){
	var fileLength=$(e)[0].files.length;
	var maxSize=10000000;
	
 	var fielCount =parseInt(count)+parseInt(fileLength);
	
	
	if(fielCount >5){
		alert("첨부 파일은 5까지만 가능합니다.");
		return false;
	} 

	var fileStr="";
	for(var i=0; i< fileLength; i++){
		count++;
	
		fileName=$(e)[0].files[i].name; //파일이름
		size=$(e)[0].files[i].size;
		
		var thumbext = fileName; //파일을 추가한 input 박스의 값

		var fileValue = thumbext.split("\\");
		var fileName = fileValue[fileValue.length-1]; // 파일명
		
		thumbext = thumbext.slice(thumbext.indexOf(".") + 1).toLowerCase(); //파일 확장자를 잘라내고, 비교를 위해 소문자로 만듭니다.
		if(thumbext != "jpg"
		  && thumbext != "jpeg" 
		  && thumbext != "png" 
		  &&  thumbext != "gif"
	      &&  thumbext != "pptx"
	      &&  thumbext != "pdf"
	      &&  thumbext != "docx"   
	      &&  thumbext != "txt"
	      &&  thumbext != "zip" 
		)
		
		{ //확장자를 확인합니다.
			alert('파일은 (jpg,jpeg,png,gif,ppt,pptx,pdf,docx,txt,zip)만 등록 가능합니다.');
		    $(e).val("");
		    $(e).focus();
			return false;
		}
	    
		if(parseInt(size) > parseInt(maxSize)){
	      alert("첨부파일 사이즈는 10M 이내로 등록 가능합니다.");
	      $(e).val("");
	      $(e).focus();
	       return false;
	    }

		if($(e)[0].files[i].type=="image/png"||$(e)[0].files[i].type=="image/jpeg"||$(e)[0].files[i].type=="image/gif"){
			fileStr+="<a href='#' class='attachment font-gray icon-img' onclick='return false;'>";
			fileStr +="<span class='text'>"+fileName+"</span>";			
			fileStr +="</a>";
		}else{
			fileStr+="<a href='#' class='attachment font-gray icon-file' onclick='return false;'>";
			fileStr +="<span class='text'>"+fileName+"</span>";			
			fileStr +="</a>";
		}		
			
	}
	
	$("#fileDisplay").html(fileStr);
		
}


//첨부파일 삭제
function attachDelete(FILE_NO){
	if(confirm("졍말 삭제 하시겠습니까?")){
		
		$.ajax({
			url :"fileDelete",
			data:{
				FILE_NO:FILE_NO
			},			
			dataType:"text",
			type:"post",
			success:function(result){
				if($.trim(result)=="success"){
					location.reload();
				}else{
					console.dir(result);
					alert("삭제할 수 없습니다.");
				}
			},
			error:function(result){
				console.log(result);
			}			
		});	

	}
}



function attachReset(){
	if($("#files").val()!=""){
		if(confirm("첨부 파일을 초기화 하시겠습니까?")){
			$("#files").val("");
			$("#fileDisplay").html("");
			count=0;
		}	
	}else{
		alert("첨부 파일을 업로드해 주세요.");
	}
	
}

function getFileDownload(filePath, fileName){
	
	var fileNameEncode=encodeURI(fileName);
	var filePathEncode=encodeURI(filePath);
	location.href="${HOME}/displayFile?fileName="+filePathEncode+"&orignalName="+fileNameEncode;	
	
	return false;
}
</script>
				    