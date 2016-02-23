<%@ page session="false" buffer="none" %> 
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="../includePortalTaglibs.jspf" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="../../../WEB-INF/tld/wcm.tld" prefix="wcm" %>
<%@ page import="com.canon.newweb.PropertyUtil"%>
<%@ page import="java.util.*,javax.servlet.jsp.JspWriter,java.io.*, java.net.*"%>
<%@ page import="java.security.Principal"%>

<%@ page import="com.canon.b2c.nw.shared.DynaCacheUtility"%>
<%@ page import="com.canon.b2c.nw.shared.UserProfile"%>
<%@ page import="com.canon.b2c.nw.shared.Constants"%>

<c:set var="primeNavigation" value="${ccConfig['cc.primeNavigation']}" />
<c:set var="selectedNodeID" value="${wp.identification[wp.selectionModel.selected]}" />
<c:set var="childrenAvailable" value="false"/>
<c:set var="step" value="0"/>

<fmt:setBundle basename="com.canon.newweb.dynamic.resource" />

<%
	String canonDirectUrlFromProps = PropertyUtil.getStringValue("CANON_DIRECT_BASE_URL");
	String canonImageUrlFromProps = PropertyUtil.getStringValue("THEME_CANON_IMAGE");		
	String mcCreateAccountUrlFromProps = PropertyUtil.getStringValue("CREATE_ACCOUNT_URL");
	String mcProductsUrlFromProps = PropertyUtil.getStringValue("PRODUCTS_URL");
	String mcOrderUrlFromProps = PropertyUtil.getStringValue("CANON_DIRECT_MYACCOUNT_URL");
	String mcProfileUrlFromProps = PropertyUtil.getStringValue("EDIT_PROFILE_URL");
	String mcCommunicationsUrlFromProps = PropertyUtil.getStringValue("MANAGE_COMMUNICATIONS_URL");
	String mcAddressUrlFromProps = PropertyUtil.getStringValue("THEME_MC_ADDRESS_BOOK");
	String mcWishListUrlFromProps = PropertyUtil.getStringValue("THEME_MC_WISHLIST");
	String mcHome = PropertyUtil.getStringValue("THEME_MC_HOME");
	String mcLoginUrlFromProps = PropertyUtil.getStringValue("LOGIN_URL");
	String searchResultsUrlFromProps = PropertyUtil.getStringValue("SEARCH_RESULTS_URL");	
	
	String userName = "";
	if (request.getSession() != null) {	
		String id = (String)request.getSession().getId() + "profile";
		//Get userProfile object from Dynacache
		UserProfile profile = (UserProfile)DynaCacheUtility.getInstance().getObjectFromCache(Constants.CACHENAME,id);
		if (profile != null && (profile.getSecurityQuestion() == null || profile.getSecurityQuestion().isEmpty())){
			mcOrderUrlFromProps = "";
		}
		if (profile != null) {
			userName = profile.getGivenName();
		}
	}
%>

