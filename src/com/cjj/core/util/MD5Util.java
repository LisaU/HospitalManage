package com.cjj.core.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Random;

import sun.misc.BASE64Encoder;

public class MD5Util {
	private final static char[] hexDigits ={'0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f','g',
		'h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'};

	public static String GetMD5Code16(String strObj) {
		return GetMD5Code32(strObj).substring(8, 24);
	}
	
	public final static String GetMD5Code32(String strobj) {       
	    try {
	        byte[] btInput = strobj.getBytes();
	        // 获得MD5摘要算法的 MessageDigest 对象
	        MessageDigest mdInst = MessageDigest.getInstance("MD5");
	        // 使用指定的字节更新摘要
	        mdInst.update(btInput);
	        // 获得密文
	        byte[] bByte = mdInst.digest();
	        
	        return byteToString(bByte);
	    } catch (Exception e) {
	        e.printStackTrace();
	        return null;
	    }
	}
	
	// 把密文转换成十六进制的字符串形式
	private static String byteToString(byte[] bByte) {
		int j = bByte.length;
	    char str[] = new char[j * 2];
	    int k = 0;
	    for (int i = 0; i < j; i++) {
	        byte byte0 = bByte[i];
	        str[k++] = hexDigits[byte0 >>> 4 & 0xf];
	        str[k++] = hexDigits[byte0 & 0xf];
	    }
		return new String(str);
	}
	
	public final static String token(){
		String token = (System.currentTimeMillis() + new Random().nextInt(999999999) + "");
		try {
			MessageDigest md = MessageDigest.getInstance("md5");
			byte md5[] = md.digest(token.getBytes());
			BASE64Encoder encoder = new BASE64Encoder();			
			return encoder.encode(md5);
		} catch (NoSuchAlgorithmException e) {
			throw new RuntimeException();
		}
	}
	
	public static void main(String[] args) {
		System.out.println(MD5Util.GetMD5Code32("加密"));
	}
}
