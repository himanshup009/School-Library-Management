<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NovelNest - Library Management</title>
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
            --available: #4CAF50;
            --borrowed: #FF9800;
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
        
        /* ====== Container ====== */
        .container {
            max-width: 1200px;
            margin: 2rem auto;
            padding: 0 1rem;
        }
        
        /* ====== Message Alert ====== */
        .alert {
            padding: 1rem 1.5rem;
            border-radius: 12px;
            margin-bottom: 2rem;
            display: flex;
            align-items: center;
            gap: 1rem;
            background: white;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            border-left: 4px solid var(--primary);
        }
        
        .alert-icon {
            font-size: 1.5rem;
            color: var(--primary);
        }
        
        /* ====== Header Section ====== */
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 2rem;
            flex-wrap: wrap;
            gap: 1rem;
        }
        
        .page-title {
            font-family: 'Playfair Display', serif;
            font-size: 2.2rem;
            color: var(--secondary);
        }
        
        /* ====== Add Book Button ====== */
        .btn-add {
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            padding: 0.8rem 1.5rem;
            background: linear-gradient(135deg, var(--primary), var(--secondary));
            color: white;
            border-radius: 50px;
            text-decoration: none;
            font-weight: 600;
            box-shadow: 0 4px 10px rgba(58, 110, 165, 0.3);
            transition: all 0.3s ease;
        }
        
        .btn-add:hover {
            transform: translateY(-3px);
            box-shadow: 0 6px 15px rgba(58, 110, 165, 0.4);
        }
        
        /* ====== Search Section ====== */
        .search-section {
            background: white;
            padding: 1.5rem;
            border-radius: 12px;
            margin-bottom: 2rem;
            box-shadow: 0 4px 12px rgba(0,0,0,0.08);
        }
        
        .search-title {
            font-family: 'Playfair Display', serif;
            font-size: 1.5rem;
            color: var(--secondary);
            margin-bottom: 1rem;
        }
        
        .search-form {
            display: flex;
            gap: 1rem;
            flex-wrap: wrap;
            align-items: end;
        }
        
        .form-group {
            flex: 2;
            min-width: 300px;
        }
        
        .form-group label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: 500;
            color: var(--dark);
        }
        
        .search-input {
            width: 100%;
            padding: 0.8rem 1rem;
            border: 1px solid var(--border);
            border-radius: 8px;
            font-family: 'Inter', sans-serif;
            font-size: 1rem;
            transition: all 0.3s ease;
        }
        
        .search-input:focus {
            outline: none;
            border-color: var(--primary);
            box-shadow: 0 0 0 3px rgba(58, 110, 165, 0.2);
        }
        
        .search-buttons {
            display: flex;
            gap: 0.5rem;
        }
        
        .btn-search {
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            padding: 0.8rem 1.5rem;
            background: linear-gradient(135deg, var(--primary), var(--secondary));
            color: white;
            border: none;
            border-radius: 8px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
        }
        
        .btn-search:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(58, 110, 165, 0.3);
        }
        
        .btn-reset {
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            padding: 0.8rem 1.5rem;
            background: var(--gray);
            color: white;
            border: none;
            border-radius: 8px;
            font-weight: 600;
            text-decoration: none;
            transition: all 0.3s ease;
        }
        
        .btn-reset:hover {
            background: #5a6268;
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(108, 117, 125, 0.3);
            color: white;
        }
        
        /* ====== Books Table ====== */
        .table-container {
            background: white;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 5px 20px rgba(0,0,0,0.08);
            margin-bottom: 2rem;
            overflow-x: auto;
        }
        
        table {
            width: 100%;
            border-collapse: collapse;
            min-width: 800px;
        }
        
        thead {
            background: linear-gradient(135deg, var(--primary), var(--secondary));
            color: white;
        }
        
        th {
            padding: 1rem 1.2rem;
            text-align: left;
            font-weight: 600;
            font-size: 0.9rem;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }
        
        tbody tr {
            border-bottom: 1px solid var(--border);
            transition: background 0.2s ease;
        }
        
        tbody tr:last-child {
            border-bottom: none;
        }
        
        tbody tr:hover {
            background: #f8fbff;
        }
        
        td {
            padding: 1.2rem;
            color: var(--dark);
        }
        
        /* Price styling with rupee symbol */
        .price {
            font-weight: 600;
            color: var(--secondary);
            display: flex;
            align-items: center;
        }
        
        .rupee-symbol {
            font-family: Arial, sans-serif;
            margin-right: 2px;
        }
        
        /* Status badges */
        .status {
            display: inline-block;
            padding: 0.4rem 0.8rem;
            border-radius: 50px;
            font-size: 0.85rem;
            font-weight: 500;
        }
        
        .status-available {
            background: rgba(76, 175, 80, 0.15);
            color: var(--available);
        }
        
        .status-borrowed {
            background: rgba(255, 152, 0, 0.15);
            color: var(--borrowed);
        }
        
        /* Action buttons */
        .actions {
            display: flex;
            gap: 0.5rem;
        }
        
        .btn-action {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            width: 36px;
            height: 36px;
            border-radius: 50%;
            text-decoration: none;
            color: white;
            font-size: 0.9rem;
            transition: all 0.2s ease;
        }
        
        .btn-action:hover {
            transform: scale(1.1);
        }
        
        .btn-borrow { 
            background: var(--success); 
        }
        
        .btn-return { 
            background: var(--warning); 
        }
        
        .btn-update { 
            background: var(--primary); 
        }
        
        .btn-delete { 
            background: var(--accent); 
        }
        
        /* Empty state */
        .empty-state {
            text-align: center;
            padding: 3rem;
            color: var(--gray);
        }
        
        .empty-icon {
            font-size: 3rem;
            margin-bottom: 1rem;
            color: var(--border);
        }
        
        /* ====== Footer ====== */
        footer {
            background: var(--secondary);
            color: white;
            padding: 2rem 5%;
            text-align: center;
            margin-top: 3rem;
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
            
            .header {
                flex-direction: column;
                align-items: flex-start;
            }
            
            .search-form {
                flex-direction: column;
            }
            
            .form-group {
                width: 100%;
            }
            
            .search-buttons {
                width: 100%;
                justify-content: center;
            }
            
            th, td {
                padding: 0.8rem;
            }
            
            .actions {
                flex-wrap: wrap;
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

    <div class="container">
        
        <!-- Header with Add Book button -->
        <div class="header">
            <h1 class="page-title">Library Collection</h1>
            <a href="addBookForm" class="btn-add">
                <i class="fas fa-plus"></i> Add New Book
            </a>
        </div>

        <!-- Search Section -->
        <div class="search-section">
            <h2 class="search-title">Search Books</h2>
            <form action="/library/search" method="get" class="search-form">
                <div class="form-group">
                    
                    <input type="text" id="searchTerm" name="searchTerm" class="search-input" 
                           placeholder="Enter book name or author name" value="${param.searchTerm}">
                </div>
                <div class="search-buttons">
                    <button type="submit" class="btn-search">
                        <i class="fas fa-search"></i> Search
                    </button>
                    <a href="/library/display" class="btn-reset">
                        <i class="fas fa-sync"></i> Reset
                    </a>
                </div>
            </form>
        </div>

        <!-- Books Table -->
        <div class="table-container">
            <c:choose>
                <c:when test="${not empty books}">
                    <c:if test="${not empty searchPerformed}">
                        <div style="padding: 1rem 1.5rem; background-color: #f8f9fa; border-bottom: 1px solid #e1e5eb;">
                            <strong>${books.size()} book(s)</strong> found
                            <c:if test="${not empty param.searchTerm}">matching "<c:out value="${param.searchTerm}"/>"</c:if>
                        </div>
                    </c:if>
                    <table>
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Book Name</th>
                                <th>Author</th>
                                <th>Price (₹)</th>
                                <th>Status</th>
                                <th>Borrowed Date</th>
                                <th>Borrowed For (Days)</th>
                                <th>Due Date</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="book" items="${books}" varStatus="status">
                                <tr>
                                    <td>${status.index + 1}</td>
                                    <td><strong>${book.name}</strong></td>
                                    <td>${book.author}</td>
                                    <td>
                                        <span class="price">
                                            <span class="rupee-symbol">₹</span>${book.price}
                                        </span>
                                    </td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${book.status == 'available'}">
                                                <span class="status status-available">Available</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="status status-borrowed">Borrowed</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>
                                        <c:if test="${book.borrowedDate != null}">
                                            ${book.borrowedDate}
                                        </c:if>
                                        <c:if test="${book.borrowedDate == null}">
                                            -
                                        </c:if>
                                    </td>
                                    <td>
                                        <c:if test="${book.borrowedForDays > 0}">
                                            ${book.borrowedForDays}
                                        </c:if>
                                        <c:if test="${book.borrowedForDays <= 0}">
                                            -
                                        </c:if>
                                    </td>
                                    <td>
                                        <c:if test="${book.dueDate != null}">
                                            ${book.dueDate}
                                        </c:if>
                                        <c:if test="${book.dueDate == null}">
                                            -
                                        </c:if>
                                    </td>
                                    <td>
                                        <div class="actions">
                                            <c:if test="${book.status == 'available'}">
                                                <a href="borrowForm/${book.id}" class="btn-action btn-borrow" title="Borrow">
                                                    <i class="fas fa-hand-holding"></i>
                                                </a>
                                            </c:if>
                                            <c:if test="${book.status == 'Borrowed'}">
                                                <a href="returnBook/${book.id}" class="btn-action btn-return" title="Return">
                                                    <i class="fas fa-undo"></i>
                                                </a>
                                            </c:if>
                                            <a href="updateForm/${book.id}" class="btn-action btn-update" title="Update">
                                                <i class="fas fa-edit"></i>
                                            </a>
                                            <a href="deleteBook/${book.id}" class="btn-action btn-delete" title="Delete">
                                                <i class="fas fa-trash"></i>
                                            </a>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:when>
                <c:otherwise>
                    <div class="empty-state">
                        <div class="empty-icon"><i class="fas fa-book-open"></i></div>
                        <c:choose>
                            <c:when test="${not empty searchPerformed}">
                                <h3>No Books Found</h3>
                                <p>No books found matching your search criteria.</p>
                            </c:when>
                            <c:otherwise>
                                <h3>No Books Available</h3>
                                <p>Get started by adding your first book to the library.</p>
                                <a href="addBookForm" class="btn-add" style="margin-top: 1rem;">
                                    <i class="fas fa-plus"></i> Add Your First Book
                                </a>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </div>

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