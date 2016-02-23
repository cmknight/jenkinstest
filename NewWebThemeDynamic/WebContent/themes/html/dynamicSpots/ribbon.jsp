<%@ page session="false" buffer="none"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page import="java.security.Principal"%>
<%@ page import="com.canon.newweb.PropertyUtil"%>
<%@ include file="../includePortalTaglibs.jspf" %>

<%@ page import="com.canon.b2c.nw.shared.DynaCacheUtility"%>
<%@ page import="com.canon.b2c.nw.shared.UserProfile"%>
<%@ page import="com.canon.b2c.nw.shared.Constants"%>

<fmt:setBundle basename="com.canon.newweb.dynamic.resource" />

<%
	String phoneUrlFromProps = PropertyUtil.getStringValue("THEME_PHONE_URL");
	String emailUrlFromProps = PropertyUtil.getStringValue("THEME_EMAIL_URL");
	String driversDownloadsUrlFromProps = PropertyUtil.getStringValue("THEME_DRIVERS_DOWNLOADS_URL");
	String prodRegistrationUrlFromProps = PropertyUtil.getStringValue("THEME_PRODUCT_REGISTRATION_URL");
	String contactUrlFromProps = PropertyUtil.getStringValue("THEME_CONTACT_URL");
	
	String userName = "";
	if (request.getSession() != null) {	
		String id = (String)request.getSession().getId() + "profile";
		//Get userProfile object from Dynacache
		UserProfile profile = (UserProfile)DynaCacheUtility.getInstance().getObjectFromCache(Constants.CACHENAME,id);
		if (profile != null) {
			userName = profile.getGivenName();
		}
	}
%>

<script>
	//See if we need to load css file for the IBM admin bar	
	if($( "div:first" ).hasClass( "wpToolbarActionBar" )){
	    var css_link = $("<link>", {
	        rel: "stylesheet",
	        type: "text/css",
	        href: "/NewWebThemeStatic/themes/NewWebTheme/css/canon-edit-bar.css"
	    });
	    css_link.appendTo('head');
	}
</script>

<section class="nav-ribbon cbg-light-gray-2 hidden-xs">
    <div class="container headerWrapper">
        <ul class="pull-left inline-list">
            <li>
            	<portal-navigation:urlGeneration contentNode="<%= phoneUrlFromProps %>" keepNavigationalState="false">
	            	<a href="<%wpsURL.write(out);%>" id="themeSupportPhone" class="cf-gray-1">
	                    <span class="icon fa fa-phone"></span>
	                </a>
                </portal-navigation:urlGeneration>
            </li>
            <li>
            	<portal-navigation:urlGeneration contentNode="<%= emailUrlFromProps %>" keepNavigationalState="false">
	                <a id="themeSupportEmail" href="<%wpsURL.write(out);%>" class="cf-gray-1">
	                    <span class="icon fa fa-envelope"></span>
	                </a>
                </portal-navigation:urlGeneration>
            </li>
            <li>
                <a id="feedbackLinkHead" href="javascript:void(0)">
                	<fmt:message key="ribbon.feedback" />
                </a>
            </li>
        </ul>
        <ul class="pull-right inline-list">
            <li>
            	<portal-navigation:urlGeneration contentNode="<%= driversDownloadsUrlFromProps %>" keepNavigationalState="false">
                	<a id="themeDD" href="<%wpsURL.write(out);%>"><fmt:message key="ribbon.drivers" /></a>
                </portal-navigation:urlGeneration>
            </li>
            <li>
            	<portal-navigation:urlGeneration contentNode="<%= prodRegistrationUrlFromProps %>" keepNavigationalState="false">
                	<a id="themeProdReg" href="<%wpsURL.write(out);%>"><fmt:message key="ribbon.product_registration" /></a>
                </portal-navigation:urlGeneration>
            </li>
            <li>
            	<portal-navigation:urlGeneration contentNode="<%= contactUrlFromProps %>" keepNavigationalState="false">
                	<a id="themeContact" href="<%wpsURL.write(out);%>"><fmt:message key="ribbon.contact" /></a>
                </portal-navigation:urlGeneration>
            </li>
            <li>
            	<%
				    Principal principal = (Principal) request.getUserPrincipal();
							if (principal != null) {
						%>   			
						<a href="#user-dropdown" data-action="toggletarget"><span class="fa fa-user icon-user spacing-right cf-gray-1"></span></a>                						
						<a href="#user-dropdown" data-action="toggletarget"> <%= userName %></a>						  
						<%
				
							} else {
						%> 
						<a href="#user-dropdown-login" data-action="toggletarget"><span class="fa fa-user icon-user spacing-right cf-gray-1"></span></a>
						<%
				
				   }
				
				%>
                
            </li>
        </ul>
    </div>
</section>
