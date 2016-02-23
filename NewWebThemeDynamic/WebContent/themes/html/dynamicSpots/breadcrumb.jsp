<%@ page session="false" buffer="none" %> 
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../includePortalTaglibs.jspf" %>
<portal-core:lazy-set var="selectionPath" elExpression="wp.selectionModel.selectionPath"/>
<portal-core:lazy-set var="showHiddenPages" elExpression=="wp.publicRenderParam['{http://www.ibm.com/xmlns/prod/websphere/portal/publicparams}hiddenPages']" />

<fmt:setBundle basename="com.canon.newweb.dynamic.resource" />

<!-- Set the Coremetrics  -->
<c:set var="cmNode" value="${wp.selectionModel.selected}" />
<c:set var="cmParentNode" value="${wp.navigationModel.parent[wp.selectionModel.selected]}" />
	<script>
		var category = "${cmNode.objectID}".split("'")[1];
		var parentCat = "${cmParentNode.objectID}".split("'")[1]; 
		var catTitle = "${cmNode.title}";
		if(catTitle == 'Home'){
			digitalData.page.category.primaryCategory = category;		
		}else{
			digitalData.page.category.primaryCategory = parentCat;
			digitalData.page.category.parentCategory = parentCat;		
		}	

	</script>

<section class="breadcrumbs cbg-light-gray-1 hidden-xs">
    <div class="container headerWrapper">
        <portal-logic:if deviceClass="!smartphone">
				<c:if test="${fn:length(selectionPath) > (param.startLevel+1)}">
			        <ol id="breadcrumb_list" class="breadcrumb pull-left">
			            <c:forEach var="node" items="${selectionPath}" begin="${param.startLevel + 1}">
							<c:set var="nodeID" value="${wp.identification[node]}"/>
							<c:if test="${!node.metadata['com.ibm.portal.Hidden'] || (wp.identification[wp.selectionModel.selected] == nodeID) || showHiddenPages}">
								<c:if test="${!fn:contains(node.title,'Product Group') && !fn:contains(node.title,'Product List') && !fn:contains(node.title,'Product Detail') && !fn:contains(node.title,'Support Detail')}">
								<c:choose>
									<c:when test="${wp.identification[wp.selectionModel.selected] == nodeID}">
										<li class="cf-gray-1"><c:choose><c:when test="${node.projectID != null}">(<c:choose><c:when test="${node.metadata['com.ibm.portal.Hidden'] && showHiddenPages}">[<c:out value="${node.title}"/>]</c:when><c:otherwise><c:out value="${node.title}"/></c:otherwise></c:choose>)</c:when><c:when test="${node.metadata['com.ibm.portal.Hidden'] && showHiddenPages}">[<c:out value="${node.title}"/>]</c:when><c:otherwise><c:out value="${node.title}"/></c:otherwise></c:choose></li>
									</c:when>
									<c:when test="${node.contentNode.contentNodeType == 'LABEL'}">
										<li class="cf-gray-1"><c:choose><c:when test="${node.projectID != null}">(<c:choose><c:when test="${node.metadata['com.ibm.portal.Hidden']}">[<c:out value="${node.title}"/>]</c:when><c:otherwise><c:out value="${node.title}"/></c:otherwise></c:choose>)</c:when><c:when test="${node.metadata['com.ibm.portal.Hidden']}">[<c:out value="${node.title}"/>]</c:when><c:otherwise><c:out value="${node.title}"/></c:otherwise></c:choose></li>
									</c:when>
									<c:otherwise>
										<li><portal-navigation:urlGeneration contentNode="${nodeID}" keepNavigationalState="false"><a href="<%wpsURL.write(out);%>"  class="cf-gray-1"><span lang="${node.title.xmlLocale}" dir="${node.title.direction}"><c:choose><c:when test="${node.projectID != null}">(<c:choose><c:when test="${node.metadata['com.ibm.portal.Hidden']}">[<c:out value="${node.title}"/>]</c:when><c:otherwise><c:out value="${node.title}"/></c:otherwise></c:choose>)</c:when><c:when test="${node.metadata['com.ibm.portal.Hidden']}">[<c:out value="${node.title}"/>]</c:when><c:otherwise><c:out value="${node.title}"/></c:otherwise></c:choose></span></a></portal-navigation:urlGeneration></li>
									</c:otherwise>
								</c:choose>
								</c:if>
							</c:if>
						</c:forEach>
			        </ol>
			    </c:if>
		</portal-logic:if>

        <div class="share-button pull-right">
        	<div id="addThis" class=" addThis addthis_toolbox addthis_default_style">
	            <a id="addThisLink" href="https://www.addthis.com/bookmark.php?v=250&amp;username=ra-4e381d4026d75dc5" class="addthis_button_compact cf-gray-1">
	            	<span class="fa fa-share-alt spacing-right"></span>
                    <span class="share-text">
                        <strong><fmt:message key="breadcrumb.share" /></strong>
                    </span>	                
	            </a>
			</div>
			
			<script type="text/javascript">
				var addthis_config = {
					 "data_track_clickback":true,
					 ui_click: true
				};
				 
			</script>
			
			<script type="text/javascript" src="https://s7.addthis.com/js/250/addthis_widget.js#username=ra-4e381d4026d75dc5"></script>			
        </div>
    </div>
</section>