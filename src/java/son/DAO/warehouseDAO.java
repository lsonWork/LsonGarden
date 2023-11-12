/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package son.DAO;

import java.sql.Array;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import son.model.BestSeller;
import son.model.Cart;
import son.model.Order;
import son.model.Person;
import son.model.Plant;
import son.model.Statistic;

/**
 *
 * @author pc
 */
public class warehouseDAO extends DBContext {

    public ArrayList<Plant> getAllPlant() {
        try {
            ArrayList<Plant> list = new ArrayList<>();
            String sql = "SELECT * FROM PlantWarehouse WHERE quantity > 0";
            ResultSet rs = null;
            PreparedStatement ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Plant plant = new Plant(rs.getInt("id"), rs.getString("name"), rs.getInt("price"), rs.getInt("quantity"), rs.getInt("type"), rs.getString("picture"), rs.getInt(7));
                list.add(plant);
            }
            return list;
        } catch (SQLException ex) {
            Logger.getLogger(warehouseDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Plant> getAllPlantForAdmin() {
        try {
            ArrayList<Plant> list = new ArrayList<>();
            String sql = "SELECT * FROM PlantWarehouse";
            ResultSet rs = null;
            PreparedStatement ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Plant plant = new Plant(rs.getInt("id"), rs.getString("name"), rs.getInt("price"), rs.getInt("quantity"), rs.getInt("type"), rs.getString("picture"), rs.getInt(7));
                list.add(plant);
            }
            return list;
        } catch (SQLException ex) {
            Logger.getLogger(warehouseDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Person> getAllAccountForAdmin() {
        try {
            ArrayList<Person> list = new ArrayList<>();
            String sql = "SELECT * FROM PlantRegister";
            ResultSet rs = null;
            PreparedStatement ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Person person = new Person(rs.getString(1), rs.getString(2), rs.getString(3), rs.getBoolean(4), rs.getInt(5), rs.getString(6));
                list.add(person);
            }
            return list;
        } catch (SQLException ex) {
            Logger.getLogger(warehouseDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public boolean checkExistPlantInCart(int idPlant, String username) {
        try {
            String sql = "SELECT * FROM PlantStatistic WHERE idPlant = ? AND username = ?";
            ArrayList<Plant> list = new ArrayList<>();
            ResultSet rs = null;
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, idPlant);
            ps.setString(2, username);
            rs = ps.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(warehouseDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public void addProductIntoDatabase(String name, int price, int quantity, int type, String link) {
        try {
            String sql = "INSERT INTO PlantWarehouse VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, name.trim().substring(0, 1).replaceAll("\\s+", " ").toUpperCase() + name.trim().substring(1).replaceAll("\\s+", " ").toLowerCase());
            ps.setInt(2, price);
            ps.setInt(3, quantity);
            ps.setInt(4, type);
            ps.setString(5, link);
            ps.setInt(6, quantity);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(warehouseDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void setTheQuantityTo0InCart(int idPlant, String username) {    //xóa số lượng trong giỏ sau khi mua
        try {
            String sql = "UPDATE PlantStatistic SET quantity = 0 WHERE idPlant = ? AND username = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, idPlant);
            ps.setString(2, username);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(warehouseDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deleteTheFollowingQuantity(Cart cart) { //giảm số lượng ở kho
        try {
            String sql = "UPDATE PlantWarehouse SET quantity = quantity - ? WHERE id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, cart.getQuantity());
            ps.setInt(2, cart.getId());
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(warehouseDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateItemInWarehouse(int id, String name, int price, int type, String link) {
        try {
            String sql = "UPDATE PlantWarehouse SET name = ?, price = ?, type = ?, picture = ? WHERE id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, name.trim().substring(0, 1).replaceAll("\\s+", " ").toUpperCase() + name.trim().substring(1).replaceAll("\\s+", " ").toLowerCase());
            ps.setInt(2, price);
            ps.setInt(3, type);
            ps.setString(4, link);
            ps.setInt(5, id);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(warehouseDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateAccountInDatabase(String username, String password, String fullname, int gender, int role) {
        try {
            String sql = "UPDATE PlantRegister SET password = ?, fullname = ?, gender = ?, role = ? WHERE username = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, password);
            ps.setString(2, fullname.trim().replaceAll("\\s+", " ").toLowerCase());
            ps.setInt(3, gender);
            ps.setInt(4, role);
            ps.setString(5, username);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(warehouseDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void addPurchaseToStatistic(Cart cart, String username) {
        try {
            String sql = "INSERT INTO PlantOverallStatistic VALUES (?, ?, ?, ?, ?, ?, ?, ?, NULL)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, cart.getName());
            ps.setInt(2, cart.getQuantity());
            ps.setInt(3, cart.getPrice());
            ps.setInt(4, cart.getAmount());
            ps.setString(5, cart.getLink());
            ps.setString(6, username);
            ps.setInt(7, cart.getIdPlant());
            ps.setInt(8, 0);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(warehouseDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void addPurchase(String username, int idAddToCart, int quantityAddToCart) {
        try {
            if (checkExistPlantInCart(idAddToCart, username)) { //nếu có cây đấy trong cart rồi thì update thêm số lượng
                String sql2 = "UPDATE PlantStatistic SET quantity = quantity + ? WHERE idPlant = ? AND username = ?";
                PreparedStatement ps = connection.prepareStatement(sql2);
                ps.setInt(1, quantityAddToCart);
                ps.setInt(2, idAddToCart);
                ps.setString(3, username);
                ps.executeUpdate();
            } else {
                String sql1 = "INSERT INTO PlantStatistic VALUES (?, ?, ?)"; //nếu chưa có cây đấy trong cart thì insert thêm
                PreparedStatement ps = connection.prepareStatement(sql1);
                ps.setString(1, username);
                ps.setInt(2, idAddToCart);
                ps.setInt(3, quantityAddToCart);
                ps.executeUpdate();
            }
        } catch (SQLException ex) {
            Logger.getLogger(warehouseDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public boolean checkAvailableQuantity(int id, String quantityString) { //nếu > kho thì false
        try {
            int quantity = Integer.parseInt(quantityString);
            String sql = "SELECT quantity FROM PlantWarehouse WHERE id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = null;
            ps.setInt(1, id);
            rs = ps.executeQuery();
            rs.next();
            if (quantity <= rs.getInt("quantity")) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(warehouseDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public ArrayList<Cart> viewCart(String username) {
        try {
            ArrayList<Cart> list = new ArrayList<>();
            String sql = "SELECT id, p.name AS item, p.id AS idPlant, toalQuantity, price, (toalQuantity * price) AS amount, picture FROM (SELECT username, idPlant, name, SUM(a.quantity) AS toalQuantity FROM PlantStatistic a JOIN PlantWarehouse b ON a.idPlant = b.id GROUP BY username, idPlant, name) t JOIN PlantWarehouse p ON t.idPlant = p.id WHERE username = ? AND toalQuantity > 0";
            //này sẽ xuất ra bảng cart
            ResultSet rs = null;
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("item");
                int idPlant = rs.getInt("idPlant");
                int quantity = rs.getInt("toalQuantity");
                int price = rs.getInt("price");
                int amount = rs.getInt("amount");
                String link = rs.getString("picture");
                Cart cart = new Cart(id, name, idPlant, quantity, price, amount, link);
                list.add(cart);
            }
            return list;
        } catch (SQLException ex) {
            Logger.getLogger(warehouseDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void deleteAnItemInWarehouse(int id) {
        try {
            String sql = "DELETE FROM PlantWarehouse WHERE id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(warehouseDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deleteAnAccountInDatabase(String username) {
        try {
            String sql = "DELETE FROM PlantRegister WHERE username = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(warehouseDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void removeAnPurchase(int idUpdate, String username) {
        try {
            String sql = "DELETE FROM PlantStatistic WHERE idPlant = ? AND username = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, idUpdate);
            ps.setString(2, username);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(warehouseDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deleteAnPurchase(int idUpdate, String username) {
        try {
            String sql = "UPDATE PlantStatistic SET quantity = quantity - 1 WHERE idPlant = ? AND username = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, idUpdate);
            ps.setString(2, username);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(warehouseDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void increaseAnPurchase(int idUpdate, String username) {
        try {
            String sql = "UPDATE PlantStatistic SET quantity = quantity + 1 WHERE idPlant = ? AND username = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, idUpdate);
            ps.setString(2, username);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(warehouseDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Plant getPlantByID(int id) {
        try {
            String sql = "SELECT * FROM PlantWarehouse WHERE id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = null;
            rs = ps.executeQuery();
            rs.next();
            Plant plant = new Plant(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getInt(4), rs.getInt(5), rs.getString(6), rs.getInt(7));
            return plant;
        } catch (SQLException ex) {
            Logger.getLogger(warehouseDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Plant> pagingPlant(int index, String sqlPlus) {
        try {
            ArrayList<Plant> list = new ArrayList<>();
            String sql = sqlPlus + " ORDER BY id OFFSET ? ROWS FETCH NEXT 12 ROWS ONLY";
            ResultSet rs = null;
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, (index - 1) * 12);
            rs = ps.executeQuery();
            while (rs.next()) {
                Plant plant = new Plant(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getInt(4), rs.getInt(5), rs.getString(6), rs.getInt(7));
                list.add(plant);
            }
            return list;
        } catch (SQLException ex) {
            Logger.getLogger(warehouseDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Plant> pagingPlantForSort(int index, String sqlPlus) {
        try {
            ArrayList<Plant> list = new ArrayList<>();
            String sql = sqlPlus + " OFFSET ? ROWS FETCH NEXT 12 ROWS ONLY";
            ResultSet rs = null;
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, (index - 1) * 12);
            rs = ps.executeQuery();
            while (rs.next()) {
                Plant plant = new Plant(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getInt(4), rs.getInt(5), rs.getString(6), rs.getInt(7));
                list.add(plant);
            }
            return list;
        } catch (SQLException ex) {
            Logger.getLogger(warehouseDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public int getTotalOfProducts(String sql) {
        try {
            ArrayList<Plant> list = new ArrayList<>();
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = null;
            rs = ps.executeQuery();
            while (rs.next()) {
                Plant plant = new Plant(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getInt(4), rs.getInt(5), rs.getString(6), rs.getInt(7));
                list.add(plant);
            }
            return list.size();
        } catch (SQLException ex) {
            Logger.getLogger(warehouseDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public ArrayList<Plant> categorise(String sql) {
        try {
            ArrayList<Plant> list = new ArrayList<>();
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = null;
            rs = ps.executeQuery();
            while (rs.next()) {
                Plant plant = new Plant(rs.getInt("id"), rs.getString("name"), rs.getInt("price"), rs.getInt("quantity"), rs.getInt("type"), rs.getString("picture"), rs.getInt(7));
                list.add(plant);
            }
            return list;
        } catch (SQLException ex) {
            Logger.getLogger(warehouseDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public int allProductsInStock() {
        try {
            String sql = "SELECT SUM(quantity) AS Products FROM PlantWarehouse";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = null;
            rs = ps.executeQuery();
            rs.next();
            return rs.getInt(1);
        } catch (SQLException ex) {
            Logger.getLogger(warehouseDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public int allSoldProducts() {
        try {
            String sql = "SELECT SUM(quantity) AS Sold FROM PlantOverallStatistic";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = null;
            rs = ps.executeQuery();
            rs.next();
            return rs.getInt(1);
        } catch (SQLException ex) {
            Logger.getLogger(warehouseDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public int revenue() {
        try {
            String sql = "SELECT SUM(amount) AS Revenue FROM PlantOverallStatistic";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = null;
            rs = ps.executeQuery();
            rs.next();
            return rs.getInt(1);
        } catch (SQLException ex) {
            Logger.getLogger(warehouseDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public ArrayList<Statistic> showStatistic() {
        try {
            ArrayList<Statistic> list = new ArrayList<>();
            ResultSet rs = null;
            String sql = "SELECT a.id, a.name, firstQuantity, a.price, SUM(b.quantity) AS sold FROM PlantWarehouse a FULL JOIN PlantOverallStatistic b ON a.id = b.idPlant GROUP BY a.id, a.name, firstQuantity, a.price HAVING a.name IS NOT NULL ORDER BY id ";
            PreparedStatement ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Statistic statistic = new Statistic(rs.getInt("id"), rs.getInt("firstQuantity"), rs.getInt("sold"), rs.getInt("price"), rs.getString("name"));
                list.add(statistic);
            }
            return list;
        } catch (SQLException ex) {
            Logger.getLogger(warehouseDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void increaseQuantity(int id, int quantity) {
        try {
            String sql = "UPDATE PlantWarehouse SET quantity = quantity + ?, firstQuantity = firstQuantity + ? WHERE id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, quantity);
            ps.setInt(2, quantity);
            ps.setInt(3, id);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(warehouseDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public ArrayList<BestSeller> top3BestSellers() {
        try {
            ArrayList<BestSeller> list = new ArrayList<>();
            String sql = "SELECT TOP(3) name, price, idPlant, SUM(quantity) AS quantity FROM PlantOverallStatistic GROUP BY name, price, idPlant ORDER BY quantity DESC";
            ResultSet rs = null;
            PreparedStatement ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                BestSeller best = new BestSeller(rs.getString(1), rs.getInt(2), rs.getInt(3), rs.getInt(4));
                list.add(best);
            }
            return list;
        } catch (SQLException ex) {
            Logger.getLogger(warehouseDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public boolean sendMail(String to, String subject, String text) {
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        Session session = Session.getInstance(props, new javax.mail.Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("lsonsgarden@gmail.com", "nmmibeddnhakveea"); //tên gmail mình và mật khảu cấp 2
            }
        });
        try {
            Message message = new MimeMessage(session);
            message.setHeader("Content-Type", "text/plain; charset=UTF-8");
            message.setFrom(new InternetAddress("lsonsgarden@gmail.com"));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
            message.setSubject(subject); //gửi title
            message.setContent(text, "text/html; charset=UTF-8");  //gửi nội dung
            Transport.send(message);
        } catch (MessagingException e) {
            return false;
        }
        return true;
    }

    public boolean checkDuplicateMail(String mail) {
        try {
            String sql = "SELECT mail FROM PlantRegister WHERE mail = ?";
            ResultSet rs = null;
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, mail);
            rs = ps.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(warehouseDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public String getMailByUsername(String username) {
        try {
            String sql = "SELECT mail FROM PlantRegister WHERE username = ?";
            ResultSet rs = null;
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            rs = ps.executeQuery();
            rs.next();
            return rs.getString(1);
        } catch (SQLException ex) {
            Logger.getLogger(warehouseDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void setNewPassword(String password, String username) {
        try {
            String sql = "UPDATE PlantRegister SET password = ? WHERE username = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, password);
            ps.setString(2, username);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(warehouseDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public ArrayList<Order> getOrders() {
        try {
            ArrayList<Order> list = new ArrayList<>();
            String sql = "SELECT * FROM PlantOverallStatistic";
            ResultSet rs = null;
            PreparedStatement ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {                
                Order order = new Order(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getInt(4), rs.getInt(5), rs.getString(6), rs.getString(7), rs.getInt(8), rs.getInt(9), rs.getString(10));
                list.add(order);
            }
            return list;
        } catch (SQLException ex) {
            Logger.getLogger(warehouseDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public ArrayList<Order> getOrdersOfSinglePerson(String username) {
        try {
            ArrayList<Order> list = new ArrayList<>();
            String sql = "SELECT * FROM PlantOverallStatistic WHERE username = ?";
            ResultSet rs = null;
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            rs = ps.executeQuery();
            while (rs.next()) {                
                Order order = new Order(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getInt(4), rs.getInt(5), rs.getString(6), rs.getString(7), rs.getInt(8), rs.getInt(9), rs.getString(10));
                list.add(order);
            }
            return list;
        } catch (SQLException ex) {
            Logger.getLogger(warehouseDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public void setStatus(int id, int status) {
        try {
            String sql = "UPDATE PlantOverallStatistic SET status = ? WHERE id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, status);
            ps.setInt(2, id);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(warehouseDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void addSellerClick(String seller, int id) {
        try {
            String sql = "UPDATE PlantOverallStatistic SET seller = ? WHERE id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, seller);
            ps.setInt(2, id);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(warehouseDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void deleteAnOrder(int id) {
        try {
            String sql = "DELETE FROM PlantOverallStatistic WHERE id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(warehouseDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public static void main(String[] args) {
        warehouseDAO dao = new warehouseDAO();
//        Cart cart = new Cart(, "name", 3, 3, 3, 3, "link");
//        dao.addPurchaseToStatistic(cart, "abc");
    }
}
