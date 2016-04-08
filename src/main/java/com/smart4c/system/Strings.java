package com.smart4c.system;

import java.util.HashMap;

/**
 * Created by apple on 15/11/10.
 */
public final class Strings {
    private static final HashMap<String, String> map = new HashMap<String, String>();

    static {
        map.put("regist_title", "门店注册");
        map.put("regist_tip", "欢迎您加入帮您养车网！希望从现在开始，我们能为您的生活提供更多便捷与快乐！");
        map.put("regist_hint", "6-20个数字、字母或下划线，以字母开头");
        map.put("password_hint", "6-20个数字、字母或下划线，以字母开头");
        map.put("repassword_hint", "请再次输入密码");
        map.put("upload_img_tip", "注：图片只限于jpg、png、gif，并且不得超过2M");
    }

    public static final String get(String key) {
        return map.get(key);
    }
}
