package com.tzh.mapper;

import com.tzh.entity.Reader;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ReaderMapper {

     void add(Reader reader);

     List<Reader> query();

     void delete(Integer id);

     void update(Reader reader);

     List<Reader> getReaderData(Integer id);


}
