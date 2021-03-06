<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/includes/taglibs.inc.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>系统管理——日志列表</title>
    <%@include file="../../include/system_mng_style.jsp" %>

</head>
<body>
<!-- 查询区 开始 -->
<div id="queryBox" class="box2">
  <div id="box_topcenter" class="box_topcenter"><div class="box_topleft">
      <div class="box_topright"><div class="title"><span>系统日志列表</span></div>
      <div class="boxSubTitle"></div><div class="clear"></div></div></div>
  </div>
  <div class="box_middlecenter">
    <div class="box_middleleft"><div class="box_middleright">
      <div class="boxContent" style="overflow: visible;"><div class="padding_top5">
		<form:form name="sysLogForm" action="${ctx}/sys/log/list" method="post" commandName="sysLog" onsubmit="showProgressBar();">
		  <input type="hidden" value="1" name="pageNo" id="pageNo" />
		  <input type="hidden" value="${pager.pageSize}" name="pageSize" id="pageSize" />
		  <table id="sysLogTable" >
			<tr>
			  <td>用户名：</td>
			  <td><form:input path="name" style="width:150px;" /></td>
			  <td>身份证：</td>
			  <td><form:input path="identifyCode"  style="width:150px;"/></td>
			  <td>IP：</td>
			  <td><form:input path="ip" /></td>
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
<!-- 列表内容 开始 -->
<div id="scrollContent"   style="overflow-x:hidden;" class="margin_top5">
  <table id="listTable" class="tableStyle">
	<tr>
	  <th class="th" width="4%"></th>
	  <th class="th">用户名</th>
	  <th class="th">身份证</th>
      <th class="th">单位</th>
	  <th class="th">IP</th>
	  <th class="th">操作模块</th>
	  <th class="th">操作内容</th>
	  <th class="th">操作时间</th>
	</tr>
	<c:forEach varStatus="status" var="sysLogTmp" items="${pager.list}">
	  <%-- 判断奇偶行样式 --%>
      <tr <c:if test="${status.count%2 == 0}">class="odd"</c:if> >
        <td width="2%" align="center">${status.count}</td>
		<td>${sysLogTmp.name}</td>
	    <td>${sysLogTmp.identifyCode}</td>
        <td>${sysLogTmp.createUnit}</td>
	    <td>${sysLogTmp.ip }</td>
	    <td>${sysLogTmp.operateModule}</td>
	    <td class="textSliceTD">
	      <span class="textSlice" title="${sysLogTmp.operateContent }" style="width: 250px;">${sysLogTmp.operateContent }</span>
		</td>
	    <td><fmt:formatDate value="${sysLogTmp.operateDate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
	  </tr>
  	</c:forEach>
  </table>
</div>
<!-- 列表内容 结束 -->
<!-- 分页 开始 -->
<jsp:include page="/includes/webpager.inc.jsp" />
<!-- 分页 结束 -->


    <%@ include file="../../include/system_script.jsp" %>

    <!--数字分页start-->
    <script type="text/javascript" src="${ctx}/libs/js/nav/pageNumber.js"></script>
    <!--数字分页end-->
    <!--列表页功能start-->
    <script type="text/javascript" src="${ctx}/libs/js/libnet/common_list.js"></script>
    <!--列表页功能end-->
    <script type="text/javascript">
        var fixObjHeight=113;

        // qui entry
        function pageReady(){
            jQuery.renderPageComponent([
                "#queryBox",
                "#sysLogTable",
                "#sysLogTable td input[type='text']",
                "#btn-1",
                "#listTable",
                "#listTable tr td[class='textSliceTD'] span[class='textSlice']",
                "#pageContent"
            ]);

        }

        function customHeightSet(contentHeight){
            $("#scrollContent").height(contentHeight-fixObjHeight);
        }
    </script>
</body>
</html>
