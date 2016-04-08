package com.smart4c.util;

import java.util.HashMap;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class SqlTools {
	public interface CallBack {// 回调函数接口
		public String executeField(String f);
		public String executeData(String f, String v);
	}

	private static Map<String, String> Q2Oper;

	public SqlTools() {
		if (Q2Oper != null) {
			return;
		}
		Q2Oper = new HashMap<String, String>();
		// ['eq','ne','lt','le','gt','ge','bw','bn','in','ni','ew','en','cn','nc']
		Q2Oper.put("eq", " = ");
		Q2Oper.put("ne", " <> ");
		Q2Oper.put("lt", " < ");
		Q2Oper.put("le", " <= ");
		Q2Oper.put("gt", " > ");
		Q2Oper.put("ge", " >= ");
		Q2Oper.put("bw", " LIKE ");
		Q2Oper.put("bn", " NOT LIKE ");
		Q2Oper.put("in", " IN ");
		Q2Oper.put("ni", " NOT IN ");
		Q2Oper.put("ew", " LIKE ");
		Q2Oper.put("en", " NOT LIKE ");
		Q2Oper.put("cn", " LIKE ");
		Q2Oper.put("nc", " NOT LIKE ");
	}
	
	private String executeData(String f, String o, String d) {  
        if(o.equals("bw") || o.equals("bn")) return "'" + d + "%'";  
        else if (o.equals("ew") || o.equals("en")) return "'%"+d+"'";  
        else if (o.equals("cn") || o.equals("nc")) return "'%" +d+ "%'";  
        else return "'" +d+ "'";  
    }  
	
	public String constructWhere(String filter, CallBack cb) {
		String query = "";
		if (!filter.isEmpty()) {
			JSONObject jsono = JSONObject.fromObject(filter);
			String group = (String) jsono.get("groupOp");
			JSONArray rules = (JSONArray) jsono.get("rules");
			int i = 0, k = 0;
			for (; i < rules.size(); i++) {
				String field = (String) rules.getJSONObject(i).get("field");
				String op = (String) rules.getJSONObject(i).get("op");
				String data = (String) rules.getJSONObject(i).get("data");
				if (!op.isEmpty() && !data.isEmpty()) {
					k++;
					field = cb.executeField(field);
					data = executeData(field, op, cb.executeData(field, data));
					if (k > 1) {
						query += " " + group + " ";
					}
					if (op.equals("in") || op.equals("ni")) {
						query += field + Q2Oper.get(op) + " (" + data + ")";
					} else {
						query += field + Q2Oper.get(op) + data;
					}
				}
			}
		}
		return query;
	}
}
