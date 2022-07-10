package com.vote.controller;

import java.util.List;

import com.vote.domain.Match;
import com.vote.service.IMatchService;
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
import com.vote.domain.ResultMatch;
import com.vote.service.IResultMatchService;
import com.vote.common.core.controller.BaseController;
import com.vote.common.core.domain.AjaxResult;
import com.vote.common.utils.poi.ExcelUtil;
import com.vote.common.core.page.TableDataInfo;

/**
 * 比赛结果Controller
 * 
 * @author 魏渝辉
 * @date 2022-07-05
 */
@Controller
@RequestMapping("/vote-own/result_match")
public class ResultMatchController extends BaseController
{
    private String prefix = "vote-own/result_match";

    @Autowired
    private IResultMatchService resultMatchService;

    @Autowired
    private IMatchService matchService;

    @RequiresPermissions("vote-own:result_match:view")
    @GetMapping()
    public String result_match(ModelMap map)
    {
        List<Match> matches = matchService.selectMatchList(new Match());
        map.put("matches",matches);
        return prefix + "/result_match";
    }

    /**
     * 查询比赛结果列表
     */
    @RequiresPermissions("vote-own:result_match:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(ResultMatch resultMatch)
    {
        startPage();
        List<ResultMatch> list = resultMatchService.selectResultMatchList(resultMatch);
        return getDataTable(list);
    }

    /**
     * 导出比赛结果列表
     */
    @RequiresPermissions("vote-own:result_match:export")
    @Log(title = "比赛结果", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(ResultMatch resultMatch)
    {
        List<ResultMatch> list = resultMatchService.selectResultMatchList(resultMatch);
        ExcelUtil<ResultMatch> util = new ExcelUtil<ResultMatch>(ResultMatch.class);
        return util.exportExcel(list, "比赛结果数据");
    }

    /**
     * 新增比赛结果
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存比赛结果
     */
    @RequiresPermissions("vote-own:result_match:add")
    @Log(title = "比赛结果", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(ResultMatch resultMatch)
    {
        return toAjax(resultMatchService.insertResultMatch(resultMatch));
    }

    /**
     * 修改比赛结果
     */
    @RequiresPermissions("vote-own:result_match:edit")
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Integer id, ModelMap mmap)
    {
        ResultMatch resultMatch = resultMatchService.selectResultMatchById(id);
        mmap.put("resultMatch", resultMatch);
        return prefix + "/edit";
    }

    /**
     * 修改保存比赛结果
     */
    @RequiresPermissions("vote-own:result_match:edit")
    @Log(title = "比赛结果", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(ResultMatch resultMatch)
    {
        return toAjax(resultMatchService.updateResultMatch(resultMatch));
    }

    /**
     * 删除比赛结果
     */
    @RequiresPermissions("vote-own:result_match:remove")
    @Log(title = "比赛结果", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(resultMatchService.deleteResultMatchByIds(ids));
    }
}
