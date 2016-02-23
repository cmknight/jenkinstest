<%
	String text = request.getParameter("searchText");
		
	StringBuilder theURL = new StringBuilder(com.canon.newweb.PropertyUtil.getStringValue("TYPEAHEAD_URL"));
	theURL.append("*").append(text).append("*");
	
	response.setContentType("application/xml");
	
	out.println(com.canon.newweb.SearchUtil.getXMLString(theURL.toString()));
%>