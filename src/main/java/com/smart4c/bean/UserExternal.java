package com.smart4c.bean;

import javax.persistence.*;
import java.io.Serializable;

/**
 * Created by lumin on 2015/12/22.
 */
@Entity
@Table(name="user_external")
public class UserExternal extends AbstractModel<Integer> implements Serializable {

    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    private int id;

    @OneToOne
    @JoinColumn(name="uid")
    private User user;

    private String type;

    @Column(name="user_id")
    private String userId;

    @Override
    public Integer getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }
}
