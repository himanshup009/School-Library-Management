package com.example.LibraryBooks.repo;

import java.util.List;
import com.example.LibraryBooks.entity.Book;
import org.springframework.data.repository.CrudRepository;

public interface BookRepository extends CrudRepository<Book, Integer> {
    public List<Book> findByName(String name);
    
    // Add this method for search functionality
    public List<Book> findByNameContainingIgnoreCaseOrAuthorContainingIgnoreCase(String name, String author);
}