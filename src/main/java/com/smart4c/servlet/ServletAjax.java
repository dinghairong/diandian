package com.smart4c.servlet;

import com.smart4c.dao.DbHelper;
import com.smart4c.pojo.*;
import com.smart4c.system.Ajaxs;
import com.smart4c.system.JsonBuilder;
import com.smart4c.util.TextUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
 * Created by apple on 15/11/13.
 */
public class ServletAjax extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json;charset=utf-8");
        PrintWriter out = resp.getWriter();
        String json = JsonBuilder.buildJson(-1);

        String req_code = req.getParameter("req_code");

        if (!TextUtils.isEmpty(req_code)) {
            int ajax_code = Integer.parseInt(req_code);
            DbHelper helper = DbHelper.getInstance();

            switch (ajax_code) {
                case Ajaxs.GET_PROVINCE:
                    List<Province> provinceList = helper.getProvinces();
                    Province provincePojo = provinceList.get(0);

                    if (provincePojo != null) {
                        List<City> cityList = helper.getCitiesFromProvinc(provincePojo.getName());
                        City cityPojo = cityList.get(0);

                        if (cityPojo != null) {
                            List<County> counties = helper.getCountiesFromCity(cityPojo.getName());
                            cityPojo.setCounties(counties);
                        }

                        provincePojo.setCities(cityList);
                    }
                    json = JsonBuilder.buildJson(0, provinceList);
                    break;
                case Ajaxs.GET_CITY:
                    String province = req.getParameter("province");

                    if (!TextUtils.isEmpty(province)) {
                        List<City> cityList = helper.getCitiesFromProvinc(province);
                        City cityPojo = cityList.get(0);

                        if (cityPojo != null) {
                            List<County> counties = helper.getCountiesFromCity(cityPojo.getName());
                            cityPojo.setCounties(counties);
                        }

                        json = JsonBuilder.buildJson(0, cityList);
                    }
                    break;
                case Ajaxs.GET_COUNTY:
                    String city = req.getParameter("city");

                    if (!TextUtils.isEmpty(city)) {
                        List<County> countyList = helper.getCountiesFromCity(city);
                        json = JsonBuilder.buildJson(0, countyList);
                    }
                    break;

                case Ajaxs.VALIDATE_CODE:
                    String vcode = req.getParameter("vcode");
                    String imgCode = (String) req.getSession().getAttribute("imagecode");

                    if (!TextUtils.hasEmpty(vcode, imgCode) &&
                        vcode.toLowerCase().equals(imgCode.toLowerCase())) {

                        json = JsonBuilder.buildJson(0);
                    }
                    break;

                case Ajaxs.REGIST_ENTERPRISE:
                    int county = Integer.parseInt(req.getParameter("county"));
                    String reg_email = req.getParameter("reg_email");
                    String desc_addr = req.getParameter("desc_addr");
                    String reg_pwd = req.getParameter("reg_pwd");
                    String agreement_no = req.getParameter("agreement_no");
                    String company_name = req.getParameter("company_name");
                    String second_party = req.getParameter("second_party");
                    String license = req.getParameter("business_license_no");
                    String linkman = req.getParameter("contact");
                    String tel = req.getParameter("phone_num");
                    String url = req.getParameter("href_addr");
                    String platform = req.getParameter("third_platform");
                    String start = req.getParameter("from_time");
                    String end = req.getParameter("to_time");

                    if (!TextUtils.isEmpty(tel) && !helper.isCompanyExist(tel)) {
                        String pwd = TextUtils.buildPassword(reg_pwd);
                        Company company = new Company();
                        company.setRole_id(2)
                                .setCid(county)
                                .setAddress(desc_addr)
                                .setPassword(pwd)
                                .setEmail(reg_email)
                                .setCompany(company_name)
                                .setBusiness_license_no(license)
                                .setContacts(linkman)
                                .setPhone(tel)
                                .setHref_addr(url)
                                .setThird_platform(platform)
                                .setBalance("")
                                .setIcon("")
                                .setStatus(0)
                                .setPath("")
                                .setMasterId(0);

                        int result = helper.insertCompany(company);

                        if (result > 0) {

                            RegProtocol rp = new RegProtocol();
                            rp.setCode(agreement_no);
                            rp.setSecond_party(second_party);
                            rp.setCompany(company_name);
                            rp.setLicence(license);
                            rp.setLinkman(linkman);
                            rp.setTel(tel);
                            rp.setUrl(url);
                            rp.setPlatform(platform);
                            rp.setAddress(desc_addr);
                            rp.setStart(new Date(Long.parseLong(start)));
                            rp.setEnd(new Date(Long.parseLong(end)));
                            rp.setReg_id(result);

                            result = helper.insertCompanyProtocol(rp);

                            if (result > 0) {
                                json = JsonBuilder.buildJson(0);
                            }
                        }
                    }

                    break;
                case Ajaxs.REGIST_STORE:
                    String username = req.getParameter("username");
                    String password = req.getParameter("password");
                    String mobile = req.getParameter("mobile");
                    String email = req.getParameter("email");
                    String introducer = req.getParameter("introducer");
                    String s_tel = req.getParameter("tel");
                    String address_id = req.getParameter("address_id");
                    String address = req.getParameter("address");
                    String store_img = req.getParameter("store_img");
                    String license_img = req.getParameter("license_img");
                    String path = req.getParameter("path");
                    String store_name = req.getParameter("store_name");

                    password = TextUtils.buildPassword(password);

                    if (TextUtils.isEmpty(s_tel)) {
                        s_tel = "";
                    }

                    ServiceStore serviceStore = new ServiceStore();
                    serviceStore.setUserName(username);
                    serviceStore.setPassword(password);
                    serviceStore.setMobile(mobile);
                    serviceStore.setEmail(email);
                    serviceStore.setIntroducer(introducer);
                    serviceStore.setTel(s_tel);
                    serviceStore.setAddress_id(Integer.parseInt(address_id));
                    serviceStore.setAddress(address);
                    serviceStore.setImage(store_img);
                    serviceStore.setLicense(license_img);
                    serviceStore.setPath(path);
                    serviceStore.setStoreName(store_name);
                    serviceStore.setStatus(1);

                    int id = helper.insertStore(serviceStore);

                    if (id != -1) {
                        String product_sel = req.getParameter("product_sel");
                        int s_result = -1;

                        if (!TextUtils.isEmpty(product_sel)) {
                            String[] ids = product_sel.split(",");
                            s_result = helper.insertStoreProduct(id, ids);
                        }

                        if (s_result != -1) {
                            String second = req.getParameter("second");
                            String second2 = req.getParameter("second2");
                            String p_province = req.getParameter("p_province");
                            String p_city = req.getParameter("p_city");
                            String place = req.getParameter("place");
                            String bank = req.getParameter("bank");
                            String account = req.getParameter("account");
                            String account_name = req.getParameter("account_name");
                            String alipay = req.getParameter("alipay");
                            String s_linkman = req.getParameter("linkman");
                            String p_address = req.getParameter("p_address");
                            String p_tel = req.getParameter("p_tel");
                            String person_in_charge = req.getParameter("person_in_charge");

                            RegProtocol protocol = new RegProtocol();
                            protocol.setReg_id(id);
                            protocol.setSecond_party(second);
                            protocol.setProvince(p_province);
                            protocol.setCity(p_city);
                            protocol.setPlace(place);
                            protocol.setBank(bank);
                            protocol.setAccount(account);
                            protocol.setAccount_name(account_name);
                            protocol.setAlipay(alipay);
                            protocol.setLinkman(s_linkman);
                            protocol.setAddress(p_address);
                            protocol.setTel(p_tel);
                            protocol.setPerson_in_charge(person_in_charge);

                            Calendar c  = Calendar.getInstance();
                            protocol.setStart(c.getTime());
                            c.add(Calendar.YEAR, 1);
                            c.add(Calendar.DAY_OF_YEAR, -1);
                            protocol.setEnd(c.getTime());

                            s_result = helper.insertStoreProtocol(protocol);

                            if (s_result != -1) {
                                json = JsonBuilder.buildJson(0);
                            } else {
                                helper.deleteStore(id);
                                helper.deleteStoreProduct(id);
                            }

                        } else {
                            helper.deleteStore(id);
                        }
                    }

                    break;

                case Ajaxs.CHECK_MOBILE_NUMBER:
                    String mobile_number = req.getParameter("mobile");

                    if (!TextUtils.isEmpty(mobile_number)) {
                        int cnt = helper.getMobileCountFromStore(mobile_number);

                        if (cnt <= 0) {
                            json = JsonBuilder.buildJson(0);
                        }
                    }
                    break;
            }
        }

        out.print(json);
        out.flush();
        out.close();
    }
}
