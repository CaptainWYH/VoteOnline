package com.vote.controller;

import java.util.List;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.vote.common.annotation.Log;
import com.vote.common.enums.BusinessType;
import com.vote.domain.Match;
import com.vote.service.IMatchService;
import com.vote.common.core.controller.BaseController;
import com.vote.common.core.domain.AjaxResult;
import com.vote.common.utils.poi.ExcelUtil;
import com.vote.common.core.page.TableDataInfo;

/**
 * 比赛信息Controller
 * 
 * @author ruoyi
 * @date 2022-07-05
 */
@Controller
@RequestMapping("/vote-own/match")
public class MatchController extends BaseController
{
    private String prefix = "vote-own/match";

    @Autowired
    private IMatchService matchService;

    @RequiresPermissions("vote-own:match:view")
    @GetMapping()
    public String match()
    {
        return prefix + "/match";
    }

    /**
     * 查询比赛信息列表
     */
    @RequiresPermissions("vote-own:match:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(Match match)
    {
        startPage();
        List<Match> list = matchService.selectMatchList(match);
        System.out.println(list);
        return getDataTable(list);
    }

    /**
     * 导出比赛信息列表
     */
    @RequiresPermissions("vote-own:match:export")
    @Log(title = "比赛信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(Match match)
    {
        List<Match> list = matchService.selectMatchList(match);
        ExcelUtil<Match> util = new ExcelUtil<Match>(Match.class);
        return util.exportExcel(list, "比赛信息数据");
    }

    /**
     * 新增比赛信息
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存比赛信息
     */
    @RequiresPermissions("vote-own:match:add")
    @Log(title = "比赛信息", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(Match match)
    {
        return toAjax(matchService.insertMatch(match));
    }

    /**
     * 修改比赛信息
     */
    @RequiresPermissions("vote-own:match:edit")
    @GetMapping("/edit/{matchId}")
    public String edit(@PathVariable("matchId") Integer matchId, ModelMap mmap)
    {
        Match match = matchService.selectMatchByMatchId(matchId);
        mmap.put("match", match);
        return prefix + "/edit";
    }

    /**
     * 修改保存比赛信息
     */
    @RequiresPermissions("vote-own:match:edit")
    @Log(title = "比赛信息", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(Match match)
    {
        return toAjax(matchService.updateMatch(match));
    }

    /**
     * 删除比赛信息
     */
    @RequiresPermissions("vote-own:match:remove")
    @Log(title = "比赛信息", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(matchService.deleteMatchByMatchIds(ids));
    }


    /**
     * 不需要权限查询所有比赛
     * @param match
     * @return
     */
    @PostMapping("/app/list")
    @ResponseBody
    public TableDataInfo lists(Match match)
    {
        startPage();
        List<Match> list = matchService.selectMatchList(match);
        System.out.println(list);
        return getDataTable(list);
    }
}
