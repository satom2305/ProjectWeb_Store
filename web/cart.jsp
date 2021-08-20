<%-- 
    Document   : cart
    Created on : Jul 14, 2021, 8:50:31 PM
    Author     : Admin
--%>

<%@page import="entity.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">    
        <title>Daily Shop | Cart Page</title>

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
                                            } else {
                                                String user = (String) session.getAttribute("user");
                                            %>
                                        <li><a>Dear <%=user%></a></li>
                                        <li class="hidden-xs"><a href="wishlist.jsp">Wishlist</a></li>
                                        <li class="hidden-xs"><a href="cart.jsp">My Cart</a></li>
                                        <li class="hidden-xs"><a href="checkout.jsp">Checkout</a></li>
                                        <!--data-toggle="modal" data-target="#login-modal"-->
                                        <li><a href="account.jsp" >Logout</a></li>
                                            <%
                                                }
                                            %>
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
                                <li><a href="http://localhost:8080/PRJ321.M3.project/ControllerProduct">Home</a></li>
                                <li><a href="#">Furniture</a></li>            
                                <li><a href="blog-archive.jsp">Blog <span class="caret"></span></a>
                                    <ul class="dropdown-menu">                
                                        <li><a href="blog-archive.jsp">Blog Style 1</a></li>
                                        <li><a href="blog-archive-2.jsp">Blog Style 2</a></li>
                                        <li><a href="blog-single.jsp">Blog Single</a></li>                
                                    </ul>
                                </li>
                                <li><a href="contact.jsp">Contact</a></li>
                                <li><a href="#">Pages <span class="caret"></span></a>
                                    <ul class="dropdown-menu">                
                                        <li><a href="product.jsp">Shop Page</a></li>
                                        <li><a href="product-detail.jsp">Shop Single</a></li>                
                                        <li><a href="404.jsp">404 Page</a></li>                
                                    </ul>
                                </li>
                            </ul>
                        </div><!--/.nav-collapse -->
                    </div>
                </div> 
            </div>
        </div>
    </section>
    <!-- / menu -->  

    <!-- catg header banner section -->
    <section id="aa-catg-head-banner">
        <img src="img/fashion/fashion-header-bg-8.jpg" alt="fashion img">
        <div class="aa-catg-head-banner-area">
            <div class="container">
                <div class="aa-catg-head-banner-content">
                    <h2>Cart Page</h2>
                    <ol class="breadcrumb">
                        <li><a href="index.jsp">Home</a></li>                   
                        <li class="active">Cart</li>
                    </ol>
                </div>
            </div>
        </div>
    </section>
    <!-- / catg header banner section -->

    <!-- Cart view section -->
    <section id="cart-view">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="cart-view-area">
                        <div class="cart-view-table">
                            <form action="">
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th></th>
                                                <th></th>
                                                <th>Product</th>
                                                <th>Price</th>
                                                <th>Quantity</th>
                                                <th>Total</th>
                                            </tr>
                                        </thead>
                                        <tbody>

                                            <tr>
                                                <%
                                                    java.util.Enumeration em = session.getAttributeNames();
                                                    float subtotal = 0;

                                                    while (em.hasMoreElements()) {
                                                        String productID = em.nextElement().toString();
                                                        if (session.getAttribute(productID) != null && session.getAttribute(productID) != session.getAttribute("user") && session.getAttribute(productID) != session.getAttribute("role") && session.getAttribute(productID) != session.getAttribute("pass")) {
                                                            Product pro = (Product) session.getAttribute(productID);

                                                            int count = pro.getQuantity();
                                                %>
                                                <td><a class="remove" href="ControllerProduct?service=remove&di=<%= pro.getPid()%> "><fa class="fa fa-close"></fa></a></td>
                                                <td><a href="#"><img  src="<%= pro.getImage()%>" alt="img" style="width:265px;height:190px;"></a></td>
                                                <td><a class="aa-cart-title" href="#"><%= pro.getPname()%></a></td>
                                                <td><%= pro.getPrice()%>$</td>
                                                <td><input class="aa-cart-quantity" name="quantity" type="text" value="<%= count%>"></td>
                                                <td><%= pro.getPrice() * count%></td>  
                                                <%= subtotal += pro.getPrice() * count%>
                                            </tr>    
                                            
                                                <%}%>
                                            <%}%>

                                            <tr>                             
                                                <td colspan="6" class="aa-cart-view-bottom">
                                                    <div class="aa-cart-coupon">
                                                        <input class="aa-coupon-code" type="text" placeholder="Coupon">
                                                        <input class="aa-cart-view-btn" type="submit" value="Apply Coupon">
                                                    </div>
                                                    <input href="ControllerProduct?service=updateCart" class="aa-cart-view-btn" value="Update Cart">
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </form>
                            <!-- Cart Total view -->
                            <div class="cart-view-total">
                                <h4>Cart Totals</h4>
                                <table class="aa-totals-table">
                                    <tbody>
                                        <tr>
                                            <th>Subtotal</th>
                                            <td><%= subtotal%></td>>
                                        </tr>
                                        <tr>
                                            <th>Total</th>
                                            <td><%= subtotal%></td>>
                                        </tr>
                                    </tbody>
                                </table>
                                <a href="checkout.jsp" class="aa-cart-view-btn">Proced to Checkout</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- / Cart view section -->


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
                    <form class="aa-login-form" action="">
                        <label for="">Username or Email address<span>*</span></label>
                        <input type="text" placeholder="Username or email">
                        <label for="">Password<span>*</span></label>
                        <input type="password" placeholder="Password">
                        <button class="aa-browse-btn" type="submit">Login</button>
                        <label for="rememberme" class="rememberme"><input type="checkbox" id="rememberme"> Remember me </label>
                        <p class="aa-lost-password"><a href="#">Lost your password?</a></p>
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
