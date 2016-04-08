package com.smart4c.pojo;

/**
 * Created by apple on 15/11/15.
 */
public class Company {

    private int id;

    private int role_id;

    private int cid;

    private String company;

    private String contacts;

    private String phone;

    private String email;

    private String address;

    private String password;

    private String createdTime;

    /*所属第三方平台*/
    private String third_platform;

    /*链接地址*/
    private String href_addr;

    /*营业执照编号*/
    private String business_license_no;

    private int masterId;// ^

    private String balance;// ^

    private String icon;// ^

    private String path;// ^

    private int status;// ^





























    public int getId() {
        return id;
    }

    public Company setId(int id) {
        this.id = id;
        return this;
    }

    public int getRole_id() {
        return role_id;
    }

    public Company setRole_id(int role_id) {
        this.role_id = role_id;
        return this;
    }

    public int getCid() {
        return cid;
    }

    public Company setCid(int cid) {
        this.cid = cid;
        return this;
    }

    public String getCompany() {
        return company;
    }

    public Company setCompany(String company) {
        this.company = company;
        return this;
    }

    public String getContacts() {
        return contacts;
    }

    public Company setContacts(String contacts) {
        this.contacts = contacts;
        return this;
    }

    public String getPhone() {
        return phone;
    }

    public Company setPhone(String phone) {
        this.phone = phone;
        return this;
    }

    public String getEmail() {
        return email;
    }

    public Company setEmail(String email) {
        this.email = email;
        return this;
    }

    public String getAddress() {
        return address;
    }

    public Company setAddress(String address) {
        this.address = address;
        return this;
    }

    public String getPassword() {
        return password;
    }

    public Company setPassword(String password) {
        this.password = password;
        return this;
    }

    public String getCreatedTime() {
        return createdTime;
    }

    public Company setCreatedTime(String createdTime) {
        this.createdTime = createdTime;
        return this;
    }

    public String getThird_platform() {
        return third_platform;
    }

    public Company setThird_platform(String third_platform) {
        this.third_platform = third_platform;
        return this;
    }

    public String getHref_addr() {
        return href_addr;
    }

    public Company setHref_addr(String href_addr) {
        this.href_addr = href_addr;
        return this;
    }

    public String getBusiness_license_no() {
        return business_license_no;
    }

    public Company setBusiness_license_no(String business_license_no) {
        this.business_license_no = business_license_no;
        return this;
    }

    public int getMasterId() {
        return masterId;
    }

    public Company setMasterId(int masterId) {
        this.masterId = masterId;
        return this;
    }

    public String getBalance() {
        return balance;
    }

    public Company setBalance(String balance) {
        this.balance = balance;
        return this;
    }

    public String getIcon() {
        return icon;
    }

    public Company setIcon(String icon) {
        this.icon = icon;
        return this;
    }

    public String getPath() {
        return path;
    }

    public Company setPath(String path) {
        this.path = path;
        return this;
    }

    public int getStatus() {
        return status;
    }

    public Company setStatus(int status) {
        this.status = status;
        return this;
    }
}
