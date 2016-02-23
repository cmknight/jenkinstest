<%@ page session="false" buffer="none" %> 
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="../includePortalTaglibs.jspf" %>

<!-- MAIN OL STYLESHEET -->
<link href="/NewWebThemeStatic/themes/NewWebTheme/css/oo_style.css" rel="stylesheet" type="text/css" />

<!-- MAIN OL ENGINE -->
<script src="/NewWebThemeStatic/themes/NewWebTheme/js/vendor/oo_engine.min.js"></script>

<!-- FEEDBACK CONFIGURATION -->
<script src="/NewWebThemeStatic/themes/NewWebTheme/js/vendor/oo_conf.js"></script>

<noscript>This JavaScript enables OnlineOpinion, a method for collecting secure feedback data.</noscript>
<!-- INVITATION PROMPT MARKUP -->
<div id="oo_container" style="display: none">
    <div id="oo_invitation_prompt" role="dialog" aria-describedby="oo_invite_message">
        <div id="oo_company_logo"></div>
        <div id="oo_invite_content">
            <p id="oo_invite_message">After your visit, would you be willing to provide some quick feedback?<br /><br />(It will only take a minute)</p>
            <p class="prompt_button"><a href="#" id="oo_launch_prompt">Yes<span class="screen_reader">This will open a new window</span></a></p>
            <p class="prompt_button"><a href="#" id="oo_no_thanks">No Thanks</a></p>
            <p id="ol_brand_logo"><a href="https://www.opinionlab.com/company/" target="_blank" aria-label="Powered by OpinionLab. This will open a new window"></a></p>
        </div>
        <a id="oo_close_prompt" href="#" aria-label="Close dialog"><div class="screen_reader">Close dialog</div><span aria-hidden="true">&#10006;</span></a>
    </div>
</div>