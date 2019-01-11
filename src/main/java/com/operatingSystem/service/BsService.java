package com.operatingSystem.service;

import com.operatingSystem.model.Bs;

import java.util.List;

public interface BsService {
    public List<Bs> getAllBs()throws Exception;
    public int insertONEBs(Bs bs)throws Exception;
    public int deleteBsByEquipid(String equipid)throws Exception;
}
