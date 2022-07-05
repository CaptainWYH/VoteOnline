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
import com.vote.domain.JudgesPoints;
import com.vote.service.IJudgesPointsService;
import com.vote.common.core.controller.BaseController;
import com.vote.common.core.domain.AjaxResult;
import com.vote.common.utils.poi.ExcelUtil;
import com.vote.common.core.page.TableDataInfo;

/**
 * 评委打分Controller
 * 
 * @author ruoyi
 * @date 2022-07-05
 */
@Controller
@RequestMapping("/vote-own/points")
public class JudgesPointsController extends BaseController
{
    private String prefix = "vote-own/points";

    @Autowired
    private IJudgesPointsService judgesPointsService;

    @RequiresPermissions("vote-own:points:view")
    @GetMapping()
    public String points()
    {
        return prefix + "/points";
    }

    /**
     * 查询评委打分列表
     */
    @RequiresPermissions("vote-own:points:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(JudgesPoints judgesPoints)
    {
        startPage();
        List<JudgesPoints> list = judgesPointsService.selectJudgesPointsList(judgesPoints);
        return getDataTable(list);
    }

    /**
     * 导出评委打分列表
     */
    @RequiresPermissions("vote-own:points:export")
    @Log(title = "评委打分", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(JudgesPoints judgesPoints)
    {
        List<JudgesPoints> list = judgesPointsService.selectJudgesPointsList(judgesPoints);
        ExcelUtil<JudgesPoints> util = new ExcelUtil<JudgesPoints>(JudgesPoints.class);
        return util.exportExcel(list, "评委打分数据");
    }

    /**
     * 新增评委打分
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存评委打分
     */
    @RequiresPermissions("vote-own:points:add")
    @Log(title = "评委打分", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(JudgesPoints judgesPoints)
    {
        return toAjax(judgesPointsService.insertJudgesPoints(judgesPoints));
    }

    /**
     * 修改评委打分
     */
    @RequiresPermissions("vote-own:points:edit")
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Integer id, ModelMap mmap)
    {
        JudgesPoints judgesPoints = judgesPointsService.selectJudgesPointsById(id);
        mmap.put("judgesPoints", judgesPoints);
        return prefix + "/edit";
    }

    /**
     * 修改保存评委打分
     */
    @RequiresPermissions("vote-own:points:edit")
    @Log(title = "评委打分", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(JudgesPoints judgesPoints)
    {
        return toAjax(judgesPointsService.updateJudgesPoints(judgesPoints));
    }

    /**
     * 删除评委打分
     */
    @RequiresPermissions("vote-own:points:remove")
    @Log(title = "评委打分", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(judgesPointsService.deleteJudgesPointsByIds(ids));
    }
}
