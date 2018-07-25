<%-- 
    Document   : inicial
    Created on : 18/06/2018, 14:13:49
    Author     : Aluno
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Erro 404</title>

        <!-- Bootstrap core CSS -->
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom fonts for this template -->
        <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">      
        <link href="vendor/font-awesome/css/italic.css" rel="stylesheet" type="text/css">
        <link href="vendor/font-awesome/css/family.css" rel="stylesheet" type="text/css">
        <link href="vendor/font-awesome/css/w3.css" rel="stylesheet" type="text/css">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Custom styles for this template -->
        <link href="css/grayscale.min.css" rel="stylesheet">

        <style>

            #tela{
                background: url(IMG/SPC1batata.jpg) no-repeat center center fixed;
                background-size: cover; /*Css padrão*/
                -webkit-background-size: cover; /*Css safari e chrome*/
                -moz-background-size: cover; /*Css firefox*/
                -ms-background-size: cover; /*Css IE não use mer#^@%#*/
                -o-background-size: cover; /*Css Opera*/

            }

           

            *{
                margin: 0px;
                padding: 0px;
            }

            .galeria{
                margin: 200px auto;
                width: 480px;
                height: 270px;
                position: relative;
                overflow: hidden;

            }



            .foto img{
                max-width: 2000px;   /* Máximo da largura da imagem */
                width: 100%;
                max-height: 500px;  /* Máximo da altura da imagem */
                min-height: auto;      /* Mínimo da altura, por padrão “auto” */
                background-size:100%;
                background-repeat: no-repeat;
            }

            fieldset
            {
                color: #000a40;
                text-align: center;
                width:500px;
                height:380px;
                border-radius: 10px;
            }

            #area
            {
                left: 29%;
                position:relative;
                top:3em;
                width:320px;
                height:270px;
            }






        </style>


    </head>

    <body id="page-top">
        <!-- Navigation -->
        <nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
            <div class="container">
                <a class="navbar-brand js-scroll-trigger" href="#page-top"> E-FUN </br> </a>          
                <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    Menu
                    <i class="fa fa-bars"></i>
                </button>
            </div>
        </nav>



        <!-- Intro Header -->
        <header class="masthead" id="tela">
            <div class="intro-body">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-8 mx-auto">
                            <h2>;( Algo de errado aconteceu</h2>
                            <h3>Senha incorreta!</h3>
                             <br><button type="submit" class="btn btn-primary" id="tom" onclick="history.go(-1)">Tente novamente</button></br>
                            <p class="intro-text"> 
                        </div>
                    </div>
                </div> 
            </div>
        </header>

        <!-- About Section -->




        <!-- Bootstrap core JavaScript -->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

        <!-- Plugin JavaScript -->
        <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

        <!-- Google Maps API Key - Use your own API key to enable the map feature. More information on the Google Maps API can be found at https://developers.google.com/maps/ -->


        <!-- Custom scripts for this template -->
        <script src="js/grayscale.min.js"></script>

        <link href="vendor/font-awesome/css/ajax.js" rel="stylesheet" type="text/css">
        <link href="vendor/font-awesome/css/max.js" rel="stylesheet" type="text/css">





    </body>

</html>