<%-- 
    Document   : paginaUsuario
    Created on : 17/06/2018, 11:58:55
    Author     : Adrielly Moraes Lustoza
    Author     : Raquel de Albuquerque Maciel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="model.Supervisor"%>
<jsp:useBean id="conexao" scope="page" class="banco_dados.ConexaoBancoDados"/>
<jsp:useBean id="supervisorDao" scope="page" class="banco_dados.SupervisorDao"/>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="Raquel">

        <title>Página do Supervisor</title>

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
        
        <%
            ResultSet rsRegistro;
            boolean conectado;
            
            
            Supervisor sp = new Supervisor();
            String email = request.getParameter("email");
            conectado = false;
            try{
                if(conexao.abrirConexao()){

                    pessoaDao.configurarConexao(conexao.obterConexao());
                    rsRegistro = supervisorDao.listarSupervisor(email);
                    sp.setNomeUsuario(rsRegistro.getString("cpf"));
                    sp.setNome(rsRegistro.getString("nome"));
                    sp.setEmail(rsRegistro.getString("email"));
                    sp.setSenha(rsRegistro.getString("senha"));
                    sp.setDataDemissao(rsRegistro.)
                    
                    conexao.fecharConexao();

                    conectado = true;
                } else {
                    out.println("<p>Falha na conexão com o banco de dados!</p>");
                }
            } catch (Exception erro) {
            erro.printStackTrace();
        }

        %>
        
        <!-- Navigation -->
        <nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
            <div class="container">
                <a class="navbar-brand js-scroll-trigger" href="#page-top"> E-FUN </a>
                <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    Menu
                    <i class="fa fa-bars"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <input class="w3-input w3-border w3-margin-bottom" style="max-width:500px; max-height: 30px" type="text" placeholder="Pesquise por pessoas, histórias e fóruns" name="usrBirth" required>
                    <ul class="navbar-nav ml-auto">

                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" ><%= ps.getNomeUsuario() %></a>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" href="#" > <label id="cor">Link 1</label></a>
                                <a class="dropdown-item" href="#"><label id="cor">Link 2</label></a>
                                <a class="dropdown-item" href="#"><label id="cor">Link 3</label></a>
                            </div>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" >Criar</a>

                            <div class="dropdown-menu">
                                <ul class='list-inline'>
                                    <li> <a class="dropdown-item" href="#" > <label id="cor">História</label></a></li>
                                    <li><a class="dropdown-item" onclick="document.getElementById('criarForum').style.display='block'"><label id="cor">Fórum</label></a></li>
                                </ul>
                            </div>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" >Fóruns</a>

                            <div class="dropdown-menu">
                                <ul class='list-inline'>
                                    <li> <a class="dropdown-item" href="#" > <label id="cor">Link 1</label></a></li>
                                    <li><a class="dropdown-item" href="#"><label id="cor">Link 2</label></a></li>
                                    <li> <a class="dropdown-item" href="#"><label id="cor">Link 3</label></a></li>
                                </ul>
                            </div>

                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#"></a>

                            <div class="dropdown-menu">
                                <ul class='list-inline'>
                                    <li><a class="dropdown-item" href="#"> <i class="fa fa-envelope " style="color:black" >  </i><label id="cor"> Notificações</label></a></li>
                                    <li> <a class="dropdown-item" href="#"><label id="cor"> Minhas histórias</label></a></li>
                                    <li> <a class="dropdown-item" href="ajuda2.html"> <label id="cor"> Ajuda</label></a></li>
                                    <li> <a class="dropdown-item" onclick="document.getElementById('config').style.display = 'block'" style="cursor:pointer"> <label id="cor">Configurações</label></a></li>
                                    <li> <a class="dropdown-item" href="index.html" > <label id="cor">Terminar sessão</label></a></li>

                                </ul>
                            </div>

                    </ul>
                </div>
            </div>
        </nav>

        <div class="w3-container">

            <div id="config" class="w3-modal">
                <div class="w3-modal-content w3-card-4 w3-animate-zoom " style="max-width:600px" >

                    <div class="w3-center"><br>
                        <span onclick="document.getElementById('config').style.display = 'none'" class="w3-button w3-xlarge w3-hover-red w3-display-topright" title="Close Modal">&times;</span>

                    </div>

                    <form class="w3-container" name="atualizar" method="post" action="AtualizarPessoa" target="_parent">
                        <div class="w3-section">
                            <i class="fa fa-user-circle " style="color:black"> </i>
                            <p><input type="hidden" name="nomeUsuario"></p>
                            <label id="cor"><b>Nome</b></label>
                            <input class="w3-input w3-border w3-margin-bottom " id="name"  type="text" value="usrname" name="usrName" required>
                            <i class="fa fa-envelope " style="color:black"> </i>
                            <label id="cor"><b>Email</b></label>
                            <input class="w3-input w3-border w3-margin-bottom" type="text"  name="usrEmail" required>
                            <i class="fa fa-calendar " style="color:black"> </i>
                            <label id="cor"><b>Data de nascimento</b></label>
                            <input class="w3-input w3-border w3-margin-bottom" type="text"  name="usrBirth" required>
                            <i class="fa fa-user " style="color:black"> </i>
                            <label id="cor"><b>Nome de usuário</b></label>
                            <input class="w3-input w3-border w3-margin-bottom" type="text" name="usrUser" required>
                            <i class="fa fa-key " style="color:black"> </i>
                            <label id="cor"><b>Senha</b></label>
                            <input class="w3-input w3-border" type="password"  name="psw" required>      
                        </div>

                        <button class="w3-button w3-blue w3-right w3-margin-bottom w3"  type="submit" id="tom">Atualizar</button>
                    </form>

                    <div class="w3-container w3-border-top w3-padding-16 w3-light-grey">
                        <button onclick="document.getElementById('config').style.display = 'none'" type="submit" class="w3-button w3-red">Cancelar</button>
                        <form name="formExcluir" method="post" action="ExcluirPessoa" target="_parent">
                            <p><input type="hidden" name="nomeUsuario"></p>
                            <button class="w3-button  w3-red w3 w3-right" type="submit" id="tom" onclick="document.getElementById('excluir').style.display = 'block'">Excluir conta</button>
                        </form>
                        <span class="w3-right w3-padding w3-hide-small"></span>

                    </div>

                </div>
            </div>
        </div>
        
          <div class="w3-container">

        <div id="excluir" class="w3-modal">
            <div class="w3-modal-content w3-card-4 w3-animate-zoom text-" style="max-width:600px">

                <div class="w3-center "><br>
                    <span onclick="document.getElementById('excluir').style.display = 'none'" class="w3-button w3-xlarge w3-hover-red w3-display-topright" title="Close Modal">&times;</span>

                </div>

                <form class="w3-container" name="excluir" method="post" action="ExcluirPessoa" target="_parent">
                    <div class="w3-section ">
                        <label id="cor" class="text-danger"><b>Você tem certeza que deseja excluir sua conta? Esta ação é permanente e irreversível. Para confirmar: </b></label>
                        <label id="cor"><b>Email</b></label>
                        <input class="w3-input w3-border w3-margin-bottom" placeholder="Entre com seu email" type="text"  name="usrEmail" required>
                        <label id="cor"><b>Senha</b></label>
                        <input class="w3-input w3-border" placeholder="Entre com sua senha" type="password"  name="psw" required>
                        
                       
                    </div>
                </form>

                <div class="w3-container w3-border-top w3-padding-16 w3-light-grey">
                    <button onclick="document.getElementById('excluir').style.display = 'none'" type="button" class="w3-button w3-red">Cancelar</button>
                     <button class="w3-button  w3-blue w3-right " type="submit" id="tom">Excluir conta</button>
                    <span class="w3-right w3-padding w3-hide-small"></span>

                </div>

            </div>
        </div>
              
          </div>
                            
        
        <div class="w3-container">

            <div id="criarForum" class="w3-modal">
                <div class="w3-modal-content w3-card-4 w3-animate-zoom " style="max-width:600px" >

                    <div class="w3-center"><br>
                        <span onclick="document.getElementById('criarForum').style.display = 'none'" class="w3-button w3-xlarge w3-hover-red w3-display-topright" title="Close Modal">&times;</span>

                    </div>

                    <form class="w3-container" name="criarForum" method="post" action="Atu" target="_parent">
                        <div class="w3-section">
                            <label id="cor"><b>Nome do fórum</b></label>
                            <input class="w3-input w3-border w3-margin-bottom" type="text" name="name" placeholder="Entre com o nome do Fórum" required>
                            <label id="cor"><b>Descrição</b></label>
                             <textarea class="form-control " id="exampleFormControlTextarea1" rows="3" style="max-width: 600px; min-height: 180px;
                             " placeholder="Entre com a descrição"></textarea>
                             <label id="cor" class="w3-margin-top"><b>Privacidade</b></label></br>
                            <input class="w3-check " type="checkbox" checked="checked"><label id="cor"> Privado</label>
                            <input class="w3-check " type="checkbox" checked="checked"> <label id="cor">Público</label>     
                        </div>
                    </form>

                    <div class="w3-container w3-border-top w3-padding-16 w3-light-grey">
                        <button onclick="document.getElementById('criarForum').style.display = 'none'" type="submit" class="w3-button w3-red">Cancelar</button>
                        <button class="w3-button  w3-blue w3 w3-right" type="submit" id="tom" onclick="document.getElementById('excluir').style.display = 'block'">Criar</button>
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
                            <h1 class="brand-heading">E-Fun</h1>
                            <p class="intro-text">                          
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

        <!-- Google Maps API Key - Use your own API key to enable the map feature. More information on the Google Maps API can be found at https://developers.google.com/maps/ -->
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCRngKslUGJTlibkQ3FkfTxj3Xss1UlZDA&sensor=false"></script>

        <!-- Custom scripts for this template -->
        <script src="js/grayscale.min.js"></script>
        
        <script>
        function nome(){
            name = document.getElementById('name');
            document.write(name);
        }
        </script>


    </body>

</html>