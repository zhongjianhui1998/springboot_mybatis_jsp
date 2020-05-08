package com.tzh.service;

import java.util.List;

public interface ReaderService<T> {

    List<T>  query();


    Boolean add(T t);


    Boolean delete(Integer id);

    Boolean update(T t);

    public List<T> getData(Integer id);



}
