package com.vote.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.vote.MatchSessionsVO;
import com.vote.common.config.RuoYiConfig;
import com.vote.common.core.controller.BaseController;
import com.vote.common.core.page.TableDataInfo;
import com.vote.domain.Match;
import com.vote.domain.MatchSession;
import com.vote.service.IMatchService;
import com.vote.service.IMatchSessionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.List;

/**
 * @author 魏渝辉
 * @Date:2022年07月07日 9:22
 * @Description:
 */


@Controller
public class HomeController extends BaseController {

    private String prefix = "vote-own/";

    @Autowired
    private IMatchService matchService;

    @Autowired
    private IMatchSessionService matchSessionService;

    @GetMapping("/system/home/{pageNum}")
    public String home(@PathVariable("pageNum")Integer pageNum, ModelMap mmap)
    {
        Match match = new Match();
        PageHelper.startPage(pageNum,6);
        List<Match> list = matchService.selectMatchList(match);
        TableDataInfo dataTable = getDataTable(list);
        System.out.println(dataTable);
        PageInfo<Match> page = new PageInfo<>(list,5);
        mmap.put("dataTable", dataTable);
        mmap.put("pages", page);
        System.out.println(page);
        return prefix + "UserHome";
    }

    /**
     *测试评委主页面
    **/
    @GetMapping("/jud")
    public String judges(){
        return prefix +"judges";
    }

    /**
     *测试评委打分详细界面
    **/
    @GetMapping("/scoPage")
    public String judgesScore(){
        return prefix +"judscore";
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
        System.out.println(pages);
        map.put("pages",pages);
        map.put("matchId",matchId);
        map.put("raceSchedule",raceSchedule);
        return prefix +"audiencevote";
    }

    /**
     *测试比赛结果详细界面
     **/
    @GetMapping("/res")
    public String competitionResults(){
        return prefix +"competitionResults";
    }

}
