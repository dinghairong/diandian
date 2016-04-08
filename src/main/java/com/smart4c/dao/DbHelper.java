package com.smart4c.dao;

import com.smart4c.pojo.*;
import org.apache.commons.dbcp.BasicDataSourceFactory;

import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

/**
 * Created by apple on 15/11/11.
 */
public class DbHelper {

    public static DbHelper getInstance() {
        return InstanceHolder.INSTANCE;
    }

    private static class InstanceHolder {
        private static final DbHelper INSTANCE = new DbHelper();
    }

    private static DataSource datasource;

    static {
        Properties p = new Properties();
        p.setProperty("driverClassName", "com.mysql.jdbc.Driver");

//        p.setProperty("url", "jdbc:mysql://rdsp29r7p8iua89f924s.mysql.rds.aliyuncs.com:3306/hx_service?characterEncoding=utf8");
//        p.setProperty("username", "hxdev");
//        p.setProperty("password", "hxdevH3fKv5");

        p.setProperty("url", "jdbc:mysql://localhost:3306/hx_service?characterEncoding=utf8");
        p.setProperty("username", "root");
        p.setProperty("password", "root");

        p.setProperty("maxActivee", "30");
        p.setProperty("maxIdle", "10");
        p.setProperty("maxWait", "1000");
        p.setProperty("removeAbandonede", "true");
        p.setProperty("removeAbandonedTimeout", "180");

        try {
            datasource = BasicDataSourceFactory.createDataSource(p);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private Connection getConn() {
        Connection conn = null;

        if (datasource != null) {
            try {
                conn = datasource.getConnection();
            } catch (SQLException e) {
            }
        }

        return conn;
    }

    public static void log(String messge) {
        String msg = "laf===================================" + messge + "========================================\r\n";
        System.out.println(msg);
    }

    public List<ServiceCatalog> getAllServices() {
        String sql = "select id, name from service_class";
        Connection conn = getConn();
        List<ServiceCatalog> list = new ArrayList<ServiceCatalog>();

        if (conn != null) {
            PreparedStatement psmt = null;

            try {
                psmt = conn.prepareStatement(sql);
                ResultSet rs = psmt.executeQuery();

                while (rs.next()) {
                    ServiceCatalog serviceCatalog = new ServiceCatalog();
                    serviceCatalog.setId(rs.getInt("id"));
                    serviceCatalog.setName(rs.getString("name"));

                    sql = "select p.id, p.title, p.accessory, p.web_price, p.description" +
                            " from service_product p INNER JOIN service_project sc" +
                            " on p.service_project_id = sc.id" +
                            " where sc.service_class_id=? order by p.createdTime";

                    PreparedStatement psmt_product = conn.prepareStatement(sql);
                    psmt_product.setInt(1, serviceCatalog.getId());
                    ResultSet rs_product = psmt_product.executeQuery();
                    List<ServiceProduct> products = new ArrayList<ServiceProduct>();

                    while (rs_product.next()) {
                        ServiceProduct product = new ServiceProduct();
                        product.setId(rs_product.getInt("id"));
                        product.setTitle(rs_product.getString("title"));
                        product.setAccessory(rs_product.getString("accessory"));
                        product.setWeb_price(rs_product.getDouble("web_price"));
                        product.setDescription(rs_product.getString("description"));

                        products.add(product);
                    }

                    psmt_product.close();
                    serviceCatalog.setServiceProducts(products);
                    list.add(serviceCatalog);

                }
            } catch (SQLException ex) {
                log(ex.getMessage());
            } finally {
                try {
                    if (psmt != null) psmt.close();
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }

        return list;
    }

    public List<Province> getProvinces() {
        String sql = "select province from areadetail group by province";
        Connection conn = getConn();
        List<Province> list = new ArrayList<Province>();

        if (conn != null) {
            PreparedStatement psmt = null;

            try {
                psmt = conn.prepareStatement(sql);
                ResultSet rs = psmt.executeQuery();

                while (rs.next()) {
                    Province province = new Province();
                    province.setName(rs.getString("province"));
                    list.add(province);

                }
            } catch (SQLException ex) {
                log(ex.getMessage());
            } finally {
                try {
                    if (psmt != null) psmt.close();
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }

        return list;
    }

    public List<City> getCitiesFromProvinc(String province) {
        String sql = "select city from areadetail where province=? group by city";
        Connection conn = getConn();
        List<City> list = new ArrayList<City>();

        if (conn != null) {
            PreparedStatement psmt = null;

            try {
                psmt = conn.prepareStatement(sql);
                psmt.setString(1, province);
                ResultSet rs = psmt.executeQuery();

                while (rs.next()) {
                    City city = new City();
                    city.setName(rs.getString("city"));
                    list.add(city);
                }

            } catch (SQLException ex) {
                log(ex.getMessage());
            } finally {
                try {
                    if (psmt != null) psmt.close();
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }

        return list;
    }

    public List<County> getCountiesFromCity(String city) {
        String sql = "select id, county from areadetail where city=?";
        Connection conn = getConn();
        List<County> list = new ArrayList<County>();

        if (conn != null) {
            PreparedStatement psmt = null;

            try {
                psmt = conn.prepareStatement(sql);
                psmt.setString(1, city);
                ResultSet rs = psmt.executeQuery();

                while (rs.next()) {
                    County county = new County();
                    county.setId(rs.getString("id"));
                    county.setName(rs.getString("county"));
                    list.add(county);
                }

            } catch (SQLException ex) {
                log(ex.getMessage());
            } finally {
                try {
                    if (psmt != null) psmt.close();
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }

        return list;
    }

    public int insertStore(ServiceStore store) {
        int result = -1;
        String sql = "insert into serviceshop " +
                "(cid,title,phone,password,tel,business,address,license,image,path,createdTime,user_name,email,introducer,longitude,latitude,status,updateTime)" +
                " values(?,?,?,?,?,'09:00-18:00',?,?,?,?,now(),?,?,?,0.0,0.0,?,now())";
        Connection conn = getConn();

        if (conn != null) {
            PreparedStatement psmt = null;

            try {
                psmt = conn.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);
                psmt.setInt(1, store.getAddress_id());
                psmt.setString(2, store.getStoreName());
                psmt.setString(3, store.getMobile());
                psmt.setString(4, store.getPassword());
                psmt.setString(5, store.getTel());
                psmt.setString(6, store.getAddress());
                psmt.setString(7, store.getLicense());
                psmt.setString(8, store.getImage());
                psmt.setString(9, store.getPath());
                psmt.setString(10, store.getUserName());
                psmt.setString(11, store.getEmail());
                psmt.setString(12, store.getIntroducer());
                psmt.setInt(13, store.getStatus());
                result = psmt.executeUpdate();

                if (result > 0) {
                    ResultSet generatedKeys = psmt.getGeneratedKeys();

                    if (generatedKeys.next()) {
                        result = generatedKeys.getInt(1);
                    } else {
                        result = -1;
                    }
                }

            } catch (SQLException ex) {
                log(ex.getMessage());
            } finally {
                try {
                    if (psmt != null) psmt.close();
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }

        return result;
    }

    public int deleteStore(int store_id) {
        int result = -1;
        String sql = "delete from serviceshop where id=?";
        Connection conn = getConn();

        if (conn != null) {
            PreparedStatement psmt = null;

            try {
                psmt = conn.prepareStatement(sql);
                psmt.setInt(1, store_id);
                result = psmt.executeUpdate();

                if (result > 0) {
                    ResultSet generatedKeys = psmt.getGeneratedKeys();

                    if (generatedKeys.next()) {
                        result = generatedKeys.getInt(1);
                    } else {
                        result = -1;
                    }
                }

            } catch (SQLException ex) {
                log(ex.getMessage());
            } finally {
                try {
                    if (psmt != null) psmt.close();
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }

        return result;
    }

    public int insertCompany(Company company) {
        Connection conn = getConn();
        int result = -1;

        if (conn != null) {
            String sql = "insert into company (rid, cid, company, contacts, phone, email, address, password, third_platform, href_addr, " +
                    "business_license_no, createdTime, masterId, balance, icon, path, status, updateTime) " +
                    "values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, now(), ?, ?, ?, ?, ?, now())";

            PreparedStatement psmt = null;

            try {
                psmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
                psmt.setInt(1, company.getRole_id());
                psmt.setInt(2, company.getCid());
                psmt.setString(3, company.getCompany());
                psmt.setString(4, company.getContacts());
                psmt.setString(5, company.getPhone());
                psmt.setString(6, company.getEmail());
                psmt.setString(7, company.getAddress());
                psmt.setString(8, company.getPassword());
                psmt.setString(9, company.getThird_platform());
                psmt.setString(10, company.getHref_addr());
                psmt.setString(11, company.getBusiness_license_no());
                psmt.setInt(12, company.getMasterId());
                psmt.setString(13, company.getBalance());
                psmt.setString(14, company.getIcon());
                psmt.setString(15, company.getPath());
                psmt.setInt(16, company.getStatus());

                result = psmt.executeUpdate();

                if (result > 0) {
                    ResultSet generateKeys = psmt.getGeneratedKeys();

                    if (generateKeys.next()) {
                        result = generateKeys.getInt(1);
                    } else {
                        result = -1;
                    }
                }

            } catch (SQLException ex) {
                log(ex.getMessage());
            } finally {
                try {
                    if (psmt != null) psmt.close();
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }

        return result;
    }

    public int insertStoreProduct(int store_id, String[] products) {
        int result = -1;
        String sql = "insert into serviceshop_service(ssid, spid) values(?, ?)";

        Connection conn = getConn();

        if (conn != null) {
            PreparedStatement psmt = null;

            try {
                psmt = conn.prepareStatement(sql);

                for (String product_id : products) {
                    psmt.setInt(1, store_id);
                    psmt.setInt(2, Integer.parseInt(product_id));
                    result = psmt.executeUpdate();
                }

            } catch (SQLException ex) {
                log(ex.getMessage());
            } finally {
                try {
                    if (psmt != null) psmt.close();
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }

        return result;
    }

    public int deleteStoreProduct(int store_id) {
        int result = -1;
        String sql = "delete from serviceshop_service where ssid=?";
        Connection conn = getConn();

        if (conn != null) {
            PreparedStatement psmt = null;

            try {
                psmt = conn.prepareStatement(sql);
                psmt.setInt(1, store_id);
                result = psmt.executeUpdate();

                if (result > 0) {
                    ResultSet generatedKeys = psmt.getGeneratedKeys();

                    if (generatedKeys.next()) {
                        result = generatedKeys.getInt(1);
                    } else {
                        result = -1;
                    }
                }

            } catch (SQLException ex) {
                log(ex.getMessage());
            } finally {
                try {
                    if (psmt != null) psmt.close();
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }

        return result;
    }

    public int insertStoreProtocol(RegProtocol protocol) {
        int result = -1;
        String sql = "insert into Regist_Protocol(reg_id,second_party,province,city,place,start,end,linkman," +
                "address,tel,person_in_charge,bank,account,account_name,alipay)" +
                " values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

        Connection conn = getConn();

        if (conn != null) {
            PreparedStatement psmt = null;

            try {
                psmt = conn.prepareStatement(sql);
                psmt.setInt(1, protocol.getReg_id());
                psmt.setString(2, protocol.getSecond_party());
                psmt.setString(3, protocol.getProvince());
                psmt.setString(4, protocol.getCity());
                psmt.setString(5, protocol.getPlace());
                psmt.setDate(6, new Date(protocol.getStart().getTime()));
                psmt.setDate(7, new Date(protocol.getEnd().getTime()));
                psmt.setString(8, protocol.getLinkman());
                psmt.setString(9, protocol.getAddress());
                psmt.setString(10, protocol.getTel());
                psmt.setString(11, protocol.getPerson_in_charge());
                psmt.setString(12, protocol.getBank());
                psmt.setString(13, protocol.getAccount());
                psmt.setString(14, protocol.getAccount_name());
                psmt.setString(15, protocol.getAlipay());
                result = psmt.executeUpdate();

            } catch (SQLException ex) {
                log(ex.getMessage());
            } finally {
                try {
                    if (psmt != null) psmt.close();
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }

        return result;
    }

    public int getMobileCountFromStore(String mobile) {
        String sql = "select count(1) as cnt from serviceshop where phone=?";
        int result = 0;

        Connection conn = getConn();

        if (conn != null) {
            PreparedStatement psmt = null;

            try {
                psmt = conn.prepareStatement(sql);
                psmt.setString(1, mobile);
                ResultSet rs = psmt.executeQuery();

                if (rs.next()) {
                    result = rs.getInt("cnt");
                }

            } catch (SQLException ex) {
                log(ex.getMessage());
            } finally {
                try {
                    if (psmt != null) psmt.close();
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }

        return result;
    }


    public int insertCompanyProtocol(RegProtocol protocol) {
        Connection conn = getConn();
        int result = 0;

        if (conn != null) {
            String sql = "insert into Regist_Protocol (code, second_party, company, licence, linkman, " +
                    "tel, url, platform, address, start, end, reg_id) values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement psmt = null;

            try {
                psmt = conn.prepareStatement(sql);
                psmt.setString(1, protocol.getCode());
                psmt.setString(2, protocol.getSecond_party());
                psmt.setString(3, protocol.getCompany());
                psmt.setString(4, protocol.getLicence());
                psmt.setString(5, protocol.getLinkman());
                psmt.setString(6, protocol.getTel());
                psmt.setString(7, protocol.getUrl());
                psmt.setString(8, protocol.getPlatform());
                psmt.setString(9, protocol.getAddress());
                psmt.setDate(10, new Date(protocol.getStart().getTime()));
                psmt.setDate(11, new Date(protocol.getEnd().getTime()));
                psmt.setInt(12, protocol.getReg_id());
                result = psmt.executeUpdate();

            } catch (SQLException ex) {
                log(ex.getMessage());
            } finally {
                try {
                    if (psmt != null) psmt.close();
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }

        return result;
    }

    public RegProtocol getStoreProtocol(int store_id) {
        Connection conn = getConn();
        RegProtocol protocol = null;
        String sql = "select id,code,second_party,company,licence,url,platform," +
                "province,city,place,start,end,bank,account,account_name,alipay," +
                "linkman,tel,address,person_in_charge " +
                "from regist_protocol where reg_id=?";

        if (conn != null) {
            PreparedStatement psmt = null;

            try {
                psmt = conn.prepareStatement(sql);
                psmt.setInt(1, store_id);
                ResultSet rs = psmt.executeQuery();

                if (rs.next()) {
                    protocol = new RegProtocol();
                    protocol.setId(rs.getInt("id"));
                    protocol.setCode(rs.getString("code"));
                    protocol.setCompany(rs.getString("company"));
                    protocol.setLicence(rs.getString("licence"));
                    protocol.setPlatform(rs.getString("platform"));
                    protocol.setUrl(rs.getString("url"));
                    protocol.setSecond_party(rs.getString("second_party"));
                    protocol.setProvince(rs.getString("province"));
                    protocol.setCity(rs.getString("city"));
                    protocol.setPlace(rs.getString("place"));
                    protocol.setStart(rs.getDate("start"));
                    protocol.setEnd(rs.getDate("end"));
                    protocol.setBank(rs.getString("bank"));
                    protocol.setAccount(rs.getString("account"));
                    protocol.setAccount_name(rs.getString("account_name"));
                    protocol.setAlipay(rs.getString("alipay"));
                    protocol.setLinkman(rs.getString("linkman"));
                    protocol.setTel(rs.getString("tel"));
                    protocol.setAddress(rs.getString("address"));
                    protocol.setPerson_in_charge(rs.getString("person_in_charge"));
                }

            } catch (SQLException ex) {
                log(ex.getMessage());
            } finally {
                try {
                    if (psmt != null) psmt.close();
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }

        return protocol;
    }

    public boolean isCompanyExist(String phone) {
        Connection conn = getConn();
        boolean result = false;

        if (conn != null) {
            String sql = "select count(1) from company where phone=?";
            PreparedStatement psmt = null;

            try {
                psmt = conn.prepareStatement(sql);
                psmt.setString(1, phone);
                ResultSet rs = psmt.executeQuery();

                if (rs.next()) {
                    if (rs.getInt(1) > 0) {
                        result = true;
                    }
                }
            } catch (SQLException e) {
                log(e.getMessage());
            } finally {
                try {
                    if (psmt != null) {
                        psmt.close();
                    }
                    conn.close();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
        }
        return result;

    }

}





























