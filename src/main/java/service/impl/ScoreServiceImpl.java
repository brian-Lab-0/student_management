package service.impl;

import mapper.impl.TScoreMapperImpl;
import model.TScore;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import service.dao.ScoreService;

import java.util.List;

@Service("scoreService")
public class ScoreServiceImpl implements ScoreService {

    @Autowired
    private TScoreMapperImpl scoreMapper;

    @Override
    public boolean addScore(TScore score) {
        int key = scoreMapper.insertSelective(score);
        if(key>0) {
            return true;
        }
        else {
            return false;
        }
    }

    @Override
    public boolean modifyScore(TScore score) {
        int row = scoreMapper.updateByPrimaryKeySelective(score);
        if(row>0) {
            return true;
        }
        else {
            return false;
        }
    }

    @Override
    public boolean deleteScore(int scoreid) {
        int row = scoreMapper.deleteByPrimaryKey(scoreid);
        if(row>0) {
            return true;
        }
        else {
            return false;
        }
    }

    @Override
    public TScore findScoreByid(int scoreid) {
        return scoreMapper.selectByPrimaryKey(scoreid);
    }

    @Override
    public List<TScore> findScore(TScore score) {
        return scoreMapper.selectBySelective(score);
    }
}
