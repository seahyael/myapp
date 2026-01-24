package org.example.domain;

import java.security.Timestamp;

public class UserVO {
    private String username;
    private String password;
    private String role; // "USER" or "ADMIN"
    private Timestamp created_at;

    public UserVO() {}

    public UserVO(String username, String password, String role, Timestamp created_at) {
        this.username = username;
        this.password = password;
        this.role = role;
        this.created_at = created_at;
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

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public Timestamp getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Timestamp created_at) {
        this.created_at = created_at;
    }
}
