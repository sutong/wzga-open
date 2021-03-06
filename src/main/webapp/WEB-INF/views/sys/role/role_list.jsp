<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/includes/taglibs.inc.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=9" ></meta>
<title>角色管理——角色列表</title>
<%@include file="../../include/system_mng_style.jsp" %>

</head>
<body>
<!-- 查询区 开始 -->
<div class="box2">
  <div id="box_topcenter" class="box_topcenter"><div class="box_topleft">
      <div class="box_topright"><div class="title"><span>用户管理</span></div>
      <div class="boxSubTitle"></div><div class="clear"></div></div></div>
  </div>
  <div class="box_middlecenter">
    <div class="box_middleleft"><div class="box_middleright">
      <div class="boxContent" style="overflow: visible;"><div class="padding_top5">
		<form:form name="sysRoleForm" action="${ctx}/sys/role/list${ext }" method="post" commandName="sysRole" onsubmit="showProgressBar();">
		  <table>
			<tr>
			  <td>角色名：</td>
			  <td><form:input path="name" id="name" /></td>
			  <td><button id="btn-1" type="submit"><span class="icon_find">查询</span></button></td>
			</tr>
		  </table>
		</form:form></div>
      </div></div>
    </div>
  </div>
  <div id="box_bottomcenter" class="box_bottomcenter">
    <div class="box_bottomleft"><div class="box_bottomright"></div></div>
  </div>
</div>
<!-- 查询区 结束 -->
<!-- 工具栏 开始 -->
<div class="box_tool_min padding_top5 padding_bottom5">
  <div class="center">
	<div class="left">
	  <div class="right">
		<div class="padding_top5 padding_left10">
		  <a href="${ctx}/sys/role/add"><span class="icon_add">新增</span></a>
		  <div class="box_tool_line"></div>
		  <a href="javascript:modifyItem('${ctx}/sys/role/#id#/update');"><span class="icon_edit">修改</span></a>
		  <div class="box_tool_line"></div>
		  <a href="javascript:removeItem('${ctx}/sys/role/#id#/delete');"><span class="icon_delete">删除</span></a>
		  <div class="clear"></div>
		</div>
	  </div>		
    </div>	
  </div>
  <div class="clear"></div>
</div>     	
<!-- 工具栏 结束 -->
<!-- 列表内容 开始 -->
<div id="scrollContent" style="overflow-x:hidden;">
  <table class="tableStyle">
	<tr>
	  <th class="th" width="4%" colspan=2></th>
	  <th class="th">角色名</th>
	  <th class="th">角色描述</th>
	  <th class="th">创建人</th>
	  <th class="th">创建时间</th>
	  <th class="th">修改人</th>
	  <th class="th">修改时间</th>
	</tr>
	<c:forEach varStatus="status" var="roleTmp" items="${pager.list}">
	  <%-- 判断奇偶行样式 --%>
      <tr <c:if test="${status.count%2 == 0}">class="odd"</c:if> >
        <td width="2%" align="center">${status.count}</td>
		<td width="2%" align="right"><input type="radio" name="ids" value="${roleTmp.id}" /></td>
		<td>${roleTmp.name}</td>
	    <td>${roleTmp.remark}</td>
	    <td>${roleTmp.creator.chineseName}</td>
	    <td><fmt:formatDate value="${roleTmp.createDate}" pattern='yyyy-MM-dd HH:mm:ss' /></td>
		<td>${roleTmp.modifyMan.chineseName }</td>
	    <td><fmt:formatDate value="${roleTmp.modifyDate}" pattern='yyyy-MM-dd HH:mm:ss' /></td>
	  </tr>
  	</c:forEach>
  </table>
</div>
<!-- 列表内容 结束 -->
<!-- 分页 开始 -->
<jsp:include page="/includes/webpager.inc.jsp" />
<!-- 分页 结束 -->

<%@ include file="../../include/system_script.jsp" %>
<jsp:include page="/includes/operate.info.jsp" />

<!--列表页功能start-->
<script type="text/javascript" src="${ctx}/libs/js/libnet/common_list.js"></script>
<!--列表页功能end-->
<!--数字分页start-->
<script type="text/javascript" src="${ctx}/libs/js/nav/pageNumber.js"></script>
<!--数字分页end-->
<script>
var fixObjHeight=145;
function pageReady(){

    $("#select-1").render();
    $("#date-1").render();
    $("#btn-1").render();
    $("#pageContent").render();
}
function customHeightSet(contentHeight){
  $("#scrollContent").height(contentHeight-fixObjHeight);
}
</script>
</body>
</html>
