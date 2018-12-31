package com.operatingSystem.dao;

import com.operatingSystem.model.Picture;

import java.util.List;

public interface PictureMapper {
    public List<Picture> getAllPictures();
    public Picture getPictureById(String id);
    public List<Picture> getPictureByPicturename(String picturename);


}
