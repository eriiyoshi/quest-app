package com.quest.app.repository;

import com.quest.app.model.Record;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 *
 * @author Erica Yoshiwara
 */
public interface RecordRepository extends JpaRepository<Record, Long>{
    
    public List<Record> findAllByOrderByCreationDateAsc();
    
    public Record findByPps(String pps);
}
