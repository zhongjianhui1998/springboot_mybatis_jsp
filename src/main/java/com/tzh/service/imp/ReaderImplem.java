package com.tzh.service.imp;

import com.tzh.dao.ReaderDao;
import com.tzh.entity.Reader;
import com.tzh.service.ReaderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ReaderImplem implements ReaderService<Reader> {


    @Autowired
    private ReaderDao readerDao;

    @Override
    public List<Reader> query() {
        return readerDao.query();
    }

    @Override
    public Boolean add(Reader reader) {
        try {
            readerDao.add(reader);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public Boolean delete(Integer id) {
        try {
            readerDao.delete(id);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public Boolean update(Reader reader) {
            readerDao.update(reader);
            return true;
    }

    @Override
    public List<Reader> getData(Integer id) {
        return readerDao.getData(id);
    }
}
