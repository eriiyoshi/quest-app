package com.quest.app.model;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 *
 * @author Erica Yoshiwara
 */
@Entity
@Table
public class Record {
    
    @Id
    @GeneratedValue
    @Column
    private long id;
    @Column(length = 25)
    private String name;
    @Column(unique = true)
    private String pps;
    @Column
    private Date birthday;
    @Column
    private String mobile;
    @Column
    private Date creationDate;
    
    public Record() {
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPps() {
        return pps;
    }

    public void setPps(String pps) {
        this.pps = pps;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }
    
    public Date getCreationDate() {
        return creationDate;
    }

    public void setCreationDate(Date creationDate) {
        this.creationDate = creationDate;
    }
}
