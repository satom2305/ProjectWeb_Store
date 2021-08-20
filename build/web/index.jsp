<%-- 
    Document   : index
    Created on : Jul 14, 2021, 8:40:50 PM
    Author     : Admin
--%>

<%@page import="java.util.List"%>
<%@page import="entity.Account"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">    
        <title>Daily Shop | Home</title>

        <!-- Font awesome -->
        <link href="css/font-awesome.css" rel="stylesheet">
        <!-- Bootstrap -->
        <link href="css/bootstrap.css" rel="stylesheet">   
        <!-- SmartMenus jQuery Bootstrap Addon CSS -->
        <link href="css/jquery.smartmenus.bootstrap.css" rel="stylesheet">
        <!-- Product view slider -->
        <link rel="stylesheet" type="text/css" href="css/jquery.simpleLens.css">    
        <!-- slick slider -->
        <link rel="stylesheet" type="text/css" href="css/slick.css">
        <!-- price picker slider -->
        <link rel="stylesheet" type="text/css" href="css/nouislider.css">
        <!-- Theme color -->
        <link id="switcher" href="css/theme-color/default-theme.css" rel="stylesheet">
        <!-- <link id="switcher" href="css/theme-color/bridge-theme.css" rel="stylesheet"> -->
        <!-- Top Slider CSS -->
        <link href="css/sequence-theme.modern-slide-in.css" rel="stylesheet" media="all">

        <!-- Main style sheet -->
        <link href="css/style.css" rel="stylesheet">    

        <!-- Google Font -->
        <link href='https://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>
        <link href='https://fonts.googleapis.com/css?family=Raleway' rel='stylesheet' type='text/css'>


        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->


    </head>
    <body> 
        <!-- wpf loader Two -->
        <div id="wpf-loader-two">          
            <div class="wpf-loader-two-inner">
                <span>Loading</span>
            </div>
        </div> 
        <!-- / wpf loader Two -->       
        <!-- SCROLL TOP BUTTON -->
        <a class="scrollToTop" href="#"><i class="fa fa-chevron-up"></i></a>
        <!-- END SCROLL TOP BUTTON -->


        <!-- Start header section -->
        <header id="aa-header">
            <!-- start header top  -->
            <div class="aa-header-top">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="aa-header-top-area">
                                <!-- start header top left -->
                                <div class="aa-header-top-left">
                                    <!-- start language -->
                                    <div class="aa-language">
                                        <div class="dropdown">
                                            <a class="btn dropdown-toggle" href="#" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                                                <img src="img/flag/english.jpg" alt="english flag">ENGLISH
                                                <span class="caret"></span>
                                            </a>
                                            <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                                                <li><a href="#"><img src="img/flag/french.jpg" alt="">FRENCH</a></li>
                                                <li><a href="#"><img src="img/flag/english.jpg" alt="">ENGLISH</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <!-- / language -->

                                    <!-- start currency -->
                                    <div class="aa-currency">
                                        <div class="dropdown">
                                            <a class="btn dropdown-toggle" href="#" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                                                <i class="fa fa-usd"></i>USD
                                                <span class="caret"></span>
                                            </a>
                                            <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                                                <li><a href="#"><i class="fa fa-euro"></i>EURO</a></li>
                                                <li><a href="#"><i class="fa fa-jpy"></i>YEN</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <!-- / currency -->
                                    <!-- start cellphone -->
                                    <div class="cellphone hidden-xs">
                                        <p><span class="fa fa-phone"></span>00-62-658-658</p>
                                    </div>
                                    <!-- / cellphone -->
                                </div>
                                <!-- / header top left -->
                                <div class="aa-header-top-right">
                                    <ul class="aa-head-top-nav-right">
                                        <%
                                            if (session.getAttribute("user") == null) {
                                        %>
                                        <!--data-toggle="modal" data-target="#login-modal"-->
                                        <li><a href="account.jsp">My Account</a></li>
                                        <li class="hidden-xs"><a href="wishlist.jsp">Wishlist</a></li>
                                        <li class="hidden-xs"><a href="cart.jsp">My Cart</a></li>
                                        <li class="hidden-xs"><a href="checkout.jsp">Checkout</a></li>
                                        <li><a href="account.jsp" >Login</a></li>
                                            <%
                                            } else if (session.getAttribute("role").equals(1)) {
                                                String user = (String) session.getAttribute("user");
                                            %>
                                        <li><a>Dear <%=user%></a></li>
                                        <li class="hidden-xs"><a href="Detail.jsp">Admin</a></li>
                                        <li class="hidden-xs"><a href="wishlist.jsp">Wishlist</a></li>
                                        <li class="hidden-xs"><a href="cart.jsp">My Cart</a></li>
                                        <li class="hidden-xs"><a href="checkout.jsp">Checkout</a></li>
                                        <!--data-toggle="modal" data-target="#login-modal"-->
                                        <li><a href="account.jsp" >Logout</a></li>
                                            <%
                                            } else {
                                                String user = (String) session.getAttribute("user");
                                            %>
                                        <li><a>Dear <%=user%></a></li>
                                        <li class="hidden-xs"><a href="wishlist.jsp">Wishlist</a></li>
                                        <li class="hidden-xs"><a href="cart.jsp">My Cart</a></li>
                                        <li class="hidden-xs"><a href="checkout.jsp">Checkout</a></li>
                                        <!--data-toggle="modal" data-target="#login-modal"-->
                                        <li><a href="account.jsp" >Logout</a></li>
                                            <%}%>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- / header top  -->

            <!-- start header bottom  -->
            <div class="aa-header-bottom">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="aa-header-bottom-area">
                                <!-- logo  -->
                                <div class="aa-logo">
                                    <!-- Text based logo -->
                                    <a href="index.jsp">
                                        <span class="fa fa-shopping-cart"></span>
                                        <p>daily<strong>Shop</strong> <span>Your Shopping Partner</span></p>
                                    </a>
                                    <!-- img based logo -->
                                    <!-- <a href="index.jsp"><img src="img/logo.jpg" alt="logo img"></a> -->
                                </div>
                                <!-- / logo  -->
                                <!-- cart box -->
                                
                                <!-- / cart box -->
                                <!-- search box -->
                                
                                <!-- / search box -->             
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- / header bottom  -->
        </header>
        <!-- / header section -->
        <!-- menu -->
        <section id="menu">
            <div class="container">
                <div class="menu-area">
                    <!-- Navbar -->
                    <div class="navbar navbar-default" role="navigation">
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                                <span class="sr-only">Toggle navigation</span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>          
                        </div>
                        <div class="navbar-collapse collapse">
                            <!-- Left nav -->
                            <ul class="nav navbar-nav">
                                <li><a href="index.jsp">Home</a></li>                               
                    </div>
                </div>       
            </div>
        </section>
        <!-- / menu -->
        <!-- Start slider -->
        <section id="aa-slider">
            <div class="aa-slider-area">
                <div id="sequence" class="seq">
                    <div class="seq-screen">
                        <ul class="seq-canvas">
                            <!-- single slide item -->
                            <li>
                                <div class="seq-model">
                                    <img data-seq style="width:1600px;height:700px;" src="https://int.stadiumgoods.com/BWStaticContent/54000/6f0db9c2-330c-43c0-8698-cd3840575baf_200810-header-websiterefresh-womens.jpg" alt="Men slide img" />
                                </div>
                                <div class="seq-title">
                                    <!--                                    <span data-seq>Save Up to 75% Off</span>                -->
                                    <h2 data-seq>NIKE Collection</h2>                
                                    <p data-seq>All the must-have releases from Nike, with everything from icons like the Nike Air Force 1 and Nike Air Max line, to Nike SB, to the latest in-demand collaborations from the famous footwear brand known and loved across the globe.</p>
                                    <a data-seq href="#" class="aa-shop-now-btn aa-secondary-btn">SHOP NOW</a>
                                </div>
                            </li>
                            <!-- single slide item -->
                            <li>
                                <div class="seq-model">
                                    <img data-seq style="width:1600px;height:700px;" src="https://int.stadiumgoods.com/BWStaticContent/54000/c09ec25a-e757-442b-9360-e47fd053eee5_210623-headers-jordan.jpg" alt="Wristwatch slide img" />
                                </div>
                                <div class="seq-title">
                                    <!--                                    <span data-seq>Save Up to 40% Off</span>                -->
                                    <h2 data-seq>Jordan Collection</h2>                
                                    <p data-seq>Take flight. As soon as the Air Jordan line debuted in 1985, it started shaping sneaker culture as we know it today. Find all the legendary models including the Air Jordan 1, Air Jordan 3, Air Jordan 6, and Air Jordan 11 here.</p>
                                    <a data-seq href="#" class="aa-shop-now-btn aa-secondary-btn">SHOP NOW</a>
                                </div>
                            </li>
                            <!-- single slide item -->
                            <li>
                                <div class="seq-model">
                                    <img data-seq style="width:1600px;height:700px;" src="https://int.stadiumgoods.com/BWStaticContent/54000/c291ed79-cf38-4fdb-9edd-4ca20ef51c4f_210623-headers-adidas-02.jpg" alt="Women Jeans slide img" />
                                </div>
                                <div class="seq-title">
                                    <!--                                    <span data-seq>Save Up to 75% Off</span>                -->
                                    <h2 data-seq>ADIDAS Collection</h2>                
                                    <p data-seq>The "Brand with the 3 Stripes" is a legend, birthing classics from the Stan Smith to the Superstar before reinventing itself with NMD, Ultra Boost, and its Yeezy collection.</p>
                                    <a data-seq href="#" class="aa-shop-now-btn aa-secondary-btn">SHOP NOW</a>
                                </div>
                            </li>
                            <!-- single slide item -->           
                            <li>
                                <div class="seq-model">
                                    <img data-seq style="width:1600px;height:700px;" src="https://int.stadiumgoods.com/BWStaticContent/54000/e672d82b-4683-4294-a47f-882edd508d59_header-extra-dunk-ct5050-500.jpg" alt="Shoes slide img" />
                                </div>
                                <div class="seq-title">
                                    <!--                                    <span data-seq>Save Up to 75% Off</span>                -->
                                    <h2 data-seq>Dunk Collection</h2>                
                                    <p data-seq>Originally a basketball shoe from 1985, the Dunk has gone on to become one of Nike’s most iconic models</p>
                                    <a data-seq href="#" class="aa-shop-now-btn aa-secondary-btn">SHOP NOW</a>
                                </div>
                            </li>
                            <!-- single slide item -->  
                            <li>
                                <div class="seq-model">
                                    <img data-seq style="width:1600px;height:700px;" src="https://int.stadiumgoods.com/BWStaticContent/54000/63941fec-d571-40aa-b1f4-e000e482ff11_210623-headers-yeezy.jpg" alt="Male Female slide img" />
                                </div>
                                <div class="seq-title">
                                    <!--                                    <span data-seq>Save Up to 50% Off</span>                -->
                                    <h2 data-seq>YEEZY Collection</h2>                
                                    <p data-seq>Few people have had a larger or more lasting impact on sneaker culture than Kanye West. Find all of his bold, boundary-pushing footwear from Nike and adidas here, including the landmark Yeezy 350 and Yeezy 700.</p>
                                    <a data-seq href="#" class="aa-shop-now-btn aa-secondary-btn">SHOP NOW</a>
                                </div>
                            </li>                   
                        </ul>
                    </div>
                    <!-- slider navigation btn -->
                    <fieldset class="seq-nav" aria-controls="sequence" aria-label="Slider buttons">
                        <a type="button" class="seq-prev" aria-label="Previous"><span class="fa fa-angle-left"></span></a>
                        <a type="button" class="seq-next" aria-label="Next"><span class="fa fa-angle-right"></span></a>
                    </fieldset>
                </div>
            </div>
        </section>
        
        <!-- Products section -->
        <section id="aa-product">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="row">
                            <div class="aa-product-area">
                                <div class="aa-product-inner">
                                    <!-- start prduct navigation -->
                                    <ul class="nav nav-tabs aa-products-tab">
                                        <c:forEach items="${requestScope.cates}" var="c">
                                            <li><a href="#" data-toggle="tab">${c.cateName}</a></li>
                                            </c:forEach>
                                    </ul>
                                    <!-- Tab panes -->
                                    <div class="tab-content">
                                        <!-- Start men product category -->
                                        <div class="tab-pane fade in active" id="men">
                                            <ul class="aa-product-catg">
                                                <!-- start single product item -->

                                                <!-- start single product item -->

                                                <!-- start single product item -->

                                                <form action="ControllerProduct" method="POST">
                                                    <c:forEach items="${requestScope.products}" var="c">
                                                        <li>
                                                            <figure>
                                                                <a class="aa-product-img" href="#"><img src="${c.image}" alt="polo shirt img" style="width:265px;height:190px;"></a>
                                                                <a class="aa-add-card-btn"href="ControllerProduct?service=add2Cart&pid=${c.pid}"><span class="fa fa-shopping-cart"></span>Add To Cart</a>
                                                                <figcaption>
                                                                    <h4 class="aa-product-title"><a href="#">${c.pname}</a></h4>
                                                                    <span class="aa-product-price">${c.price}$</span>
                                                                </figcaption>
                                                            </figure>                                        
                                                        </li>
                                                    </c:forEach>
                                                </form>
                                                <!-- start single product item -->

                                                <!-- start single product item -->     

                                                <!-- start single product item -->

                                                <!-- start single product item -->

                                                <!-- start single product item -->

                                            </ul>
                                            <a class="aa-browse-btn" href="#">Browse all Product <span class="fa fa-long-arrow-right"></span></a>
                                        </div>
                                        <!-- / men product category -->
                                        <!-- start women product category -->
                                        <div class="tab-pane fade" id="women">
                                            <ul class="aa-product-catg">
                                                <!-- start single product item -->
                                                <li>
                                                    <figure>
                                                        <a class="aa-product-img" href="#"><img src="img/women/girl-1.png" alt="polo shirt img"></a>
                                                        <a class="aa-add-card-btn"href="#"><span class="fa fa-shopping-cart"></span>Add To Cart</a>
                                                        <figcaption>
                                                            <h4 class="aa-product-title"><a href="#">This is Title</a></h4>
                                                            <span class="aa-product-price">$45.50</span><span class="aa-product-price"><del>$65.50</del></span>
                                                        </figcaption>
                                                    </figure>                         
                                                    <div class="aa-product-hvr-content">
                                                        <a href="#" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><span class="fa fa-heart-o"></span></a>
                                                        <a href="#" data-toggle="tooltip" data-placement="top" title="Compare"><span class="fa fa-exchange"></span></a>
                                                        <a href="#" data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal" data-target="#quick-view-modal"><span class="fa fa-search"></span></a>                            
                                                    </div>
                                                    <!-- product badge -->
                                                    <!--                                                    <span class="aa-badge aa-sale" href="#">SALE!</span>-->
                                                </li>
                                                <!-- start single product item -->
                                                <li>
                                                    <figure>
                                                        <a class="aa-product-img" href="#"><img src="img/women/girl-2.png" alt="polo shirt img"></a>
                                                        <a class="aa-add-card-btn"href="#"><span class="fa fa-shopping-cart"></span>Add To Cart</a>
                                                        <figcaption>
                                                            <h4 class="aa-product-title"><a href="#">Lorem ipsum doller</a></h4>
                                                            <span class="aa-product-price">$45.50</span>
                                                        </figcaption>
                                                    </figure>                         
                                                    <div class="aa-product-hvr-content">
                                                        <a href="#" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><span class="fa fa-heart-o"></span></a>
                                                        <a href="#" data-toggle="tooltip" data-placement="top" title="Compare"><span class="fa fa-exchange"></span></a>
                                                        <a href="#" data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal" data-target="#quick-view-modal"><span class="fa fa-search"></span></a>
                                                    </div>
                                                    <!-- product badge -->
                                                    <!--                                                    <span class="aa-badge aa-hot" href="#">HOT!</span>-->
                                                </li>
                                                <!-- start single product item -->
                                                <li>
                                                    <figure>
                                                        <a class="aa-product-img" href="#"><img src="img/women/girl-3.png" alt="polo shirt img"></a>
                                                        <a class="aa-add-card-btn"href="#"><span class="fa fa-shopping-cart"></span>Add To Cart</a>
                                                        <figcaption>
                                                            <h4 class="aa-product-title"><a href="#">Lorem ipsum doller</a></h4>
                                                            <span class="aa-product-price">$45.50</span><span class="aa-product-price"><del>$65.50</del></span>
                                                        </figcaption>
                                                    </figure>                         
                                                    <div class="aa-product-hvr-content">
                                                        <a href="#" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><span class="fa fa-heart-o"></span></a>
                                                        <a href="#" data-toggle="tooltip" data-placement="top" title="Compare"><span class="fa fa-exchange"></span></a>
                                                        <a href="#" data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal" data-target="#quick-view-modal"><span class="fa fa-search"></span></a>
                                                    </div>
                                                </li>
                                                <!-- start single product item -->
                                                <li>
                                                    <figure>
                                                        <a class="aa-product-img" href="#"><img src="img/women/girl-4.png" alt="polo shirt img"></a>
                                                        <a class="aa-add-card-btn"href="#"><span class="fa fa-shopping-cart"></span>Add To Cart</a>
                                                        <figcaption>
                                                            <h4 class="aa-product-title"><a href="#">Lorem ipsum doller</a></h4>
                                                            <span class="aa-product-price">$45.50</span><span class="aa-product-price"><del>$65.50</del></span>
                                                        </figcaption>
                                                    </figure>                          
                                                    <div class="aa-product-hvr-content">
                                                        <a href="#" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><span class="fa fa-heart-o"></span></a>
                                                        <a href="#" data-toggle="tooltip" data-placement="top" title="Compare"><span class="fa fa-exchange"></span></a>
                                                        <a href="#" data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal" data-target="#quick-view-modal"><span class="fa fa-search"></span></a>
                                                    </div>
                                                    <!-- product badge -->
                                                    <!--                                                    <span class="aa-badge aa-sold-out" href="#">Sold Out!</span>-->
                                                </li>
                                                <!-- start single product item -->
                                                <li>
                                                    <figure>
                                                        <a class="aa-product-img" href="#"><img src="img/women/girl-5.png" alt="polo shirt img"></a>
                                                        <a class="aa-add-card-btn"href="#"><span class="fa fa-shopping-cart"></span>Add To Cart</a>
                                                        <figcaption>
                                                            <h4 class="aa-product-title"><a href="#">Lorem ipsum doller</a></h4>
                                                            <span class="aa-product-price">$45.50</span>
                                                        </figcaption>
                                                    </figure>

                                                    <div class="aa-product-hvr-content">
                                                        <a href="#" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><span class="fa fa-heart-o"></span></a>
                                                        <a href="#" data-toggle="tooltip" data-placement="top" title="Compare"><span class="fa fa-exchange"></span></a>
                                                        <a href="#" data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal" data-target="#quick-view-modal"><span class="fa fa-search"></span></a>
                                                    </div>
                                                </li>
                                                <!-- start single product item -->
                                                <li>
                                                    <figure>
                                                        <a class="aa-product-img" href="#"><img src="img/women/girl-6.png" alt="polo shirt img"></a>
                                                        <a class="aa-add-card-btn"href="#"><span class="fa fa-shopping-cart"></span>Add To Cart</a>
                                                        <figcaption>
                                                            <h4 class="aa-product-title"><a href="#">Lorem ipsum doller</a></h4>
                                                            <span class="aa-product-price">$45.50</span><span class="aa-product-price"><del>$65.50</del></span>
                                                        </figcaption>
                                                    </figure>                          
                                                    <div class="aa-product-hvr-content">
                                                        <a href="#" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><span class="fa fa-heart-o"></span></a>
                                                        <a href="#" data-toggle="tooltip" data-placement="top" title="Compare"><span class="fa fa-exchange"></span></a>
                                                        <a href="#" data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal" data-target="#quick-view-modal"><span class="fa fa-search"></span></a>
                                                    </div>
                                                </li>
                                                <!-- start single product item -->
                                                <li>
                                                    <figure>
                                                        <a class="aa-product-img" href="#"><img src="img/women/girl-7.png" alt="polo shirt img"></a>
                                                        <a class="aa-add-card-btn"href="#"><span class="fa fa-shopping-cart"></span>Add To Cart</a>
                                                        <figcaption>
                                                            <h4 class="aa-product-title"><a href="#">Lorem ipsum doller</a></h4>
                                                            <span class="aa-product-price">$45.50</span><span class="aa-product-price"><del>$65.50</del></span>
                                                        </figcaption>
                                                    </figure>                          
                                                    <div class="aa-product-hvr-content">
                                                        <a href="#" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><span class="fa fa-heart-o"></span></a>
                                                        <a href="#" data-toggle="tooltip" data-placement="top" title="Compare"><span class="fa fa-exchange"></span></a>
                                                        <a href="#" data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal" data-target="#quick-view-modal"><span class="fa fa-search"></span></a>
                                                    </div>
                                                    <!-- product badge -->
                                                    <!--                                                    <span class="aa-badge aa-sale" href="#">SALE!</span>-->
                                                </li>
                                                <!-- start single product item -->
                                                <li>
                                                    <figure>
                                                        <a class="aa-product-img" href="#"><img src="img/women/girl-1.png" alt="polo shirt img"></a>
                                                        <a class="aa-add-card-btn"href="#"><span class="fa fa-shopping-cart"></span>Add To Cart</a>
                                                        <figcaption>
                                                            <h4 class="aa-product-title"><a href="#">Lorem ipsum doller</a></h4>
                                                            <span class="aa-product-price">$45.50</span>
                                                        </figcaption>
                                                    </figure>                         
                                                    <div class="aa-product-hvr-content">
                                                        <a href="#" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><span class="fa fa-heart-o"></span></a>
                                                        <a href="#" data-toggle="tooltip" data-placement="top" title="Compare"><span class="fa fa-exchange"></span></a>
                                                        <a href="#" data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal" data-target="#quick-view-modal"><span class="fa fa-search"></span></a>
                                                    </div>
                                                    <!-- product badge -->
                                                    <!--                                                    <span class="aa-badge aa-sold-out" href="#">Sold Out!</span>-->
                                                </li>                        
                                            </ul>
                                            <a class="aa-browse-btn" href="#">Browse all Product <span class="fa fa-long-arrow-right"></span></a>
                                        </div>
                                        <!-- / women product category -->
                                        <!-- start sports product category -->
                                        <div class="tab-pane fade" id="sports">
                                            <ul class="aa-product-catg">
                                                <!-- start single product item -->
                                                <li>
                                                    <figure>
                                                        <a class="aa-product-img" href="#"><img src="img/sports/sport-1.png" alt="polo shirt img"></a>
                                                        <a class="aa-add-card-btn"href="#"><span class="fa fa-shopping-cart"></span>Add To Cart</a>
                                                        <figcaption>
                                                            <h4 class="aa-product-title"><a href="#">This is Title</a></h4>
                                                            <span class="aa-product-price">$45.50</span><span class="aa-product-price"><del>$65.50</del></span>
                                                        </figcaption>
                                                    </figure>                         
                                                    <div class="aa-product-hvr-content">
                                                        <a href="#" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><span class="fa fa-heart-o"></span></a>
                                                        <a href="#" data-toggle="tooltip" data-placement="top" title="Compare"><span class="fa fa-exchange"></span></a>
                                                        <a href="#" data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal" data-target="#quick-view-modal"><span class="fa fa-search"></span></a>                          
                                                    </div>
                                                    <!-- product badge -->
                                                    <!--                                                    <span class="aa-badge aa-sale" href="#">SALE!</span>-->
                                                </li>
                                                <!-- start single product item -->
                                                <li>
                                                    <figure>
                                                        <a class="aa-product-img" href="#"><img src="img/sports/sport-2.png" alt="polo shirt img"></a>
                                                        <a class="aa-add-card-btn"href="#"><span class="fa fa-shopping-cart"></span>Add To Cart</a>
                                                        <figcaption>
                                                            <h4 class="aa-product-title"><a href="#">Lorem ipsum doller</a></h4>
                                                            <span class="aa-product-price">$45.50</span>
                                                        </figcaption>
                                                    </figure>                         
                                                    <div class="aa-product-hvr-content">
                                                        <a href="#" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><span class="fa fa-heart-o"></span></a>
                                                        <a href="#" data-toggle="tooltip" data-placement="top" title="Compare"><span class="fa fa-exchange"></span></a>
                                                        <a href="#" data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal" data-target="#quick-view-modal"><span class="fa fa-search"></span></a>
                                                    </div>
                                                    <!-- product badge -->
                                                    <!--                                                    <span class="aa-badge aa-sold-out" href="#">Sold Out!</span>-->
                                                </li>
                                                <!-- start single product item -->
                                                <li>
                                                    <figure>
                                                        <a class="aa-product-img" href="#"><img src="img/sports/sport-3.png" alt="polo shirt img"></a>
                                                        <a class="aa-add-card-btn"href="#"><span class="fa fa-shopping-cart"></span>Add To Cart</a>
                                                        <figcaption>
                                                            <h4 class="aa-product-title"><a href="#">Lorem ipsum doller</a></h4>
                                                            <span class="aa-product-price">$45.50</span><span class="aa-product-price"><del>$65.50</del></span>
                                                        </figcaption>
                                                    </figure>                          
                                                    <div class="aa-product-hvr-content">
                                                        <a href="#" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><span class="fa fa-heart-o"></span></a>
                                                        <a href="#" data-toggle="tooltip" data-placement="top" title="Compare"><span class="fa fa-exchange"></span></a>
                                                        <a href="#" data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal" data-target="#quick-view-modal"><span class="fa fa-search"></span></a>
                                                    </div>
                                                </li>
                                                <!-- start single product item -->
                                                <li>
                                                    <figure>
                                                        <a class="aa-product-img" href="#"><img src="img/sports/sport-4.png" alt="polo shirt img"></a>
                                                        <a class="aa-add-card-btn"href="#"><span class="fa fa-shopping-cart"></span>Add To Cart</a>
                                                        <figcaption>
                                                            <h4 class="aa-product-title"><a href="#">Lorem ipsum doller</a></h4>
                                                            <span class="aa-product-price">$45.50</span><span class="aa-product-price"><del>$65.50</del></span>
                                                        </figcaption>
                                                    </figure>                         
                                                    <div class="aa-product-hvr-content">
                                                        <a href="#" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><span class="fa fa-heart-o"></span></a>
                                                        <a href="#" data-toggle="tooltip" data-placement="top" title="Compare"><span class="fa fa-exchange"></span></a>
                                                        <a href="#" data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal" data-target="#quick-view-modal"><span class="fa fa-search"></span></a>
                                                    </div>
                                                    <!-- product badge -->
                                                    <!--                                                    <span class="aa-badge aa-hot" href="#">HOT!</span>-->
                                                </li>
                                                <!-- start single product item -->
                                                <li>
                                                    <figure>
                                                        <a class="aa-product-img" href="#"><img src="img/sports/sport-5.png" alt="polo shirt img"></a>
                                                        <a class="aa-add-card-btn"href="#"><span class="fa fa-shopping-cart"></span>Add To Cart</a>
                                                        <figcaption>
                                                            <h4 class="aa-product-title"><a href="#">Lorem ipsum doller</a></h4>
                                                            <span class="aa-product-price">$45.50</span>
                                                        </figcaption>
                                                    </figure>                          
                                                    <div class="aa-product-hvr-content">
                                                        <a href="#" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><span class="fa fa-heart-o"></span></a>
                                                        <a href="#" data-toggle="tooltip" data-placement="top" title="Compare"><span class="fa fa-exchange"></span></a>
                                                        <a href="#" data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal" data-target="#quick-view-modal"><span class="fa fa-search"></span></a>
                                                    </div>
                                                </li>
                                                <!-- start single product item -->
                                                <li>
                                                    <figure>
                                                        <a class="aa-product-img" href="#"><img src="img/sports/sport-6.png" alt="polo shirt img"></a>
                                                        <a class="aa-add-card-btn"href="#"><span class="fa fa-shopping-cart"></span>Add To Cart</a>
                                                        <figcaption>
                                                            <h4 class="aa-product-title"><a href="#">Lorem ipsum doller</a></h4>
                                                            <span class="aa-product-price">$45.50</span><span class="aa-product-price"><del>$65.50</del></span>
                                                        </figcaption>
                                                    </figure>                         
                                                    <div class="aa-product-hvr-content">
                                                        <a href="#" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><span class="fa fa-heart-o"></span></a>
                                                        <a href="#" data-toggle="tooltip" data-placement="top" title="Compare"><span class="fa fa-exchange"></span></a>
                                                        <a href="#" data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal" data-target="#quick-view-modal"><span class="fa fa-search"></span></a>
                                                    </div>
                                                </li>
                                                <!-- start single product item -->
                                                <li>
                                                    <figure>
                                                        <a class="aa-product-img" href="#"><img src="img/sports/sport-7.png" alt="polo shirt img"></a>
                                                        <a class="aa-add-card-btn"href="#"><span class="fa fa-shopping-cart"></span>Add To Cart</a>
                                                        <figcaption>
                                                            <h4 class="aa-product-title"><a href="#">Lorem ipsum doller</a></h4>
                                                            <span class="aa-product-price">$45.50</span><span class="aa-product-price"><del>$65.50</del></span>
                                                        </figcaption>
                                                    </figure>                          
                                                    <div class="aa-product-hvr-content">
                                                        <a href="#" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><span class="fa fa-heart-o"></span></a>
                                                        <a href="#" data-toggle="tooltip" data-placement="top" title="Compare"><span class="fa fa-exchange"></span></a>
                                                        <a href="#" data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal" data-target="#quick-view-modal"><span class="fa fa-search"></span></a>
                                                    </div>
                                                    <!-- product badge -->
                                                    <!--                                                    <span class="aa-badge aa-sale" href="#">SALE!</span>-->
                                                </li>
                                                <!-- start single product item -->
                                                <li>
                                                    <figure>
                                                        <a class="aa-product-img" href="#"><img src="img/sports/sport-8.png" alt="polo shirt img"></a>
                                                        <a class="aa-add-card-btn"href="#"><span class="fa fa-shopping-cart"></span>Add To Cart</a>
                                                        <figcaption>
                                                            <h4 class="aa-product-title"><a href="#">Lorem ipsum doller</a></h4>
                                                            <span class="aa-product-price">$45.50</span>
                                                        </figcaption>
                                                    </figure>                         
                                                    <div class="aa-product-hvr-content">
                                                        <a href="#" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><span class="fa fa-heart-o"></span></a>
                                                        <a href="#" data-toggle="tooltip" data-placement="top" title="Compare"><span class="fa fa-exchange"></span></a>
                                                        <a href="#" data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal" data-target="#quick-view-modal"><span class="fa fa-search"></span></a>
                                                    </div>
                                                    <!-- product badge -->
                                                    <!--                                                    <span class="aa-badge aa-sold-out" href="#">Sold Out!</span>-->
                                                </li>                        
                                            </ul>
                                        </div>
                                        <!-- / sports product category -->
                                        <!-- start electronic product category -->
                                        <div class="tab-pane fade" id="electronics">
                                            <ul class="aa-product-catg">
                                                <!-- start single product item -->
                                                <li>
                                                    <figure>
                                                        <a class="aa-product-img" href="#"><img src="img/electronics/electronic-1.png" alt="polo shirt img"></a>
                                                        <a class="aa-add-card-btn"href="#"><span class="fa fa-shopping-cart"></span>Add To Cart</a>
                                                        <figcaption>
                                                            <h4 class="aa-product-title"><a href="#">This is Title</a></h4>
                                                            <span class="aa-product-price">$45.50</span><span class="aa-product-price"><del>$65.50</del></span>
                                                        </figcaption>
                                                    </figure>                         
                                                    <div class="aa-product-hvr-content">
                                                        <a href="#" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><span class="fa fa-heart-o"></span></a>
                                                        <a href="#" data-toggle="tooltip" data-placement="top" title="Compare"><span class="fa fa-exchange"></span></a>
                                                        <a href="#" data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal" data-target="#quick-view-modal"><span class="fa fa-search"></span></a>                            
                                                    </div>
                                                    <!-- product badge -->
                                                    <!--                                                    <span class="aa-badge aa-sale" href="#">SALE!</span>-->
                                                </li>
                                                <!-- start single product item -->
                                                <li>
                                                    <figure>
                                                        <a class="aa-product-img" href="#"><img src="img/electronics/electronic-2.png" alt="polo shirt img"></a>
                                                        <a class="aa-add-card-btn"href="#"><span class="fa fa-shopping-cart"></span>Add To Cart</a>
                                                        <figcaption>
                                                            <h4 class="aa-product-title"><a href="#">Lorem ipsum doller</a></h4>
                                                            <span class="aa-product-price">$45.50</span>
                                                        </figcaption>
                                                    </figure>                         
                                                    <div class="aa-product-hvr-content">
                                                        <a href="#" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><span class="fa fa-heart-o"></span></a>
                                                        <a href="#" data-toggle="tooltip" data-placement="top" title="Compare"><span class="fa fa-exchange"></span></a>
                                                        <a href="#" data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal" data-target="#quick-view-modal"><span class="fa fa-search"></span></a>
                                                    </div>
                                                    <!-- product badge -->
                                                    <!--                                                    <span class="aa-badge aa-sold-out" href="#">Sold Out!</span>-->
                                                </li>
                                                <!-- start single product item -->
                                                <li>
                                                    <figure>
                                                        <a class="aa-product-img" href="#"><img src="img/electronics/electronic-3.png" alt="polo shirt img"></a>
                                                        <a class="aa-add-card-btn"href="#"><span class="fa fa-shopping-cart"></span>Add To Cart</a>
                                                        <figcaption>
                                                            <h4 class="aa-product-title"><a href="#">Lorem ipsum doller</a></h4>
                                                            <span class="aa-product-price">$45.50</span><span class="aa-product-price"><del>$65.50</del></span>
                                                        </figcaption>
                                                    </figure>                          
                                                    <div class="aa-product-hvr-content">
                                                        <a href="#" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><span class="fa fa-heart-o"></span></a>
                                                        <a href="#" data-toggle="tooltip" data-placement="top" title="Compare"><span class="fa fa-exchange"></span></a>
                                                        <a href="#" data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal" data-target="#quick-view-modal"><span class="fa fa-search"></span></a>
                                                    </div>
                                                </li>
                                                <!-- start single product item -->
                                                <li>
                                                    <figure>
                                                        <a class="aa-product-img" href="#"><img src="img/electronics/electronic-4.png" alt="polo shirt img"></a>
                                                        <a class="aa-add-card-btn"href="#"><span class="fa fa-shopping-cart"></span>Add To Cart</a>
                                                        <figcaption>
                                                            <h4 class="aa-product-title"><a href="#">Lorem ipsum doller</a></h4>
                                                            <span class="aa-product-price">$45.50</span><span class="aa-product-price"><del>$65.50</del></span>
                                                        </figcaption>
                                                    </figure>                          
                                                    <div class="aa-product-hvr-content">
                                                        <a href="#" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><span class="fa fa-heart-o"></span></a>
                                                        <a href="#" data-toggle="tooltip" data-placement="top" title="Compare"><span class="fa fa-exchange"></span></a>
                                                        <a href="#" data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal" data-target="#quick-view-modal"><span class="fa fa-search"></span></a>
                                                    </div>
                                                    <!-- product badge -->
                                                    <!--                                                    <span class="aa-badge aa-hot" href="#">HOT!</span>-->
                                                </li>
                                                <!-- start single product item -->
                                                <li>
                                                    <figure>
                                                        <a class="aa-product-img" href="#"><img src="img/electronics/electronic-5.png" alt="polo shirt img"></a>
                                                        <a class="aa-add-card-btn"href="#"><span class="fa fa-shopping-cart"></span>Add To Cart</a>
                                                        <figcaption>
                                                            <h4 class="aa-product-title"><a href="#">Lorem ipsum doller</a></h4>
                                                            <span class="aa-product-price">$45.50</span>
                                                        </figcaption>
                                                    </figure>                         
                                                    <div class="aa-product-hvr-content">
                                                        <a href="#" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><span class="fa fa-heart-o"></span></a>
                                                        <a href="#" data-toggle="tooltip" data-placement="top" title="Compare"><span class="fa fa-exchange"></span></a>
                                                        <a href="#" data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal" data-target="#quick-view-modal"><span class="fa fa-search"></span></a>
                                                    </div>
                                                </li>
                                                <!-- start single product item -->
                                                <li>
                                                    <figure>
                                                        <a class="aa-product-img" href="#"><img src="img/electronics/electronic-6.png" alt="polo shirt img"></a>
                                                        <a class="aa-add-card-btn"href="#"><span class="fa fa-shopping-cart"></span>Add To Cart</a>
                                                        <figcaption>
                                                            <h4 class="aa-product-title"><a href="#">Lorem ipsum doller</a></h4>
                                                            <span class="aa-product-price">$45.50</span><span class="aa-product-price"><del>$65.50</del></span>
                                                        </figcaption>
                                                    </figure>                         
                                                    <div class="aa-product-hvr-content">
                                                        <a href="#" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><span class="fa fa-heart-o"></span></a>
                                                        <a href="#" data-toggle="tooltip" data-placement="top" title="Compare"><span class="fa fa-exchange"></span></a>
                                                        <a href="#" data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal" data-target="#quick-view-modal"><span class="fa fa-search"></span></a>
                                                    </div>
                                                </li>
                                                <!-- start single product item -->
                                                <li>
                                                    <figure>
                                                        <a class="aa-product-img" href="#"><img src="img/electronics/electronic-7.png" alt="polo shirt img"></a>
                                                        <a class="aa-add-card-btn"href="#"><span class="fa fa-shopping-cart"></span>Add To Cart</a>
                                                        <figcaption>
                                                            <h4 class="aa-product-title"><a href="#">Lorem ipsum doller</a></h4>
                                                            <span class="aa-product-price">$45.50</span><span class="aa-product-price"><del>$65.50</del></span>
                                                        </figcaption>
                                                    </figure>                          
                                                    <div class="aa-product-hvr-content">
                                                        <a href="#" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><span class="fa fa-heart-o"></span></a>
                                                        <a href="#" data-toggle="tooltip" data-placement="top" title="Compare"><span class="fa fa-exchange"></span></a>
                                                        <a href="#" data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal" data-target="#quick-view-modal"><span class="fa fa-search"></span></a>
                                                    </div>
                                                    <!-- product badge -->
                                                    <!--                                                    <span class="aa-badge aa-sale" href="#">SALE!</span>-->
                                                </li>
                                                <!-- start single product item -->
                                                <li>
                                                    <figure>
                                                        <a class="aa-product-img" href="#"><img src="img/electronics/electronic-8.png" alt="polo shirt img"></a>
                                                        <a class="aa-add-card-btn"href="#"><span class="fa fa-shopping-cart"></span>Add To Cart</a>
                                                        <figcaption>
                                                            <h4 class="aa-product-title"><a href="#">Lorem ipsum doller</a></h4>
                                                            <span class="aa-product-price">$45.50</span>
                                                        </figcaption>
                                                    </figure>                          
                                                    <div class="aa-product-hvr-content">
                                                        <a href="#" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><span class="fa fa-heart-o"></span></a>
                                                        <a href="#" data-toggle="tooltip" data-placement="top" title="Compare"><span class="fa fa-exchange"></span></a>
                                                        <a href="#" data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal" data-target="#quick-view-modal"><span class="fa fa-search"></span></a>
                                                    </div>
                                                    <!-- product badge -->
                                                    <span class="aa-badge aa-sold-out" href="#">Sold Out!</span>
                                                </li>                        
                                            </ul>
                                            <a class="aa-browse-btn" href="#">Browse all Product <span class="fa fa-long-arrow-right"></span></a>
                                        </div>
                                        <!-- / electronic product category -->
                                    </div>
                                    <!-- quick view modal -->                  
                                    <div class="modal fade" id="quick-view-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">                      
                                                <div class="modal-body">
                                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                    <div class="row">
                                                        <!-- Modal view slider -->
                                                        <div class="col-md-6 col-sm-6 col-xs-12">                              
                                                            <div class="aa-product-view-slider">                                
                                                                <div class="simpleLens-gallery-container" id="demo-1">
                                                                    <div class="simpleLens-container">
                                                                        <div class="simpleLens-big-image-container">
                                                                            <a class="simpleLens-lens-image" data-lens-image="img/view-slider/large/polo-shirt-1.png">
                                                                                <img src="img/view-slider/medium/polo-shirt-1.png" class="simpleLens-big-image">
                                                                            </a>
                                                                        </div>
                                                                    </div>
                                                                    <div class="simpleLens-thumbnails-container">
                                                                        <a href="#" class="simpleLens-thumbnail-wrapper"
                                                                           data-lens-image="img/view-slider/large/polo-shirt-1.png"
                                                                           data-big-image="img/view-slider/medium/polo-shirt-1.png">
                                                                            <img src="img/view-slider/thumbnail/polo-shirt-1.png">
                                                                        </a>                                    
                                                                        <a href="#" class="simpleLens-thumbnail-wrapper"
                                                                           data-lens-image="img/view-slider/large/polo-shirt-3.png"
                                                                           data-big-image="img/view-slider/medium/polo-shirt-3.png">
                                                                            <img src="img/view-slider/thumbnail/polo-shirt-3.png">
                                                                        </a>

                                                                        <a href="#" class="simpleLens-thumbnail-wrapper"
                                                                           data-lens-image="img/view-slider/large/polo-shirt-4.png"
                                                                           data-big-image="img/view-slider/medium/polo-shirt-4.png">
                                                                            <img src="img/view-slider/thumbnail/polo-shirt-4.png">
                                                                        </a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <!-- Modal view content -->
                                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                                            <div class="aa-product-view-content">
                                                                <h3>T-Shirt</h3>
                                                                <div class="aa-price-block">
                                                                    <span class="aa-product-view-price">$34.99</span>
                                                                    <p class="aa-product-avilability">Avilability: <span>In stock</span></p>
                                                                </div>
                                                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Officiis animi, veritatis quae repudiandae quod nulla porro quidem, itaque quis quaerat!</p>
                                                                <h4>Size</h4>
                                                                <div class="aa-prod-view-size">
                                                                    <a href="#">S</a>
                                                                    <a href="#">M</a>
                                                                    <a href="#">L</a>
                                                                    <a href="#">XL</a>
                                                                </div>
                                                                <div class="aa-prod-quantity">
                                                                    <form action="">
                                                                        <select name="" id="">
                                                                            <option value="0" selected="1">1</option>
                                                                            <option value="1">2</option>
                                                                            <option value="2">3</option>
                                                                            <option value="3">4</option>
                                                                            <option value="4">5</option>
                                                                            <option value="5">6</option>
                                                                        </select>
                                                                    </form>
                                                                    <p class="aa-prod-category">
                                                                        Category: <a href="#">Polo T-Shirt</a>
                                                                    </p>
                                                                </div>
                                                                <div class="aa-prod-view-bottom">
                                                                    <a href="#" class="aa-add-to-cart-btn"><span class="fa fa-shopping-cart"></span>Add To Cart</a>
                                                                    <a href="#" class="aa-add-to-cart-btn">View Details</a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>                        
                                            </div><!-- /.modal-content -->
                                        </div><!-- /.modal-dialog -->
                                    </div><!-- / quick view modal -->              
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- / Products section -->
        <!-- banner section -->
        <section id="aa-banner">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">        
                        <div class="row">
                            <div class="aa-banner-area">
                                <a href="#"><img src="img/fashion-banner.jpg" alt="fashion banner img"></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- popular section -->
        <section id="aa-popular-category">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="row">
                            <div class="aa-popular-category-area">
                                <!-- start prduct navigation -->
                                <ul class="nav nav-tabs aa-products-tab">
                                    <li class="active"><a href="#popular" data-toggle="tab">Popular</a></li>
                                    <li><a href="#featured" data-toggle="tab">Featured</a></li>
                                    <li><a href="#latest" data-toggle="tab">Latest</a></li>                    
                                </ul>
                                <!-- Tab panes -->
                                <div class="tab-content">
                                    <!-- Start men popular category -->
                                    <div class="tab-pane fade in active" id="popular">
                                        <ul class="aa-product-catg aa-popular-slider">
                                            <!-- start single product item -->
                                            <li>
                                                <figure>
                                                    <a class="aa-product-img" href="#"><img src="img/man/polo-shirt-2.png" alt="polo shirt img"></a>
                                                    <a class="aa-add-card-btn"href="#"><span class="fa fa-shopping-cart"></span>Add To Cart</a>
                                                    <figcaption>
                                                        <h4 class="aa-product-title"><a href="#">Polo T-Shirt</a></h4>
                                                        <span class="aa-product-price">$45.50</span><span class="aa-product-price"><del>$65.50</del></span>
                                                    </figcaption>
                                                </figure>                     
                                                <div class="aa-product-hvr-content">
                                                    <a href="#" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><span class="fa fa-heart-o"></span></a>
                                                    <a href="#" data-toggle="tooltip" data-placement="top" title="Compare"><span class="fa fa-exchange"></span></a>
                                                    <a href="#" data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal" data-target="#quick-view-modal"><span class="fa fa-search"></span></a>                            
                                                </div>
                                                <!-- product badge -->
                                                <span class="aa-badge aa-sale" href="#">SALE!</span>
                                            </li>
                                            <!-- start single product item -->
                                            <li>
                                                <figure>
                                                    <a class="aa-product-img" href="#"><img src="img/women/girl-2.png" alt="polo shirt img"></a>
                                                    <a class="aa-add-card-btn"href="#"><span class="fa fa-shopping-cart"></span>Add To Cart</a>
                                                    <figcaption>
                                                        <h4 class="aa-product-title"><a href="#">Lorem ipsum doller</a></h4>
                                                        <span class="aa-product-price">$45.50</span>
                                                    </figcaption>
                                                </figure>                      
                                                <div class="aa-product-hvr-content">
                                                    <a href="#" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><span class="fa fa-heart-o"></span></a>
                                                    <a href="#" data-toggle="tooltip" data-placement="top" title="Compare"><span class="fa fa-exchange"></span></a>
                                                    <a href="#" data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal" data-target="#quick-view-modal"><span class="fa fa-search"></span></a>
                                                </div>
                                                <!-- product badge -->
                                                <span class="aa-badge aa-sold-out" href="#">Sold Out!</span>
                                            </li>
                                            <!-- start single product item -->
                                            <li>
                                                <figure>
                                                    <a class="aa-product-img" href="#"><img src="img/man/t-shirt-1.png" alt="polo shirt img"></a>
                                                    <a class="aa-add-card-btn"href="#"><span class="fa fa-shopping-cart"></span>Add To Cart</a>
                                                </figure>
                                            <figcaption>
                                                <h4 class="aa-product-title"><a href="#">T-Shirt</a></h4>
                                                <span class="aa-product-price">$45.50</span>
                                            </figcaption>
                                            <div class="aa-product-hvr-content">
                                                <a href="#" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><span class="fa fa-heart-o"></span></a>
                                                <a href="#" data-toggle="tooltip" data-placement="top" title="Compare"><span class="fa fa-exchange"></span></a>
                                                <a href="#" data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal" data-target="#quick-view-modal"><span class="fa fa-search"></span></a>
                                            </div>
                                            <!-- product badge -->
                                            <span class="aa-badge aa-sold-out" href="#">Sold Out!</span>
                                            </li>
                                            <!-- start single product item -->
                                            <li>
                                                <figure>
                                                    <a class="aa-product-img" href="#"><img src="img/women/girl-3.png" alt="polo shirt img"></a>
                                                    <a class="aa-add-card-btn"href="#"><span class="fa fa-shopping-cart"></span>Add To Cart</a>
                                                    <figcaption>
                                                        <h4 class="aa-product-title"><a href="#">Lorem ipsum doller</a></h4>
                                                        <span class="aa-product-price">$45.50</span><span class="aa-product-price"><del>$65.50</del></span>
                                                    </figcaption>
                                                </figure>                     
                                                <div class="aa-product-hvr-content">
                                                    <a href="#" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><span class="fa fa-heart-o"></span></a>
                                                    <a href="#" data-toggle="tooltip" data-placement="top" title="Compare"><span class="fa fa-exchange"></span></a>
                                                    <a href="#" data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal" data-target="#quick-view-modal"><span class="fa fa-search"></span></a>
                                                </div>
                                            </li>
                                            <!-- start single product item -->
                                            <li>
                                                <figure>
                                                    <a class="aa-product-img" href="#"><img src="img/man/polo-shirt-1.png" alt="polo shirt img"></a>
                                                    <a class="aa-add-card-btn"href="#"><span class="fa fa-shopping-cart"></span>Add To Cart</a>
                                                    <figcaption>
                                                        <h4 class="aa-product-title"><a href="#">Polo T-Shirt</a></h4>
                                                        <span class="aa-product-price">$45.50</span><span class="aa-product-price"><del>$65.50</del></span>
                                                    </figcaption>
                                                </figure>                      
                                                <div class="aa-product-hvr-content">
                                                    <a href="#" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><span class="fa fa-heart-o"></span></a>
                                                    <a href="#" data-toggle="tooltip" data-placement="top" title="Compare"><span class="fa fa-exchange"></span></a>
                                                    <a href="#" data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal" data-target="#quick-view-modal"><span class="fa fa-search"></span></a>
                                                </div>
                                            </li>
                                            <!-- start single product item -->
                                            <li>
                                                <figure>
                                                    <a class="aa-product-img" href="#"><img src="img/women/girl-4.png" alt="polo shirt img"></a>
                                                    <a class="aa-add-card-btn"href="#"><span class="fa fa-shopping-cart"></span>Add To Cart</a>
                                                    <figcaption>
                                                        <h4 class="aa-product-title"><a href="#">Lorem ipsum doller</a></h4>
                                                        <span class="aa-product-price">$45.50</span><span class="aa-product-price"><del>$65.50</del></span>
                                                    </figcaption>
                                                </figure>                     
                                                <div class="aa-product-hvr-content">
                                                    <a href="#" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><span class="fa fa-heart-o"></span></a>
                                                    <a href="#" data-toggle="tooltip" data-placement="top" title="Compare"><span class="fa fa-exchange"></span></a>
                                                    <a href="#" data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal" data-target="#quick-view-modal"><span class="fa fa-search"></span></a>
                                                </div>
                                                <!-- product badge -->
                                                <span class="aa-badge aa-hot" href="#">HOT!</span>
                                            </li>    
                                            <!-- start single product item -->
                                            <li>
                                                <figure>
                                                    <a class="aa-product-img" href="#"><img src="img/man/polo-shirt-4.png" alt="polo shirt img"></a>
                                                    <a class="aa-add-card-btn"href="#"><span class="fa fa-shopping-cart"></span>Add To Cart</a>
                                                    <figcaption>
                                                        <h4 class="aa-product-title"><a href="#">Polo T-Shirt</a></h4>
                                                        <span class="aa-product-price">$45.50</span><span class="aa-product-price"><del>$65.50</del></span>
                                                    </figcaption>
                                                </figure>                     
                                                <div class="aa-product-hvr-content">
                                                    <a href="#" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><span class="fa fa-heart-o"></span></a>
                                                    <a href="#" data-toggle="tooltip" data-placement="top" title="Compare"><span class="fa fa-exchange"></span></a>
                                                    <a href="#" data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal" data-target="#quick-view-modal"><span class="fa fa-search"></span></a>
                                                </div>
                                                <!-- product badge -->
                                                <!--                                                <span class="aa-badge aa-hot" href="#">HOT!</span>-->

                                                <!-- start single product item -->
                                            <li>
                                                <figure>
                                                    <a class="aa-product-img" href="#"><img src="img/women/girl-1.png" alt="polo shirt img"></a>
                                                    <a class="aa-add-card-btn"href="#"><span class="fa fa-shopping-cart"></span>Add To Cart</a>
                                                    <figcaption>
                                                        <h4 class="aa-product-title"><a href="#">This is Title</a></h4>
                                                        <span class="aa-product-price">$45.50</span><span class="aa-product-price"><del>$65.50</del></span>
                                                    </figcaption>
                                                </figure>                     
                                                <div class="aa-product-hvr-content">
                                                    <a href="#" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><span class="fa fa-heart-o"></span></a>
                                                    <a href="#" data-toggle="tooltip" data-placement="top" title="Compare"><span class="fa fa-exchange"></span></a>
                                                    <a href="#" data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal" data-target="#quick-view-modal"><span class="fa fa-search"></span></a>                            
                                                </div>
                                                <!-- product badge -->
                                                <span class="aa-badge aa-sale" href="#">SALE!</span>
                                            </li>                                                                                   
                                        </ul>
                                        <a class="aa-browse-btn" href="#">Browse all Product <span class="fa fa-long-arrow-right"></span></a>
                                    </div>
                                    <!-- / popular product category -->

                                    <!-- start featured product category -->
                                    <div class="tab-pane fade" id="featured">
                                        <ul class="aa-product-catg aa-featured-slider">
                                            <!-- start single product item -->
                                            <li>
                                                <figure>
                                                    <a class="aa-product-img" href="#"><img src="img/man/polo-shirt-2.png" alt="polo shirt img"></a>
                                                    <a class="aa-add-card-btn"href="#"><span class="fa fa-shopping-cart"></span>Add To Cart</a>
                                                    <figcaption>
                                                        <h4 class="aa-product-title"><a href="#">Polo T-Shirt</a></h4>
                                                        <span class="aa-product-price">$45.50</span>
                                                        <!--                                                        <span class="aa-product-price"><del>$65.50</del></span>-->
                                                    </figcaption>
                                                </figure>                     
                                                <div class="aa-product-hvr-content">
                                                    <a href="#" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><span class="fa fa-heart-o"></span></a>
                                                    <a href="#" data-toggle="tooltip" data-placement="top" title="Compare"><span class="fa fa-exchange"></span></a>
                                                    <a href="#" data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal" data-target="#quick-view-modal"><span class="fa fa-search"></span></a>                            
                                                </div>
                                                <!-- product badge -->
                                                <!--                                                <span class="aa-badge aa-sale" href="#">SALE!</span>-->
                                            </li>
                                            <!-- start single product item -->
                                            <li>
                                                <figure>
                                                    <a class="aa-product-img" href="#"><img src="img/women/girl-2.png" alt="polo shirt img"></a>
                                                    <a class="aa-add-card-btn"href="#"><span class="fa fa-shopping-cart"></span>Add To Cart</a>
                                                    <figcaption>
                                                        <h4 class="aa-product-title"><a href="#">Lorem ipsum doller</a></h4>
                                                        <span class="aa-product-price">$45.50</span>
                                                    </figcaption>
                                                </figure>                      
                                                <div class="aa-product-hvr-content">
                                                    <a href="#" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><span class="fa fa-heart-o"></span></a>
                                                    <a href="#" data-toggle="tooltip" data-placement="top" title="Compare"><span class="fa fa-exchange"></span></a>
                                                    <a href="#" data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal" data-target="#quick-view-modal"><span class="fa fa-search"></span></a>
                                                </div>
                                                <!-- product badge -->
                                                <span class="aa-badge aa-sold-out" href="#">Sold Out!</span>
                                            </li>
                                            <!-- start single product item -->
                                            <li>
                                                <figure>
                                                    <a class="aa-product-img" href="#"><img src="img/man/t-shirt-1.png" alt="polo shirt img"></a>
                                                    <a class="aa-add-card-btn"href="#"><span class="fa fa-shopping-cart"></span>Add To Cart</a>
                                                </figure>
                                            <figcaption>
                                                <h4 class="aa-product-title"><a href="#">T-Shirt</a></h4>
                                                <span class="aa-product-price">$45.50</span>
                                            </figcaption>
                                            <div class="aa-product-hvr-content">
                                                <a href="#" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><span class="fa fa-heart-o"></span></a>
                                                <a href="#" data-toggle="tooltip" data-placement="top" title="Compare"><span class="fa fa-exchange"></span></a>
                                                <a href="#" data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal" data-target="#quick-view-modal"><span class="fa fa-search"></span></a>
                                            </div>
                                            <!-- product badge -->
                                            <span class="aa-badge aa-sold-out" href="#">Sold Out!</span>
                                            </li>
                                            <!-- start single product item -->
                                            <li>
                                                <figure>
                                                    <a class="aa-product-img" href="#"><img src="img/women/girl-3.png" alt="polo shirt img"></a>
                                                    <a class="aa-add-card-btn"href="#"><span class="fa fa-shopping-cart"></span>Add To Cart</a>
                                                    <figcaption>
                                                        <h4 class="aa-product-title"><a href="#">Lorem ipsum doller</a></h4>
                                                        <span class="aa-product-price">$45.50</span><span class="aa-product-price"><del>$65.50</del></span>
                                                    </figcaption>
                                                </figure>                     
                                                <div class="aa-product-hvr-content">
                                                    <a href="#" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><span class="fa fa-heart-o"></span></a>
                                                    <a href="#" data-toggle="tooltip" data-placement="top" title="Compare"><span class="fa fa-exchange"></span></a>
                                                    <a href="#" data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal" data-target="#quick-view-modal"><span class="fa fa-search"></span></a>
                                                </div>
                                            </li>
                                            <!-- start single product item -->
                                            <li>
                                                <figure>
                                                    <a class="aa-product-img" href="#"><img src="img/man/polo-shirt-1.png" alt="polo shirt img"></a>
                                                    <a class="aa-add-card-btn"href="#"><span class="fa fa-shopping-cart"></span>Add To Cart</a>
                                                    <figcaption>
                                                        <h4 class="aa-product-title"><a href="#">Polo T-Shirt</a></h4>
                                                        <span class="aa-product-price">$45.50</span><span class="aa-product-price"><del>$65.50</del></span>
                                                    </figcaption>
                                                </figure>                      
                                                <div class="aa-product-hvr-content">
                                                    <a href="#" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><span class="fa fa-heart-o"></span></a>
                                                    <a href="#" data-toggle="tooltip" data-placement="top" title="Compare"><span class="fa fa-exchange"></span></a>
                                                    <a href="#" data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal" data-target="#quick-view-modal"><span class="fa fa-search"></span></a>
                                                </div>
                                            </li>
                                            <!-- start single product item -->
                                            <li>
                                                <figure>
                                                    <a class="aa-product-img" href="#"><img src="img/women/girl-4.png" alt="polo shirt img"></a>
                                                    <a class="aa-add-card-btn"href="#"><span class="fa fa-shopping-cart"></span>Add To Cart</a>
                                                    <figcaption>
                                                        <h4 class="aa-product-title"><a href="#">Lorem ipsum doller</a></h4>
                                                        <span class="aa-product-price">$45.50</span><span class="aa-product-price"><del>$65.50</del></span>
                                                    </figcaption>
                                                </figure>                     
                                                <div class="aa-product-hvr-content">
                                                    <a href="#" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><span class="fa fa-heart-o"></span></a>
                                                    <a href="#" data-toggle="tooltip" data-placement="top" title="Compare"><span class="fa fa-exchange"></span></a>
                                                    <a href="#" data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal" data-target="#quick-view-modal"><span class="fa fa-search"></span></a>
                                                </div>
                                                <!-- product badge -->
                                                <!--                                                <span class="aa-badge aa-hot" href="#">HOT!</span>-->
                                            </li>    
                                            <!-- start single product item -->
                                            <li>
                                                <figure>
                                                    <a class="aa-product-img" href="#"><img src="img/man/polo-shirt-4.png" alt="polo shirt img"></a>
                                                    <a class="aa-add-card-btn"href="#"><span class="fa fa-shopping-cart"></span>Add To Cart</a>
                                                    <figcaption>
                                                        <h4 class="aa-product-title"><a href="#">Polo T-Shirt</a></h4>
                                                        <span class="aa-product-price">$45.50</span><span class="aa-product-price"><del>$65.50</del></span>
                                                    </figcaption>
                                                </figure>                     
                                                <div class="aa-product-hvr-content">
                                                    <a href="#" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><span class="fa fa-heart-o"></span></a>
                                                    <a href="#" data-toggle="tooltip" data-placement="top" title="Compare"><span class="fa fa-exchange"></span></a>
                                                    <a href="#" data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal" data-target="#quick-view-modal"><span class="fa fa-search"></span></a>
                                                </div>
                                                <!-- product badge -->
                                                <span class="aa-badge aa-hot" href="#">HOT!</span>
                                            </li> 
                                            <!-- start single product item -->
                                            <li>
                                                <figure>
                                                    <a class="aa-product-img" href="#"><img src="img/women/girl-1.png" alt="polo shirt img"></a>
                                                    <a class="aa-add-card-btn"href="#"><span class="fa fa-shopping-cart"></span>Add To Cart</a>
                                                    <figcaption>
                                                        <h4 class="aa-product-title"><a href="#">This is Title</a></h4>
                                                        <span class="aa-product-price">$45.50</span><span class="aa-product-price"><del>$65.50</del></span>
                                                    </figcaption>
                                                </figure>                     
                                                <div class="aa-product-hvr-content">
                                                    <a href="#" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><span class="fa fa-heart-o"></span></a>
                                                    <a href="#" data-toggle="tooltip" data-placement="top" title="Compare"><span class="fa fa-exchange"></span></a>
                                                    <a href="#" data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal" data-target="#quick-view-modal"><span class="fa fa-search"></span></a>                            
                                                </div>
                                                <!-- product badge -->
                                                <span class="aa-badge aa-sale" href="#">SALE!</span>
                                            </li>                                                                                   
                                        </ul>
                                        <a class="aa-browse-btn" href="#">Browse all Product <span class="fa fa-long-arrow-right"></span></a>
                                    </div>
                                    <!-- / featured product category -->

                                    <!-- start latest product category -->
                                    <div class="tab-pane fade" id="latest">
                                        <ul class="aa-product-catg aa-latest-slider">
                                            <!-- start single product item -->
                                            <li>
                                                <figure>
                                                    <a class="aa-product-img" href="#"><img src="img/man/polo-shirt-2.png" alt="polo shirt img"></a>
                                                    <a class="aa-add-card-btn"href="#"><span class="fa fa-shopping-cart"></span>Add To Cart</a>
                                                    <figcaption>
                                                        <h4 class="aa-product-title"><a href="#">Polo T-Shirt</a></h4>
                                                        <span class="aa-product-price">$45.50</span><span class="aa-product-price"><del>$65.50</del></span>
                                                    </figcaption>
                                                </figure>                     
                                                <div class="aa-product-hvr-content">
                                                    <a href="#" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><span class="fa fa-heart-o"></span></a>
                                                    <a href="#" data-toggle="tooltip" data-placement="top" title="Compare"><span class="fa fa-exchange"></span></a>
                                                    <a href="#" data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal" data-target="#quick-view-modal"><span class="fa fa-search"></span></a>                            
                                                </div>
                                                <!-- product badge -->
                                                <span class="aa-badge aa-sale" href="#">SALE!</span>
                                            </li>
                                            <!-- start single product item -->
                                            <li>
                                                <figure>
                                                    <a class="aa-product-img" href="#"><img src="img/women/girl-2.png" alt="polo shirt img"></a>
                                                    <a class="aa-add-card-btn"href="#"><span class="fa fa-shopping-cart"></span>Add To Cart</a>
                                                    <figcaption>
                                                        <h4 class="aa-product-title"><a href="#">Lorem ipsum doller</a></h4>
                                                        <span class="aa-product-price">$45.50</span>
                                                    </figcaption>
                                                </figure>                      
                                                <div class="aa-product-hvr-content">
                                                    <a href="#" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><span class="fa fa-heart-o"></span></a>
                                                    <a href="#" data-toggle="tooltip" data-placement="top" title="Compare"><span class="fa fa-exchange"></span></a>
                                                    <a href="#" data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal" data-target="#quick-view-modal"><span class="fa fa-search"></span></a>
                                                </div>
                                                <!-- product badge -->
                                                <span class="aa-badge aa-sold-out" href="#">Sold Out!</span>
                                            </li>
                                            <!-- start single product item -->
                                            <li>
                                                <figure>
                                                    <a class="aa-product-img" href="#"><img src="img/man/t-shirt-1.png" alt="polo shirt img"></a>
                                                    <a class="aa-add-card-btn"href="#"><span class="fa fa-shopping-cart"></span>Add To Cart</a>
                                                </figure>
                                            <figcaption>
                                                <h4 class="aa-product-title"><a href="#">T-Shirt</a></h4>
                                                <span class="aa-product-price">$45.50</span>
                                            </figcaption>
                                            <div class="aa-product-hvr-content">
                                                <a href="#" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><span class="fa fa-heart-o"></span></a>
                                                <a href="#" data-toggle="tooltip" data-placement="top" title="Compare"><span class="fa fa-exchange"></span></a>
                                                <a href="#" data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal" data-target="#quick-view-modal"><span class="fa fa-search"></span></a>
                                            </div>
                                            <!-- product badge -->
                                            <span class="aa-badge aa-sold-out" href="#">Sold Out!</span>
                                            </li>
                                            <!-- start single product item -->
                                            <li>
                                                <figure>
                                                    <a class="aa-product-img" href="#"><img src="img/women/girl-3.png" alt="polo shirt img"></a>
                                                    <a class="aa-add-card-btn"href="#"><span class="fa fa-shopping-cart"></span>Add To Cart</a>
                                                    <figcaption>
                                                        <h4 class="aa-product-title"><a href="#">Lorem ipsum doller</a></h4>
                                                        <span class="aa-product-price">$45.50</span><span class="aa-product-price"><del>$65.50</del></span>
                                                    </figcaption>
                                                </figure>                     
                                                <div class="aa-product-hvr-content">
                                                    <a href="#" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><span class="fa fa-heart-o"></span></a>
                                                    <a href="#" data-toggle="tooltip" data-placement="top" title="Compare"><span class="fa fa-exchange"></span></a>
                                                    <a href="#" data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal" data-target="#quick-view-modal"><span class="fa fa-search"></span></a>
                                                </div>
                                            </li>
                                            <!-- start single product item -->
                                            <li>
                                                <figure>
                                                    <a class="aa-product-img" href="#"><img src="img/man/polo-shirt-1.png" alt="polo shirt img"></a>
                                                    <a class="aa-add-card-btn"href="#"><span class="fa fa-shopping-cart"></span>Add To Cart</a>
                                                    <figcaption>
                                                        <h4 class="aa-product-title"><a href="#">Polo T-Shirt</a></h4>
                                                        <span class="aa-product-price">$45.50</span><span class="aa-product-price"><del>$65.50</del></span>
                                                    </figcaption>
                                                </figure>                      
                                                <div class="aa-product-hvr-content">
                                                    <a href="#" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><span class="fa fa-heart-o"></span></a>
                                                    <a href="#" data-toggle="tooltip" data-placement="top" title="Compare"><span class="fa fa-exchange"></span></a>
                                                    <a href="#" data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal" data-target="#quick-view-modal"><span class="fa fa-search"></span></a>
                                                </div>
                                            </li>
                                            <!-- start single product item -->
                                            <li>
                                                <figure>
                                                    <a class="aa-product-img" href="#"><img src="img/women/girl-4.png" alt="polo shirt img"></a>
                                                    <a class="aa-add-card-btn"href="#"><span class="fa fa-shopping-cart"></span>Add To Cart</a>
                                                    <figcaption>
                                                        <h4 class="aa-product-title"><a href="#">Lorem ipsum doller</a></h4>
                                                        <span class="aa-product-price">$45.50</span><span class="aa-product-price"><del>$65.50</del></span>
                                                    </figcaption>
                                                </figure>                     
                                                <div class="aa-product-hvr-content">
                                                    <a href="#" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><span class="fa fa-heart-o"></span></a>
                                                    <a href="#" data-toggle="tooltip" data-placement="top" title="Compare"><span class="fa fa-exchange"></span></a>
                                                    <a href="#" data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal" data-target="#quick-view-modal"><span class="fa fa-search"></span></a>
                                                </div>
                                                <!-- product badge -->
                                                <!--                                                <span class="aa-badge aa-hot" href="#">HOT!</span>-->
                                            </li>    
                                            <!-- start single product item -->
                                            <li>
                                                <figure>
                                                    <a class="aa-product-img" href="#"><img src="img/man/polo-shirt-4.png" alt="polo shirt img"></a>
                                                    <a class="aa-add-card-btn"href="#"><span class="fa fa-shopping-cart"></span>Add To Cart</a>
                                                    <figcaption>
                                                        <h4 class="aa-product-title"><a href="#">Polo T-Shirt</a></h4>
                                                        <span class="aa-product-price">$45.50</span><span class="aa-product-price"><del>$65.50</del></span>
                                                    </figcaption>
                                                </figure>                     
                                                <div class="aa-product-hvr-content">
                                                    <a href="#" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><span class="fa fa-heart-o"></span></a>
                                                    <a href="#" data-toggle="tooltip" data-placement="top" title="Compare"><span class="fa fa-exchange"></span></a>
                                                    <a href="#" data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal" data-target="#quick-view-modal"><span class="fa fa-search"></span></a>
                                                </div>
                                                <!-- product badge -->
                                                <!--                                                <span class="aa-badge aa-hot" href="#">HOT!</span>-->
                                            </li> 
                                            <!-- start single product item -->
                                            <li>
                                                <figure>
                                                    <a class="aa-product-img" href="#"><img src="img/women/girl-1.png" alt="polo shirt img"></a>
                                                    <a class="aa-add-card-btn"href="#"><span class="fa fa-shopping-cart"></span>Add To Cart</a>
                                                    <figcaption>
                                                        <h4 class="aa-product-title"><a href="#">This is Title</a></h4>
                                                        <span class="aa-product-price">$45.50</span><span class="aa-product-price"><del>$65.50</del></span>
                                                    </figcaption>
                                                </figure>                     
                                                <div class="aa-product-hvr-content">
                                                    <a href="#" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><span class="fa fa-heart-o"></span></a>
                                                    <a href="#" data-toggle="tooltip" data-placement="top" title="Compare"><span class="fa fa-exchange"></span></a>
                                                    <a href="#" data-toggle2="tooltip" data-placement="top" title="Quick View" data-toggle="modal" data-target="#quick-view-modal"><span class="fa fa-search"></span></a>                            
                                                </div>
                                                <!-- product badge -->
                                                <span class="aa-badge aa-sale" href="#">SALE!</span>
                                            </li>                                                                                   
                                        </ul>
                                        <a class="aa-browse-btn" href="#">Browse all Product <span class="fa fa-long-arrow-right"></span></a>
                                    </div>
                                    <!-- / latest product category -->              
                                </div>
                            </div>
                        </div> 
                    </div>
                </div>
            </div>
        </section>
        <!-- / popular section -->
        <!-- Support section -->
        <section id="aa-support">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="aa-support-area">
                            <!-- single support -->
                            <div class="col-md-4 col-sm-4 col-xs-12">
                                <div class="aa-support-single">
                                    <span class="fa fa-truck"></span>
                                    <h4>FREE SHIPPING</h4>
                                    <P>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quam, nobis.</P>
                                </div>
                            </div>
                            <!-- single support -->
                            <div class="col-md-4 col-sm-4 col-xs-12">
                                <div class="aa-support-single">
                                    <span class="fa fa-clock-o"></span>
                                    <h4>30 DAYS MONEY BACK</h4>
                                    <P>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quam, nobis.</P>
                                </div>
                            </div>
                            <!-- single support -->
                            <div class="col-md-4 col-sm-4 col-xs-12">
                                <div class="aa-support-single">
                                    <span class="fa fa-phone"></span>
                                    <h4>SUPPORT 24/7</h4>
                                    <P>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quam, nobis.</P>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- / Support section -->
        <!-- Testimonial -->
        <section id="aa-testimonial">  
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="aa-testimonial-area">
                            <ul class="aa-testimonial-slider">
                                <!-- single slide -->
                                <li>
                                    <div class="aa-testimonial-single">
                                        <img class="aa-testimonial-img" src="img/testimonial-img-2.jpg" alt="testimonial img">
                                        <span class="fa fa-quote-left aa-testimonial-quote"></span>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sunt distinctio omnis possimus, facere, quidem qui!consectetur adipisicing elit. Sunt distinctio omnis possimus, facere, quidem qui.</p>
                                        <div class="aa-testimonial-info">
                                            <p>Allison</p>
                                            <span>Designer</span>
                                            <a href="#">Dribble.com</a>
                                        </div>
                                    </div>
                                </li>
                                <!-- single slide -->
                                <li>
                                    <div class="aa-testimonial-single">
                                        <img class="aa-testimonial-img" src="img/testimonial-img-1.jpg" alt="testimonial img">
                                        <span class="fa fa-quote-left aa-testimonial-quote"></span>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sunt distinctio omnis possimus, facere, quidem qui!consectetur adipisicing elit. Sunt distinctio omnis possimus, facere, quidem qui.</p>
                                        <div class="aa-testimonial-info">
                                            <p>KEVIN MEYER</p>
                                            <span>CEO</span>
                                            <a href="#">Alphabet</a>
                                        </div>
                                    </div>
                                </li>
                                <!-- single slide -->
                                <li>
                                    <div class="aa-testimonial-single">
                                        <img class="aa-testimonial-img" src="img/testimonial-img-3.jpg" alt="testimonial img">
                                        <span class="fa fa-quote-left aa-testimonial-quote"></span>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sunt distinctio omnis possimus, facere, quidem qui!consectetur adipisicing elit. Sunt distinctio omnis possimus, facere, quidem qui.</p>
                                        <div class="aa-testimonial-info">
                                            <p>Luner</p>
                                            <span>COO</span>
                                            <a href="#">Kinatic Solution</a>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- / Testimonial -->

        <!-- Latest Blog -->
        <section id="aa-latest-blog">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="aa-latest-blog-area">
                            <h2>LATEST BLOG</h2>
                            <div class="row">
                                <!-- single latest blog -->
                                <div class="col-md-4 col-sm-4">
                                    <div class="aa-latest-blog-single">
                                        <figure class="aa-blog-img">                    
                                            <a href="#"><img src="img/promo-banner-1.jpg" alt="img"></a>  
                                            <figcaption class="aa-blog-img-caption">
                                                <span href="#"><i class="fa fa-eye"></i>5K</span>
                                                <a href="#"><i class="fa fa-thumbs-o-up"></i>426</a>
                                                <a href="#"><i class="fa fa-comment-o"></i>20</a>
                                                <span href="#"><i class="fa fa-clock-o"></i>June 26, 2016</span>
                                            </figcaption>                          
                                        </figure>
                                        <div class="aa-blog-info">
                                            <h3 class="aa-blog-title"><a href="#">Lorem ipsum dolor sit amet</a></h3>
                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Assumenda, ad? Autem quos natus nisi aperiam, beatae, fugiat odit vel impedit dicta enim repellendus animi. Expedita quas reprehenderit incidunt, voluptates corporis.</p> 
                                            <a href="#" class="aa-read-mor-btn">Read more <span class="fa fa-long-arrow-right"></span></a>
                                        </div>
                                    </div>
                                </div>
                                <!-- single latest blog -->
                                <div class="col-md-4 col-sm-4">
                                    <div class="aa-latest-blog-single">
                                        <figure class="aa-blog-img">                    
                                            <a href="#"><img src="img/promo-banner-3.jpg" alt="img"></a>  
                                            <figcaption class="aa-blog-img-caption">
                                                <span href="#"><i class="fa fa-eye"></i>5K</span>
                                                <a href="#"><i class="fa fa-thumbs-o-up"></i>426</a>
                                                <a href="#"><i class="fa fa-comment-o"></i>20</a>
                                                <span href="#"><i class="fa fa-clock-o"></i>June 26, 2016</span>
                                            </figcaption>                          
                                        </figure>
                                        <div class="aa-blog-info">
                                            <h3 class="aa-blog-title"><a href="#">Lorem ipsum dolor sit amet</a></h3>
                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Assumenda, ad? Autem quos natus nisi aperiam, beatae, fugiat odit vel impedit dicta enim repellendus animi. Expedita quas reprehenderit incidunt, voluptates corporis.</p> 
                                            <a href="#" class="aa-read-mor-btn">Read more <span class="fa fa-long-arrow-right"></span></a>         
                                        </div>
                                    </div>
                                </div>
                                <!-- single latest blog -->
                                <div class="col-md-4 col-sm-4">
                                    <div class="aa-latest-blog-single">
                                        <figure class="aa-blog-img">                    
                                            <a href="#"><img src="img/promo-banner-1.jpg" alt="img"></a>  
                                            <figcaption class="aa-blog-img-caption">
                                                <span href="#"><i class="fa fa-eye"></i>5K</span>
                                                <a href="#"><i class="fa fa-thumbs-o-up"></i>426</a>
                                                <a href="#"><i class="fa fa-comment-o"></i>20</a>
                                                <span href="#"><i class="fa fa-clock-o"></i>June 26, 2016</span>
                                            </figcaption>                          
                                        </figure>
                                        <div class="aa-blog-info">
                                            <h3 class="aa-blog-title"><a href="#">Lorem ipsum dolor sit amet</a></h3>
                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Assumenda, ad? Autem quos natus nisi aperiam, beatae, fugiat odit vel impedit dicta enim repellendus animi. Expedita quas reprehenderit incidunt, voluptates corporis.</p> 
                                            <a href="#" class="aa-read-mor-btn">Read more <span class="fa fa-long-arrow-right"></span></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>    
                </div>
            </div>
        </section>
        <!-- / Latest Blog -->

        <!-- Client Brand -->
        <section id="aa-client-brand">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="aa-client-brand-area">
                            <ul class="aa-client-brand-slider">
                                <li><a href="#"><img src="img/client-brand-java.png" alt="java img"></a></li>
                                <li><a href="#"><img src="img/client-brand-jquery.png" alt="jquery img"></a></li>
                                <li><a href="#"><img src="img/client-brand-html5.png" alt="html5 img"></a></li>
                                <li><a href="#"><img src="img/client-brand-css3.png" alt="css3 img"></a></li>
                                <li><a href="#"><img src="img/client-brand-wordpress.png" alt="wordPress img"></a></li>
                                <li><a href="#"><img src="img/client-brand-joomla.png" alt="joomla img"></a></li>
                                <li><a href="#"><img src="img/client-brand-java.png" alt="java img"></a></li>
                                <li><a href="#"><img src="img/client-brand-jquery.png" alt="jquery img"></a></li>
                                <li><a href="#"><img src="img/client-brand-html5.png" alt="html5 img"></a></li>
                                <li><a href="#"><img src="img/client-brand-css3.png" alt="css3 img"></a></li>
                                <li><a href="#"><img src="img/client-brand-wordpress.png" alt="wordPress img"></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- / Client Brand -->

        <!-- Subscribe section -->
        <section id="aa-subscribe">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="aa-subscribe-area">
                            <h3>Subscribe our newsletter </h3>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ex, velit!</p>
                            <form action="" class="aa-subscribe-form">
                                <input type="email" name="" id="" placeholder="Enter your Email">
                                <input type="submit" value="Subscribe">
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- / Subscribe section -->

        <!-- footer -->  
        <footer id="aa-footer">
            <!-- footer bottom -->
            <div class="aa-footer-top">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="aa-footer-top-area">
                                <div class="row">
                                    <div class="col-md-3 col-sm-6">
                                        <div class="aa-footer-widget">
                                            <h3>Main Menu</h3>
                                            <ul class="aa-footer-nav">
                                                <li><a href="#">Home</a></li>
                                                <li><a href="#">Our Services</a></li>
                                                <li><a href="#">Our Products</a></li>
                                                <li><a href="#">About Us</a></li>
                                                <li><a href="#">Contact Us</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="col-md-3 col-sm-6">
                                        <div class="aa-footer-widget">
                                            <div class="aa-footer-widget">
                                                <h3>Knowledge Base</h3>
                                                <ul class="aa-footer-nav">
                                                    <li><a href="#">Delivery</a></li>
                                                    <li><a href="#">Returns</a></li>
                                                    <li><a href="#">Services</a></li>
                                                    <li><a href="#">Discount</a></li>
                                                    <li><a href="#">Special Offer</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-3 col-sm-6">
                                        <div class="aa-footer-widget">
                                            <div class="aa-footer-widget">
                                                <h3>Useful Links</h3>
                                                <ul class="aa-footer-nav">
                                                    <li><a href="#">Site Map</a></li>
                                                    <li><a href="#">Search</a></li>
                                                    <li><a href="#">Advanced Search</a></li>
                                                    <li><a href="#">Suppliers</a></li>
                                                    <li><a href="#">FAQ</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-3 col-sm-6">
                                        <div class="aa-footer-widget">
                                            <div class="aa-footer-widget">
                                                <h3>Contact Us</h3>
                                                <address>
                                                    <p> 25 Astor Pl, NY 10003, USA</p>
                                                    <p><span class="fa fa-phone"></span>+1 212-982-4589</p>
                                                    <p><span class="fa fa-envelope"></span>dailyshop@gmail.com</p>
                                                </address>
                                                <div class="aa-footer-social">
                                                    <a href="#"><span class="fa fa-facebook"></span></a>
                                                    <a href="#"><span class="fa fa-twitter"></span></a>
                                                    <a href="#"><span class="fa fa-google-plus"></span></a>
                                                    <a href="#"><span class="fa fa-youtube"></span></a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- footer-bottom -->
            <div class="aa-footer-bottom">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="aa-footer-bottom-area">
                                <p>Designed by <a href="http://www.markups.io/">MarkUps.io</a></p>
                                <div class="aa-footer-payment">
                                    <span class="fa fa-cc-mastercard"></span>
                                    <span class="fa fa-cc-visa"></span>
                                    <span class="fa fa-paypal"></span>
                                    <span class="fa fa-cc-discover"></span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
        <!-- / footer -->

        <!-- Login Modal -->  
        <div class="modal fade" id="login-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">                      
                    <div class="modal-body">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4>Login or Register</h4>
                        <form action="Login" class="aa-login-form"  method="POST">
                            <label for="">Username or Email address<span>*</span></label>
                            <input type="text" name="user" placeholder="Username or email">
                            <label for="">Password<span>*</span></label>
                            <input type="password" name="pass" placeholder="Password">
                            <button class="aa-browse-btn" type="submit">Login</button>
                            <!--<label for="rememberme" class="rememberme"><input type="checkbox" id="rememberme"> Remember me </label>-->
                            <!--<p class="aa-lost-password"><a href="#">Lost your password?</a></p>-->
                            <div class="aa-register-now">
                                Don't have an account?<a href="account.jsp">Register now!</a>
                            </div>
                        </form>
                    </div>                        
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div>    

        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="js/bootstrap.js"></script>  
        <!-- SmartMenus jQuery plugin -->
        <script type="text/javascript" src="js/jquery.smartmenus.js"></script>
        <!-- SmartMenus jQuery Bootstrap Addon -->
        <script type="text/javascript" src="js/jquery.smartmenus.bootstrap.js"></script>  
        <!-- To Slider JS -->
        <script src="js/sequence.js"></script>
        <script src="js/sequence-theme.modern-slide-in.js"></script>  
        <!-- Product view slider -->
        <script type="text/javascript" src="js/jquery.simpleGallery.js"></script>
        <script type="text/javascript" src="js/jquery.simpleLens.js"></script>
        <!-- slick slider -->
        <script type="text/javascript" src="js/slick.js"></script>
        <!-- Price picker slider -->
        <script type="text/javascript" src="js/nouislider.js"></script>
        <!-- Custom js -->
        <script src="js/custom.js"></script> 

    </body>
</html>
