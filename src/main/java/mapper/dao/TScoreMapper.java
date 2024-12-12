package mapper.dao;

import model.TScore;

import java.util.List;

public interface TScoreMapper {
    int deleteByPrimaryKey(Integer scoreid);

    int insert(TScore record);

    int insertSelective(TScore record);

    TScore selectByPrimaryKey(Integer scoreid);

    List<TScore> selectBySelective(TScore record);

    int updateByPrimaryKeySelective(TScore record);

    int updateByPrimaryKey(TScore record);
}