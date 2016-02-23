<%@ page session="false" buffer="none"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:setBundle basename="com.canon.newweb.dynamic.resource" />

<div class="container" style="position: relative">
	<div style="width: 250px; float: right">
       <section class="user-pulldown" style="display: none;" id="user-login-pulldown">
       		<section class="pulldown-menu-items">
               <article>
                   <ul>
		               <a href="#"><li><fmt:message key="user-login-pulldown.login" /></li></a>
		               <a href="#"><li><fmt:message key="user-login-pulldown.create" /></li></a>
		               <p><fmt:message key="user-login-pulldown.create-text" /></p>
					</ul>
				</article>
			</section>
       </section>
   </div>
</div>