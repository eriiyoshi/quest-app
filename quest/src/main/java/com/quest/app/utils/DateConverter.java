package com.quest.app.utils;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author Erica Yoshiwara
 */
public class DateConverter {
    
    public static String convertDateToString(Date date) {
        DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
        
        return date == null ? null : dateFormat.format(date);
    }
       
    public static Date convertStringToDate(String date) throws ParseException {
        return new SimpleDateFormat("dd/MM/yyyy").parse(date);  
    }
}
