<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NovelNest - Library Management System</title>
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;700&family=Inter:wght@300;400;500;600&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary: #3A6EA5;
            --secondary: #004E98;
            --accent: #FF6B6B;
            --light: #F8F9FA;
            --dark: #212529;
            --success: #28A745;
            --warning: #FFC107;
            --gray: #6C757D;
            --light-blue: #E6F2FF;
        }
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Inter', sans-serif;
            background: linear-gradient(135deg, var(--light-blue) 0%, #ffffff 100%);
            color: var(--dark);
            line-height: 1.6;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }
        
        /* ====== Navbar ====== */
        nav {
            background: rgba(255, 255, 255, 0.95);
            padding: 1rem 5%;
            display: flex;
            align-items: center;
            justify-content: space-between;
            box-shadow: 0 2px 15px rgba(0,0,0,0.1);
            position: sticky;
            top: 0;
            z-index: 100;
            backdrop-filter: blur(10px);
        }
        
        .logo {
            display: flex;
            align-items: center;
            gap: 0.5rem;
            font-family: 'Playfair Display', serif;
            font-size: 1.8rem;
            font-weight: 700;
            color: var(--secondary);
            text-decoration: none;
        }
        
        .logo-icon {
            font-size: 2.2rem;
            color: var(--accent);
        }
        
        .nav-links {
            display: flex;
            gap: 1.5rem;
        }
        
        .nav-links a {
            text-decoration: none;
            color: var(--dark);
            font-weight: 500;
            font-size: 1rem;
            padding: 0.5rem 1rem;
            border-radius: 50px;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }
        
        .nav-links a:hover {
            background: var(--light-blue);
            color: var(--primary);
            transform: translateY(-2px);
        }
        
        /* ====== Hero Section ====== */
        .hero {
            padding: 4rem 5%;
            display: flex;
            flex-direction: column;
            align-items: center;
            text-align: center;
            background: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" width="100" height="100" viewBox="0 0 100 100"><rect fill="%23E6F2FF" width="100" height="100"/><path fill="%233A6EA5" fill-opacity="0.1" d="M0 0h100v100H0z"/></svg>');
            position: relative;
            overflow: hidden;
        }
        
        .hero::before {
            content: "";
            position: absolute;
            top: -50%;
            right: -10%;
            width: 300px;
            height: 300px;
            border-radius: 50%;
            background: rgba(58, 110, 165, 0.05);
            z-index: 0;
        }
        
        .hero::after {
            content: "";
            position: absolute;
            bottom: -30%;
            left: -10%;
            width: 250px;
            height: 250px;
            border-radius: 50%;
            background: rgba(255, 107, 107, 0.05);
            z-index: 0;
        }
        
        .hero-content {
            max-width: 800px;
            position: relative;
            z-index: 1;
        }
        
        .hero h1 {
            font-family: 'Playfair Display', serif;
            font-size: 3.5rem;
            color: var(--secondary);
            margin-bottom: 1rem;
            line-height: 1.2;
        }
        
        .hero p {
            font-size: 1.2rem;
            color: var(--gray);
            margin-bottom: 2rem;
            max-width: 600px;
            margin-left: auto;
            margin-right: auto;
        }
        
        .app-name {
            display: inline-block;
            background: linear-gradient(135deg, var(--primary), var(--secondary));
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            font-weight: 700;
        }
        
        /* ====== Main Content ====== */
        .container {
            flex: 1;
            padding: 2rem 5%;
        }
        
        .features {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 2rem;
            margin-bottom: 3rem;
        }
        
        .feature-card {
            background: white;
            border-radius: 12px;
            padding: 2rem;
            box-shadow: 0 5px 20px rgba(0,0,0,0.05);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            text-align: center;
        }
        
        .feature-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(0,0,0,0.1);
        }
        
        .feature-icon {
            font-size: 2.5rem;
            margin-bottom: 1rem;
            color: var(--primary);
        }
        
        .feature-card h3 {
            font-family: 'Playfair Display', serif;
            color: var(--secondary);
            margin-bottom: 1rem;
            font-size: 1.5rem;
        }
        
        .feature-card p {
            color: var(--gray);
            margin-bottom: 1.5rem;
        }
        
        /* ====== Buttons ====== */
        .btn {
            padding: 0.8rem 1.8rem;
            border: none;
            border-radius: 50px;
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
            text-decoration: none;
            transition: all 0.3s ease;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
        }
        
        .btn-primary {
            background: linear-gradient(135deg, var(--primary), var(--secondary));
            color: white;
            box-shadow: 0 4px 10px rgba(58, 110, 165, 0.3);
        }
        
        .btn-primary:hover {
            transform: translateY(-3px);
            box-shadow: 0 6px 15px rgba(58, 110, 165, 0.4);
        }
        
        .btn-secondary {
            background: white;
            color: var(--primary);
            border: 2px solid var(--primary);
        }
        
        .btn-secondary:hover {
            background: var(--light-blue);
            transform: translateY(-3px);
        }
        
        .cta-buttons {
            display: flex;
            gap: 1rem;
            justify-content: center;
            margin-top: 2rem;
            flex-wrap: wrap;
        }
        
        /* ====== Stats Section ====== */
        .stats {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 1.5rem;
            margin: 3rem 0;
        }
        
        .stat-card {
            background: white;
            border-radius: 12px;
            padding: 1.5rem;
            text-align: center;
            box-shadow: 0 5px 15px rgba(0,0,0,0.05);
        }
        
        .stat-number {
            font-size: 2.5rem;
            font-weight: 700;
            color: var(--primary);
            margin-bottom: 0.5rem;
        }
        
        .stat-label {
            color: var(--gray);
            font-size: 0.9rem;
        }
        
        /* ====== Footer ====== */
        footer {
            background: var(--secondary);
            color: white;
            padding: 3rem 5%;
            text-align: center;
            margin-top: auto;
        }
        
        .footer-content {
            max-width: 1200px;
            margin: 0 auto;
        }
        
        .footer-links {
            display: flex;
            justify-content: center;
            gap: 2rem;
            margin: 1.5rem 0;
        }
        
        .footer-links a {
            color: rgba(255, 255, 255, 0.8);
            text-decoration: none;
            transition: color 0.3s ease;
        }
        
        .footer-links a:hover {
            color: white;
        }
        
        .copyright {
            margin-top: 1.5rem;
            color: rgba(255, 255, 255, 0.7);
            font-size: 0.9rem;
        }
        
        /* Responsive Design */
        @media (max-width: 768px) {
            nav {
                flex-direction: column;
                gap: 1rem;
            }
            
            .nav-links {
                flex-wrap: wrap;
                justify-content: center;
            }
            
            .hero h1 {
                font-size: 2.5rem;
            }
            
            .cta-buttons {
                flex-direction: column;
                align-items: center;
            }
            
            .features, .stats {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>

    <!-- Navbar -->
    <nav>
        <a href="/library/home" class="logo">
            <span class="logo-icon">📚</span>
            <span>NovelNest</span>
        </a>
        <div class="nav-links">
            <a href="/library/home">🏠 Home</a>
            <a href="/library/addBookForm">➕ Add Book</a>
            <a href="/library/display">📖 View Books</a>
        </div>
    </nav>

    <!-- Hero Section -->
    <section class="hero">
        <div class="hero-content">
            <h1>Discover Your Next <span class="app-name">Favorite Book</span></h1>
            <p>Welcome to our digital library management system. Explore our collection, manage books, and dive into the world of literature.</p>
            <h3>${appName}</h3>
        </div>
    </section>

    <!-- Main Content -->
    <div class="container">
        <div class="features">
            <div class="feature-card">
                <div class="feature-icon">🔍</div>
                <h3>Browse Collection</h3>
                <p>Explore our extensive library of books from various genres, authors, and publications.</p>
                <a href="/library/display" class="btn btn-primary">
                    <span>View Books</span>
                    <span>→</span>
                </a>
            </div>
            
            <div class="feature-card">
                <div class="feature-icon">➕</div>
                <h3>Add New Books</h3>
                <p>Contribute to our growing collection by adding new books with detailed information.</p>
                <a href="/library/addBookForm" class="btn btn-primary">
                    <span>Add Book</span>
                    <span>+</span>
                </a>
            </div>
            
            <div class="feature-card">
                <div class="feature-icon">📊</div>
                <h3>Manage Inventory</h3>
                <p>Efficiently manage the library inventory with our intuitive management system.</p>
                <a href="/library/display" class="btn btn-primary">
                    <span>Manage</span>
                    <span>⚙️</span>
                </a>
            </div>
        </div>
        
        
        
        <div class="cta-buttons">
            <a href="/library/display" class="btn btn-primary">📚 Browse Our Collection</a>
            <a href="/library/addBookForm" class="btn btn-secondary">➕ Add a New Book</a>
        </div>
    </div>

    <!-- Footer -->
    <footer>
        <div class="footer-content">
            <div class="logo" style="justify-content: center; color: white;">
                <span class="logo-icon">📚</span>
                <span>NovelNest</span>
            </div>
            <div class="footer-links">
                <a href="/library/home">Home</a>
                <a href="/library/addBookForm">Add Book</a>
                <a href="/library/display">View Books</a>
                <a href="#">About Us</a>
                <a href="#">Contact</a>
            </div>
            <div class="copyright">
                &copy; 2025 Java Training School Library. All rights reserved.
            </div>
        </div>
    </footer>

</body>
</html>