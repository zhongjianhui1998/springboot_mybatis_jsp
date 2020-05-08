package com.tzh.dao;

import java.util.List;

public interface ReaderDao<T> {


    public void add(T t);

    List<T> query();

    public void delete(Integer id);

    public void update(T t);

    public List<T> getData(Integer id);

}
