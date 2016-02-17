<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%><%@ page session="false" isELIgnored="false"%><%@ page
	import="com.ibm.workplace.wcm.api.*"%>


<%
   // get a system workspace and dump the user
   Workspace ws = null;
   try
   {
      ws = WCM_API.getRepository().getSystemWorkspace();
      // try saving content     
      out.println(ws.getUserProfile().getUsername());
	  String toCopy = (String) request.getParameter("toCopy");
	  String newParent = (String) request.getParameter("newParent");
	
	  if(!toCopy.isEmpty() && !newParent.isEmpty()) {
	    DocumentId copyId = ws.createDocumentId(toCopy);
	    DocumentId parentId = ws.createDocumentId(newParent);
	  	Document docToCopy = ws.getById(copyId);
	  	
	  	CopyOptions copyOptions = new CopyOptions();
	  	copyOptions.add(new RecursiveCopyOption());
	  	ws.copy((Placeable)docToCopy, new PlacementLocation(parentId, Placement.END), copyOptions);	  	
	  	
	  }

   }
   catch (Exception e)
   {
      out.println(e.getMessage());
   }
%>