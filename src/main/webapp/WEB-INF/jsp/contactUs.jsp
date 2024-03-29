<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<jsp:include page="/WEB-INF/includes/header.jsp">
	<jsp:param value="El Pudu" name="title"/>
</jsp:include>


<script type="text/javascript">
$(function() {
	$('body').addClass('pudu-products');
});

function send(formId) {
	$('#' + formId).submit();
}
function closeDialog() {
	$('#success-msg').dialog('close');
}
</script>


<%
	String messageKey = (String)request.getAttribute("messageKey");
	String disableForm = request.getAttribute("disableForm") != null ? 
			(String)request.getAttribute("disableForm") : "false";
%>

<c:if test="<%= messageKey != null %>">
<script type="text/javascript">
$(function() {
	$('#success-msg').dialog({ 
		title: '<spring:message code="thank.you" />',
		resizable: false,
		width: 300,
		dialogClass: 'success-msg'
	 });
});
</script>
</c:if>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td class="contenido" align="center" valign="middle">&nbsp;</td>
	</tr>
	<tr>
    	<td class="contenido" valign="middle" align="center">
		<table border="0" cellspacing="0" cellpadding="0" align="center" class="tablaContenidoContacto"
			id="contact_us_container">
			<tr>

				<td class="SeccionesMenu">
				<jsp:include page="/WEB-INF/includes/menu-lateral.jsp">
					<jsp:param value="contactUs.html" name="pageFrom" />
				</jsp:include></td>


				<td class="SeccionesContenido">
				
				<c:if test="<%= messageKey != null %>">
					<div class="inner-title" id="success-msg" style="display: none;">
						<div class="right link-container">
							<a href="#" class="Sector2Link" onclick="closeDialog()">x</a>
						</div>
						<div class="msg">
							<div class="TextoRersaltado"><spring:message code="thank.you" /></div>
							<spring:message code="<%= messageKey %>" />
						</div>
					</div>
				</c:if>

				<table height="24" border="0" cellpadding="0" cellspacing="0"
					class="contenidoTexto">
					<tr>
						<td class="contenidoTextoTitular">
						<table width="100%" border="0" cellspacing="0" cellpadding="0"
							class="tablaTitulo">
							<tr>
								<td class="titular"><spring:message code="contact" /></td>
							</tr>
						</table>
						</td>
						<td class="contenidoTextoInterno">
						
						<form:form method="post" action="sendMail.html"
							modelAttribute="contact" id="sendMail_form">
						
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td class="contenidoTextoInternoContacto">
										<spring:message code="name.and.lastname" />
									</td>
								</tr>
								<tr>
									<td>
										<form:input path="name" cssClass="form left" disabled="<%= disableForm %>"/>
										<div class="required left"><br/></div>
										<form:errors path="name" cssClass="errors left" element="div" />
									</td>
								</tr>
								<tr>
									<td class="contenidoTextoInternoContacto">
										<spring:message code="phone.number" />
									</td>
								</tr>
								<tr>
									<td>
										<form:input path="phoneNumber" cssClass="form left" disabled="<%= disableForm %>"/>
										<form:errors path="phoneNumber" cssClass="errors" element="div"/>
									</td>
								</tr>
								<tr>
									<td class="contenidoTextoInternoContacto">
										<spring:message code="email" />
									</td>
								</tr>
								<tr>
									<td>
										<form:input path="email" cssClass="form left" disabled="<%= disableForm %>"/>
										<div class="required left"><br/></div>
										<form:errors path="email" cssClass="errors left" element="div" />
									</td>
								</tr>
								<tr>
									<td class="contenidoTextoInternoContacto">
										<spring:message code="address.zip.code.city.country" />
									</td>
								</tr>
								<tr>
									<td>
										<form:input path="address" cssClass="form left" disabled="<%= disableForm %>"/>
										<form:errors path="address" cssClass="errors" element="div" />
									</td>
								</tr>
								<tr>
									<td class="contenidoTextoInternoContacto">
										<spring:message code="my.order.comments" />
									</td>
								</tr>
								<tr>
									<td>
										<form:textarea path="comment" cssClass="textarea left" 
											disabled="<%= disableForm %>" rows="6"/>
										<div class="required left"><br/></div>
										<form:errors path="comment" cssClass="errors left" element="div" />
									</td>
								</tr>
								<tr>
									<td class="contenidoTextoInternoContacto" align="right">
									<c:if test="<%= !Boolean.parseBoolean(disableForm) %>">
										<div class="right enviarLink-container">
											<a href="#" onclick="send('sendMail_form')" class="enviarLink">
												<spring:message code="send" />
											</a>
											<span class="TextoRersaltado">&gt;</span>
										</div>
									</c:if>
									</td>
								</tr>
								
								<tr style="display: none;">
									<td class="contenidoTextoInterno">
										<div class="required left"><br/></div>
										<div class="left" style="padding-top: 3px;">
											<spring:message code="required" />
										</div>
									</td>
								</tr>
								
								<tr style="display: none;">
									<td>&nbsp;</td>
								</tr>
								<tr>
									<td class="contenidoTextoInternoContacto" id="disclaimer">
									<span class="TextoRersaltado"><spring:message code="address" />
									</span> 
									Av Coronel Diaz 1953 <br />
									Capital Federal - Buenos Aires - Argentina<br />
									<span class="TextoRersaltado"><spring:message code="phone.number" /></span> 
										005491140496157<br/>
									<span class="TextoRersaltado"><spring:message code="my.order" /></span> 
										pedido@elpudu.com
									</td>
								</tr>
								<tr>
									<td>&nbsp;</td>
								</tr>
								<tr>
									<td class="redes">
										<div class="fotografia left">
											<spring:message code="follow.us.on" />
										</div>
										
										<a href="http://twitter.com/#!/bennylennar" target="_blank" class="twitter">
											<img alt='twitter' src='<c:url value="/image/btntwitter.png"/>' 
												border='0' width="24" height="31" />
										</a>
										
										<a href="http://www.facebook.com/pages/Pudú/207180832681242?sk=page_getting_started" 
											target="_blank" class="facebook">
											<img alt='facebook' src='<c:url value="/image/btnfacebook.png"/>' 
												border='0' width="28" height="31" />
										</a>
										
										<div class="fotografia right">
											<spring:message code="photography" />
											<a href="http://www.makiasiburu.com.ar" target="_blank">maría siburu</a>
										</div>
									</td>
							</table>
							
						</form:form>

						</td>
					</tr>
				</table>


				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>

<jsp:include page="/WEB-INF/includes/footer.jsp" />
