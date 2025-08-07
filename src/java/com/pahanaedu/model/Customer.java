package com.pahanaedu.model;

public class Customer {
    private String accountNumber;
    private String name;
    private String address;
    private String telephone;
    private String email;  // <-- new field

    public Customer() {}

    // Updated constructor including email
    public Customer(String accountNumber, String name, String address, String telephone, String email) {
        this.accountNumber = accountNumber;
        this.name = name;
        this.address = address;
        this.telephone = telephone;
        this.email = email;
    }

    // getters and setters

    public String getAccountNumber() {
        return accountNumber;
    }

    public void setAccountNumber(String accountNumber) {
        this.accountNumber = accountNumber;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getEmail() {    // new getter
        return email;
    }

    public void setEmail(String email) {  // new setter
        this.email = email;
    }
}
