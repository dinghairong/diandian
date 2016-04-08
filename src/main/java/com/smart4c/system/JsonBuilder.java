package com.smart4c.system;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

/**
 * Created by apple on 15/11/13.
 */
public final class JsonBuilder {
    private static final String JSON_TEMPLATE = "{\"code\":%d, \"data\":%s}";
    private static final Gson gson = new GsonBuilder().disableHtmlEscaping().create();

    public static final <T> String buildJson(int code, T t) {
        String json = gson.toJson(t);

        return String.format(JSON_TEMPLATE, code, json);
    }

    public static final String buildStringJson(int code, String json) {
        return String.format(JSON_TEMPLATE, code, json);
    }

    public static final String buildJson(int code) {
        return String.format(JSON_TEMPLATE, code, "\"\"");
    }
}
