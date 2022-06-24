package com.quest.app.services;

import com.quest.app.model.Record;
import com.quest.app.repository.RecordRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Erica Yoshiwara
 */
@Service
public class RecordServiceImpl implements IRecordService {
    
    @Autowired
    private RecordRepository recordRepository;
    
    @Override
    public int saveRecord(Record record) {
        //check if a record with the ppsn already exists
        final Record existingRecord = recordRepository.findByPps(record.getPps());
        if(null == existingRecord) {
            //if ppsn does not exist in the system, save the record
            recordRepository.save(record);
            return 0;
        } else {
            return -1;
        }
    }
    
    //get all records saved in the system and return them in order of date of creation
    @Override
    public List<Record> getAllRecords() {
        return recordRepository.findAllByOrderByCreationDateAsc();
    }
    
    @Override
    public Record findByPPS(String pps) {
        return recordRepository.findByPps(pps);
    }
    
}
