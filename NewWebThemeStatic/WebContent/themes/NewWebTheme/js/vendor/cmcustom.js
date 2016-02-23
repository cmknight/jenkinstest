/**
 *	DISCLAIMER OF WARRANTIES:
 *	-------------------------
 *	The following [enclosed] code is sample code created by IBM Corporation.
 *	This sample code is provided to you solely for the purpose of assisting
 *	you in the development of your applications.
 *	The code is provided "AS IS", without warranty of any kind. IBM shall
 *	not be liable for any damages arising out of your use of the sample code,
 *	even if they have been advised of the possibility of such damages.
 * (c) Copyright IBM Corp. 2011. All rights reserved.
 */
 /*
 * cmcustom.js 
 * $Id: WebSpherePortal_Normalization.js 235674 2014-04-21 15:19:34Z swehrung $
 * $Revision: 235674 $
 *
 * Version 4.1.0
 *
 * Coremetrics Tag v4.0, 8/7/2006
 * COPYRIGHT 1999-2002 COREMETRICS, INC. 
 * ALL RIGHTS RESERVED. U.S.PATENT PENDING
 *
 * Link and URL Normalization designed for IBM WebSphere Portal using WCM
 * provided stand alone for clients implementing a WebSphere Portal site without the integration
 * Note that this normalization is also included in the current integration and is not needed if you are using the inegration file
 */

function myNormalizeURL(url, isHref) {
    var newURL = url;
    if (newURL.toLowerCase().indexOf("!ut")>-1){
    	var startParam=newURL.toLowerCase().indexOf("!ut");
		var wcmParam=newURL.toLowerCase().indexOf("?1dmy&"); 
    	var endParam=newURL.toLowerCase().indexOf("?cm");    	
    		if (wcmParam!=-1){
    		newURL=newURL.substring(wcmParam)
    		} else {
    		 	if (endParam==-1){
				newURL=newURL.substring(0,startParam)
				} else {
				newURL=newURL.substring(0,startParam)+newURL.substring(endParam);
				} 
			}
	}
	
	// %21ut case created to deal with minor firefox HTML encoding 
	if (newURL.toLowerCase().indexOf("%21ut")>-1){
    	var startParam=newURL.toLowerCase().indexOf("%21ut");
		var wcmParam=newURL.toLowerCase().indexOf("?1dmy&"); 
    	var endParam=newURL.toLowerCase().indexOf("?cm");    	
    		if (wcmParam!=-1){
    		newURL=newURL.substring(wcmParam)
    		} else {
    		 	if (endParam==-1){
				newURL=newURL.substring(0,startParam)
				} else {
				newURL=newURL.substring(0,startParam)+newURL.substring(endParam);
				} 
			}
	}
     var blackList = ["cmplaceholder=","paramHash="];
     var paramString;
     var paramIndex = newURL.indexOf("?cm");
     var params;
     var keepParams = new Array();
     var goodParam;

     if (paramIndex > 0) {
	paramString = newURL.substring(paramIndex+1);
        newURL = newURL.substring(0, paramIndex);
	params = paramString.split("&");

		for(var i=0; i<params.length; i++) {
			goodParam = true;
			for(var j=0; j<blackList.length; j++) {
				if (params[i].toLowerCase().indexOf(blackList[j].toLowerCase()) == 0) {
					goodParam = false;
				}
			}
			if(goodParam == true) {
				keepParams[keepParams.length] = params[i];
			}
		}
		newURL += "?" + keepParams.join("&");
    }
    if (defaultNormalize != null) {
        newURL = defaultNormalize(newURL, isHref);
    }
    if (newURL.length > 1023) {    // last ditch Target/HREF URL truncation to avoid linkclick data rejection
	newURL = newURL.substring(0,1023);
    }
    return newURL;
}

// install normalization
if (document.cmTagCtl != null) {
    var func = "" + document.cmTagCtl.normalizeURL;
    if (func.indexOf('myNormalizeURL') == -1) {
        defaultNormalize = document.cmTagCtl.normalizeURL;
        document.cmTagCtl.normalizeURL = myNormalizeURL;
    }
}

cmSetupNormalization(null, null, myNormalizeURL);
