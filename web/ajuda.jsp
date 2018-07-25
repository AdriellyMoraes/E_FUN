<%-- 
    Document   : ajuda
    Created on : 24/07/2018, 10:41:24
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

        <title>E-FUN</title>

        <!-- Bootstrap core CSS -->
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom fonts for this template -->
        <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic" rel="stylesheet" type="text/css">
        <link href='https://fonts.googleapis.com/css?family=Cabin:700' rel='stylesheet' type='text/css'>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

        <!-- Custom styles for this template -->
        <link href="css/grayscale.min.css" rel="stylesheet">



        <style>

            #tela{
                background: black;

            }

            #fale{
                background-color: white;
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

            .foto{
                position: absolute;
                opacity: 0;
                animation-name: animacao;
                animation-duration: 20s;
                animation-iteration-count: infinite;
                max-width: 2000px;
                width: 100%;
                height: auto;
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

            #fundo{
                background-color: white;
            }

            @keyframes animacao{

                25%{
                    opacity:1;
                    transform: scale(1.1, 1.1);
                }

                50%{
                    opacity:0;
                }
            }

            .foto:nth-child(1){

            }

            .foto:nth-child(2){
                animation-delay: 1s;
            }

            .foto:nth-child(3){
                animation-delay: 5s; 
            }

            .foto:nth-child(4){
                animation-delay: 11s; 
            }

            #cor{
                color:black;
            }

            .modal-body{
                max-height: calc(50vh - 50px);
                overflow-y: auto;
            }

            #tom{
                background: rgba (255, 255, 255, 0.3);
            }


        </style>


    </head>

    <body id="page-top">
        <!-- Navigation -->
        <nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
            <div class="container">
                <a class="navbar-brand js-scroll-trigger" href="#page-top"> E-FUN </a>

               
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <input class="w3-input w3-border w3-margin-bottom" style="max-width:500px; max-height: 30px" type="text" placeholder="Pesquise por pessoas, histórias e fóruns" name="usrBirth" required>
                   
                    <ul class="navbar-nav ml-auto">



                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" >Usuário</a>

                            <div class="dropdown-menu">
                                <ul class='list-inline'>
                                    <li> <a class="dropdown-item" href="usuario.html" > <label id="cor">O meu perfil</label></a></li>
                                    <li><a class="dropdown-item" href="#"><label id="cor">Notificações</label></a></li>
                                    <li> <a class="dropdown-item" href="#"><label id="cor"> Minhas histórias</label></a></li>
                                    <li> <a class="dropdown-item" onclick="document.getElementById('config').style.display = 'block'" style="cursor:pointer"> <label id="cor">Configurações</label></a></li>
                                    <li> <a class="dropdown-item" href="index.html" > <label id="cor">Terminar sessão</label></a></li>

                                </ul>
                            </div>
                            <li class="nav-item dropdown">
                    </ul>
                </div>
            </div>
        </nav>



        <div class="w3-container">

            <div id="config" class="w3-modal">
                <div class="w3-modal-content w3-card-4 w3-animate-zoom" style="max-width:600px">

                    <div class="w3-center"><br>
                        <span onclick="document.getElementById('config').style.display = 'none'" class="w3-button w3-xlarge w3-hover-red w3-display-topright" title="Close Modal">&times;</span>

                    </div>

                    <form class="w3-container" name="cadastro" method="post" action="InserirPessoa" target="_parent">
                        <div class="w3-section">
                            <label id="cor"><b>Nome</b></label>
                            <input class="w3-input w3-border w3-margin-bottom" type="text" value="+usrname" name="usrName" required>
                            <label id="cor"><b>Email</b></label>
                            <input class="w3-input w3-border w3-margin-bottom" type="text"  name="usrEmail" required>
                            <label id="cor"><b>Data de nascimento</b></label>
                            <input class="w3-input w3-border w3-margin-bottom" type="text"  name="usrBirth" required>
                            <label id="cor"><b>Nome de usuário</b></label>
                            <input class="w3-input w3-border w3-margin-bottom" type="text" name="usrUser" required>
                            <label id="cor"><b>Senha</b></label>
                            <input class="w3-input w3-border" type="password"  name="psw" required>
                            <button class="w3-button w3-block w3-red w3-section w3-padding" type="submit" id="tom">Excluir conta</button>
                        </div>
                    </form>

                    <div class="w3-container w3-border-top w3-padding-16 w3-light-grey">
                        <button onclick="document.getElementById('config').style.display = 'none'" type="button" class="w3-button w3-red">Cancelar</button>
                        <button class="w3-button w3-block w3-blue w3-section w3-padding" type="submit" id="tom">Atualizar</button>
                        <span class="w3-right w3-padding w3-hide-small"></span>

                    </div>

                </div>
            </div>
        </div>



        <!-- Intro Header -->
        <header class="masthead" id="tela" >
            <div class="intro-body">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-8 mx-auto"> 
                            <form>
                                <div class="form-group">
                                    <label style="color:white; font-size: 15px; margin-left: -144%" >FALE CONOSCO</label>
                                    <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" style="max-width: 500px; min-height: 250px; margin-left: -30%" placeholder="Nos ajude a melhorar, enviando sua dúvida"></textarea>
                                      

                                    <br><button type="submit" class="btn btn-primary" id="tom" style="margin-left:-34%">Enviar</button></br>
                                   
                                </div>
                            </form>
                        </div>
                    </div>
                </div> 
            </div>
        </header>




        

        <!-- Footer -->
        <footer>
            <div class="container text-center">
                <p>Copyright &copy; E-FUN 2018 </p>

            </div>
        </footer>

        <!-- Bootstrap core JavaScript -->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

        <!-- Plugin JavaScript -->
        <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

        <!-- Custom scripts for this template -->
        <script src="js/grayscale.min.js"></script>


    </body>

</html>