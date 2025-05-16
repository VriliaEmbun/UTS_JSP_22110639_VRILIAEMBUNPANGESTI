<%@ page import="java.util.*" %>
<%
    String nama = request.getParameter("nama");
    int jumlah = Integer.parseInt(request.getParameter("jumlah"));
    String filmDipilih = request.getParameter("film");
    String jamTayang = request.getParameter("jam");

    List<String[]> films = (List<String[]>) application.getAttribute("filmList");
    int harga = 0;

    for (String[] film : films) {
        if (film[0].equals(filmDipilih)) {
            harga = Integer.parseInt(film[3]);
            break;
        }
    }

    int total = jumlah * harga;
%>
<!DOCTYPE html>
<html>
<head>
    <title>Tiket Bioskop</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" />

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Share+Tech+Mono&family=Poppins:wght@400;600&display=swap" rel="stylesheet" />

    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: #1e1e2f;
            color: #fff;
            padding: 40px 15px;
        }

        .ticket {
            max-width: 600px;
            margin: auto;
            background: #fff;
            color: #000;
            border-radius: 15px;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.4);
            padding: 30px 25px;
            font-family: 'Share Tech Mono', monospace;
            position: relative;
        }

        .ticket::before, .ticket::after {
            content: "";
            position: absolute;
            width: 20px;
            height: 20px;
            background: #1e1e2f;
            border-radius: 50%;
            top: 50%;
            transform: translateY(-50%);
            z-index: 10;
        }

        .ticket::before {
            left: -10px;
        }

        .ticket::after {
            right: -10px;
        }

        .ticket-header {
            border-bottom: 2px dashed #444;
            padding-bottom: 10px;
            margin-bottom: 20px;
            text-align: center;
        }

        .ticket-header h2 {
            font-weight: 700;
            margin: 0;
            font-size: 24px;
            letter-spacing: 1px;
        }

        .ticket-body table {
            width: 100%;
        }

        .ticket-body th {
            text-align: left;
            width: 40%;
            padding: 8px 0;
            color: #444;
        }

        .ticket-body td {
            padding: 8px 0;
            font-weight: 600;
        }

        .barcode {
            margin-top: 25px;
            text-align: center;
        }

        .barcode img {
            max-width: 180px;
        }

        .actions {
            text-align: center;
            margin-top: 30px;
        }

        .btn-custom {
            margin: 0 10px;
            font-weight: 600;
            border-radius: 50px;
            padding: 10px 25px;
            transition: all 0.3s ease;
        }

        .btn-custom.btn-primary {
            background-color: #6c63ff;
            color: #fff;
            border: none;
        }

        .btn-custom.btn-primary:hover {
            background-color: #5848c2;
            transform: translateY(-2px);
        }

        .btn-custom.btn-danger {
            background-color: #ff4b5c;
            color: #fff;
            border: none;
        }

        .btn-custom.btn-danger:hover {
            background-color: #d83743;
            transform: translateY(-2px);
        }
    </style>
</head>
<body>
    <div class="ticket">
        <div class="ticket-header">
            <h2>TIKET BIOSKOP</h2>
        </div>

        <div class="ticket-body">
            <table>
                <tr>
                    <th>Nama Pemesan</th>
                    <td><%= nama %></td>
                </tr>
                <tr>
                    <th>Film</th>
                    <td><%= filmDipilih %></td>
                </tr>
                <tr>
                    <th>Jam Tayang</th>
                    <td><%= jamTayang %></td>
                </tr>
                <tr>
                    <th>Jumlah Tiket</th>
                    <td><%= jumlah %></td>
                </tr>
                <tr>
                    <th>Total Harga</th>
                    <td>Rp <%= String.format("%,d", total).replace(',', '.') %></td>
                </tr>
            </table>

            <div class="barcode">
                <img src="https://api.qrserver.com/v1/create-qr-code/?data=<%= nama %>_<%= filmDipilih %>_<%= jamTayang %>&size=100x100" alt="barcode">
            </div>
        </div>

        <div class="actions">
            <a href="index.jsp" class="btn btn-custom btn-primary">Beranda</a>
            <a href="dologout.jsp" class="btn btn-custom btn-danger">Logout</a>
        </div>
    </div>
</body>
</html>
