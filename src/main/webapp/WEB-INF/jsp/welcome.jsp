<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>--%>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Home</title>
    <jsp:include page="header.jsp"/>
    <%--<script src="//cdnjs.cloudflare.com/ajax/libs/list.js/1.2.0/list.min.js"></script>--%>
    <script src="/js/list.min.js"></script>

</head>
<body>

<div id="contacts" class="container">
    <div class="row">
        <div class="col-xs-12 ">
            <input class="search" placeholder="Search"/>
            &nbsp;&nbsp;Сортировать по:
            <span class="sort btn" data-sort="firstName">Имени</span>
            <span class="sort btn" data-sort="secondName">Фамилии</span>
            <span class="sort btn" data-sort="phoneMobile">Моб. телефону</span>
            <span class="sort btn" data-sort="address">Адресу</span>
            <span class="sort btn" data-sort="email">Email</span>
            <br>
            <br>
            <br>
        </div>
    </div>


    <div class="row">
        <div class="col-xs-12">
            <table class="table">
                <tr>
                <th>Фото</th>
                <th class="hidden">id</th>
                <th>Имя</th>
                <th>Фамилия</th>
                <th>Отчество</th>
                <th>Моб.телефон</th>
                <th>Дом.телефон</th>
                <th>Адрес</th>
                <th>Email</th>
                <th></th>
                <th></th>
                </tr>
                <tbody class="list">
                <c:forEach items="${contacts}" var="contact" varStatus="loop">

                    <tr class="well">
                        <td><img class="" src="/img/${contact.id}.jpg" width="75px"height="75px"></td>
                        <td class="hidden">${contact.id}</td>
                        <td class="firstName"><h4>${contact.firstName}</h4></td>
                        <td class="secondName"><p>${contact.secondName}</p></td>
                        <td class="lastName"><p>${contact.lastName}</p></td>
                        <td class="phoneMobile"><p>${contact.phoneMobile}</p></td>
                        <td class="phoneHome"><p>${contact.phoneHome}</p></td>
                        <td class="address"><p>${contact.address}</p></td>
                        <td class="email"><p>${contact.email}</p></td>
                        <td>
                            <button class="btn" onclick="location.href='/edit/${contact.id}'">Изменить</button>
                        </td>
                        <td>
                            <button class="btn" onclick="deleteContact(${contact.id});" type="button">Удалить</button>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <button class="btn button" onclick="location.href='/add'">Добавить</button>
        </div>
    </div>
</div>

<jsp:include page="footer.jsp"/>
</body>
</html>
<script>
    var options = {
        valueNames: ['firstName', 'secondName', 'lastName', 'phoneMobile', 'phoneHome', 'address', 'email']
    };

    var contactList = new List('contacts', options);

    function deleteContact(id) {
        $.ajax({
            type: 'POST',
            url: '/delete/' + id,
            dataType: 'html',
            data: {
                id: id,
            },
            success: function (res, status, xhr) {
                //alert(xhr.getResponseHeader("info"));
                window.location.href = '/';
            }
        });
    }
    ;
</script>