<%@ page session="false" buffer="none" %> 
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="../includePortalTaglibs.jspf" %>
<portal-core:lazy-set var="selectionPath" elExpression="wp.selectionModel.selectionPath"/>
<portal-core:lazy-set var="showHiddenPages" elExpression=="wp.publicRenderParam['{http://www.ibm.com/xmlns/prod/websphere/portal/publicparams}hiddenPages']" />

<portal-logic:if deviceClass="!smartphone">
	<c:if test="${fn:length(selectionPath) > (param.startLevel+1)}">
		<ul>
		<c:forEach var="node" items="${selectionPath}" begin="${param.startLevel}">
			<c:set var="nodeID" value="${wp.identification[node]}"/>
			<c:if test="${!node.metadata['com.ibm.portal.Hidden'] || (wp.identification[wp.selectionModel.selected] == nodeID) || showHiddenPages}">
				<c:choose>
					<c:when test="${wp.identification[wp.selectionModel.selected] == nodeID}">
						<li><c:choose><c:when test="${node.projectID != null}">(<c:choose><c:when test="${node.metadata['com.ibm.portal.Hidden'] && showHiddenPages}">[<c:out value="${node.title}"/>]</c:when><c:otherwise><c:out value="${node.title}"/></c:otherwise></c:choose>)</c:when><c:when test="${node.metadata['com.ibm.portal.Hidden'] && showHiddenPages}">[<c:out value="${node.title}"/>]</c:when><c:otherwise><c:out value="${node.title}"/></c:otherwise></c:choose></li>
					</c:when>
					<c:when test="${node.contentNode.contentNodeType == 'LABEL'}">
						<li><c:choose><c:when test="${node.projectID != null}">(<c:choose><c:when test="${node.metadata['com.ibm.portal.Hidden']}">[<c:out value="${node.title}"/>]</c:when><c:otherwise><c:out value="${node.title}"/></c:otherwise></c:choose>)</c:when><c:when test="${node.metadata['com.ibm.portal.Hidden']}">[<c:out value="${node.title}"/>]</c:when><c:otherwise><c:out value="${node.title}"/></c:otherwise></c:choose></li>
					</c:when>
					<c:otherwise>
						<portal-navigation:urlGeneration contentNode="${nodeID}" keepNavigationalState="false"><a href="<%wpsURL.write(out);%>" ><span lang="${node.title.xmlLocale}" dir="${node.title.direction}"><c:choose><c:when test="${node.projectID != null}">(<c:choose><c:when test="${node.metadata['com.ibm.portal.Hidden']}">[<c:out value="${node.title}"/>]</c:when><c:otherwise><c:out value="${node.title}"/></c:otherwise></c:choose>)</c:when><c:when test="${node.metadata['com.ibm.portal.Hidden']}">[<c:out value="${node.title}"/>]</c:when><c:otherwise><c:out value="${node.title}"/></c:otherwise></c:choose></span></a></portal-navigation:urlGeneration>
					</c:otherwise>
				</c:choose>
			</c:if>
		</c:forEach>
		</ul>
	</c:if>
</portal-logic:if>