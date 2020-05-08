package com.tzh.dao.imp;

import com.tzh.dao.ReaderDao;
import com.tzh.entity.Reader;
import com.tzh.mapper.ReaderMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ReaderDaoImp implements ReaderDao<Reader> {

    @Autowired
    private ReaderMapper readerMapper;


    @Override
    public void add(Reader reader) {
        readerMapper.add(reader);
    }

    @Override
    public List<Reader> query() {
        List<Reader> readerList = readerMapper.query();
        return readerList;
    }

    @Override
    public void delete(Integer id) {
        readerMapper.delete(id);
    }

    @Override
    public void update(Reader reader) {
        readerMapper.update(reader);
    }

    @Override
    public List<Reader> getData(Integer id) {
        return readerMapper.getReaderData(id);
    }
}
