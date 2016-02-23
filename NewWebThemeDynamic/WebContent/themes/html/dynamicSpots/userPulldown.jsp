<%@ page session="false" buffer="none"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:setBundle basename="com.canon.newweb.dynamic.resource" />

<div class="container" style="position: relative">
	<div style="width: 250px; float: right">
       <section class="user-pulldown" style="display: none;" id="user-pulldown">
           <header>
               <h4><em>Welcome, Bob!</em></h4>
               <a href="mycanon.html"><h1><fmt:message key="user-pulldown.header" /></h1></a>
           </header>
           <section class="pulldown-menu-items">
               <article>
                   <ul>
                       <a href="mycanon-products.html">
                           <li><fmt:message key="user-pulldown.my_products" /></li>
                       </a>
                       <a href="#">
                           <li><fmt:message key="user-pulldown.order_history" /></li>
                       </a>
                       <a href="#">
                           <li><fmt:message key="user-pulldown.repair_history" /></li>
                       </a>
                       <a href="mycanon-profile.html">
                           <li><fmt:message key="user-pulldown.my_profile" /></li>
                       </a>
                       <a href="#">
                           <li><fmt:message key="user-pulldown.subscriptions" /></li>
                       </a>
                       <a href="#">
                           <li><fmt:message key="user-pulldown.address_book" /></li>
                       </a>
                       <a href="#">
                           <li><fmt:message key="user-pulldown.my_wishlists" /></li>
                       </a>
                   </ul>
               </article>
           </section>
           <div class="logout">
               <a href="#">
                   <p><fmt:message key="user-pulldown.logout" /></p>
               </a>
           </div>
       </section>
   </div>
</div>