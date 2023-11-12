/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package son.model;

/**
 *
 * @author pc
 */
public class Cart {
    private String name, link;
    private int id, quantity, price, amount, idPlant;

    public Cart() {
    }

    public Cart(int id, String name, int idPlant, int quantity, int price, int amount, String link) {
        this.id = id;
        this.name = name;
        this.quantity = quantity;
        this.price = price;
        this.amount = amount;
        this.link = link;
        this.idPlant = idPlant;
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

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public int getIdPlant() {
        return idPlant;
    }

    public void setIdPlant(int idPlant) {
        this.idPlant = idPlant;
    }

    @Override
    public String toString() {
        return "Product: " + name + "\n" + "Quantity: " + quantity + "\n" + "Price: " + price + "VND" + "\n" + "Amount: " + amount + "\n";
    }
    
}
