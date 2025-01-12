<%@ page import="servlets.Item" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
<div class="container">
    <nav class="navbar navbar-expand-lg bg-body-tertiary" style="background-color: #003366 !important;">
        <div class="container-fluid">
            <a class="navbar-brand fw-bold" href="#" style="color: white;">TASK MANAGER</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link fw-bold" href="/task1" style="color: white;">Все задания</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <br>

    <div class="add-item-button">
        <button class="btn btn-primary"
                data-bs-toggle="modal"
                data-bs-target="#addTaskModal"
                style="background-color: #003366; border-color: #003366; color: white;">
            + Добавить задание
        </button>
    </div>

    <%
        List<Item> itemList = (List<Item>) request.getAttribute("tovary");
    %>

    <table class="table">
        <thead>
        <tr>
            <th scope="col">ID</th>
            <th scope="col">Наименование</th>
            <th scope="col">Выполнено</th>
            <th scope="col">Крайний срок</th>
            <th scope="col">Детали</th>
        </tr>
        </thead>
        <tbody>
        <%
            if(itemList != null) {
                for(Item item:itemList){
                    item.getName();
        %>
        <tr>
            <th scope="row"><%=item.getId()%></th>
            <td><%=item.getName()%></td>
            <td><%=item.getDescription()%></td>
            <td><%=item.getDeadlineDate()%></td>
            <td><a href ="/details?nomer=<%=item.getId()%>" style="background-color: #003366; border-color: #003366; color: white; text-decoration: none;">Детали</a></td>
        </tr>
        <%
                }
            }
        %>
        </tbody>
    </table>

    <div class="modal fade" id="addTaskModal" tabindex="-1" aria-labelledby="addTaskModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" style="max-width: 80%; margin-top: 5%;">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="addTaskModalLabel">Новое задание</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form action="/addItem" method="post">
                        <div style="margin-bottom: 15px;">
                            <label class="form-label" style="display: block; margin-bottom: 5px;">Наименование :</label>
                            <input class="form-control" type="text" name="name" placeholder="Наименование..."
                                   style="width: 100%; padding: 10px; border: 1px solid #ccc; border-radius: 5px; font-size: 16px;">
                        </div>
                        <div style="margin-bottom: 15px;">
                            <label class="form-label" style="display: block; margin-bottom: 5px;">Описание :</label>
                            <textarea class="form-control" name="description" placeholder="Описание..."
                                      style="width: 100%; height: 300px; padding: 10px; border: 1px solid #ccc; border-radius: 5px; font-size: 16px;">
                    </textarea>
                        </div>
                        <div style="margin-bottom: 15px;">
                            <label class="form-label" style="display: block; margin-bottom: 5px;">Крайний срок :</label>
                            <input class="form-control" type="date" name="deadline"
                                   style="width: 100%; padding: 10px; border: 1px solid #ccc; border-radius: 5px; font-size: 16px;">
                        </div>
                        <div style="text-align: right;">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal"
                                    style="padding: 10px 20px; margin-right: 10px; border: none; background: #a39999; border-radius: 5px; font-size: 16px; cursor: pointer;">
                                Закрыть
                            </button>
                            <button type="submit" class="btn btn-success"
                                    style="padding: 10px 20px; border: none; background: #003366; color: white; border-radius: 5px; font-size: 16px; cursor: pointer;">
                                Добавить
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
