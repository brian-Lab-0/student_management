package mapper.impl;

import mapper.dao.TScoreMapper;
import model.TScore;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TScoreMapperImpl implements TScoreMapper {

    private SqlSession session = null;

    @Autowired
    private SqlSessionFactory sqlSessionFactory;

    @Override
    public int deleteByPrimaryKey(Integer scoreid) {
        session = sqlSessionFactory.openSession();
        int row = session.delete("mapper.dao.TScoreMapper.deleteByPrimaryKey",scoreid);
        session.commit();
        session.close();
        return  row;
    }

    @Override
    public int insert(TScore record) {
        return 0;
    }

    @Override
    public int insertSelective(TScore record) {
        session = sqlSessionFactory.openSession();
        int row = session.insert("mapper.dao.TScoreMapper.insertSelective",record);
        session.commit();
        session.close();
        return  row;
    }

    @Override
    public TScore selectByPrimaryKey(Integer scoreid) {
        session = sqlSessionFactory.openSession();
        TScore score = session.selectOne("mapper.dao.TScoreMapper.selectByPrimaryKey",scoreid);
        session.commit();
        session.close();
        return  score;
    }

    @Override
    public List<TScore> selectBySelective(TScore record) {
        session = sqlSessionFactory.openSession();
        List<TScore> list = session.selectList("mapper.dao.TScoreMapper.selectBySelective",record);
        session.close();
        return list;
    }

    @Override
    public int updateByPrimaryKeySelective(TScore record) {
        session = sqlSessionFactory.openSession();
        int row = session.update("mapper.dao.TScoreMapper.updateByPrimaryKeySelective",record);
        session.commit();
        session.close();
        return row;
    }

    @Override
    public int updateByPrimaryKey(TScore record) {
        session = sqlSessionFactory.openSession();
        int row = session.update("mapper.dao.TScoreMapper.updateByPrimaryKeySelective",record);
        session.commit();
        session.close();
        return row;
    }
}
