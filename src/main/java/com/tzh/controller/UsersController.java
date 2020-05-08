package com.tzh.controller;

import com.tzh.entity.Users;
import com.tzh.service.UsersService;
import com.tzh.utils.PageUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @author tangzihao
 * @date 05-04
 */


@Controller
public class UsersController {



    @Autowired
    private UsersService usersService;



    @RequestMapping(value = "/toUsers")
    public String toWelcome(){
        return "users";
    }


    /**
     * @author:        tangzihao
     * @methodName：   query
     * @param:         [user, page]
     * @return         com.yr.entity.Page<com.tzh.entity.Users>
     * @version:       1.0
     * 分页的形式查询user表的数据
     */
    @RequestMapping(value="/users")
    @ResponseBody
    public PageUtils<Users> query(Users users ,PageUtils<Users> pageUtils){
        pageUtils.setT(users);
        usersService.query(pageUtils);
//        System.out.println(pageUtils.toString());
        return pageUtils;
    }





}
