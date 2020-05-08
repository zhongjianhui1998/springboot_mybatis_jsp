package com.tzh.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.*;

import java.io.Serializable;

/**
 * @author tangzihao
 * @date 04-21
 */

@Setter
@Getter
@ToString
@NoArgsConstructor//无参构造
@AllArgsConstructor//有参构造
public class Users implements Serializable{
    private Integer id; //主键id

    private String username; //用户姓名

    private String account; //账号

    private String password; //密码

    private String sex; //用户性别

    private Integer age; //用户年龄

    private String phone; //联系电话

    private String mailbox; //邮箱

    private String address; //用户地址

    private String status; //账号状态


}
