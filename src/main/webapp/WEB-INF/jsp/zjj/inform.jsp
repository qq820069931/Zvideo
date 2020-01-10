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
							<c:forEach items="${myInform}"  var="myInform">
									<a class="list-group-item col-xs-10 col-sm-6 rgba-3 margin-top-03e" href="#">
										<table>
											<tbody>
												<tr>
													<td>
														<h4 class="font-family-a font-weight-900">${myInform.icontent}</h4>
														<span>
 														${myInform.itime}
 													</span>
 													</br>
 													
													</td>
													
												</tr>
											</tbody>
										</table>
									</a>
							</c:forEach>
									
								
								</div>
    	
 	</body>
</html>