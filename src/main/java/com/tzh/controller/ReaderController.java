package com.tzh.controller;

import com.tzh.entity.Reader;
import com.tzh.service.ReaderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class ReaderController {

    @Autowired
    private ReaderService<Reader> readerService;

    private List<Reader> readerList;


    @RequestMapping(value = "/toWelcome")
    public String toWelcome(){
        return "welcome";
    }


    @RequestMapping(value = "/toAddReader")
    public String toAddReader(){
        return "addReader";
    }



    @ResponseBody
    @RequestMapping(value = "/reader/add",method = RequestMethod.POST)
    public String add(Reader reader, ModelMap modelMap){
        Boolean bool = readerService.add(reader);
        String mark = null;
        if (bool) {
            readerList = query();
            modelMap.addAttribute("readerList", readerList);
            mark = "s";
        } else {
            mark = "e";
        }
        return mark;
    }

    @ResponseBody
    @RequestMapping(value = "/reader/query",method = RequestMethod.GET)
    public List<Reader> query(){
       readerList =  readerService.query();
           return readerList;
    }

    @ResponseBody
    @RequestMapping(value = "/reader/delete/{id}", method = RequestMethod.POST)
    public String delete(@PathVariable Integer id, ModelMap modelMap){
        Boolean bool = readerService.delete(id);
        String mark = null;
        if (bool) {
            readerList = query();
            modelMap.addAttribute("readerList", readerList);
            mark = "s";
        } else {
            mark = "e";
        }
        return mark;
    }

    @RequestMapping(value = "/reader/update")
    public String update(Reader reader, ModelMap modelMap){
        Boolean bool = readerService.update(reader);
        if (bool) {
            readerList = query();
            modelMap.addAttribute("readerList", readerList);
            return "welcome";
        } else {
            modelMap.addAttribute("err", 2);
            return "updateReader";
        }


    }


    /**
     * 修改回显数据
     *
     * @return
     */
    @RequestMapping("{id}/getReader")
    public String getDepart(@PathVariable Integer id, ModelMap modelMap) {
        readerList = readerService.getData(id);
        modelMap.addAttribute("readerList", readerList);
        return "updateReader";
    }



}
