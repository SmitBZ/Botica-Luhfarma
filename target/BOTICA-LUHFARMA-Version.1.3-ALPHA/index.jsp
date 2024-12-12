<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="wiewport" conte="width=device-width, initial-scale=1.0">
        <link rel="icon" href="img/logo.ico" type="image/x-icon">
        <link rel="stylesheet" href="css/style.css"/>
        <title>BOTICA LUHFARMA</title>
    </head>
    <body>
        <div class="loading-container" id="loadingScreen">
            <div class="logo-container">
                <center><img src="img/barra.gif" alt="logo" class="logo" style="width: 240px; margin-bottom: 160px;"></center>
                <div class="logo">LUHFARMA</div>
            </div>
            <div class="progress-container">
                <div class="progress-bar">
                    <div class="progress-fill"></div>
                </div>
            </div>
            <div class="loading-text">
                Cargando... Por favor espere
            </div>
        </div>
        <div id="mainContent" class="hidden"></div>
        
        <script src="js/script.js"></script>
    </body>
</html>
