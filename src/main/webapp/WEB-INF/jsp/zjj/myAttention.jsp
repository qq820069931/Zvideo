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
								
								<c:forEach items="${myAttention}"  var="myAttention">
									<a class="list-group-item col-xs-10 col-sm-6 rgba-3 margin-top-03e" href="${path }/common/othervideo.action?vid=${myAttention.vid }">
										<table>
											<tbody>
												<tr>
													<td class="">
														<img src="../img/touxiang.jpg" width="150px" height="150px">
													</td>
													
													<td>
														<h4 class="font-family-a font-weight-900">${myAttention.unname}</h4>
														<span>
 														${myAttention.usatement}
 													</span>
 													</br></br>
 													<span>${myAttention.uemail}</span>
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