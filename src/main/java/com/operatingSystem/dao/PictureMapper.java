package com.operatingSystem.dao;

import com.operatingSystem.model.Picture;

import java.util.List;

public interface PictureMapper {
    public List<Picture> getAllPictures();
    public List<Picture> searchPicturesByKeyword(String keyword);
    public Picture getPictureById(String id);
    public List<Picture> getPictureByPicturename(String picturename);
    public int insertOnePicture(Picture picture);
    public int deletePictureById(String id);
}
