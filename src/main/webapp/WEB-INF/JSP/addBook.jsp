<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Book - NovelNest</title>
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;700&family=Inter:wght@300;400;500;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
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
            --border: #E1E5EB;
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
            align-items: center;
            justify-content: center;
            padding: 2rem;
        }
        
        /* ====== Navbar ====== */
        nav {
            background: rgba(255, 255, 255, 0.95);
            padding: 1rem 5%;
            display: flex;
            align-items: center;
            justify-content: space-between;
            box-shadow: 0 2px 15px rgba(0,0,0,0.1);
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
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
        
        /* ====== Form Container ====== */
        .form-container {
            background: #fff;
            padding: 2.5rem;
            border-radius: 16px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
            width: 100%;
            max-width: 450px;
            margin-top: 4rem;
        }
        
        .form-header {
            text-align: center;
            margin-bottom: 2rem;
        }
        
        .form-icon {
            display: flex;
            justify-content: center;
            margin-bottom: 1rem;
        }
        
        .form-icon div {
            width: 70px;
            height: 70px;
            border-radius: 50%;
            background: var(--light-blue);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 2rem;
            color: var(--primary);
        }
        
        .form-header h1 {
            font-family: 'Playfair Display', serif;
            font-size: 1.8rem;
            color: var(--secondary);
            margin-bottom: 0.5rem;
        }
        
        .form-header p {
            color: var(--gray);
            font-size: 0.95rem;
        }
        
        /* ====== Form Elements ====== */
        .form-group {
            margin-bottom: 1.5rem;
        }
        
        .form-group label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: 500;
            color: var(--dark);
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }
        
        .form-group label i {
            color: var(--primary);
        }
        
        .input-with-icon {
            position: relative;
        }
        
        .input-with-icon i {
            position: absolute;
            left: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: var(--gray);
        }
        
        .input-with-icon input {
            padding-left: 45px;
        }
        
        .form-group input {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid var(--border);
            border-radius: 10px;
            font-size: 1rem;
            transition: all 0.3s ease;
        }
        
        .form-group input:focus {
            outline: none;
            border-color: var(--primary);
            box-shadow: 0 0 0 3px rgba(58, 110, 165, 0.2);
        }
        
        /* ====== Buttons ====== */
        .form-buttons {
            display: flex;
            flex-direction: column;
            gap: 1rem;
            margin-top: 2rem;
        }
        
        .btn {
            padding: 12px 20px;
            border: none;
            border-radius: 10px;
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
            text-decoration: none;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 0.5rem;
        }
        
        .btn-primary {
            background: linear-gradient(135deg, var(--primary), var(--secondary));
            color: white;
            box-shadow: 0 4px 10px rgba(58, 110, 165, 0.3);
        }
        
        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 15px rgba(58, 110, 165, 0.4);
        }
        
        .btn-secondary {
            background: white;
            color: var(--gray);
            border: 1px solid var(--border);
        }
        
        .btn-secondary:hover {
            background: #f8f9fa;
            transform: translateY(-2px);
        }
        
        /* ====== Footer ====== */
        footer {
            margin-top: 2rem;
            text-align: center;
            font-size: 0.9rem;
            color: var(--gray);
        }
        
        /* Responsive Design */
        @media (max-width: 768px) {
            body {
                padding: 1rem;
            }
            
            nav {
                flex-direction: column;
                gap: 1rem;
                padding: 1rem;
            }
            
            .nav-links {
                flex-wrap: wrap;
                justify-content: center;
            }
            
            .form-container {
                padding: 2rem 1.5rem;
                margin-top: 6rem;
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
            <a href="/library/home"><i class="fas fa-home"></i> Home</a>
            <a href="/library/addBookForm"><i class="fas fa-plus"></i> Add Book</a>
            <a href="/library/display"><i class="fas fa-book"></i> View Books</a>
        </div>
    </nav>

    <div class="form-container">
        <div class="form-header">
            <div class="form-icon">
                <div>
                    <i class="fas fa-book"></i>
                </div>
            </div>
            <h1>Add New Book</h1>
            <p>Fill in the details to add a book to the library</p>
        </div>
        
        <form method="post" action="addBook" modelAttribute="book">
            <div class="form-group">
                <label for="name"><i class="fas fa-book"></i> Book Name</label>
                <div class="input-with-icon">
                    
                    <input type="text" id="name" name="name" placeholder="Enter book title" required>
                </div>
            </div>
            
            <div class="form-group">
                <label for="author"><i class="fas fa-user"></i> Author</label>
                <div class="input-with-icon">
                    
                    <input type="text" id="author" name="author" placeholder="Enter author name" required>
                </div>
            </div>
            
            <div class="form-group">
                <label for="price"><i class="fas fa-tag"></i> Price</label>
                <div class="input-with-icon">
                    
                    <input type="text" id="price" name="price" placeholder="Enter price" required>
                </div>
            </div>
            
            <div class="form-buttons">
                <button type="submit" class="btn btn-primary">
                    <i class="fas fa-save"></i> Save Book
                </button>
                
                <a href="display" class="btn btn-secondary">
                    <i class="fas fa-arrow-left"></i> Back to Library
                </a>
            </div>
        </form>
    </div>

    <footer>
        &copy; 2025 Java Training School Library
    </footer>

</body>
</html>