package com.vote.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.vote.service.IResultMatchService;
import com.vote.vo.MatchSessionsVO;
import com.vote.common.core.controller.BaseController;
import com.vote.common.core.page.TableDataInfo;
import com.vote.domain.Match;
import com.vote.domain.MatchSession;
import com.vote.service.IMatchService;
import com.vote.service.IMatchSessionService;
import com.vote.vo.ResultMatchVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Date;
import java.util.List;

/**
 * @author 魏渝辉
 * @Date:2022年07月07日 9:22
 * @Description:
 */


@Controller
public class PageController extends BaseController {

    private String prefix = "vote-own/";

    @Autowired
    private IMatchService matchService;

    @Autowired
    private IMatchSessionService matchSessionService;

    @Autowired
    private IResultMatchService resultMatchService;

    @GetMapping("/system/home/{pageNum}")
    public String home(@PathVariable("pageNum")Integer pageNum, ModelMap mmap)
    {
        Match match = new Match();
        PageHelper.startPage(pageNum,6);
        List<Match> list = matchService.selectMatchList(match);
        TableDataInfo dataTable = getDataTable(list);

        PageInfo<Match> page = new PageInfo<>(list,5);
        mmap.put("dataTable", dataTable);
        System.out.println("主页面"+dataTable);
        mmap.put("pages", page);
        mmap.put("winDate",new Date());
        List<Match> matches = matchService.selectMatchList(new Match());
        mmap.put("matches",matches);
        System.out.println("当前时间"+ new Date());
        System.out.println(page);
        return prefix + "UserHome";
    }

    /**
     *测试评委主页面
    **/
    @GetMapping("/jud/{pageNum}")
    public String judges(@PathVariable("pageNum")Integer pageNum, ModelMap mmap){
        Match match = new Match();
        PageHelper.startPage(pageNum,6);
        List<Match> list = matchService.selectMatchList(match);
        TableDataInfo dataTable = getDataTable(list);
        System.out.println(dataTable);
        PageInfo<Match> page = new PageInfo<>(list,5);
        mmap.put("dataTable", dataTable);
        mmap.put("pages", page);
        mmap.put("winDate",new Date());
        return prefix +"judges";
    }

    /**
     *测试评委打分详细界面
    **/
    @GetMapping("/scoPage/{pageNum}/{matchId}/{raceSchedule}")
    public String judgesScore(@PathVariable("pageNum")Integer pageNum,
                              @PathVariable("matchId")Integer matchId,
                              @PathVariable("raceSchedule")Integer raceSchedule,ModelMap map){
        MatchSession matchSession = new MatchSession();
        matchSession.setMatchId(matchId);
        matchSession.setRaceSchedule(raceSchedule);
        System.out.println("matchSession:" + matchSession);
        PageHelper.startPage(pageNum,1);
        List<MatchSessionsVO> matchSessionsVOS = matchSessionService.selectMatchSessions(matchSession);
        PageInfo<MatchSessionsVO> pages = new PageInfo<>(matchSessionsVOS,2);
        System.out.println(pages);
        if (pages.getTotal() > 0){
            map.put("pages",pages);
            map.put("matchId",matchId);
            map.put("raceSchedule",raceSchedule);
            return prefix +"judscore";
        }else{
            map.put("msg","暂时没有场次可投票/打分");
            return prefix +"voteNull";
        }
    }

    /**
     *测试观众投票详细界面
    **/
    @GetMapping("/votPage/{pageNum}/{matchId}/{raceSchedule}")
    public String audiencevote(@PathVariable("pageNum")Integer pageNum,
                               @PathVariable("matchId")Integer matchId,
                               @PathVariable("raceSchedule")Integer raceSchedule,ModelMap map){
        MatchSession matchSession = new MatchSession();
        matchSession.setMatchId(matchId);
        matchSession.setRaceSchedule(raceSchedule);
        System.out.println("matchSession:" + matchSession);
        PageHelper.startPage(pageNum,1);
        List<MatchSessionsVO> matchSessionsVOS = matchSessionService.selectMatchSessions(matchSession);
        PageInfo<MatchSessionsVO> pages = new PageInfo<>(matchSessionsVOS,2);
        System.out.println("pagesInfo:" + pages);
        if (pages.getTotal() > 0){
            map.put("pages",pages);
            map.put("matchId",matchId);
            map.put("raceSchedule",raceSchedule);
            return prefix +"audiencevote";
        }else{
            map.put("msg","暂时没有场次可投票/打分");
            return prefix +"voteNull";
        }
    }

    /**
     *测试比赛结果详细界面
     **/
    @GetMapping("/res/{matchId}/{raceSchedule}")
    public String competitionResults(@PathVariable("matchId") Integer matchId,
                                     @PathVariable("raceSchedule") Integer raceSchedule,
                                     @RequestParam String matchName,
                                     ModelMap map){
        List<ResultMatchVo> resultMatchVos = resultMatchService.selectResultMatchListByMatchIdAndRaceSchedule(matchId, raceSchedule);
        if (resultMatchVos.isEmpty()){
            map.put("msg","该比赛结果还未出来");
            return prefix +"voteNull";
        }else{
            map.put("result",resultMatchVos);
            map.put("matchName",raceSchedule == 1 ? matchName + "---初赛" : matchName + "---决赛");
            return prefix +"competitionResults";
        }

    }


}
