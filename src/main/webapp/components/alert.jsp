<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%> 

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<c:if
    test="${not empty requestScope.message and not empty requestScope.type}">

    <script type="text/javascript">
        const notyf = new Notyf();
        notyf.open({
            type : "${requestScope.type}",
            message : "${requestScope.message}",
            position : {
                x : "center",
                y : "center",
            },
            duration : "${requestScope.type}" === "error" ? null : 2500,
            dismissible : true
        });
    </script>
    <c:remove var="message" scope="request" />
    <c:remove var="type" scope="request" />
</c:if>