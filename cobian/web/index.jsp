<%@ page import="java.util.*" %>
<%
    List<String[]> films = new ArrayList<>();
    // Format: Judul, Genre, Durasi, Harga, Jam Tayang, URL Poster
    films.add(new String[]{"FINAL DESTINATION", "Thriller", "110", "60000", "10:00,13:30,17:00", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTfjnT90RBTdUDDSSs5-jIGV2mIh4vzulwqcw&s"});
    films.add(new String[]{"GODAAN SETAN YANG TERKUTUK", "Horror", "88", "50000", "09:00,11:30,14:00", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTxvXsP7JFlc0ChK5JqSiSqC2QGiTCmdep9gg&s"});
    films.add(new String[]{"PEMBANTAIAN DUKUN SANTET", "Horror", "92", "55000", "12:00,15:00,18:00", "https://m.media-amazon.com/images/M/MV5BNDIwM2VjMzYtYjhhMS00YmVhLWJmNDgtNmRmYjhlMjViMTllXkEyXkFqcGc@._V1_.jpg"});

    application.setAttribute("filmList", films);
%>
<!DOCTYPE html>
<html>
<head>
    <title> Daftar Film</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #667eea, #764ba2);
            padding: 40px 20px;
            color: #fff;
        }

        .card {
            border: none;
            border-radius: 15px;
            overflow: hidden;
            transition: transform 0.3s ease;
            box-shadow: 0 10px 20px rgba(0,0,0,0.3);
        }

        .card:hover {
            transform: scale(1.03);
        }

        .card-img-top {
            height: 320px;
            object-fit: cover;
        }

        .card-body {
            background-color: #ffffff;
            color: #333;
        }

        .card-title {
            font-weight: 700;
            font-size: 1.25rem;
        }

        .btn-primary {
            background-color: #764ba2;
            border: none;
            border-radius: 50px;
            font-weight: 600;
            padding: 10px 20px;
        }

        .btn-primary:hover {
            background-color: #5a368a;
        }

        h2 {
            text-align: center;
            margin-bottom: 40px;
            font-weight: 700;
            color: #fff;
        }

        @media (max-width: 480px) {
            .card-img-top {
                height: 220px;
            }
        }
    </style>
</head>
<body>

<div class="container">
    <h2> Daftar Film Tersedia</h2>
    <div class="row">
        <% for (String[] film : films) { %>
            <div class="col-md-4 mb-4">
                <div class="card h-100">
                    <img src="<%= film[5] %>" class="card-img-top" alt="Poster <%= film[0] %>">
                    <div class="card-body">
                        <h5 class="card-title"><%= film[0] %></h5>
                        <p><strong>Genre:</strong> <%= film[1] %></p>
                        <p><strong>Durasi:</strong> <%= film[2] %> menit</p>
                        <p><strong>Harga:</strong> Rp <%= film[3] %></p>
                        <p><strong>Jam Tayang:</strong> <%= film[4] %></p>
                        <a href="formPesan.jsp?judul=<%= film[0] %>" class="btn btn-primary btn-block">Pesan Tiket</a>
                    </div>
                </div>
            </div>
        <% } %>
    </div>
</div>

</body>
</html>
