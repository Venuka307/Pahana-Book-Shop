package com.pahanaedu.model;

import java.time.LocalDateTime;

public class Sales {
    private int id;
    private LocalDateTime date;
    private double total;
    private String paymentMethod;
    private int cashierId;
    private String customerName;
    private String bookTitle;
    private int quantity;

    public Sales() {}

    public Sales(int id, LocalDateTime date, double total, String paymentMethod, int cashierId,
                 String customerName, String bookTitle, int quantity) {
        this.id = id;
        this.date = date;
        this.total = total;
        this.paymentMethod = paymentMethod;
        this.cashierId = cashierId;
        this.customerName = customerName;
        this.bookTitle = bookTitle;
        this.quantity = quantity;
    }

    
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public LocalDateTime getDate() { return date; }
    public void setDate(LocalDateTime date) { this.date = date; }

    public double getTotal() { return total; }
    public void setTotal(double total) { this.total = total; }

    public String getPaymentMethod() { return paymentMethod; }
    public void setPaymentMethod(String paymentMethod) { this.paymentMethod = paymentMethod; }

    public int getCashierId() { return cashierId; }
    public void setCashierId(int cashierId) { this.cashierId = cashierId; }

    public String getCustomerName() { return customerName; }
    public void setCustomerName(String customerName) { this.customerName = customerName; }

    public String getBookTitle() { return bookTitle; }
    public void setBookTitle(String bookTitle) { this.bookTitle = bookTitle; }

    public int getQuantity() { return quantity; }
    public void setQuantity(int quantity) { this.quantity = quantity; }
}
