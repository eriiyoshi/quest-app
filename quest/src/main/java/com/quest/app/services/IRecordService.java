package com.quest.app.services;

import com.quest.app.model.Record;
import java.util.List;

/**
 *
 * @author Erica Yoshiwara
 */
public interface IRecordService {
        
    public int saveRecord(Record record);
    
    public List<Record> getAllRecords();
    
    public Record findByPPS(String pps);
}
