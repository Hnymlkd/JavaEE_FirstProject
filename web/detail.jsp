<%@ page import="servlets.Item" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        .form-container {
            max-width: 600px;
            margin: 0 auto;
        }

        .form-control-large {
            height: 200px;
        }
    </style>
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

    <div class="form-container">
        <%
            Item item = (Item) request.getAttribute("tovary");
            if(item != null){
        %>
        <form method="post" action="/save">
            <label class="form-label">Наименование :</label>
            <input type="hidden" value="<%=item.getId()%>" name="idishka">
            <input class="form-control" type="text" name="name" value="<%=item.getName()%>">

            <label class="form-label">Описание :</label>
            <textarea class="form-control form-control-large" name="description"><%=item.getDescription()%></textarea>

            <label class="form-label">Крайний срок :</label>
            <input class="form-control" type="date" name="deadlineDate" value="<%=item.getDeadlineDate()%>">

            <div style="display: flex; justify-content: space-between; margin-top: 10px;">
                <button class="btn btn-success">Сохранить</button>
            </div>
        </form>
        <form method="post" action="/delete">
            <input type = "hidden" value ="<%=item.getId()%>" name="idishka">
            <button class = "btn btn-danger">Удалить</button>
        </form>
        <%
            }
        %>
        </form>
    </div>
</div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
