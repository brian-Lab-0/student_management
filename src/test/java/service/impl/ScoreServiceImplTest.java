package service.impl;

import model.TScore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;

import static org.junit.Assert.*;

@RunWith(SpringRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class ScoreServiceImplTest {

    @Autowired
    private ScoreServiceImpl scoreService;

    @Test
    public void addScore() {
        TScore score = new TScore();
        score.setTerm("");
        score.setScore(85.0);
        score.setClassid("eerg");
        score.setClassname("cst");
        score.setStudentid("ergreg");
        score.setStudentname("rey");
        score.setCourseid("uyg");
        score.setCoursenanme("Java");

        boolean row = scoreService.addScore(score);
        System.out.println(row);

    }

    @Test
    public void modifyScore() {
        TScore score = new TScore();

        score.setScoreid(2);
        score.setTerm("2021-2022-1");
        score.setScore(79.5);
        score.setClassid("21080101");
        score.setClassname("2018 cst 1 class");
        score.setStudentid("21080752041");
        score.setStudentname("Athanas Sanga");
        score.setCourseid("08XCYYJC0001");
        score.setCoursenanme("Fundamentals of programming Language");

        boolean row = scoreService.modifyScore(score);
        System.out.println(row);
    }

    @Test
    public void deleteScore() {
        boolean key = scoreService.deleteScore(1);
        System.out.println(key);
    }

    @Test
    public void findScoreByid() {
        TScore score = scoreService.findScoreByid(1);
        System.out.println(score);
    }

    @Test
    public void findScore() {
        TScore score = new TScore();
        score.setStudentname("Athanas");
        score.setCoursenanme("Fundamentals");
        score.setClassname("cst");

        List<TScore> list =scoreService.findScore(score);

        for(TScore tScore: list){
            System.out.println(tScore);
        }


    }
}