package com.smart4c.action.apphybrid;

import com.cootek.touchlife.ApiException;
import com.cootek.touchlife.DefaultTouchlifeClient;
import com.cootek.touchlife.TouchlifeClient;
import com.cootek.touchlife.request.AccountUserProfileRequest;
import com.cootek.touchlife.request.TradePayCreateRequest;
import com.cootek.touchlife.response.AccountUserProfileResponse;
import com.cootek.touchlife.response.TradePayCreateResponse;
import com.cootek.touchlife.response.TradePayResultResponse;
import com.cootek.touchlife.util.SecurityUtils;
import com.opensymphony.xwork2.ActionSupport;
import com.smart4c.alipay.util.UtilDate;
import com.smart4c.bean.*;
import com.smart4c.common.SmartProperties;
import com.smart4c.dao.*;
import com.smart4c.util.MiscUtils;
import com.smart4c.util.Page;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import net.sf.json.util.PropertyFilter;
import org.apache.commons.collections.map.HashedMap;
import org.apache.commons.lang3.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.hibernate.mapping.Array;
import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.DataInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.*;

public class AppHybridAction extends ActionSupport implements ServletResponseAware {
    private HttpServletResponse response;

    @Override
    public void setServletResponse(HttpServletResponse arg0) {
        // TODO Auto-generated method stub
        this.response = arg0;
    }

    @Autowired
    private ServiceProductDao spDao;

    @Autowired
    private OrderDao orderDao;

    @Autowired
    private UserExternalDao userExternalDao;

    @Autowired
    private MyCartDao myCartDao;

    @Autowired
    private RoleDao roleDao;

    @Autowired
    private UsersDao usersDao;

    @Autowired
    private PaidTypeDao paidTypeDao;

    @Autowired
    private CommentDao commentDao;

    @Autowired
    private ServiceShopDao serviceShopDao;

    @Autowired
    private AreaDetailDao areaDetailDao;

    private int scId;
    private int spId;
    private int userId;
    private int state;

    private String chuBaoUserId;
    private Long totalFee;
    private String tradeStr;

    private String accessToken;
    private String type;
    private String name;
    private String phone;
    private int orderId;
    private int number;
    private String title;
    private int star;
    private String content;
    private String reason;
    private String province;
    private String city;
    private String country;
    private int serviceShopId;
    private Page page = new Page();
    private SmartProperties prop = SmartProperties.getInstance();

    public String getProductList() {
        HttpServletRequest httpRquest = ServletActionContext.getRequest();

        JSONObject jsonObj = new JSONObject();
        JSONArray jsonArr = new JSONArray();
        page.setPageSize(10);
        long totalRecords = spDao.getCountProductsByServiceClassId(page, scId);

        List<ServiceProduct> spList = spDao.getProductsByServiceClassId(page, scId);
        for (ServiceProduct sp : spList) {
            int star = 0;
            for(int j = 0;j < sp.getComments().size();j ++){
                star = star + sp.getComments().get(j).getStar();
            }
            if(sp.getComments().size() != 0){
                star = star / sp.getComments().size();
            }
            JSONObject obj = new JSONObject();
            obj.put("id", sp.getId());
            obj.put("project", sp.getServiceProject().getName());
            obj.put("title", sp.getTitle());
            obj.put("newprice", sp.getNewprice());
            obj.put("path", sp.getPath());
            obj.put("icon", sp.getIcon());
            obj.put("star", star);
            obj.put("buycount", orderDao.countOrderByProduct(sp.getId()));

            jsonArr.add(obj);
        }
        long totalPages = page.getPageCount(totalRecords);
        jsonObj.put("totalRecords", totalRecords);
        jsonObj.put("totalPages", totalPages);
        jsonObj.put("curPage", page.getCurPageNo());
        jsonObj.put("dataRows", jsonArr);
        jsonObj.put("serviceClassId", scId);

        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        httpRquest.setAttribute("jsonObj", jsonObj);
        return "success";
    }

