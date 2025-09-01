package com.example.LibraryBooks.entity;
 
 
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import java.time.LocalDate;
import javax.persistence.*;
 
@Entity
 
@Table(name = "book_tb")
public class Book {
 
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	private String name;
	private String author;
	private int price;
	private String status; // true-available and false-borrowed
	private int borrowedForDays;
	private LocalDate borrowedDate;
	
	public Book(int id, String name, String author, int price, String status, int borrowedForDays,LocalDate borrowedDate) {
		super();
		this.id = id;
		this.name = name;
		this.author = author;
		this.price = price;
		this.status = status;
		this.borrowedForDays = borrowedForDays;
		this.borrowedDate = borrowedDate;
	}

	public Book() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "Book [id=" + id + ", name=" + name + ", author=" + author + ", price=" + price + ", status=" + status
				+ ", borrowedForDays=" + borrowedForDays + "]";
	}
 
	public int getId() {
		return id;
	}
 
	public void setId(int id) {
		this.id = id;
	}
 
	public String getName() {
		return name;
	}
 
	public void setName(String name) {
		this.name = name;
	}
 
	public String getAuthor() {
		return author;
	}
 
	public void setAuthor(String author) {
		this.author = author;
	}
 
	public int getPrice() {
		return price;
	}
 
	public void setPrice(int price) {
		this.price = price;
	}
 
	public String getStatus() {
		return status;
	}
 
	public void setStatus(String status) {
		this.status = status;
	}
 
	public int getBorrowedForDays() {
		return borrowedForDays;
	}
 
	public void setBorrowedForDays(int borrowedForDays) {
		this.borrowedForDays = borrowedForDays;
	}
	public LocalDate getBorrowedDate() {
        return borrowedDate;
    }

    public void setBorrowedDate(LocalDate borrowedDate) {
        this.borrowedDate = borrowedDate;
    }
    @Transient
    public LocalDate getDueDate() {
        if (borrowedDate != null && borrowedForDays > 0) {
            return borrowedDate.plusDays(borrowedForDays);
        }
        return null;
    }
 
}
 