package com.cjj.core.util;

import java.beans.PropertyEditorSupport;
import java.util.Calendar;
import java.util.Date;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import org.apache.commons.lang.StringUtils;

public class DateUtil extends PropertyEditorSupport{
	public static Timestamp timestamp(){
		Calendar calendar = Calendar.getInstance();
		calendar.add(Calendar.MONTH, 0);
		return new Timestamp(calendar.getTimeInMillis());
	}
	
	public static Timestamp timestamp(Timestamp timestamp, int month){
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(timestamp);
		calendar.add(Calendar.MONTH, month);
		return new Timestamp(calendar.getTimeInMillis());
	}
	
	public void setAsText(String text) throws IllegalArgumentException {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = null;
		try {
			if(StringUtils.isNotBlank(text)){
				date = format.parse(text);
			}
		} catch (ParseException e) {
			format = new SimpleDateFormat("yyyy-MM-dd");
			try {
				date = format.parse(text);
			} catch (ParseException e1) {
				e1.printStackTrace();
			}
		}
		setValue(date);
	}
}
