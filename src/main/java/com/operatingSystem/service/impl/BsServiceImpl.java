package com.operatingSystem.service.impl;

import com.operatingSystem.dao.BsMapper;
import com.operatingSystem.model.Bs;
import com.operatingSystem.service.BsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional
@Service
public class BsServiceImpl implements BsService {

    @Autowired
    public BsMapper bsMapper;

    @Override
    public List<Bs> getAllBs()throws Exception{
        return bsMapper.getAllBs();
    }
    @Override
    public int insertONEBs(Bs bs)throws Exception{
        return bsMapper.insertOneBs(bs);
    }

    @Override
    public int deleteBsByEquipid(String equipid)throws Exception{
        return bsMapper.deleteBsByEquipid(equipid);
    }
}
