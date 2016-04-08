package com.smart4c.action.diandian;

import com.opensymphony.xwork2.ActionSupport;
import com.smart4c.bean.Area;
import com.smart4c.bean.AreaDetail;
import com.smart4c.bean.Store;
import com.smart4c.dao.AreaDao;
import com.smart4c.dao.StoreDao;
import com.smart4c.util.MiscUtils;
import net.sf.json.JSONObject;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by HSHY-032 on 2016/4/6.
 */
public class TyreAction  extends ActionSupport implements ServletResponseAware {

    @Autowired
    private StoreDao storeDao;

    @Autowired
    private AreaDao areaDao;

    private Integer pid;

    private Store store;

    private HttpServletResponse response;

    private File filelogo;

    private File filelicense;

    // 上传文件名
    private String filelicenseFileName;
    // 上传文件类型
    private String filelicenseContentType;

    // 上传文件名
    private String filelogoFileName;
    // 上传文件类型
    private String filelogoContentType;

    private static final int BUFFER_SIZE = 16 * 1024;

    @Override
    public void setServletResponse(HttpServletResponse response) {
        this.response = response;
    }

    public String index(){
        JSONObject ret = new JSONObject();
        HttpServletRequest httpRequest = ServletActionContext.getRequest();
        int storeNum = storeDao.findAllStoreNum();
        ret.put("storeNum",storeNum);
        httpRequest.setAttribute("jsonObj", ret);
        return "success";
    }

    public String getCityByProvince(){
        List<Area> cityList = areaDao.findCityByProvince(pid);
        response.setContentType("application/json");
        response.setCharacterEncoding("utf-8");
        JSONObject ret = new JSONObject();
        StringBuilder html = new StringBuilder("");
        List<Integer> isRepeat = new ArrayList<Integer>();

        for(int i = 0;i < cityList.size();i ++){
            if(!isRepeat.contains(cityList.get(i).getId())){
                html.append("<option value=\"" + String.valueOf(cityList.get(i).getId()) + "\">" + cityList.get(i).getAreaname() + "</option>");
                isRepeat.add(cityList.get(i).getId());
            }
        }
        ret.put("html", html.toString());
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

    public String saveStore(){
        String picSavePath = ServletActionContext.getServletContext().getRealPath("/storePictures");
        String licenseName = getFileName(filelicenseFileName);
        String license = "/storePictures/"+licenseName;
        copy(filelicense,new File(picSavePath+"/"+licenseName));
        String logoName = getFileName(filelogoFileName);
        String logo = "/storePictures/"+logoName;
        copy(filelogo,new File(picSavePath+"/"+logoName));
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Store storeNew = new Store();
        storeNew.setStorename(store.getStorename());
        storeNew.setLinkman(store.getLinkman());
        storeNew.setMobile(store.getMobile());
        storeNew.setAreaid(store.getAreaid());
        storeNew.setAddress(store.getAddress());
        storeNew.setRegtime(sdf.format(new Date()));
        storeNew.setBusinesslicense(license);
        storeNew.setLogo(logo);
        storeNew.setStatus(0);
        storeDao.saveNewStore(storeNew);
        return "success";
    }

    private static void copy(File src, File dst) {
        InputStream in = null;
        OutputStream out = null;
        try {
            in = new BufferedInputStream(new FileInputStream(src), BUFFER_SIZE);
            out = new BufferedOutputStream(new FileOutputStream(dst),
                    BUFFER_SIZE);
            byte[] buffer = new byte[BUFFER_SIZE];
            int len = 0;
            while ((len = in.read(buffer)) > 0) {
                out.write(buffer, 0, len);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (null != in) {
                try {
                    in.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
            if (null != out) {
                try {
                    out.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    private static String getFileName(String fileName){
        SimpleDateFormat sdfFile = new SimpleDateFormat("yyyyMMddHHmmss");
        int temp = fileName.lastIndexOf(".");
        String picType=fileName.substring(temp,fileName.length());
        String picName = fileName.substring(0,temp)+"_"+sdfFile.format(new Date())+picType;
        return picName;

    }


    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public Store getStore() {
        return store;
    }

    public void setStore(Store store) {
        this.store = store;
    }

    public File getFilelogo() {
        return filelogo;
    }

    public void setFilelogo(File filelogo) {
        this.filelogo = filelogo;
    }

    public String getFilelogoFileName() {
        return filelogoFileName;
    }

    public void setFilelogoFileName(String filelogoFileName) {
        this.filelogoFileName = filelogoFileName;
    }

    public String getFilelogoContentType() {
        return filelogoContentType;
    }

    public void setFilelogoContentType(String filelogoContentType) {
        this.filelogoContentType = filelogoContentType;
    }

    public String getFilelicenseContentType() {
        return filelicenseContentType;
    }

    public void setFilelicenseContentType(String filelicenseContentType) {
        this.filelicenseContentType = filelicenseContentType;
    }

    public String getFilelicenseFileName() {
        return filelicenseFileName;
    }

    public void setFilelicenseFileName(String filelicenseFileName) {
        this.filelicenseFileName = filelicenseFileName;
    }

    public File getFilelicense() {
        return filelicense;
    }

    public void setFilelicense(File filelicense) {
        this.filelicense = filelicense;
    }
}
