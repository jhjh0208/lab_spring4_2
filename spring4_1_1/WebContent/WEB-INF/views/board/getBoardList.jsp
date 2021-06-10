<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>    
<%
	StringBuilder path = new StringBuilder(request.getContextPath());
	path.append("/");
	List<Map<String,Object>> boardList = null;
	boardList = (List<Map<String,Object>>)request.getAttribute("boardList");
	int size = 0;
	if(boardList!=null){
		size = boardList.size();
	}
	out.print("size:"+size);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 목록[WEB-INF]</title>
<!-- jEasyUI 시작 -->
<link rel="stylesheet" type="text/css" href="<%=path.toString() %>themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="<%=path.toString() %>themes/icon.css"> 
<!-- jEasyUI JS 시작 -->
<script type="text/javascript" src="<%=path.toString() %>js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path.toString() %>js/jquery.easyui.min.js"></script>   
<script type="text/javascript">
	function boardSel(){
		$('#dg_board').datagrid({
			url:'./jsonGetBoardList.sp4'
			,onLoadSuccess: function(){
				alert("조회 호출 성공");
			}
		});
	}
	function boardIns(){
		
	}
	function boardUpd(){
		
	}
	function boardDel(){
		
	}
</script>
</head>
<body>
<script type="text/javascript">
	$(document).ready(function(){
		$('#dg_board').datagrid({
			columns:[[
				{field:'BM_NO', title:'글번호', width:100,align:'center'},
				{field:'BM_TITLE', title:'제목', width:100,align:'left'},
				{field:'BM_DATE', title:'작성일', width:300,align:'center'},
				{field:'BM_FILE', title:'첨부파일', width:200,align:'center'},
				{field:'BM_HIT', title:'조회수', width:100,align:'center'}				
				
			]]
		});
		  $('#btn_sel').bind('click', function(){
		        //alert('조회');
		        boardSel();
		    });
		});
		  $('#btn_ins').bind('click', function(){
		        //alert('입력');
		        boardIns();
		    });
		});
		  $('#btn_upd').bind('click', function(){
		        //alert('수정');
		        boarUpd();
		    });
		});
		  $('#btn_del').bind('click', function(){
		        //alert('삭제');
		        boardDel();
		    });
	});
</script>
<table class="easyui-datagrid" data-options="title:'게시판',toolbar:'#tb_board'" style="width:1000px;height:350px">
    <thead>  
        <tr>
            <th data-options="width:150">글번호</th>
            <th data-options="width:300">제목</th>
            <th data-options="width:300">작성일</th>
            <th data-options="width:200">첨부파일</th>
            <th data-options="width:150">조회수</th>
        </tr>
    </thead>
    <tbody>
<%
//조회 결과 없는거야?
if(size==0){
%>        
        <tr>
			<th colspan="5">조회결과가 없습니다.</th>        
        </tr>  
<%
}
else{//조회 결과가 있는데...
	for(int i=0; i<size; i++){
       Map<String,Object> rmap = boardList.get(i);
       if(i==size) break;
%>     
        
        <tr>
            <th><%=rmap.get("BM_NO") %></th>
            <th><%=rmap.get("BM_TITLTLE") %></th>
            <th><%=rmap.get("BM_DATE") %></th>
            <th><%=rmap.get("BM_FILE") %></th>
            <th><%=rmap.get("BM_HIT") %></th>
        </tr>
<%
	}/////////////end of for
}/////////////////end of eles
%>        
    </tbody>
</table>
    <div id="tb_board" style="padding:2px 5px;">
        <a id="btn_sle"href="#" class="easyui-linkbutton" iconCls="icon-search" plain="true">조회</a>
        <a id="btn_ins"href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true">입력</a>
        <a id="btn_upd"href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true">수정</a>
        <a id="btn_del"href="#" class="easyui-linkbutton" iconCls="icon-cancel" plain="true">삭제</a>
    </div>   
</body>
</html>