<%@ page session="false" buffer="none"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../includePortalTaglibs.jspf"%>
<%@ taglib uri="../../../WEB-INF/tld/wcm.tld" prefix="wcm" %>
<%@ page import="com.canon.newweb.PropertyUtil"%>

<portal-core:constants />
<portal-core:defineObjects />

<%
	String baseUrlFromProps = PropertyUtil.getStringValue("WCM_BASE_URL");
	String themeBanner = PropertyUtil.getStringValue("SHOW_BANNER");
	if(themeBanner == null) themeBanner = "N";	
%>
<script>
		var waiBaseURL = '<%=baseUrlFromProps %>';
</script>

<!-- Dummy divs to check device category -->
<div class="visible-xs" id="devicetype-mobile"></div>
<div class="visible-sm" id="devicetype-tablet"></div>
<div class="visible-md visible-lg visible-xl" id="devicetype-desktop"></div>

<wcm:initworkspace user="<%= request.getUserPrincipal() %>"></wcm:initworkspace>
<wcm:setExplicitContext path="/Canon_NewWeb_Design/DefaultPages/Content"></wcm:setExplicitContext>
<wcm:libraryComponent name="HTML - GlobalFooter" library="Canon_NewWeb_Design"></wcm:libraryComponent>	
<script src="<%= baseUrlFromProps %>/NewWebThemeStatic/themes/NewWebTheme/js/vendor/mustache.min.js"></script>
<script src="<%= baseUrlFromProps %>/NewWebThemeStatic/themes/NewWebTheme/js/canon.js?v3"></script>
<script src="/NewWebThemeStatic/themes/NewWebTheme/js/jquery.lazyloadxt.min.js"></script>
<script src="/NewWebThemeStatic/themes/NewWebTheme/js/jquery.lazyloadxt.autoload.min.js"></script>

<script>

	//Check to show theme baner
	var showBanner = '<%=themeBanner %>';
	if(showBanner == 'Y') $('#themeBanner').show();
	
	// Need to show ConfirmIt only on support pages
	if (window.location.href.indexOf("home/support") > -1) {
		ConfirmIt.openSurvey();
	}
	
	createMMCThemeLinks();
	
</script>


<!-- Browser compatibility check code -->
<!-- Modal Desktop-->
<div class="modal fade" id="browserError" role="dialog" aria-labelledby="browserErrorLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-body">       
        <div class="browser-error-desktop text-center">
        	<h1> Your browser is currently not supported.</h1>       	
        	<p> If you'd like to download the latest browser version please select the appropriate link below.</p>       	
        	<div class="row">
        		<div class="col-xs-3">
        			<a href="https://www.google.com/chrome/browser/desktop/index.html"><img src="/NewWebThemeStatic/themes/NewWebTheme/images/browsers/chrome.png" class="img-responsive"></a>
        		</div>
        		<div class="col-xs-3">
        			<a href="https://www.mozilla.org/en-US/firefox/new/"><img src="/NewWebThemeStatic/themes/NewWebTheme/images/browsers/ff.png" class="img-responsive"></a>
        		</div>
        		<div class="col-xs-3">
        			<a href="https://support.apple.com/downloads/internet"><img src="/NewWebThemeStatic/themes/NewWebTheme/images/browsers/safari.jpg" class="img-responsive"></a>
        		</div>
        		<div class="col-xs-3">
        			<a href="http://windows.microsoft.com/en-us/internet-explorer/download-ie"><img src="/NewWebThemeStatic/themes/NewWebTheme/images/browsers/ie.png" class="img-responsive"></a>
        		</div>       		
        	</div>
			<p class="add-margin-top clearfix">
			If you would like to continue without update please <a href="#" data-dismiss="modal" class="cf-canon-red">click here</a>
			</p>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- Modal Mobile -->
<div class="modal fade" id="browserErrorMobile" role="dialog" aria-labelledby="browserErrorMobileLabel" aria-hidden="true" >
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-body">          
        <div class="browser-error-mobile text-center">
        	<h1> Your browser is currently not supported.</h1>
        	<p> Your mobile device's operating system and/or browser are out of date and not supported. Please consider updating your phone.</p>
			<p class="add-margin-top">
			 <a href="#" data-dismiss="modal" class=" cbtn cbtn-canon-red-o">Continue to site</a>
			</p>        
        </div>
      </div>
    </div>
  </div>
</div>

<!--record Coremetrics cmCreatePageviewTag-->
<script>
	//Set needed Coremetrics digitalData
	$('#breadcrumb_list > li').each(function(){
  		digitalData.page.pageInfo.breadCrumbs.push($(this).text());
	});
	digitalData.page.attributes.exploreAttributes[0] = digitalData.page.pageInfo.breadCrumbs.join(">");

	CoreMetricsWrapper.reportPageCategory();
</script> 