    //根据状态查询订单
    public String getOrderByState() {
        HttpServletRequest httpRquest = ServletActionContext.getRequest();
        JSONObject jsonObj = new JSONObject();
        JSONArray jsonArr = new JSONArray();
        page.setPageSize(10);


        long totalRecords = orderDao.findOrderCountByUserAndNumAndState(userId, page.getPageSize(), (page.getCurPageNo() - 1) * page.getPageSize(), state);

        List<Order> order_list = orderDao.findOrderByUserPageAndState(userId, page.getPageSize(), (page.getCurPageNo() - 1) * page.getPageSize(), state);
        for (Order order : order_list) {
            JSONObject obj = new JSONObject();
            obj.put("spTitle", order.getServiceProduct().getTitle());
            obj.put("name", order.getServiceProduct().getServiceProject().getName());
            obj.put("shopTitle", order.getServiceShop() == null ? "" : order.getServiceShop().getTitle());
            obj.put("paid", order.getPaid());
            obj.put("id", order.getId());
            obj.put("orderState", order.getState());

            jsonArr.add(obj);

        }

        long totalPages = page.getPageCount(totalRecords);
        jsonObj.put("totalRecords", totalRecords);
        jsonObj.put("totalPages", totalPages);
        jsonObj.put("curPage", page.getCurPageNo());
        jsonObj.put("userId", userId);
        jsonObj.put("state", state);
        jsonObj.put("dataRows", jsonArr);

        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        httpRquest.setAttribute("jsonObj", jsonObj);

        return "success";
    }


    //查询用户所有订单
    public String getAllOrderByState() {
        HttpServletRequest httpRquest = ServletActionContext.getRequest();
        JSONObject jsonObj = new JSONObject();
        JSONArray jsonArr = new JSONArray();
        page.setPageSize(10);


        long totalRecords = orderDao.findOrderCountByUserAndNumAndState(userId, page.getPageSize(), (page.getCurPageNo() - 1) * page.getPageSize(), state);

        List<Order> order_list = orderDao.findOrderByUserPageAndState(userId, page.getPageSize(), (page.getCurPageNo() - 1) * page.getPageSize(), state);
        for (Order order : order_list) {
            JSONObject obj = new JSONObject();
            obj.put("spTitle", order.getServiceProduct().getTitle());
            obj.put("name", order.getServiceProduct().getServiceProject().getName());
            obj.put("shopTitle", order.getServiceShop() == null ? "" : order.getServiceShop().getTitle());
            obj.put("paid", order.getPaid());
            obj.put("path", order.getServiceProduct().getPath());
            obj.put("icon", order.getServiceProduct().getIcon());
            obj.put("id", order.getId());
            obj.put("orderState", order.getState());

            jsonArr.add(obj);

        }

        long totalPages = page.getPageCount(totalRecords);
        jsonObj.put("totalRecords", totalRecords);
        jsonObj.put("totalPages", totalPages);
        jsonObj.put("curPage", page.getCurPageNo());
        jsonObj.put("userId", userId);
        jsonObj.put("state", state);
        jsonObj.put("dataRows", jsonArr);

        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        httpRquest.setAttribute("jsonObj", jsonObj);

        return "success";
    }

    public String createOrder() {
        JSONObject ret = new JSONObject();
        HttpServletRequest httpRequest = ServletActionContext.getRequest();
         User user = (User)httpRequest.getSession().getAttribute("user");
        String serialnumber = "HX"+ UtilDate.getOrderNum();
        ServiceProduct sp = spDao.findServiceProductById(spId);
        System.err.print(serviceShopId);
        ServiceShop serviceShop = serviceShopDao.findServiceShopById(serviceShopId);
        Order order = new Order();
        order.setSerialnumber(serialnumber);
        order.setCustomername(name);
        order.setCustomerphone(phone);
        order.setNumber(number);
        if(null != serviceShop){
            order.setServiceShop(serviceShop);
        }
        order.setServiceProduct(sp);
        order.setPrice(sp.getNewprice());
        order.setPaid(sp.getNewprice() * number);
        order.setUser(user);
        order.setPaidType(paidTypeDao.findPaidTypeById(1));
        order.setCreatedTime(new Date());
        order.setUpdateTime(new Date());
        order.setType(0);       //个人用户，企业用户
        order.setState(0);      //0确认订单
        orderDao.saveNewOrder(order);
        ret.put("result","ok");
        ret.put("orderId",order.getId());
        ret.put("paid",order.getPaid());
        httpRequest.setAttribute("jsonObj", ret);

        return "success";
    }

