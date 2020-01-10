<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
String path = request.getContextPath();
request.setAttribute("path", path);
%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8" />
		<title></title>
		<link rel="stylesheet" href="../css/fxz/css.css" />
		<link href="../publicUtil/bootstrap/css/bootstrap.css" rel="stylesheet">
		<link href="../publicUtil/layui/css/layui.css" rel="stylesheet" media="all">
		<script src="../publicUtil/layui/layui.js"></script>
		
	</head>
  
  <body>
    					
						<div class="list-group row">
							<c:forEach var="vList"   items="${videoList }" end="24" varStatus="xh">
									<a class="list-group-item col-xs-5 col-sm-2 rgba-3 margin-right-1e margin-left-1e margin-top-2e" href="${path }/video/video.action?vid=${vList.vid }">
								<table>
									<tbody>
										<tr>
											<td class="">
												<img src="http://localhost:8082//fileserver/${vList.vphoto }" width="150px" height="200px">
											</td>
										</tr>

										<tr>
											<td>
												<h3 class="font-family-a font-weight-900" style="text-align: center;">${vList.vname }</h3>
											</td>
										</tr>
									</tbody>
								</table>
							</a>
							</c:forEach>
							
							
						</div>
					
  </body>
</html>
