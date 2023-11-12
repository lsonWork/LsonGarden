/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package son.DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import son.model.Person;

/**
 *
 * @author pc
 */
public class DAO extends DBContext {
    public boolean checkLogin(String username, String password) {
        try {
            String sql = "SELECT * FROM PlantRegister WHERE username = ? AND password = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = null;
            ps.setString(1, username);
            ps.setString(2, password);
            rs = ps.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
    public String findUsernameToCheckDuplicate(String username) {
        try {
            String sql = "SELECT * FROM PlantRegister WHERE username = ?";
            ResultSet rs = null;
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getString("username");
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "NO";
    }
    
    public boolean getGenderOfMember(String username) {
        try {
            String sql = "SELECT gender FROM PlantRegister WHERE username = ?";
            ResultSet rs = null;
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            rs = ps.executeQuery();
            rs.next();
            return rs.getBoolean("gender");
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
    public static void main(String[] args) {
        DAO dao = new DAO();
        System.out.println(dao.getRoleOfMember("dausitinhai"));
    }
    
    public int getRoleOfMember(String username) {
        try {
            String sql = "SELECT role FROM PlantRegister WHERE username = ?";
            ResultSet rs = null;
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            rs = ps.executeQuery();
            rs.next();
            return rs.getInt("role");
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 15;
    }
    
    public String getFullnameOfMember(String username) {
        try {
            String sql = "SELECT fullname FROM PlantRegister WHERE username = ?";
            ResultSet rs = null;
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            rs = ps.executeQuery();
            rs.next();
            return rs.getString("fullname");
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public void signup(String username, String password, String fullname, boolean genderBit, String mail) {
        try {
            int gender;
            String sql = "INSERT INTO PlantRegister VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            ps.setString(3, fullname);
            if (genderBit == true) {
                gender = 1;
            } else {
                gender = 0;
            }
            ps.setInt(4, gender);
            ps.setInt(5, 0);
            ps.setString(6, mail);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
