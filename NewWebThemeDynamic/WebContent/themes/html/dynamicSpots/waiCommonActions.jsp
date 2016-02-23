<%@ page session="false" buffer="none" %> 
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/WEB-INF/tld/portal-internal.tld" prefix="portal-internal" %>
<%@ include file="../includePortalTaglibs.jspf" %>
<%@ page import="com.canon.newweb.PropertyUtil"%>

<%
	String baseUrlFromProps = PropertyUtil.getStringValue("WCM_BASE_URL");
%>

<portal-core:constants/><portal-core:defineObjects/>

<%-- Renders links for Login/Logout and Help that are shown in the banner --%>
<portal-core:lazy-set var="selectionPath" elExpression="wp.selectionModel.selectionPath"/>
<portal-core:lazy-set var="themeConfig" elExpression="wp.themeConfig"/>


<portal-logic:if deviceClass="smartphone/tablet"><div class="wpthemeMobile"></portal-logic:if>
<ul class="wpthemeCommonActions wpthemeLeft">
	<%-- Logo --%>
	<li>
		<span class="wpthemeBranding">
		    <c:set var="node" value="${selectionPath[1]}"/>
		    <c:set var="nodeID" value="${wp.identification[node]}"/>
            	    
		    <span class="wpthemeAltText"><portal-fmt:text key="theme.ibmLogo" bundle="nls.commonUI"/></span>
		</span>
	</li>
</ul>
<ul class="wpthemeCommonActions wpthemeRight">
	<portal-logic:if loggedIn="yes">
	<%-- Logout Link --%>
	<li id="wpthemeLogout">
		<a id="logoutlink" href="<portal-navigation:url command='LogoutUser' keepNavigationalState='false'/>"><portal-fmt:text key="link.logout" bundle="nls.engine"/></a>
	</li>
	</portal-logic:if>
	<portal-logic:if loggedIn="no">
	<%-- Login Link --%>
	<c:set var="endPreviewOperation" value="${wp.operation['ibm.portal.operations.endPreviewMode']}"></c:set>
	<c:if test="${!endPreviewOperation.isActive}">
	<li class="wpthemeLast" id="wpthemeLogin">
		<portal-navigation:urlGeneration allowRelativeURL="true" keepNavigationalState="true" contentNode="wps.content.root" home="protected" >
			<a href='<% wpsURL.write(escapeXmlWriter); %>' ><portal-fmt:text key="link.login" bundle="nls.engine"/></a>
		</portal-navigation:urlGeneration>
	</li>
	</c:if>
	</portal-logic:if>
	<%--  Top Nav Toggle --%>
	<portal-logic:if deviceClass="tablet">
	<li id="wpthemeTopNavToggle">
	<a role="button" class="wpthemeTopNavToggleBtn" aria-label="<portal-fmt:text key="theme.display.top.nav" bundle="nls.commonUI"/>" title="<portal-fmt:text key="theme.display.top.nav" bundle="nls.commonUI"/>" href="javascript:;" onclick="wptheme.toggleMobileTopNav('<portal-fmt:text key="theme.display.top.nav" bundle="nls.commonUI"/>','<portal-fmt:text key="theme.hide.top.nav" bundle="nls.commonUI"/>');" id="wpthemeTopNavToggleBtn">
	&nbsp;<img alt="" src="data:image/gif;base64,R0lGODlhAQABAIAAAP///wAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw==">
	<span class="wpthemeAltText" id="wpthemeTopNavToggleBtnAccess"><portal-fmt:text key="theme.display.top.nav" bundle="nls.commonUI"/></span>
	</a>
	</li>
	</portal-logic:if>
</ul>
<portal-logic:if deviceClass="smartphone/tablet"></div></portal-logic:if>
