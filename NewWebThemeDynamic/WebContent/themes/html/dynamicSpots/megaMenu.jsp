<%@ page session="false" buffer="none" %> 
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="../includePortalTaglibs.jspf" %>
<%@ taglib uri="../../../WEB-INF/tld/wcm.tld" prefix="wcm" %>

<%@ page import="java.util.*,javax.servlet.jsp.JspWriter,java.io.*, java.net.*"%>

<c:set var="primeNavigation" value="${ccConfig['cc.primeNavigation']}" />
<c:set var="selectedNodeID" value="${wp.identification[wp.selectionModel.selected]}" />
<c:set var="childrenAvailable" value="false"/>
<c:set var="step" value="0"/>
<wcm:initworkspace user="<%= request.getUserPrincipal() %>"></wcm:initworkspace>
<wcm:setExplicitContext path="/Canon_NewWeb_Design/DefaultPages/Content"></wcm:setExplicitContext>
<wcm:libraryComponent name="HTML - MegaNav" library="Canon_NewWeb_Design"></wcm:libraryComponent>	

      
