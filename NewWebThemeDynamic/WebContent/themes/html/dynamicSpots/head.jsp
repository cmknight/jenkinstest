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
	String prodSiteFromProps = PropertyUtil.getStringValue("PROD_SITE");
	String wcmPathStripStart = PropertyUtil.getStringValue("WCM_PATH_STRIPSTART");

	//Needed to gather information for the Coremetrics registration call
	String uuid = "";
	String name = "";
	String encryptEmail = "";
	String city = "";
	String state = "";
	String country = "";
	String zipCode = "";
	
	if(request.getRequestURI().indexOf("myportal") > -1){
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
		 for (Cookie cookie : cookies) {
		   if (cookie.getName().equals("registration")) {
		     	String id = (String)request.getSession().getId() + "profile";
				//Get userProfile object from Dynacache
				UserProfile profile = (UserProfile)DynaCacheUtility.getInstance().getObjectFromCache(Constants.CACHENAME,id);
				if(profile != null){
					uuid = profile.getUuid();
					name = profile.getGivenName() + " " + profile.getSurName();
					encryptEmail = profile.getEncryptedEmail();
					city = profile.getCity();
					state = profile.getState();
					country = profile.getCountry();
					zipCode = profile.getZipCode(); 
				}
		   }
		  }
		}
	}

%>

<portal-core:constants/><portal-core:defineObjects/> <portal-core:stateBase/>
<portal-core:lazy-set var="themeWebDAVBaseURI" elExpression="wp.themeList.current.metadata['com.ibm.portal.theme.template.ref']"/>
<portal-core:lazy-set var="currentNavNode" elExpression="wp.selectionModel.selected"/>
<title><c:out value='${wp.title}'/></title>
<portal-core:portletsHeadMarkupElements method="html" filter="title"/>
<portal-navigation:urlGeneration navigationNode='${wp.identification[currentNavNode]}'>
<link id="com.ibm.lotus.NavStateUrl" rel="alternate" href="<%wpsURL.write(escapeXmlWriter);%>" />
<link rel="bookmark" title='<c:out value='${currentNavNode.title}'/>' href='<%= baseUrlFromProps %><%wpsURL.write(escapeXmlWriter);%>' hreflang="${wp.preferredLocale}"/>
</portal-navigation:urlGeneration>
<c:if test="${not empty currentNavNode.metadata['com.nw.canonical.url']}"><link rel="canonical" href="${currentNavNode.metadata['com.nw.canonical.url']}" /></c:if>

<script src="/NewWebThemeStatic/themes/NewWebTheme/js/nwConsoleDebug.js"></script>
<script>
	debugMode(false);
	var baseURL = '<%= baseUrlFromProps %>';
	var prodSite = '<%= prodSiteFromProps %>';
	var wcmPathStripStart = '<%= wcmPathStripStart %>';
</script>



<script src="/NewWebThemeStatic/themes/NewWebTheme/js/min/jquery.include-min.js"></script>
<script src="/NewWebThemeStatic/themes/NewWebTheme/js/min/jquery.ui-min.js"></script>
<script src="/NewWebThemeStatic/themes/NewWebTheme/js/jquery.validate.min.js"></script>
<script src="/NewWebThemeStatic/themes/NewWebTheme/js/confirmDialog.js"></script>
<script src="/NewWebThemeStatic/themes/NewWebTheme/js/productFinder.js"></script>
<script src="/NewWebThemeStatic/themes/NewWebTheme/js/serialFinder.js"></script>
<script src="/NewWebThemeStatic/themes/NewWebTheme/js/validatorCustomMethods.js"></script>
<script src="/NewWebThemeStatic/themes/NewWebTheme/js/min/jquery.raty-min.js"></script>
<script src="/NewWebThemeStatic/themes/NewWebTheme/js/min/jquery.mask-min.js"></script>
<script src="/NewWebThemeStatic/themes/NewWebTheme/js/paginationHelper.js"></script>
<script src="/NewWebThemeStatic/themes/NewWebTheme/js/paginationWidget.js"></script>

<!-- Coremetrics Section -->
<script src="//libs.coremetrics.com/eluminate.js"></script>
<!-- End of Coremetrics Section -->

<link href="/NewWebThemeStatic/themes/NewWebTheme/images/favicon.ico" rel="shortcut icon" type="image/x-icon" />

<link href="/NewWebThemeStatic/themes/NewWebTheme/css/jquery-ui.css" rel="stylesheet" type="text/css" />
<link href="/NewWebThemeStatic/themes/NewWebTheme/css/bootstrap.css" rel="stylesheet" type="text/css" />
<link href="/NewWebThemeStatic/themes/NewWebTheme/css/canon-styles.css" rel="stylesheet" type="text/css" />
<link href="/NewWebThemeStatic/themes/NewWebTheme/css/new_web_custom.css" rel="stylesheet" type="text/css" />
<link href="/NewWebThemeStatic/themes/NewWebTheme/css/print.css" media="print" rel="stylesheet" type="text/css" />
<link href="/NewWebThemeStatic/themes/NewWebTheme/css/raty/jquery.raty.css" media="print" rel="stylesheet" type="text/css" />

<script src="/NewWebThemeStatic/themes/NewWebTheme/js/coreMetricsWrapper.js"></script>
<script src="/NewWebThemeStatic/themes/NewWebTheme/js/liveChat.js"></script>
<script src="/NewWebThemeStatic/themes/NewWebTheme/js/jquery.history.js"></script>

<c:set var="prodSiteProps" value="<%=prodSiteFromProps%>" />
<c:set var="bvNode" value="${wp.selectionModel.selected}" />
<c:if test="${bvNode.metadata['com.nw.load.bazaar']}">
	<c:choose>
		<c:when test="${'Y' == prodSiteProps}">
			<script type="text/javascript" src="https://display.ugc.bazaarvoice.com/static/Canon/en_US/bvapi.js"></script>
		</c:when>
		<c:otherwise>
			<script type="text/javascript" src="https://display-stg.ugc.bazaarvoice.com/static/Canon/en_US/bvapi.js"></script>
		</c:otherwise>
	</c:choose>
</c:if>

<script src="/NewWebThemeStatic/themes/NewWebTheme/js/custom.js"></script> 
<script src="/NewWebThemeStatic/themes/NewWebTheme/js/confirmIt.js"></script>
<script src="/NewWebThemeStatic/themes/NewWebTheme/js/allegiance.js"></script> 
<script type="text/javascript" src="https://e.invodo.com/4.0/s/canon.com.js"></script>


<script type="text/javascript">
	CoreMetricsWrapper.init();	
	
	 if(jQuery().Cookies) { 
		if(Cookies.get('registration') == 'true'){
			//Remove registration cookie so the call is only made once 
			Cookies.remove('registration', { path: '/', domain: '.canon.com' });
			
			//Log Coremetrics Registration event
			CoreMetricsWrapper.createRegistrationCall('<%=uuid%>', '<%=encryptEmail%>', '<%=city%>', '<%=state%>', '<%=zipCode%>', '<%=country%>', '<%=name%>');
			
			var profile = {
				"profileInfo" : {
					"profileID" :"REGISTRATION-ID",
					"profileEmail" : '<%=encryptEmail%>',
					"address" : {
						"city" : '<%=city%>',
						"state_province" : '<%=state%>',
						"postalcode":'<%=zipCode%>',
						"country":'<%=country%>'
					}
				
				}
			};
			var profileArray = {
				"profile" : []
			};
			
			profileArray.profile.push(profile);
			digitalData.user.push(profileArray);	
		}
	}
</script>