    public String cancerOrder(){
        response.setContentType("text/html");
        response.setCharacterEncoding("utf-8");
        JSONObject ret = new JSONObject();
        Order order = orderDao.findOrderById(orderId);
        if(order != null){
            order.setState(7);
            order.setUpdateTime(new Date());
            orderDao.saveOrder(order);
            ret.put("result","ok");
        }else{
            ret.put("errCode",1);
            ret.put("erMessage","未找到该订单");
        }

        try {
            PrintWriter out = response.getWriter();
            out.print(ret.toString());
            out.flush();
            out.close();
        } catch (Exception e) {
            MiscUtils.getLogger().info(e.toString());
        }

        return null;
    }

    public String sureOrder(){
        response.setContentType("text/html");
        response.setCharacterEncoding("utf-8");
        JSONObject ret = new JSONObject();
        Order order = orderDao.findOrderById(orderId);
        if(order != null){
            order.setState(2);
            order.setUpdateTime(new Date());
            orderDao.saveOrder(order);
            ret.put("result","ok");
        }else{
            ret.put("errCode",1);
            ret.put("erMessage","未找到该订单");
        }

        try {
            PrintWriter out = response.getWriter();
            out.print(ret.toString());
            out.flush();
            out.close();
        } catch (Exception e) {
            MiscUtils.getLogger().info(e.toString());
        }

        return null;
    }

    public String refundOrder(){
        response.setContentType("text/html");
        response.setCharacterEncoding("utf-8");
        JSONObject ret = new JSONObject();
        Order order = orderDao.findOrderById(orderId);
        if(order != null){
            order.setState(4);
//            order.setPos(reason);
            order.setUpdateTime(new Date());
            orderDao.saveOrder(order);
            ret.put("result","ok");
        }
        try {
            PrintWriter out = response.getWriter();
            out.print(ret.toString());
            out.flush();
            out.close();
        } catch (Exception e) {
            MiscUtils.getLogger().info(e.toString());
        }

        return null;
    }

    //选择服务店
    public String getShopList(){
        HttpServletRequest httpRquest = ServletActionContext.getRequest();
        if(spId != 0){
            httpRquest.getSession().setAttribute("spId",spId);
        }
        if(StringUtils.isNotEmpty(name)){
            httpRquest.getSession().setAttribute("name",name);
        }
        if(StringUtils.isNotEmpty(phone)){
            httpRquest.getSession().setAttribute("phone",phone);
        }
        if(number != 0){
            httpRquest.getSession().setAttribute("number",number);
        }

        List<AreaDetail> cityList = new ArrayList<AreaDetail>();
        if(StringUtils.isNotEmpty(province)){
            httpRquest.setAttribute("province", province);
        }
        if(StringUtils.isNotEmpty(province)){
            httpRquest.setAttribute("city", city);
        }
        if(StringUtils.isNotEmpty(province)){
            httpRquest.setAttribute("country", country);
        }
        page.setPageSize(10);
        List<ServiceShop> serviceshop = serviceShopDao.findServiceShopPageByArea(page,province,city,country);
        Long totalRecords = serviceShopDao.countServiceShopPageByArea(province,city,country);

        httpRquest.setAttribute("serviceshop", serviceshop);
        httpRquest.setAttribute("curPageNo",page.getCurPageNo());
        httpRquest.setAttribute("totalRecords", totalRecords);
        return "success";
    }


