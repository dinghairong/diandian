package com.smart4c.action.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.struts2.interceptor.ServletResponseAware;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionSupport;
import com.smart4c.bean.Advertising;
import com.smart4c.common.SmartProperties;
import com.smart4c.dao.AdvertisingDao;
import com.smart4c.util.MiscUtils;

public class AdsMgmtAction extends ActionSupport implements ServletResponseAware {
	private Advertising ads;
	@Autowired
	private AdvertisingDao advDao;
	
	private String pics ="";
	private SmartProperties hxprop = SmartProperties.getInstance();
	private HttpServletResponse response;
	

	public String getPics() {
		return pics;
	}

	public void setPics(String pics) {
		this.pics = pics;
	}

	@Override
	public void setServletResponse(HttpServletResponse arg0) {
		this.response = arg0;
	}
	
	public String updateAds(){
		String picInfo[] =pics.split("\\|");
		List<Advertising> adsList = advDao.findAdvByLocation(ads.getLocation());
		int imgPathLen = hxprop.getImgPath().length();
		int maxCount =1;//the max count at that position 
		switch(ads.getLocation()){
		case 1://when location is 1;
			maxCount = 6;
			break;
		case 2:
		case 3:
		case 4:
		case 5:
		case 6:
		default:
			break;	
		}
		
		int count =0,j=0;
		for(int i=0;i<picInfo.length&&count<maxCount;i++){
			String tmp[] = picInfo[i].split(";", -1);
			if(tmp.length !=4){
				continue;
			}
			Advertising adsTmp = null;
			if(j<adsList.size()){
				adsTmp = adsList.get(j);
				adsTmp.setHref(tmp[2]);
				adsTmp.setImage(tmp[1]);
				adsTmp.setPath(MiscUtils.addPathSuffix(tmp[0].substring(imgPathLen)));
				adsTmp.setStatus((byte) 0);
				adsTmp.setTitle(tmp[3]);
				advDao.merge(adsTmp);
				j++;
			}else{
				adsTmp = new Advertising();
				adsTmp.setHref(tmp[2]);
				adsTmp.setImage(tmp[1]);
				adsTmp.setPath(MiscUtils.addPathSuffix(tmp[0].substring(imgPathLen)));
				adsTmp.setStatus((byte) 0);
				adsTmp.setTitle(tmp[3]);
				adsTmp.setLocation(ads.getLocation());
				advDao.persist(adsTmp);
			}
		}
		for(;j<adsList.size();j++){
			if(adsList.get(j).getStatus()==0){
				adsList.get(j).setStatus((byte) 1);
				advDao.merge(adsList.get(j));
			}
		}
		return null;
	}
	
	public String getAdsList(){
		JSONObject jsonObj = new JSONObject();
		int totalRecords = 6;
		int totalPages = 1;
		jsonObj.put("totalRecords", totalRecords);
		jsonObj.put("totalPages", totalPages);
		jsonObj.put("curPage", 1);
		
		JSONArray arr = new JSONArray();
		int[] maxCnt = new int[6];
		maxCnt[0] = 6;
		maxCnt[1] = 1;
		maxCnt[2] = 1;
		maxCnt[3] = 1;
		maxCnt[4] = 1;
		maxCnt[5] = 1;
		String imgPath = hxprop.getImgPath();
		for (int loc = 1; loc<7; loc++) {
			JSONObject obj = new JSONObject();
			obj.put("maxCnt", maxCnt[loc-1]);
			obj.put("location", loc);
			if (loc == 1) {
				obj.put("locName", "首页轮播广告");
			} else if (loc == 2) {
				obj.put("locName", "服务流程下方左侧广告");
			} else if (loc == 3) {
				obj.put("locName", "服务流程下方右侧广告");
			} else if (loc == 4) {
				obj.put("locName", "检测修正四方格右侧广告");
			} else if (loc == 5) {
				obj.put("locName", "客户评价上方左侧广告");
			} else if (loc == 6) {
				obj.put("locName", "客户评价上方右侧广告");
			} 
			List<Advertising> adsList = advDao.findAdvByLocation(loc);
			StringBuffer buf = new StringBuffer();
			for (Advertising adsTmp : adsList) {
				buf.append(imgPath + adsTmp.getPath() + ";" + adsTmp.getImage() 
						+ ";" + adsTmp.getHref() + ";" + adsTmp.getTitle());
				buf.append("|");
			}
			if (buf.length() > 1) {
				buf.deleteCharAt(buf.length() - 1);
			}
			
			obj.put("pics", buf.toString());
			arr.add(obj);
		}
		jsonObj.put("dataRows", arr);
		
		response.setContentType("application/json;charset=UTF-8"); // 避免中文乱码
		try {
			PrintWriter out = response.getWriter();
			out.write(jsonObj.toString());
			out.flush();
			out.close();
		} catch (Exception e) {
			MiscUtils.getLogger().info(e.toString());
		}
		return null;
	}

	public Advertising getAds() {
		return ads;
	}

	public void setAds(Advertising ads) {
		this.ads = ads;
	}
}
