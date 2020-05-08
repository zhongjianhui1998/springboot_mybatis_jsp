package com.tzh.service.imp;

import com.tzh.entity.Users;
import com.tzh.mapper.UsersMapper;
import com.tzh.service.UsersService;
import com.tzh.utils.PageUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author tangzihao
 * @date 05-04
 */
@Service
public class UsersImplem implements UsersService {

    @Autowired
    private UsersMapper usersMapper;

    @Override
    public void query(PageUtils<Users> page) {
        page.setTotalCount(usersMapper.getCount(page));//查询总条数加入page中
        List<Users> list = usersMapper.query(page);//分页查询的数据
        page.setDataList(list);
    }
}
