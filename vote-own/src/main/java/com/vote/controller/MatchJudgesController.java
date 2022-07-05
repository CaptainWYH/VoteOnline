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
import com.vote.domain.MatchJudges;
import com.vote.service.IMatchJudgesService;
import com.vote.common.core.controller.BaseController;
import com.vote.common.core.domain.AjaxResult;
import com.vote.common.utils.poi.ExcelUtil;
import com.vote.common.core.page.TableDataInfo;

/**
 * 比赛评委中间表Controller
 * 
 * @author ruoyi
 * @date 2022-07-05
 */
@Controller
@RequestMapping("/vote-own/match_judges")
public class MatchJudgesController extends BaseController
{
    private String prefix = "vote-own/match_judges";

    @Autowired
    private IMatchJudgesService matchJudgesService;

    @RequiresPermissions("vote-own:match_judges:view")
    @GetMapping()
    public String match_judges()
    {
        return prefix + "/match_judges";
    }

    /**
     * 查询比赛评委中间表列表
     */
    @RequiresPermissions("vote-own:match_judges:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(MatchJudges matchJudges)
    {
        startPage();
        List<MatchJudges> list = matchJudgesService.selectMatchJudgesList(matchJudges);
        return getDataTable(list);
    }

    /**
     * 导出比赛评委中间表列表
     */
    @RequiresPermissions("vote-own:match_judges:export")
    @Log(title = "比赛评委中间表", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(MatchJudges matchJudges)
    {
        List<MatchJudges> list = matchJudgesService.selectMatchJudgesList(matchJudges);
        ExcelUtil<MatchJudges> util = new ExcelUtil<MatchJudges>(MatchJudges.class);
        return util.exportExcel(list, "比赛评委中间表数据");
    }

    /**
     * 新增比赛评委中间表
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存比赛评委中间表
     */
    @RequiresPermissions("vote-own:match_judges:add")
    @Log(title = "比赛评委中间表", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(MatchJudges matchJudges)
    {
        return toAjax(matchJudgesService.insertMatchJudges(matchJudges));
    }

    /**
     * 修改比赛评委中间表
     */
    @RequiresPermissions("vote-own:match_judges:edit")
    @GetMapping("/edit/{matchId}")
    public String edit(@PathVariable("matchId") Integer matchId, ModelMap mmap)
    {
        MatchJudges matchJudges = matchJudgesService.selectMatchJudgesByMatchId(matchId);
        mmap.put("matchJudges", matchJudges);
        return prefix + "/edit";
    }

    /**
     * 修改保存比赛评委中间表
     */
    @RequiresPermissions("vote-own:match_judges:edit")
    @Log(title = "比赛评委中间表", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(MatchJudges matchJudges)
    {
        return toAjax(matchJudgesService.updateMatchJudges(matchJudges));
    }

    /**
     * 删除比赛评委中间表
     */
    @RequiresPermissions("vote-own:match_judges:remove")
    @Log(title = "比赛评委中间表", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(matchJudgesService.deleteMatchJudgesByMatchIds(ids));
    }
}
