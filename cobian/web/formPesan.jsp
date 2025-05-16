<%@ page import="java.util.*" %>
<%
    List<String[]> films = (List<String[]>) application.getAttribute("filmList");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Form Pemesanan Tiket</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <!-- Bootstrap + Google Fonts + Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(to right, #141e30, #243b55);
            color: #fff;
            min-height: 100vh;
            padding: 40px 0;
        }

        .form-box {
            background-color: #ffffff10;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 0 30px rgba(0,0,0,0.3);
            backdrop-filter: blur(10px);
        }

        .form-box h2 {
            text-align: center;
            margin-bottom: 30px;
            font-weight: 600;
        }

        label {
            font-weight: 500;
        }

        .form-control {
            border-radius: 8px;
            background-color: #fff;
        }

        .btn-success {
            background: #28a745;
            border: none;
            border-radius: 8px;
            padding: 10px;
            font-weight: 600;
            transition: background 0.3s ease;
        }

        .btn-success:hover {
            background: #218838;
        }

        .header-icon {
            font-size: 40px;
            color: #ffc107;
            margin-bottom: 10px;
            text-align: center;
        }

        @media (max-width: 576px) {
            .form-box {
                padding: 25px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="col-md-8 col-lg-6 mx-auto form-box">
            <div class="header-icon">
                <i class="fas fa-ticket-alt"></i>
            </div>
            <h2>Form Pemesanan Tiket</h2>

            <form action="struk.jsp" method="post">
                <div class="form-group">
                    <label>Nama Pemesan:</label>
                    <input type="text" name="nama" class="form-control" required placeholder="Masukkan nama Anda">
                </div>

                <div class="form-group">
                    <label>Jumlah Tiket:</label>
                    <input type="number" name="jumlah" class="form-control" required min="1" placeholder="Jumlah tiket">
                </div>

                <div class="form-group">
                    <label>Film:</label>
                    <select name="film" class="form-control" required>
                        <option disabled selected>Pilih Film</option>
                        <% for (String[] film : films) { %>
                            <option value="<%= film[0] %>"><%= film[0] %></option>
                        <% } %>
                    </select>
                </div>

                <div class="form-group">
                    <label>Jam Tayang:</label>
                    <select name="jam" class="form-control" required>
                        <option disabled selected>Pilih Jam</option>
                        <option value="09:00">09:00</option>
                        <option value="11:30">11:30</option>
                        <option value="14:00">14:00</option>
                        <option value="16:30">16:30</option>
                        <option value="19:00">19:00</option>
                    </select>
                </div>

                <button type="submit" class="btn btn-success btn-block">Cetak Struk</button>
            </form>
        </div>
    </div>
</body>
</html>