<nav class="main-nav navbar navbar-default">
    <div class="container headerWrapper">
        <!-- User Logged Out -->
        <div id="user-dropdown-login" class="user-dropdown cbr-light-gray-3 cf-light-gray-2 cbg-white">
            <header class="cbg-dark-gray-2">
                <a href="#user-dropdown-login" data-action="toggletarget" class="close">&times;</a>
                <h4><fmt:message key="user-login-pulldown.title" /></h4>
            </header>
            <ul class="user-control-list">
                <li>                
					<a id="mcLogin" href="<%= mcLoginUrlFromProps %>"><fmt:message key="user-login-pulldown.login" /></a>		           			
	            </li>
                <li>
                    <a id="mcCreateAccount" href="<%= mcCreateAccountUrlFromProps %>"><fmt:message key="user-login-pulldown.create" /></a>
                    <p class="cf-infrared add-padding-left text-80 create-account-blurb">
                        <fmt:message key="user-login-pulldown.create-text" />
                    </p>
                </li>
            </ul>
        </div>
        
        <!-- User Logged In -->
        <div id="user-dropdown" class="user-dropdown cbr-light-gray-3 cf-light-gray-2 cbg-white">
            <div class="cbg-dark-gray-2">
                <a href="#user-dropdown" data-action="toggletarget" class="close">&times;</a>                 				
				<h3><fmt:message key="user-pulldown.welcome" />,  <%= userName %>!</h3>				  
                <h4>
                	<portal-navigation:urlGeneration contentNode="<%= mcHome %>" keepNavigationalState="false">
                		<a class="cf-white" href="<%wpsURL.write(out);%>"><fmt:message key="user-pulldown.header" /></a>
                	</portal-navigation:urlGeneration>
                </h4>
            </div>
            <ul class="user-control-list">
                <li>                	
                    <a id="mcProducts" href="<%= mcProductsUrlFromProps %>"><fmt:message key="user-pulldown.my_products" /></a>
                </li>
                <li>   
                	<% 	String target = "_blank";
                		if (mcOrderUrlFromProps.isEmpty()) {             	
                    		target = "_self";
                   	 	}                    	 	
                   	%>
                   	<a target="<%= target %>" id="mcOrderHist" href="<%= mcOrderUrlFromProps %>"><fmt:message key="user-pulldown.order_history" /></a>
                </li>
                <%-- Not in scope for release 1
                <li>    
                	<portal-navigation:urlGeneration contentNode="<%= mcHome %>" keepNavigationalState="false">            	
                    	<a href="<%wpsURL.write(out);%>"><fmt:message key="user-pulldown.repair_history" /></a>
                    </portal-navigation:urlGeneration>
                </li> 
                --%>
                <li>                	
                    <a id="mcProfile" href="<%= mcProfileUrlFromProps %>"><fmt:message key="user-pulldown.my_profile" /></a>
                </li>
                <li>                	
                    <a id="mcCommunications" href="<%= mcCommunicationsUrlFromProps %>"><fmt:message key="user-pulldown.subscriptions" /></a>
                </li>
                <%-- Not in scope for release 1
                <li> 
                	<portal-navigation:urlGeneration contentNode="<%= mcAddressUrlFromProps %>" keepNavigationalState="false">               	
                    	<a href="<%wpsURL.write(out);%>"><fmt:message key="user-pulldown.address_book" /></a>
                    </portal-navigation:urlGeneration>
                </li>
                <li> 
                	<portal-navigation:urlGeneration contentNode="<%= mcWishListUrlFromProps %>" keepNavigationalState="false">               	
                    	<a href="<%wpsURL.write(out);%>"><fmt:message key="user-pulldown.my_wishlists" /></a>
                    </portal-navigation:urlGeneration>
                </li>
                --%>
            </ul>
            <footer class="cbg-light-gray-2">
                <a id="logout-link" href="<portal-navigation:url command='LogoutUser' keepNavigationalState='false'/>"><fmt:message key="user-pulldown.logout" /></a>
            </footer>
        </div>
        <div class="navbar-header">
        	<portal-navigation:urlGeneration contentNode="<%= canonImageUrlFromProps %>" keepNavigationalState="false">
	            <a class="navbar-brand" href="<%wpsURL.write(out);%>">
	            </a>
	        </portal-navigation:urlGeneration>
            <ul class="nav navbar-nav pull-right visible-xs mobile-nav">
                <a href="#search-form" data-action="toggletarget">
                    <i class="fa fa-search"></i>
                </a>
                <%
			    Principal principal = (Principal) request.getUserPrincipal();
				if (principal != null) {
				%> 
                <a href="#user-dropdown" data-action="toggletarget">
                    <i class="fa fa-user"></i>
                </a>
                <%
					} else {
				%> 
                <a href="#user-dropdown-login" data-action="toggletarget">
                    <i class="fa fa-user"></i>
                </a>
                <%
				   }	
				%>
                <a href="#navbar-left" data-action="toggletarget">
                    <i class="fa fa-navicon"></i>
                </a>
            </ul>
        </div>
        <ul class="nav navbar-nav navbar-right store-link hidden-xs">
            <li>
                <a id="canonDirectLink" href="<%= canonDirectUrlFromProps %>" class="cf-canon-red" target="_blank">
                    <span class="fa fa-shopping-cart icon"></span>
                    <fmt:message key="ribbon.canon_store" />
                </a>
            </li>
        </ul>
        <ul id="navbar-left" class="nav navbar-nav navbar-left">
        	<c:forEach var="node" items="${wp.selectionModel.selectionPath}" varStatus="status" begin="1" end="1" step="1">
				<c:set var="level" value="${0 + (status.count-1)}" />
				<c:forEach var="node" items="${wp.navigationModel.children[node]}" varStatus="status">
					<c:if test="${!node.metadata['com.ibm.portal.Hidden'] && node.metadata['com.nw.meganav']}">
						<c:set var="primeNode" value="${primeNavigation && wp.selectionModel[node] != null}" />
						<c:set var="nodeID" value="${wp.identification[node]}" />
						<li>
						<a class="toggleize" href="#section-${fn:toLowerCase(node.title)}" role="tab" data-toggle="tab" data-toggle-target=".megamenu">
							<c:if test="${primeNode}">data-nm-level="${level+1}" data-nm-primed="<portal-fmt:out><portal-core:navigationNodePriming navigationNode="${nodeID}" metaData="${navHiddenMetadata}" considerChildren="false" includeRoles="true" /></portal-fmt:out>"</c:if>${node.title}</a>
						</li>
					</c:if>
					<c:if test="${node.title eq 'Contact Canon'}" >
						<c:set var="primeNode" value="${primeNavigation && wp.selectionModel[node] != null}" />
						<c:set var="nodeID" value="${wp.identification[node]}" />
						<li>
							<a class="toggleize visible-xs hidden-sm hidden-md hidden-lg" href="#section-contactcanon" role="tab" data-toggle="tab" data-toggle-target=".megamenu">
								<c:if test="${primeNode}">data-nm-level="${level+1}" data-nm-primed="<portal-fmt:out><portal-core:navigationNodePriming navigationNode="${nodeID}" metaData="${navHiddenMetadata}" considerChildren="false" includeRoles="true" /></portal-fmt:out>"</c:if>${node.title}</a>
						</li>
					</c:if>
				</c:forEach>
			</c:forEach> 			
        </ul>
        <a class="search-toggle" href="#search-form" data-action="toggletarget">
            <i class="fa fa-search"></i>SEARCH
        </a>
        
	        <form action="<%= searchResultsUrlFromProps %>" id="search-form" class="navbar-form navbar-right search-form" role="search">
	            <input type="hidden" id="seach-area" value='<c:if test="${wp.selectionModel.selectionPath[2].metadata['com.nw.search.category']}">${wp.selectionModel.selectionPath[2]}</c:if>' />
	            <div class="form-group">
	                <input id="search-button" name="query" type="text" class="form-control skipSqlFiltering" autocomplete="off" placeholder="CHOOSE A SEARCH AREA" />
	                <a href="#search-dropdown" class="dropdown-trigger" data-action="toggletarget">
	                    <i class="fa fa-angle-down"></i>
	                </a>
	                <section name="searchTab" id="search-dropdown" class="search-dropdown cbg-white cbr-light-gray-3">
		                <ul>
		                    <c:forEach var="node" items="${wp.selectionModel.selectionPath}" varStatus="status" begin="1" end="1" step="1">
								<c:set var="level" value="${0 + (status.count-1)}" />
								<c:forEach var="node" items="${wp.navigationModel.children[node]}" varStatus="status">
									<c:if test="${node.metadata['com.nw.search.category']}">
										<c:set var="primeNode" value="${primeNavigation && wp.selectionModel[node] != null}" />
										<c:set var="nodeID" value="${wp.identification[node]}" />
										<li>
										<a href="#" onclick="updatePlaceHolder('search-button', '${node.title}'.toUpperCase());return false;"
											<c:if test="${primeNode}">data-nm-level="${level+1}" data-nm-primed="<portal-fmt:out><portal-core:navigationNodePriming navigationNode="${nodeID}" metaData="${navHiddenMetadata}" considerChildren="false" includeRoles="true" /></portal-fmt:out>"</c:if>>${node.title}</a>
										</li>
									</c:if>
								</c:forEach>
							</c:forEach>    
		                </ul>
		            </section>
	            </div>
	            <input type="hidden" name="searchTab" id="searchTab" value='<c:if test="${wp.selectionModel.selectionPath[2].metadata['com.nw.search.category']}">${wp.selectionModel.selectionPath[2]}</c:if>' />
	            <button type="submit" class="cbtn cbtn-canon-red">
	                <span class="fa fa-search"></span>
	            </button>
	            
	        </form>
        
    </div>
</nav>
