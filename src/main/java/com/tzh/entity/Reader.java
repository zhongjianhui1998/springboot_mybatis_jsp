package com.tzh.entity;

import lombok.Data;

import java.io.Serializable;

@Data
public class Reader implements Serializable {
    private Integer id;
    private String reader;
}
