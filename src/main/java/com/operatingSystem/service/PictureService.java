package com.operatingSystem.service;

import com.operatingSystem.model.Picture;

import java.util.List;

public interface PictureService {
    public List<Picture> getAllPictures() throws Exception;
    public Picture getPictureById(String id) throws Exception;
    public List<Picture> getPictureByPicturename(String picturename) throws Exception;
    public int insertOnePicture(Picture picture) throws Exception;
    public int deletePictureById(String id) throws Exception;
}
