package com.smart4c.util;

/**
 * Created by apple on 15/11/10.
 */
public class TextUtils {
    public static final boolean isEmpty(String text) {
        return text == null || text.trim().length() == 0;
    }

    public static final boolean hasEmpty(String... text) {
        if (text == null || text.length == 0) return true;

        for (String txt : text) {
            if (txt == null || txt.trim().length() == 0) {
                return true;
            }
        }

        return false;
    }

    public static final String deleteLast(String source) {
        if (!isEmpty(source)) {
            return source.substring(0, source.length() - 1);
        } else {
            return source;
        }
    }

    public static final String buildPassword(String password) {
        byte[] sha1Bytes = EncryptionUtils.getSha1(password);
        StringBuilder sb = new StringBuilder();
        for (byte b : sha1Bytes) {
            sb.append(b);
        }

        return sb.toString();
    }
}
