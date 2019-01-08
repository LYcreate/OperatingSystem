package com.operatingSystem.service.impl;

import com.operatingSystem.dao.PictureMapper;
import com.operatingSystem.model.Picture;
import com.operatingSystem.service.PictureService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import java.util.List;
//
@Service
public class PictureServiceImpl implements PictureService {

    @Autowired
    private PictureMapper pictureMapper;

    @Override
    public Picture getPictureById(String id) throws Exception{
        return pictureMapper.getPictureById(id);
    }

    @Override
    public List<Picture> getPictureByPicturename(String picturename) throws Exception{
        return pictureMapper.getPictureByPicturename(picturename);
    }

    @Override
    public List<Picture> getAllPictures() throws Exception{
        return pictureMapper.getAllPictures();
    }

    @Override
    public int insertOnePicture(Picture picture) throws Exception{
        return pictureMapper.insertOnePicture(picture);
    }

    @Override
    public int deletePictureById(String id) throws Exception{
        return pictureMapper.deletePictureById(id);
    }
}
