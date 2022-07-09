package com.vote.controller;

import java.util.List;

import com.vote.domain.Match;
import com.vote.service.IMatchService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import com.vote.common.annotation.Log;
import com.vote.common.enums.BusinessType;
import com.vote.domain.MatchSession;
import com.vote.service.IMatchSessionService;
import com.vote.common.core.controller.BaseController;
import com.vote.common.core.domain.AjaxResult;
import com.vote.common.utils.poi.ExcelUtil;
import com.vote.common.core.page.TableDataInfo;

/**
 * 比赛场次Controller
 * 
 * @author ruoyi
 * @date 2022-07-05
 */
@Controller
@RequestMapping("/vote-own/match_session")
public class MatchSessionController extends BaseController
{
    private String prefix = "vote-own/match_session";

    @Autowired
    private IMatchSessionService matchSessionService;

    @Autowired
    private IMatchService matchService;

    @RequiresPermissions("vote-own:match_session:view")
    @GetMapping()
    public String match_session(ModelMap map)
    {
        List<Match> matches = matchService.selectMatchList(new Match());
        map.put("matches",matches);
        return prefix + "/match_session";
    }

    /**
     * 查询比赛场次列表
     */
    @RequiresPermissions("vote-own:match_session:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(MatchSession matchSession)
    {
        startPage();
        List<MatchSession> list = matchSessionService.selectMatchSessionList(matchSession);
        return getDataTable(list);
    }

    /**
     * 导出比赛场次列表
     */
    @RequiresPermissions("vote-own:match_session:export")
    @Log(title = "比赛场次", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(MatchSession matchSession)
    {
        List<MatchSession> list = matchSessionService.selectMatchSessionList(matchSession);
        ExcelUtil<MatchSession> util = new ExcelUtil<MatchSession>(MatchSession.class);
        return util.exportExcel(list, "比赛场次数据");
    }

    /**
     * 新增比赛场次
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存比赛场次
     */
    @RequiresPermissions("vote-own:match_session:add")
    @Log(title = "比赛场次", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(MatchSession matchSession)
    {
        return toAjax(matchSessionService.insertMatchSession(matchSession));
    }

    /**
     * 修改比赛场次
     */
    @RequiresPermissions("vote-own:match_session:edit")
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Integer id, ModelMap mmap)
    {
        MatchSession matchSession = matchSessionService.selectMatchSessionById(id);
        mmap.put("matchSession", matchSession);
        return prefix + "/edit";
    }

    /**
     * 修改保存比赛场次
     */
    @RequiresPermissions("vote-own:match_session:edit")
    @Log(title = "比赛场次", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(MatchSession matchSession)
    {
        return toAjax(matchSessionService.updateMatchSession(matchSession));
    }

    /**
     * 删除比赛场次
     */
    @RequiresPermissions("vote-own:match_session:remove")
    @Log(title = "比赛场次", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(matchSessionService.deleteMatchSessionByIds(ids));
    }


    /**
     * 自动分配场次    根据比赛id ,赛程
     * @param matchId
     * @param raceSchedule
     * @return
     */
    @PostMapping("/autoDistribute")
    @ResponseBody
    public AjaxResult autoDistribute(@RequestParam("matchId") Integer matchId,@RequestParam("raceSchedule")Integer raceSchedule){
        System.out.println("MatchId:" + matchId);
        System.out.println("rachSchedule:" + raceSchedule);
        return toAjax(matchSessionService.autoDistribute(matchId,raceSchedule));
    }
}
