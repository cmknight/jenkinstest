<%@ page session="false" buffer="none" %> 
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../includePortalTaglibs.jspf" %>
<%@ page import="com.canon.newweb.PropertyUtil"%>
<%@ page import="com.canon.b2c.nw.shared.DynaCacheUtility"%>
<%@ page import="com.canon.b2c.nw.shared.UserProfile"%>
<%@ page import="com.canon.b2c.nw.shared.Constants"%>


<%
	String baseUrlFromProps = PropertyUtil.getStringValue("WCM_BASE_URL");	
	String prodSite = PropertyUtil.getStringValue("PROD_SITE");

%>

<portal-core:constants/><portal-core:defineObjects/>
<portal-core:lazy-set var="themeWebDAVBaseURI" elExpression="wp.themeList.current.metadata['com.ibm.portal.theme.template.ref']"/>
<portal-core:lazy-set var="currentNavNode" elExpression="wp.selectionModel.selected"/>
<title><c:out value='${wp.title}'/></title>
<portal-core:portletsHeadMarkupElements method="html" filter="title"/>
<portal-navigation:urlGeneration navigationNode='${wp.identification[currentNavNode]}'>
<link id="com.ibm.lotus.NavStateUrl" rel="alternate" href="<%wpsURL.write(escapeXmlWriter);%>" />
<link rel="bookmark" title='<c:out value='${currentNavNode.title}'/>' href='<%wpsURL.write(escapeXmlWriter);%>' hreflang="${wp.preferredLocale}"/>
</portal-navigation:urlGeneration>
<c:if test="${not empty currentNavNode.metadata['com.nw.canonical.url']}"><link rel="canonical" href="${currentNavNode.metadata['com.nw.canonical.url']}" /></c:if>

<script src="<%= baseUrlFromProps %>/NewWebThemeStatic/themes/NewWebTheme/js/nwConsoleDebug.js"></script>
<script>
	debugMode(false);
	var baseURL = '<%= baseUrlFromProps %>';
	var prodSite = '<%= prodSite %>';
</script>

<script src="<%= baseUrlFromProps %>/NewWebThemeStatic/themes/NewWebTheme/js/min/jquery.include-min.js"></script>
<script src="<%= baseUrlFromProps %>/NewWebThemeStatic/themes/NewWebTheme/js/jquery.ui.js"></script>
<script src="<%= baseUrlFromProps %>/NewWebThemeStatic/themes/NewWebTheme/js/jquery.validate.min.js"></script>
<script src="<%= baseUrlFromProps %>/NewWebThemeStatic/themes/NewWebTheme/js/confirmDialog.js"></script>
<script src="<%= baseUrlFromProps %>/NewWebThemeStatic/themes/NewWebTheme/js/productFinder.js"></script>
<script src="<%= baseUrlFromProps %>/NewWebThemeStatic/themes/NewWebTheme/js/serialFinder.js"></script>
<script src="<%= baseUrlFromProps %>/NewWebThemeStatic/themes/NewWebTheme/js/validatorCustomMethods.js"></script>
<script src="<%= baseUrlFromProps %>/NewWebThemeStatic/themes/NewWebTheme/js/jquery.raty.js"></script>
<script src="<%= baseUrlFromProps %>/NewWebThemeStatic/themes/NewWebTheme/js/min/jquery.mask-min.js"></script>


<!-- Coremetrics Section -->
<script src="//libs.coremetrics.com/eluminate.js"></script>
<!-- End of Coremetrics Section -->

<link href="<%= baseUrlFromProps %>/NewWebThemeStatic/themes/NewWebTheme/images/favicon.ico" rel="shortcut icon" type="image/x-icon" />

<link href="<%= baseUrlFromProps %>/NewWebThemeStatic/themes/NewWebTheme/css/jquery-ui.css" rel="stylesheet" type="text/css" />
<link href="<%= baseUrlFromProps %>/NewWebThemeStatic/themes/NewWebTheme/css/bootstrap.css" rel="stylesheet" type="text/css" />
<link href="<%= baseUrlFromProps %>/NewWebThemeStatic/themes/NewWebTheme/css/canon-styles.css" rel="stylesheet" type="text/css" />
<link href="<%= baseUrlFromProps %>/NewWebThemeStatic/themes/NewWebTheme/css/canon-styles-external.css" rel="stylesheet" type="text/css" />
<link href="<%= baseUrlFromProps %>/NewWebThemeStatic/themes/NewWebTheme/css/new_web_custom.css" rel="stylesheet" type="text/css" />
<link href="<%= baseUrlFromProps %>/NewWebThemeStatic/themes/NewWebTheme/css/raty/jquery.raty.css" rel="stylesheet" type="text/css" />

<script src="<%= baseUrlFromProps %>/NewWebThemeStatic/themes/NewWebTheme/js/coreMetricsWrapper.js"></script>
<script src="<%= baseUrlFromProps %>/NewWebThemeStatic/themes/NewWebTheme/js/liveChat.js"></script>


<script src="<%= baseUrlFromProps %>/NewWebThemeStatic/themes/NewWebTheme/js/custom.js"></script> 
<script src="<%= baseUrlFromProps %>/NewWebThemeStatic/themes/NewWebTheme/js/confirmIt.js"></script>
<script src="<%= baseUrlFromProps %>/NewWebThemeStatic/themes/NewWebTheme/js/allegiance.js"></script> 



<script type="text/javascript">
	CoreMetricsWrapper.init();	
</script>