    //添加评论
    public String sureComment(){
        HttpServletRequest httpRquest = ServletActionContext.getRequest();
        response.setContentType("text/html");
        response.setCharacterEncoding("utf-8");
        JSONObject ret = new JSONObject();
        User user = (User)httpRquest.getSession().getAttribute("user");
//        Company company = (Company)httpRquest.getSession().getAttribute("company");
        Order order = orderDao.findOrderById(orderId);
        Comment comm = new Comment();
        comm.setOrder(order);
        if(null != user){
            comm.setUser(user);
        }
//        if(null != company){
//            comm.setCompany(company);
//        }
        comm.setServiceProduct(order.getServiceProduct());
        comm.setServiceShop(order.getServiceShop());
        comm.setTitle(title);
        comm.setContent(content);
        comm.setStar(star);
        comm.setStatus(1);
        comm.setCreatedTime(new Date());
        comm.setUpdateTime(new Date());
        commentDao.saveNewComment(comm);

        order.setState(3);
        orderDao.saveOrder(order);

        ret.put("result", "ok");
        try {
            PrintWriter out = response.getWriter();
            out.print(ret.toString());
            out.flush();
            out.close();
        } catch (Exception e) {
            MiscUtils.getLogger().info(e.toString());
        }
        return null;
    }




