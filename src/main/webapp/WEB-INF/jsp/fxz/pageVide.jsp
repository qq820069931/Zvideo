<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
 
								<div class="list-group row">
								
								<c:forEach items="${videC}"  var="videC">
									<a class="list-group-item col-xs-10 col-sm-6 rgba-3 margin-top-03e" href="${path }/video/video.action?vid=${videC.vid }">
										<table>
											<tbody>
												<tr>
													<td class="">
														<img src="http://localhost:8082//fileserver/${videC.vphoto}" width="150px" height="150px">
													</td>
													<td>
														&nbsp &nbsp &nbsp &nbsp
													</td>
													<td>
														<h4 class="font-family-a font-weight-900">标题:${videC.vname}</h4>
														<span>
 														简介:${videC.vcontent}
 													</span>
 													</br></br>
 													<span>作者:${videC.use.unname}</span>
													</td>
													
													
													<td>
													
													</td>
												</tr>
											</tbody>
										</table>
									</a>
							</c:forEach>
									
								
								</div>
							
  
  
  
</body>
</html>