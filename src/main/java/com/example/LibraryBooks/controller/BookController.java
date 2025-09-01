package com.example.LibraryBooks.controller;

import java.util.List;
import java.util.Optional;
import java.util.Collections;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.LibraryBooks.entity.Book;
import com.example.LibraryBooks.repo.BookRepository;

/**
 * Controller class for handling all library book management operations
 * Maps to the "/library" base URL path
 */
@Controller
@RequestMapping("/library")
public class BookController {
    
    @Autowired
    private BookRepository bookRepository;

    // -------------------------------------------------------------------------
    // BOOK FORM DISPLAY METHODS
    
    
    /**
     * Displays the form for adding a new book
     * @param model Spring Model object to pass data to the view
     * @return addBook view name
     */
    @GetMapping("/addBookForm")
    public String displayAddBookForm(Model model) {
        model.addAttribute("book", new Book());
        return "addBook";
    }
    
    /**
     * Displays the home page of the library application
     * @param model Spring Model object to pass data to the view
     * @return home view name
     */
    @RequestMapping("/home")
    public String home(Model model) {
        model.addAttribute("appName", "Java Training School Library");
        return "home";
    }
    
    /**
     * Displays all books in the library collection
     * @param model Spring Model object to pass data to the view
     * @return displayBook view name
     */
    @RequestMapping("/display")
    public String displayBookInfo(Model model) {
        List<Book> allBooks = (List<Book>) bookRepository.findAll();
        model.addAttribute("books", allBooks);
        
        // Set appropriate message based on whether books exist
        if(allBooks.isEmpty())
            model.addAttribute("msg", "Unfortunately, the library is empty now. Let's contribute by adding some books");
        else {
            if(model.getAttribute("msg") == null)
                model.addAttribute("msg", "Welcome to Java Training School Library");
        }
        return "displayBook";
    }
    
    // -------------------------------------------------------------------------
    // BOOK OPERATION METHODS
    
    
    /**
     * Processes the addition of a new book to the library
     * @param book Book object populated from the form data
     * @param model Spring Model object to pass data to the view
     * @return redirect to display all books
     */
    @PostMapping("/addBook")
    public String addBook(@ModelAttribute("book") Book book, Model model) {
        book.setStatus("available");
        bookRepository.save(book);
        model.addAttribute("msg", "Book added successfully. Thanks");
        return displayBookInfo(model);
    }
    
    /**
     * Displays the form for borrowing a book
     * @param id The ID of the book to be borrowed
     * @param model Spring Model object to pass data to the view
     * @return borrowBook view name
     */
    @GetMapping("/borrowForm/{id}")
    public String displayBorrowForm(@PathVariable String id, Model model) {
        Book book = bookRepository.findById(Integer.parseInt(id)).get();
        model.addAttribute("book", book);
        return "borrowBook";
    }

    /**
     * Processes the borrowing of a book
     * @param id The ID of the book being borrowed
     * @param days Number of days the book is being borrowed for
     * @param model Spring Model object to pass data to the view
     * @return redirect to display all books
     */
    @PostMapping("/borrow")
    public String borrow(@RequestParam int id, @RequestParam int days, Model model) {
        Book book = bookRepository.findById(id).get();
        book.setStatus("Borrowed");
        book.setBorrowedForDays(days);
        book.setBorrowedDate(java.time.LocalDate.now());
        bookRepository.save(book);
        model.addAttribute("msg", "Book borrowed successfully for " + days + " days.");
        return "redirect:/library/display";
    }
    
    // -------------------------------------------------------------------------
    // BOOK UPDATE METHODS
   
    
    /**
     * Displays the form for updating book information
     * @param id The ID of the book to be updated
     * @param model Spring Model object to pass data to the view
     * @return updateBook view name
     */
    @GetMapping("/updateForm/{id}")
    public String showUpdateForm(@PathVariable int id, Model model) {
        Book book = bookRepository.findById(id).get();
        model.addAttribute("book", book);
        return "updateBook";
    }

    /**
     * Processes the update of book information
     * @param book Book object with updated information
     * @param model Spring Model object to pass data to the view
     * @return redirect to display all books
     */
    @PostMapping("/updateBook")
    public String updateBook(@ModelAttribute("book") Book book, Model model) {
        bookRepository.save(book);
        model.addAttribute("msg", "Book updated successfully!");
        return displayBookInfo(model);
    }

    // -------------------------------------------------------------------------
    // BOOK DELETE METHODS
    
    
    /**
     * Deletes a book from the library collection
     * @param id The ID of the book to be deleted
     * @param model Spring Model object to pass data to the view
     * @return redirect to display all books
     */
    @GetMapping("/deleteBook/{id}")
    public String deleteBook(@PathVariable int id, Model model) {
        bookRepository.deleteById(id);
        model.addAttribute("msg", "Book deleted successfully!");
        return "redirect:/library/display";
    }
    
    // -------------------------------------------------------------------------
    // BOOK RETURN METHODS
    
    
    /**
     * Processes the return of a borrowed book
     * @param id The ID of the book being returned
     * @param model Spring Model object to pass data to the view
     * @return redirect to display all books
     */
    @GetMapping("/returnBook/{id}")
    public String returnBook(@PathVariable int id, Model model) {
        Book book = bookRepository.findById(id).get();
        book.setStatus("available");
        book.setBorrowedForDays(0); // reset borrowed days
        book.setBorrowedDate(null); // reset borrowed date
        bookRepository.save(book);
        model.addAttribute("msg", "Book returned successfully!");
        return "redirect:/library/display";
    }
    
    // -------------------------------------------------------------------------
    // SEARCH FUNCTIONALITY
    
    
    /**
     * Searches for books by name or author
     * Supports partial matching and case-insensitive search
     * @param searchTerm The search query (book name or author)
     * @param model Spring Model object to pass data to the view
     * @return displayBook view with search results
     */
    @GetMapping("/search")
    public String searchBooks(@RequestParam(required = false) String searchTerm, Model model) {
        
        List<Book> searchResults;
        
        if (searchTerm != null && !searchTerm.trim().isEmpty()) {
            // Search by name or author (case insensitive) using repository method
            searchResults = bookRepository.findByNameContainingIgnoreCaseOrAuthorContainingIgnoreCase(searchTerm, searchTerm);
            model.addAttribute("searchPerformed", true);
        } else {
            // If no search criteria provided, show all books
            searchResults = (List<Book>) bookRepository.findAll();
            model.addAttribute("searchPerformed", false);
        }
        
        model.addAttribute("books", searchResults);
        
        // Set appropriate message based on search results
        if (searchResults.isEmpty()) {
            model.addAttribute("msg", "No books found matching your search criteria.");
        } else {
            model.addAttribute("msg", "Search results:");
        }
        
        return "displayBook";
    }
}