<%-- 
    Document   : paginaUsuario
    Created on : 17/06/2018, 11:58:55
    Author     : Adrielly Moraes Lustoza
    Author     : Raquel de Albuquerque Maciel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="model.Pessoa"%>
<jsp:useBean id="conexao" scope="page" class="banco_dados.ConexaoBancoDados"/>
<jsp:useBean id="pessoaDao" scope="page" class="banco_dados.PessoaDao"/>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="Raquel">

        <title>Página de Usuário</title>

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

            #posiciona {
                position: absolute; /* posição absoluta ao elemento pai, neste caso o BODY */
                /* Posiciona no meio, tanto em relação a esquerda como ao topo */
                left: 10%; 
                top: 40%;
                width: 1200px; /* Largura da DIV */
                height: 800px; /* Altura da DIV */
                /* A margem a esquerda deve ser menos a metade da largura */
                /* A margem ao topo deve ser menos a metade da altura */
                /* Fazendo isso, centralizará a DIV */
                margin-left: -150px;
                margin-top: -125px;
                background-color: #FFF;
                color: #FFF;
                background-color: whitesmoke;
                text-align: center; /* Centraliza o texto */
                z-index: 1000; /* Faz com que fique sobre todos os elementos da página */
            }

            #fechar { margin: 5px; font-size: 12px; }

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

            #rcorners3 {
                border-radius: 15px 50px;
                background:whitesmoke;
                padding: 20px; 
                width: 500px;
                height: 250px; 
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
            
            Pessoa ps = new Pessoa();
            String nomeUsu = request.getParameter("nome_usuario");
            conectado = false;
            try{
                if(conexao.abrirConexao()){

                    pessoaDao.configurarConexao(conexao.obterConexao());
                    rsRegistro = pessoaDao.listarPessoa(nomeUsu);
                    ps.setNomeUsuario(rsRegistro.getString("nomeUsuario"));
                    ps.setNome(rsRegistro.getString("nome"));
                    ps.setEmail(rsRegistro.getString("email"));
                    ps.setSenha(rsRegistro.getString("senha"));
                    ps.setDataNasc(rsRegistro.getString("dataNasc"));
                    
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
                    <input class="w3-input w3-border w3-margin-bottom" style="max-width:900px; max-height: 30px" type="text" placeholder="Pesquise por pessoas, histórias e fóruns" name="pesquisar" required>
                    <ul class="navbar-nav ml-auto">

                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle " data-toggle="dropdown" href="#" >Descubra</a>
                            <div class="dropdown-menu">
                                <ul class="card-columns">
                                    <a class="dropdown-item" href="#" > <label id="cor">Aventura</label></a>
                                    <a class="dropdown-item" href="#"><label id="cor">Ação</label></a>
                                    <a class="dropdown-item" href="#"><label id="cor">Conto</label></a>
                                    <a class="dropdown-item" href="#" > <label id="cor">Espiritual</label></a>
                                    <a class="dropdown-item" href="#"><label id="cor">Fanfic</label></a>
                                    <a class="dropdown-item" href="#"><label id="cor">Fantasia</label></a>
                                    </li>
                                    <li>
                                        <a class="dropdown-item" href="#" > <label id="cor"> Ficção Científica</label></a>
                                        <a class="dropdown-item" href="#"><label id="cor">Ficção Geral</label></a>
                                        <a class="dropdown-item" href="#"><label id="cor">Humor</label></a>
                                        <a class="dropdown-item" href="#"><label id="cor">Não Ficção</label></a>
                                        <a class="dropdown-item" href="#" > <label id="cor">Mistério</label></a>
                                        <a class="dropdown-item" href="#"><label id="cor">Outros gêneros</label></a> 

                                    </li>
                                    <li>

                                        <a class="dropdown-item" href="#"> <label id="cor" >Paranormal</label></a>
                                        <a class="dropdown-item" href="#" > <label id="cor">Poesia</label></a>
                                        <a class="dropdown-item" href="#"><label id="cor">....</label></a>
                                        <a class="dropdown-item" href="#"><label id="cor">Romance</label></a>
                                        <a class="dropdown-item" href="#"><label id="cor">Suspense</label></a>
                                        <a class="dropdown-item" href="#"><label id="cor">Terror</label></a>
                                        </font>
                                    </li>
                                </ul>
                            </div>

                        </li>


                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" >Criar</a>

                            <div class="dropdown-menu">
                                <ul class='list-inline'>
                                    <li> <a class="dropdown-item" onclick="document.getElementById('criacao').style.display = 'block'" > <label id="cor">História</label></a></li>
                                    <li><a class="dropdown-item" onclick="document.getElementById('criarForum').style.display = 'block'"><label id="cor">Fórum</label></a></li>
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
                            <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#">Perfil</a>

                            <div class="dropdown-menu">
                                <ul class='list-inline'>
                                    <li> <a class="dropdown-item" href="#"><label id="cor"> Minhas histórias</label></a></li>
                                    <li> <a class="dropdown-item" onclick="document.getElementById('config').style.display = 'block'" style="cursor:pointer"> <label id="cor">Configurações</label></a></li>
                                    <li> <a class="dropdown-item" value=""> <label id="cor">Terminar sessão</label></a></li>

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
                            <input type="hidden" name="nome_usuario" value="<%=nomeUsu%>">
                            <i class="fa fa-user-circle " style="color:black"> </i>
                            <label id="cor"><b>Nome</b></label>
                            <input class="w3-input w3-border w3-margin-bottom " id="name" value="<%=ps.getNomeUsuario()%>"  type="text" name="usrName" required>
                            <i class="fa fa-calendar " style="color:black"> </i>
                            <label id="cor"><b>Data de nascimento</b></label>
                            <input class="w3-input w3-border w3-margin-bottom" type="date"  name="usrBirth" value="<%=ps.getDataNasc()%>" required>
                            <i class="fa fa-user " style="color:black"> </i>
                            <label id="cor"><b>Nome de usuário</b></label>
                            <input class="w3-input w3-border w3-margin-bottom" type="text" name="usrUser" value="<%=ps.getNomeUsuario()%>" required>
                            <i class="fa fa-key " style="color:black"> </i>
                            <label id="cor"><b>Senha</b></label>
                            <input class="w3-input w3-border" type="password"  name="psw" value="<%=ps.getSenha()%>" required>      
                        </div>

                        <button class="w3-button w3-blue w3-right w3-margin-bottom w3"  type="submit" id="tom">Atualizar</button>
                    </form>

                    <div class="w3-container w3-border-top w3-padding-16 w3-light-grey">
                        <button onclick="document.getElementById('config').style.display = 'none'" type="submit" class="w3-button w3-red">Cancelar</button>
                        <form name="formExcluir" method="post" action="ExcluirPessoa" target="_parent">
                            <input type="hidden" name="nome_usuario" value="<%=nomeUsu%>">
                            <button class="w3-button  w3-red w3 w3-right" type="submit" id="tom" onclick="document.getElementById('excluir').style.display = 'block'">Excluir conta</button>
                        </form>
                        <span class="w3-right w3-padding w3-hide-small"></span>

                    </div>

                </div>
            </div>
        </div>

        <div class="w3-container">

            <div id="excluirPop" class="w3-modal">
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

<div class="w3-container w3-border-top w3-padding-16 w3-light-grey">
                        <button onclick="document.getElementById('excluir').style.display = 'none'" type="button" class="w3-button w3-red">Cancelar</button>
                        <button class="w3-button  w3-blue w3-right " type="submit" id="tom">Excluir conta</button>
                        <span class="w3-right w3-padding w3-hide-small"></span>

                    </div>
                        </div>
                    </form>

                    

                </div>
            </div>
        </div>

        <div class="w3-container">

            <div id="criarForum" class="w3-modal">
                <div class="w3-modal-content w3-card-4 w3-animate-zoom " style="max-width:600px" >

                    <div class="w3-center"><br>
                        <span onclick="document.getElementById('criarForum').style.display = 'none'" class="w3-button w3-xlarge w3-hover-red w3-display-topright" title="Close Modal">&times;</span>

                    </div>

                    <form class="w3-container" name="criarForum" method="post" action="InserirForum" target="_parent">
                        <div class="w3-section">
                            <input type="hidden" name="nome_usuario" value="<%=nomeUsu%>">
                            <label id="cor"><b>Nome do fórum</b></label>
                            <input class="w3-input w3-border w3-margin-bottom" type="text" name="nome" placeholder="Entre com o nome do Fórum" required>
                            <label id="cor"><b>Descrição</b></label>
                            <textarea class="form-control " id="exampleFormControlTextarea1" name="descricao" rows="3" style="max-width: 600px; min-height: 180px;
                                      " placeholder="Entre com a descrição"></textarea>
                            <label id="cor" class="w3-margin-top"><b>Privacidade</b></label></br>
                            <input class="w3-check " name="privado" type="checkbox"><label id="cor"> Privado</label>
                            <input class="w3-check " name="publico" type="checkbox"> <label id="cor">Público</label>     
                        </div>


                        <div class="w3-container w3-border-top w3-padding-16 w3-light-grey">
                            <button onclick="document.getElementById('criarForum').style.display = 'none'" type="submit" class="w3-button w3-red">Cancelar</button>
                            <button class="w3-button  w3-blue w3 w3-right" type="submit" id="tom">Criar</button>
                            <span class="w3-right w3-padding w3-hide-small"></span>

                        </div>
                    </form>

                </div>
            </div>
        </div>

        <div class="w3-container">

            <div id="criacao" class="w3-modal">
                <div class="w3-modal-content w3-card-4 w3-animate-zoom " style="max-width:900px" >

                    <div class="w3-center"><br>
                        <span onclick="document.getElementById('criacao').style.display = 'none'" class="w3-button w3-xlarge w3-hover-red w3-display-topright" title="Close Modal">&times;</span>

                    </div>

                    <form class="w3-container" name="inserirHistoria" method="post" action="InserirHistoria" target="_parent">
                        <div class="w3-section">
                            <div id="dvCentro">
                                <div class="w3-section">
                                    <input type="hidden" name="nome_usuario" value="<%=nomeUsu%>">

                                    <label id="cor"><b>Título</b></label>
                                    <input class="w3-input w3-border w3-margin-bottom " id="name"  type="text" value="" name="titulo" required>

                                    <label id="cor"><b>Categoria</b></label>
                                    <div class="form-group">
                                        <select class="form-control" id="genero">
                                            <option>Aventura</option>
                                            <option>Ação</option>
                                            <option>Conto</option>
                                            <option>Espiritual</option>
                                            <option>Fanfic</option>
                                            <option>Fantasia</option>
                                            <option> Ficção Científica</option>
                                            <option> Ficção Geral</option>
                                            <option> Mistério</option>
                                            <option> Humor</option>
                                             <option>Não Ficção</option>
                                            <option> Outros gêneros</option>
                                             <option>Paranormal</option>
                                             <option>Poesia</option>
                                            <option> Romance</option>
                                             <option>Suspense</option>
                                             <option>Terror</option>
                                        </select>
                                            <label id="cor"><b>Sinopse</b></label>
                                            <textarea class="w3-input w3-border w3-margin-bottom" type="textArea"  name="sinopse" required></textarea>
                                    </div>
                                    <textarea id="txtArtigo" name="txtArtigo"></textarea>
                                </div>
                                <script src="ckeditor/ckeditor.js"></script>
                                <script>
                            CKEDITOR.replace('txtArtigo');
                                </script>  
                            </div>
                            <div class="w3-container w3-border-top w3-padding-16 w3-light-grey">
                                <button class="w3-button w3-blue w3-right w3-margin-bottom w3"  type="submit" id="tom">Salvar</button>
                                <button onclick="document.getElementById('criacao').style.display = 'none'" type="submit" class="w3-button w3-red">Cancelar</button>
                            </div>
                    </form>
                </div>
            </div>
        </div>


        <!-- Intro Header-->
        <header class="masthead" id="tela" >
            <div class="intro-body">
                <div class="container">
                    <div class="row">
                        </p>
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
                                    function nome() {
                                        name = document.getElementById('name');
                                        document.write(name);
                                    }
        </script>


    </body>

</html>
