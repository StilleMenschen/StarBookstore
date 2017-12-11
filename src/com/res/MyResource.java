package com.res;

import java.io.UnsupportedEncodingException;

public class MyResource {
	public static final String HOST = "127.0.0.1";
	public static final String DATABASE = "lgbookshop";
	public static final String USER = "root";
	public static final String PASSWORD = "";
	public static final String CHARSET = "gb2312";
	public static final String DRIVER = "com.mysql.jdbc.Driver";
	private static final byte[][] ABOUT = { { 71, 66, 75 }, { 52, 48, 57, -80, -32 },{ 49, 53, 49, 54, 48, 52, 48, 57, 48, 53 }, { -63, -42, -71, -13 } };

	public static String getURI() {
		return String.format("jdbc:mysql://%s/%s?user=%s&password=%s&characterEncoding=%s", HOST, DATABASE, USER,
				PASSWORD, CHARSET);
	}

	public static void main(String[] args) {
		System.out.println(getURI());
	}

	public static String[] getAbout() {
		String[] vars = new String[3];
		try {
			vars[0] = new String(ABOUT[1], new String(ABOUT[0]));
			vars[1] = new String(ABOUT[2], new String(ABOUT[0]));
			vars[2] = new String(ABOUT[3], new String(ABOUT[0]));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return vars;
	}
}
