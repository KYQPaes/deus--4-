<%@page import="DAO.CupomDAO"%>
<%@page import="Classes.Cupom"%>
<%@page import="java.util.Date"%>
<%@page import="Classes.Cliente"%>
<%@page import="Classes.Endereco"%>
<%@page import="DAO.EnderecoDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="Classes.Cartao"%>
<%@page import="java.util.List"%>
<%@page import="conexao.Conexao"%>
<%@page import="DAO.CartaoDAO"%>
<?xml version="1.0" encoding="UTF-8"?>


<%
    Cliente cliente = (Cliente) session.getAttribute("loguser");
    if(cliente==null){
        response.sendRedirect("login.xhtml");
    }
    
    CupomDAO cupomdata = new CupomDAO(Conexao.getConnection());
    List<Cupom> cupom = cupomdata.selectSpecificCupom(cliente.getId());
    request.setAttribute("Cupom_LIST", cupom);
    

        

%>

<html xmlns="http://www.w3.org/1999/xhtml" xmlns:h="http://java.sun.com/jsf/html" xmlns:f="http://java.sun.com/jsf/core"
    xmlns:p="http://primefaces.org/ui">


<h:head>


    <title>Cupom</title>
    <link rel="stylesheet" href="styles/finalcompra-style.css"/>
    <script src="js/generate_cupom.js"></script>
</h:head>

