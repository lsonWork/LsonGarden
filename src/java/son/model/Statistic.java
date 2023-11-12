/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package son.model;

/**
 *
 * @author pc
 */
public class Statistic {
    private int id, fQuantity, sold, price;
    private String name;

    public Statistic() {
    }

    public Statistic(int id, int fQuantity, int sold, int price, String name) {
        this.id = id;
        this.fQuantity = fQuantity;
        this.sold = sold;
        this.price = price;
        this.name = name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getfQuantity() {
        return fQuantity;
    }

    public void setfQuantity(int fQuantity) {
        this.fQuantity = fQuantity;
    }

    public int getSold() {
        return sold;
    }

    public void setSold(int sold) {
        this.sold = sold;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    
    
}
