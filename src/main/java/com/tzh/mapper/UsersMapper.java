package com.tzh.mapper;

import com.tzh.entity.Users;
import com.tzh.utils.PageUtils;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface UsersMapper {

    /**
     * 查询总条数
     * @return Integer
     */
    Integer getCount(PageUtils<Users> page);//@Param指定的是别名


    /**
     * 分页的形式查询user表的数据
     * @return List<User>
     */
    List<Users> query(PageUtils<Users> page);
}
