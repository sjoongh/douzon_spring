<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="secu"
	uri="http://www.springframework.org/security/tags"%>
<secu:authorize access="hasRole('ROLE_inventory_page_view')">
	<ul class="nav nav-pills nav-stacked">
		<secu:authorize
			access="hasAnyRole('ROLE_inventory_page1_master','ROLE_inventory_page1_anything','ROLE_inventory_page1_readWrite','ROLE_inventory_page1_readOnly')">
			<li role="presentation" id="stockList"><a href="stockList">재고목록</a></li>
		</secu:authorize>
		<secu:authorize
			access="hasAnyRole('ROLE_inventory_page2_master','ROLE_inventory_page2_anything','ROLE_inventory_page2_readWrite','ROLE_inventory_page2_readOnly')">
			<li role="presentation" id="invoiceList"><a href="invoiceList">거래내역</a></li>
		</secu:authorize>
		<secu:authorize
			access="hasAnyRole('ROLE_inventory_page3_master','ROLE_inventory_page3_anything','ROLE_inventory_page3_readWrite','ROLE_inventory_page3_readOnly')">
			<li role="presentation" id="supplierList"><a href="supplierList">거래처목록</a></li>
		</secu:authorize>
	</ul>
</secu:authorize>