<h:body>

    <header>
        <div id="header-box">
            <div id='search-box'>
                
            </div>
            <div class="logo">
                <a href="http://localhost:8080/deus-1.0-SNAPSHOT/home-page.xhtml" draggable="false">  
                <img src="images/logo/hotline.png" width="250" height="250" draggable="false" ></img> 
                </a>
            </div>
        </div>
        <div id="icones">

            <div>
                
                
            </div>

            <div class="boxhead">
    
                <a class="otherPage" href="http://localhost:8080/deus-1.0-SNAPSHOT/cupons.jsp" draggable="false">  
                <img src="images/icon/cupom.png" width="40" height="40" draggable="false" ></img> 
                </a>

                          
                <a class="otherPage" href="ControleLogout" draggable="false">  
                <img src="images/icon/logout.png" width="40" height="40" draggable="false" ></img> 
                </a>
    
                
                
                <a class="otherPage" href="http://localhost:8080/deus-1.0-SNAPSHOT/clientes.jsp" draggable="false">  
                <img src="images/icon/setting.png" width="40" height="40" draggable="false" ></img> 
                </a>

                <a class="otherPage" href="http://localhost:8080/deus-1.0-SNAPSHOT/carrinho.jsp" draggable="false">  
                <img src="images/icon/cart.png" width="40" height="40" draggable="false" ></img> 
                </a>

                
                <br> <br> <br> <br>
    

         
            </div>

        </div>
    </header>



    <div id="all">


              <div class="topnav">
                <input type="text" id="search" size="30" placeholder="Pesquise Aqui...">
              <a  id="masculino" href="http://localhost:8080/deus-1.0-SNAPSHOT/compra.jsp?tipo=personalizado">Masculino</a>
              <a  id="feminino" href="http://localhost:8080/deus-1.0-SNAPSHOT/compra.jsp?tipo=feminino">Feminino</a>
              <a  id="personalizada" href="http://localhost:8080/deus-1.0-SNAPSHOT/compra.jsp?tipo=personalizado">Personalizadas</a>
              <a id="carbono"  href="http://localhost:8080/deus-1.0-SNAPSHOT/compra-carbono.xhtml">Carbono</a>
              <a  id="documento" href="http://localhost:8080/deus-1.0-SNAPSHOT/compra-documento.xhtml">Documento</a>
              <a  >   |  </a>
              <a  href="http://localhost:8080/deus-1.0-SNAPSHOT/consulta_produto.jsp" style="color: darkblue">Meus Pedidos</a>
              
               
            </div>
        
        
        <div id="meio">
            <div class="meiomenor">
                
            
            <div>
                <table>

                    <tr>
                        <td>
                            <p><font size="5">Cupons Disponiveis</font></p>
                                <table id="tabela">
                                    <tr>
                                      <th>Cupom</th>
                                      <th>Descricao</th>
                                      <th>Validade</th>
                                      <th>Codigo</th>
                                      
                                    </tr>
                                    
                                    
                                    
                                     <c:forEach var="tempCupom" items="${Cupom_LIST}">
                                        <tr>
                                            <td></td>
                                            <td>${tempCupom.descricao}</td>
                                            <td>${tempCupom.validade}</td>
                                            <td id="code">${tempCupom.codigo}</td>
                                            <td>
                                                <a href="ControleDeleteCupom?id=${tempCupom.id}" draggable="false">  
                                                <img src="images/icon/copy.png" width="30" height="30" onclick="copy()" draggable="false" ></img>
                                                </a>
                                            </td>
                                  
                                    </tr>
                                      </c:forEach>           
                                    
                                                                      
                                  
                                </table>
                        </td>
                    </tr>
                    
                    
                    
                    <tr>
                        <td>
                               
                                
                               
                          
                                

                        </td>
                        
                    </tr>
                    
                    

                   

                </table>
            </div>

                                <form class="form" action="ControleAddCupom" method="POST">
                                <h4>Insira um c�digo de cupom</h4>
                                <input type="text" id="inputcupom" name="codigo_cupom" size="30" placeholder="insira o codigo Aqui..."/>
                                
                                <input type="submit" id="cadastrar" class="cupom" value="Validar"/>
                                
                                <input type="hidden" value="<%= cliente.getId() %>" name="id">
                                
                                </form>                  
            </div>
               
          </div>
            
           
            
        </div>
        
        
        <div id="foot">

            <div id="rodape">
                <article>

                    <p><font size="5">Ajuda</font></p>

                    <br /> 


                    <div id="fonte">

                        <a href="http://localhost:8080/deus-1.0-SNAPSHOT/termos-de-uso.xhtml" style="color: black;" >
                            Termos e condi��es de uso
                        </a> 
                        
                        <br /> <br />
                        
                        <a href="http://localhost:8080/deus-1.0-SNAPSHOT/termos-de-uso.xhtml" style="color: black;">
                            Politicas de troca
                        </a> 
    
    
                        <br /><br />
                        
                        <a href="http://localhost:8080/deus-1.0-SNAPSHOT/termos-de-uso.xhtml" style="color: black;">
                            Politicas de privacidade
                        </a> 
                    </div>


                </article>

                <article>

                    <p><font size="5">Contato</font></p>
                    <br /> 

                    
                    <font size="3" face="Arial"> Email: Atendimento@Hotline.com </font> <br />

                    <br /> <br />
                 
                    <font size="3" face="Arial"> Telefone : (11) 3548-5434 </font> <br />


                    <br /><br />
                
                    <font size="3" face="Arial"> Disponivel segunda a sexta-feira, das 09:00 as 18:00 horas </font> <br />


                </article>

                <article id="social">

                    

                    <p><font size="5">Social</font></p>
                    
                    <font size="3" face="Arial"> Nos encontre em: </font> <br />

                    <br /> <br />
                    <div id="logos">
                        
                 <br /><br />
                    <a href="https://www.instagram.com" draggable="false">  
                    <img src="images/icon/instagram.png" width="50" height="50" draggable="false" ></img> 
                    </a>
                    

                 <br /><br />
                    <a href="https://twitter.com" draggable="false">  
                    <img src="images/icon/twitter.png" width="50" height="50" draggable="false" ></img> 
                    </a>
                 

                    
                    <br /><br />
                    <a href="https://facebook.com" draggable="false">  
                    <img src="images/icon/facebook.png" width="50" height="50" draggable="false" ></img> 
                    </a>

                    <a href="https://youtube.com" draggable="false">  
                    <img src="images/icon/youtube.png" width="55" height="50" draggable="false" ></img> 
                    </a>
                    </div>
                    


                </article>
            </div>
        </div>
    </div>


 
</h:body>

</html>