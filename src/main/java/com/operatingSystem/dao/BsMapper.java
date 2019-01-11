package com.operatingSystem.dao;

import com.operatingSystem.model.Bs;

import java.util.List;

public interface BsMapper {
    public List<Bs> getAllBs();
    public int insertOneBs(Bs bs);
    public int deleteBsByEquipid(String equipid);
}