    // 验证AccessToken
    private Map<String,String> validateAccessToken(String accessToken, String type) {
        Map<String,String> map = new HashedMap();
        if (StringUtils.isBlank(accessToken) || StringUtils.isBlank(type))
            return null;
        String userId = null;String phone = null;
        try {
            if ("touchlife".equals(type)) {
                String url = prop.getProperty("ctk_url");
                String appkey = prop.getProperty("ctk_appkey");
                String appsecret = prop.getProperty("ctk_secret");
                String sellerId = prop.getProperty("ctk_sellerid");
                String prvKey = prop.getProperty("ctk_prvkey");
                String pubKey = prop.getProperty("ctk_pubkey");
                TouchlifeClient client = new DefaultTouchlifeClient(url, appkey, appsecret, sellerId, prvKey, pubKey);
                AccountUserProfileRequest req = new AccountUserProfileRequest();
                req.setAccessToken(accessToken);
                AccountUserProfileResponse resp = client.execute(req);
                userId = resp.getUserId();
                phone = resp.getPhone();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        map.put("userId",userId);
        map.put("phone",phone);
        return map;
    }

    // 使用AccessToken绑定用户
    public String bindByAccessToken() {
        HttpServletRequest httpRequest = ServletActionContext.getRequest();
        response.setContentType("application/json");
        response.setCharacterEncoding("utf-8");
        JSONObject ret = new JSONObject();
        User user = (User) httpRequest.getSession().getAttribute("user");
        if (user == null) {
            //未登陆，拿手机号去差
            ret.put("result", 5); // 当前用户未登陆
        } else if (StringUtils.isBlank(accessToken)) {
            ret.put("result", 1);
        } else if (StringUtils.isBlank(type)) {
            ret.put("result", 2);
        } else {
            UserExternal userExternal = null;
            if ("touchlife".equals(type)) {         //type:touchlife 触宝用户
                String userId = validateAccessToken(accessToken, type).get("userId");
                if (userId != null) {
                    userExternal = userExternalDao.findUserExternalByUserId(type, userId);
                    if (userExternal == null) {
                        userExternal = new UserExternal();
                        userExternal.setUser(user);
                        userExternal.setUserId(userId);
                        userExternal.setType(type);
                        userExternalDao.persist(userExternal);
                    } else {
                        ret.put("result", 4); // 用户已绑定
                    }
                } else {
                    ret.put("result", 6); // AccessToken错误
                }
            } else {
                ret.put("result", 3);   //不是来自触宝
            }
        }
        return null;
    }

    // 使用AccessToken登录
    public String loginByAccessToken() {

        HttpServletRequest httpRequest = ServletActionContext.getRequest();
        httpRequest.getSession().setAttribute("company", null);
        httpRequest.getSession().setAttribute("shopuser", null);
        response.setContentType("application/json");
        response.setCharacterEncoding("utf-8");
        JSONObject ret = new JSONObject();
        if (StringUtils.isBlank(accessToken)) {
            ret.put("result", 1); // accessToken不能为空;
        } else if (StringUtils.isBlank(type)) {
            ret.put("result", 2); // 登录类型不能为空;
        } else {
            if ("touchlife".equals(type)) {
                Role role = roleDao.find(3);        //普通用户
                AreaDetail areaDetail = areaDetailDao.findAreaByid(3);      //地址
                String userId = validateAccessToken(accessToken, type).get("userId");
                String phone =  validateAccessToken(accessToken, type).get("phone");
                if(StringUtils.isNotEmpty(phone)){
                    phone = StringUtils.substring(phone,3);
                }
                UserExternal userExternal = userExternalDao.findUserExternalByUserId(type, userId);
                if (userExternal == null || userExternal.getUser() == null) {   //未绑定 此时用手机号码生成用户
                    User user = usersDao.findByPhone(phone);
                    if(null == user){
                        user = new User();
                        user.setRole(role);
                        user.setAreaDetail(areaDetail);
                        user.setName(phone);
                        user.setPhone(phone);
                        user.setEmail("dhr0824@163.com");
                        user.setPassword("123456");
                        user.setBalance("");
                        user.setIcon("");
                        user.setPath("");
                        user.setStatus(0);
                        user.setCreatedTime(new Date());
                        user.setUpdateTime(new Date());
                        usersDao.saveNewUser(user);
                    }
                    userExternal = new UserExternal();
                    userExternal.setUser(user);
                    userExternal.setUserId(userId);
                    userExternal.setType(type);
                    userExternalDao.persist(userExternal);
                }

                User userLogin = userExternal.getUser();
                httpRequest.getSession().setAttribute("user", userLogin);
                List<MyCart> cart_list = (List<MyCart>) httpRequest.getSession().getAttribute("ProductInCart");
                List<MyCart> my_list = myCartDao.findMyCartByUser(userLogin.getId());
                List<Integer> sp_list = new ArrayList<Integer>();
                MyCart new_cart = new MyCart();
                if (my_list.size() > 0) {
                    for (int i = 0; i < my_list.size(); i++) {
                        sp_list.add(my_list.get(i).getServiceProduct().getId());
                    }
                }
                if (null == cart_list) {
                    cart_list = new ArrayList<MyCart>();
                }
                if (cart_list.size() > 0) {
                    for (int i = 0; i < cart_list.size(); i++) {
                        if (!sp_list.contains(cart_list.get(i).getServiceProduct().getId())) {
                            new_cart = cart_list.get(i);
                            new_cart.setUser(userLogin);
                            myCartDao.saveNewMyCart(new_cart);
                        }
                    }
                }
                my_list = myCartDao.findMyCartByUser(userLogin.getId());
                httpRequest.getSession().setAttribute("ProductInCart", my_list);
                ret.put("result", 0);
            } else {
                ret.put("result", 3); //不支持的登录方式
            }
        }

        try {
            PrintWriter out = response.getWriter();
            out.print(ret.toString());
            out.flush();
            out.close();
        } catch (Exception e) {
            MiscUtils.getLogger().info(e.toString());
        }
        return null;
    }

    public String tradePay(){
        Order order = orderDao.findOrderById(orderId);
        String callbackUrl = prop.getProperty("call_back_url");
        String url = prop.getProperty("ctk_url");
        String appkey = prop.getProperty("ctk_appkey");
        String appsecret = prop.getProperty("ctk_secret");
        String sellerId = prop.getProperty("ctk_sellerid");
        String prvKey = prop.getProperty("ctk_prvkey");
        String pubKey = prop.getProperty("ctk_pubkey");
        TouchlifeClient client = new DefaultTouchlifeClient(url, appkey, appsecret, sellerId, prvKey, pubKey);
        TradePayCreateRequest req = new TradePayCreateRequest();
        req.setUserId(chuBaoUserId);
        req.setNotifyUrl(callbackUrl+"apphybrid/callBack.do");
        req.setTradeNo(order.getSerialnumber());
        req.setTradeService("com.80ycw.autoservice");
        req.setTradeName(order.getServiceProduct().getServiceProject().getName());
        req.setTradeDesc(order.getServiceProduct().getServiceProject().getName()+"-"+order.getPaid()+"元");
        req.setTotalFee(totalFee);
        req.setExpireTime(new Date(System.currentTimeMillis()));
        req.setAttach(String.valueOf(order.getId()));
        req.setTradeStr(tradeStr);
        TradePayCreateResponse response1 = new TradePayCreateResponse();
        try {
            response1 = client.execute(req);
        } catch (ApiException e) {
            e.printStackTrace();
        }
        JSONObject ret = new JSONObject();
        ret.put("payStr",response1.getPayStr());
        try {
            PrintWriter out = response.getWriter();
            out.print(ret.toString());
            out.flush();
            out.close();
        } catch (Exception e) {
            MiscUtils.getLogger().info(e.toString());
        }

        return null;
    }


    public String callBack(){
        HttpServletRequest httpRequest = ServletActionContext.getRequest();

        String appsecret = prop.getProperty("ctk_secret");
        String pubKey = prop.getProperty("ctk_pubkey");
        TradePayResultResponse response = new TradePayResultResponse();

        int totalbytes = httpRequest.getContentLength();
        byte[] dataOrigin = new byte[totalbytes];
        //获取到异步通知请求body
        String body ="";
        DataInputStream in = null;
        try {
            in = new DataInputStream(httpRequest.getInputStream());
            in.readFully(dataOrigin);
            in.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        String reqcontent = new String(dataOrigin); // 从字节数组中得到表示实体的字符串

        try {
            response.setBody(reqcontent);
        } catch (Exception e) {
            e.printStackTrace();
        }
        try {
            assert(SecurityUtils.verifySign(response.getParams(), appsecret, pubKey)); //进行验证签名等操作
        } catch (Exception e) {
            e.printStackTrace();
        }

        Integer orderId = Integer.valueOf(response.getAttach());

        System.err.print(response.getTradeStatus());
        if(response.getTradeStatus().toString().equals("TRADE_SUCCESS")){
            Order order = orderDao.findOrderById(orderId);
            order.setState(1);//已付款
            orderDao.saveOrder(order);
        }
        return null;
    }

    //手机号查询serviceshop
    public String queryServiceShopByPhone(){
        response.setContentType("application/json");
        response.setCharacterEncoding("utf-8");
        List<ServiceShop> list = serviceShopDao.queryServiceShopByPhone(phone);
        JSONObject jsonObj = new JSONObject();
        JSONArray jsonArr = new JSONArray();
        JsonConfig config = new JsonConfig();
        config.setJsonPropertyFilter(new PropertyFilter(){
            public boolean apply(Object source, String name, Object value) {
                if(name.equals("paidtype" )|| name.equals("comments") || name.equals("orders") || name.equals("areaDetail") || name.equals("serviceshopServices") ) {

                    return true;

                } else {

                    return false;

                }
            }
        });
        for(ServiceShop sp:list){
            JSONObject jsonTemp = JSONObject.fromObject(sp,config);
            jsonArr.add(jsonTemp);
        }
        jsonObj.put("data",jsonArr);
        try {
            PrintWriter out = response.getWriter();
            out.print(jsonObj.toString());
            out.flush();
            out.close();
        } catch (Exception e) {
            MiscUtils.getLogger().info(e.toString());
        }
        return null;
    }


    public int getScId() {
        return scId;
    }

    public void setScId(int scId) {
        this.scId = scId;
    }

    public Page getPage() {
        return page;
    }

    public void setPage(Page page) {
        this.page = page;
    }

    public SmartProperties getProp() {
        return prop;
    }

    public int getSpId() {
        return spId;
    }

    public void setSpId(int spId) {
        this.spId = spId;
    }

    public void setProp(SmartProperties prop) {
        this.prop = prop;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    public String getAccessToken() {
        return accessToken;
    }

    public void setAccessToken(String accessToken) {
        this.accessToken = accessToken;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name=name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getStar() {
        return star;
    }

    public void setStar(int star) {
        this.star = star;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public int getServiceShopId() {
        return serviceShopId;
    }

    public void setServiceShopId(int serviceShopId) {
        this.serviceShopId = serviceShopId;
    }

    public String getChuBaoUserId() {
        return chuBaoUserId;
    }

    public void setChuBaoUserId(String chuBaoUserId) {
        this.chuBaoUserId = chuBaoUserId;
    }

    public Long getTotalFee() {
        return totalFee;
    }

    public void setTotalFee(Long totalFee) {
        this.totalFee = totalFee;
    }

    public String getTradeStr() {
        return tradeStr;
    }

    public void setTradeStr(String tradeStr) {
        this.tradeStr = tradeStr;
    }
}