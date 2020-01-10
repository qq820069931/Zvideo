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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    	
    	<div class="list-group row">
							<c:forEach items="${myHistory}"  var="myHistory">
									<a class="list-group-item col-xs-10 col-sm-6 rgba-3 margin-top-03e" href="${path }/video/video.action?vid=${myHistory.vid }">
										<table>
											<tbody>
												<tr>
													<td class="">
														<img src="http://localhost:8082//fileserver/${myHistory.vphoto }" width="150px" height="150px">
													</td>
													<td>
														&nbsp; &nbsp; &nbsp; &nbsp;
													</td>
													<td>
														<h4 class="font-family-a font-weight-900">标题:${myHistory.vname}</h4>
														<span>
 														简介:${myHistory.vcontent}
 													</span>
 													</br></br>
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