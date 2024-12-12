package service.dao;

import model.TScore;

import java.util.List;

public interface ScoreService {
    public boolean addScore(TScore score);

    public boolean modifyScore(TScore score);

    public boolean deleteScore(int scoreid);

    public TScore findScoreByid(int scoreid);

    public List<TScore> findScore(TScore score);
}
