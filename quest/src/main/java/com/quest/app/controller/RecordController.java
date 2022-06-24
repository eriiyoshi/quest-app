package com.quest.app.controller;

import com.quest.app.model.Record;
import com.quest.app.services.IRecordService;
import com.quest.app.utils.DateConverter;
import java.text.ParseException;
import java.util.Date;
import java.util.List;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author Erica Yoshiwara
 */
@Controller
@RequestMapping("/record")
public class RecordController {
    
    @Autowired
    private IRecordService recordService;
    
    @GetMapping("/register")
    public String showRegistrationPage() {
       return "register";
    }
    
    @GetMapping("/all")
    public String showAllRecordsPage(ModelMap model) {
        
        List<Record> records = new ArrayList<Record>();
        records = recordService.getAllRecords();
        
        model.put("records", recordService.getAllRecords());
        return "all";
    }
    
    @PostMapping("/register")
    public String saveRecord(@RequestParam String name,
                              @RequestParam String pps,
                              @RequestParam String dob,
                              @RequestParam String mobile,
                              Model model) {
        
        Record r = new Record();
        
        r.setName(name);
        r.setPps(pps);
        
        try {
            r.setBirthday(DateConverter.convertStringToDate(dob));
        } catch (ParseException ex) {
            Logger.getLogger(RecordController.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        //no mobile phone inserted
        if(mobile.trim().equals("08") || mobile.trim().equals("") ) {
            r.setMobile("");
        } else {
            r.setMobile(mobile);
        }
        
        //creation date of the new record is now
        r.setCreationDate(new Date());
        
        int saved = recordService.saveRecord(r);
        String msg = "";
        
        //if ppsn already exists
        if(saved < 0) {
            msg = "Record with PPSN " + pps + " already registered in the system.";
            model.addAttribute("msg", msg);
            return "register";
        }
                
        return "redirect:/record/all";
    }
}
