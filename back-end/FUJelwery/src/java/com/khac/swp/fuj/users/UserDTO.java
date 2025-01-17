    /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.khac.swp.fuj.users;

/**
 *
 * @author phucu
 */
public class UserDTO {

    public int userid;
    public String fullName;
    public String username;
    public String password;
    public String firstname;
    public String lastname;
    public String phonenumber;
    public String email;
    public String address;
    public int point;
    public String status;
    public int roleid;
    public String rolename;
    public int totalUsers;
    public int totalActiveUserCount;
    public int totalBannedUSerCount;

    public int getTotalUsers() {
        return totalUsers;
    }

    public void setTotalUsers(int totalUsers) {
        this.totalUsers = totalUsers;
    }

    public int getTotalActiveUserCount() {
        return totalActiveUserCount;
    }

    public void setTotalActiveUserCount(int totalActiveUserCount) {
        this.totalActiveUserCount = totalActiveUserCount;
    }

    public int getTotalBannedUSerCount() {
        return totalBannedUSerCount;
    }

    public void setTotalBannedUSerCount(int totalBannedUSerCount) {
        this.totalBannedUSerCount = totalBannedUSerCount;
    }
    
    

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    
    
    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public String getPhonenumber() {
        return phonenumber;
    }

    public void setPhonenumber(String phonenumber) {
        this.phonenumber = phonenumber;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getPoint() {
        return point;
    }

    public void setPoint(int point) {
        this.point = point;
    }

    public int getRoleid() {
        return roleid;
    }

    public void setRoleid(int roleid) {
        this.roleid = roleid;
    }

    public String getRolename() {
        return rolename;
    }

    public void setRolename(String rolename) {
        this.rolename = rolename;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    @Override
    public String toString() {
        return "UserDTO{" + "userid=" + userid + ", fullName=" + fullName + ", username=" + username + ", password=" + password + ", firstname=" + firstname + ", lastname=" + lastname + ", phonenumber=" + phonenumber + ", email=" + email + ", address=" + address + ", point=" + point + ", status=" + status + ", roleid=" + roleid + ", rolename=" + rolename + ", totalUsers=" + totalUsers + ", totalActiveUserCount=" + totalActiveUserCount + ", totalBannedUSerCount=" + totalBannedUSerCount + '}';
    }

    
}
