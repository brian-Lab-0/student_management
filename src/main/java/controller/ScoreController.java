package controller;

import com.alibaba.fastjson.JSON;
import model.TScore;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import service.dao.ScoreService;
import util.LayuiTableData;
import util.ResponseJSON;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.Writer;
import java.util.List;

@Controller
@RequestMapping(value = "score")
public class ScoreController {

    @Autowired
    private ScoreService scoreService;

    @RequestMapping("/scoreview")
    public void scoreView(TScore score, HttpServletResponse response) throws IOException {
        response.setContentType("application/json");
        List<TScore> list = scoreService.findScore(score);

        LayuiTableData table = new LayuiTableData();
        if(list.size() > 0){
            table.code = LayuiTableData.FLAG_SUCC;
            table.msg = "Query successfully!";
            table.data = list;
            table.count = list.size();
        }else {
            table.code = LayuiTableData.FLAG_FAIL;
            table.msg = "Query Failed!";
            table.data = list;
            table.count = 0;
        }
        Writer w = response.getWriter();
        w.write(JSON.toJSONString(table));

        w.flush();
        w.close();
    }

    @RequestMapping(value="/addscore")
    public void addScore(@RequestBody TScore score, HttpServletRequest req, HttpServletResponse resp) throws IOException {
        resp.setContentType("application/json");
        Writer writer = resp.getWriter();
        ResponseJSON respJson = new ResponseJSON();

        boolean result = scoreService.addScore(score);
        if (result) {
            respJson.status = ResponseJSON.FLAG_SUCC;
            respJson.msg = "New score save successed!";
        } else {
            respJson.status = ResponseJSON.FLAG_FAIL;
            respJson.msg = "New score save failed!";
        }

        writer.write(JSON.toJSONString(respJson));
        writer.flush();
        writer.close();
    }

    @RequestMapping(value="/findscore")
    public void findScoreById(int scoreid, HttpServletRequest req, HttpServletResponse resp) throws IOException {

        resp.setContentType("application/json");
        Writer writer = resp.getWriter();
        ResponseJSON respJson = new ResponseJSON();
        if(scoreid==0){
            respJson.status = ResponseJSON.FLAG_FAIL;
            respJson.msg = "No provide score id.";
        }else {
            TScore score = scoreService.findScoreByid(scoreid);
            if(score!=null){
                respJson.status = ResponseJSON.FLAG_SUCC;
                respJson.msg = "find a score successed.";
                respJson.result = score;
            }else {
                respJson.status = ResponseJSON.FLAG_FAIL;
                respJson.msg = "here is no data corresponding to ID.";
            }
        }
        writer.write(JSON.toJSONString(respJson));
        writer.flush();
        writer.close();
    }

    @RequestMapping(value="/modifyscore")
    public void modifyScore(@RequestBody TScore score, HttpServletRequest req, HttpServletResponse resp) throws IOException {

        resp.setContentType("application/json");
        Writer writer = resp.getWriter();
        ResponseJSON respJson = new ResponseJSON();

        //query score which you want to change
        TScore record = scoreService.findScoreByid(score.getScoreid());
        record.setTerm(score.getTerm());
        record.setClassname(score.getClassname());
        record.setScore(score.getScore());
        record.setCoursenanme(score.getCoursenanme());
        record.setStudentname(score.getStudentname());
        record.setCourseid(score.getCourseid());
        record.setStudentid(score.getStudentid());
        record.setClassid(score.getClassid());

        boolean result = scoreService.modifyScore(record);

        if (result) {
            respJson.status = ResponseJSON.FLAG_SUCC;
            respJson.msg = "Modify score successed!";
        } else {
            respJson.status = ResponseJSON.FLAG_FAIL;
            respJson.msg = "Modify score failed!";
        }

        writer.write(JSON.toJSONString(respJson));
        writer.flush();
        writer.close();
    }
    @RequestMapping(value="/deletescore")
    public void deleteScore(int scoreid, HttpServletRequest req, HttpServletResponse resp) throws IOException {

        resp.setContentType("application/json");
        Writer writer = resp.getWriter();
        ResponseJSON respJson = new ResponseJSON();

        //query score which you want to change
        boolean result = scoreService.deleteScore(scoreid);
        if (result) {
            respJson.status = ResponseJSON.FLAG_SUCC;
            respJson.msg = "Delete score successed!";
        } else {
            respJson.status = ResponseJSON.FLAG_FAIL;
            respJson.msg = "Delete score failed!";
        }

        writer.write(JSON.toJSONString(respJson));
        writer.flush();
        writer.close();
    }
}
