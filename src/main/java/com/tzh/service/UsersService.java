package com.tzh.service;

import com.tzh.entity.Users;
import com.tzh.utils.PageUtils;

public interface UsersService {



    void query(PageUtils<Users> page);



}
