<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Mostrador.aspx.cs" Inherits="Tienda.Mostrador" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link href="https://unpkg.com/aos@2.3.4/dist/aos.css" rel="stylesheet">
    <style>
        /* Colores personalizados */
        :root {
            --primary-color: #0d6efd;
            --secondary-color: #ff5733;
            --accent-color: #17a2b8;
            --dark-color: #121212;
            --hover-gradient: linear-gradient(45deg, #0d6efd, #ff5733);
        }

        /* General */
        body {
            background-color: var(--dark-color);
            color: #fff;
        }

        /* Navbar con degradado fijo */
        .navbar {
            background: linear-gradient(45deg, #ff5733, #0d6efd);
            transition: all 0.4s ease-in-out;
        }

        /* Carrusel */
        .carousel-image {
            width: 100%;
            height: 600px;
            object-fit: cover;
            animation: zoom 10s infinite;
        }
        @keyframes zoom {
            0%, 100% {
                transform: scale(1);
            }
            50% {
                transform: scale(1.1);
            }
        }

        .carousel-caption {
            background: rgba(0, 0, 0, 0.7);
            padding: 15px;
            border-radius: 10px;
            animation: fadeInUp 2s ease-in-out;
        }

        /* Productos */
        .products-section {
            background: var(--dark-color);
            padding: 50px 0;
        }

        .product-card {
            background: var(--dark-color);
            border: 2px solid var(--primary-color);
            transition: all 0.5s ease;
            color: white;
            animation: fadeInZoom 1s ease;
        }

        @keyframes fadeInZoom {
            from {
                opacity: 0;
                transform: scale(0.8);
            }
            to {
                opacity: 1;
                transform: scale(1);
            }
        }

        .product-card:hover {
            transform: scale(1.1) rotate(1deg);
            background: var(--hover-gradient);
            border-color: var(--secondary-color);
            box-shadow: 0 8px 15px rgba(255, 87, 51, 0.4);
        }
        .product-image {
            width: 100%;
            height: 200px;
            object-fit: cover;
            border-bottom: 2px solid var(--primary-color);
        }

        .product-card .btn {
            background: var(--accent-color);
            color: white;
            transition: all 0.4s ease-in-out;
        }
        .product-card .btn:hover {
            background: var(--primary-color);
            color: black;
        }

        /* Títulos con efecto typing */
        .section-title {
            font-size: 2.5rem;
            font-weight: bold;
            color: var(--primary-color);
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
            overflow: hidden;
            white-space: nowrap;
            border-right: 2px solid var(--primary-color);
            animation: typing 4s steps(30, end), blink 0.8s step-end infinite;
        }

        @keyframes typing {
            from {
                width: 0;
            }
            to {
                width: 100%;
            }
        }

        @keyframes blink {
            50% {
                border-color: transparent;
            }
        }

        /* Botón de flecha para subir */
        .scroll-to-top {
            position: fixed;
            bottom: 20px;
            right: 20px;
            background: var(--primary-color);
            color: white;
            border-radius: 50%;
            width: 50px;
            height: 50px;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            transition: all 0.4s ease-in-out;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
        }

        .scroll-to-top:hover {
            background: var(--hover-gradient);
            transform: scale(1.2);
            box-shadow: 0 8px 15px rgba(255, 87, 51, 0.5);
        }

        .scroll-to-top i {
            font-size: 1.5rem;
        }

        /* Footer */

        .footer {
            background: linear-gradient(45deg, #ff5733, #0d6efd);
            color: white;
            padding: 30px 0;
        }

        .footer a {
            color: var(--primary-color);
            text-decoration: none;
            font-weight: bold;
        }
        .footer a:hover {
            color: var(--secondary-color);
        }
        .footer .grupo {
            margin-top: 10px;
            font-weight: bold;
            color: #fff;
            font-size: 1.2rem;
        }
        /* Mensaje de bienvenida - Overlay */
        .welcome-overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(45deg, #ff5733, #0d6efd);
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            z-index: 2000;
            opacity: 1;
            visibility: visible;
            transition: all 1s ease-in-out;
        }

        /* Contenido del mensaje */
        .welcome-content {
            text-align: center;
            animation: fadeIn 1.5s ease-in-out;
        }

        .welcome-content h1 {
            font-size: 3rem;
            font-weight: bold;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
            margin-bottom: 20px;
        }

        .welcome-content p {
            font-size: 1.5rem;
            margin-bottom: 20px;
        }

        /* Ocultar mensaje de bienvenida */
        .welcome-overlay.hidden {
            opacity: 0;
            visibility: hidden;
            transition: all 1s ease-in-out;
        }

        /* Animación de entrada */
        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: scale(0.8);
            }
            to {
                opacity: 1;
                transform: scale(1);
            }
        }

    </style>
    <title>Electroniks - Catálogo</title>
</head>
<body>
    <!-- Mensaje de bienvenida -->
    <div id="welcomeMessage" class="welcome-overlay">
        <div class="welcome-content">
            <h1>Bienvenido a Electroniks</h1>
            <p>Tu mejor opción en tecnología y electrónica</p>
        </div>
    </div>

    <form id="form1" runat="server">
        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg fixed-top">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">
                    <img src="https://blogs.ucontinental.edu.pe/wp-content/uploads/2016/08/logo-universidad-continental.png" alt="Logo" width="190" height="50">
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item"><a class="nav-link text-white" href="#">Inicio</a></li>
                        <li class="nav-item"><a class="nav-link text-white" href="#catalogo">Catálogo</a></li>
                        <li class="nav-item"><a class="nav-link text-white" href="#about">Nosotros</a></li>
                    </ul>
                </div>
            </div>
        </nav>

        <!-- Carrusel -->
        <div id="carouselExample" class="carousel slide mt-5 pt-3" data-bs-ride="carousel" data-aos="zoom-in">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="https://concepto.de/wp-content/uploads/2020/06/Computadora-de-escritorio-scaled-e1724955496406.jpg" class="carousel-image" alt="Imagen 1">
                    <div class="carousel-caption">
                        <h5>Mejores dispositivos electrónicos</h5>
                        <p>Encuentra lo que necesitas con nosotros.</p>
                    </div>
                </div>
                <div class="carousel-item">
                    <img src="https://hiraoka.com.pe/media/mageplaza/blog/post/d/j/dji-tecnologia_en_drones_y_camaras_de_accion.jpg" class="carousel-image" alt="Imagen 2">
                    <div class="carousel-caption">
                        <h5>Electrónica moderna</h5>
                        <p>Calidad garantizada.</p>
                    </div>
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
                <span class="carousel-control-prev-icon"></span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
                <span class="carousel-control-next-icon"></span>
            </button>
        </div>

        <!-- Descripción -->
        <section class="description text-center" data-aos="fade-right">
            <h2 class="section-title">Bienvenido a <strong>Electroniks</strong></h2>
            <p>Tu mejor opción para comprar componentes y dispositivos electrónicos.</p>
        </section>

        <!-- Catálogo -->
        <section id="catalogo" class="products-section" data-aos="fade-up">
            <div class="container">
                <h2 class="text-center section-title">Mira nuestros productos</h2>
                <asp:Repeater ID="rptCategorias" runat="server">
                    <ItemTemplate>
                        <h3 class="text-center text-uppercase mt-4"><%# Eval("CategoriaNombre") %></h3>
                        <div class="row g-4">
                            <asp:Repeater ID="rptProductos" runat="server" DataSource='<%# Eval("Productos") %>'>
                                <ItemTemplate>
                                    <div class="col-md-3">
                                        <div class="card product-card" data-aos="flip-left">
                                            <img src='<%# Eval("Imagen") %>' class="product-image" alt='<%# Eval("Nombre") %>'>
                                            <div class="card-body text-center">
                                                <h5 class="card-title"><%# Eval("Nombre") %></h5>
                                                <p class="card-text"><%# Eval("Descripcion") %></p>
                                                <p><strong>Precio:</strong> $<%# Eval("Precio") %></p>
                                                <p><strong>Stock:</strong> <%# Eval("Stock") %></p>
                                                <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#productModal">Ver más</button>
                                            </div>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </section>
    </form>

    <!-- Botón para volver arriba -->
    <div class="scroll-to-top" id="scrollToTop" title="Ir arriba">
        <i class="bi bi-arrow-up"></i>
    </div>

    <!-- Footer -->
    <footer class="footer text-center">
        <div class="container">
            <p>&copy; 2024 Electroniks. Todos los derechos reservados.</p>
            <p>
                <a href="#">Política de privacidad</a> | 
                <a href="#">Términos de servicio</a>
            </p>
            <p class="grupo">Grupo las innombrables</p>
        </div>
    </footer>


    <!-- Scripts -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://unpkg.com/aos@2.3.4/dist/aos.js"></script>
    <script>

        // Desaparecer el mensaje de bienvenida automáticamente
        document.addEventListener("DOMContentLoaded", () => {
            const welcomeOverlay = document.getElementById("welcomeMessage");

            // Desaparecer el mensaje después de 3 segundos
            setTimeout(() => {
                welcomeOverlay.classList.add("hidden");
            }, 3000); // 3000ms = 3 segundos
        });

        AOS.init();

        // Mostrar u ocultar el botón de "Ir arriba"
        const scrollToTopBtn = document.getElementById('scrollToTop');
        window.addEventListener('scroll', () => {
            if (window.scrollY > 300) {
                scrollToTopBtn.style.display = 'flex';
            } else {
                scrollToTopBtn.style.display = 'none';
            }
        });

        // Volver arriba al hacer clic en el botón
        scrollToTopBtn.addEventListener('click', () => {
            window.scrollTo({ top: 0, behavior: 'smooth' });
        });
    </script>
</body>
</html>




