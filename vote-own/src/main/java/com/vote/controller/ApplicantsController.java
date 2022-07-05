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
import com.vote.domain.Applicants;
import com.vote.service.IApplicantsService;
import com.vote.common.core.controller.BaseController;
import com.vote.common.core.domain.AjaxResult;
import com.vote.common.utils.poi.ExcelUtil;
import com.vote.common.core.page.TableDataInfo;

/**
 * 曲目信息Controller
 * 
 * @author ruoyi
 * @date 2022-07-05
 */
@Controller
@RequestMapping("/vote-own/applicants")
public class ApplicantsController extends BaseController
{
    private String prefix = "vote-own/applicants";

    @Autowired
    private IApplicantsService applicantsService;

    @RequiresPermissions("vote-own:applicants:view")
    @GetMapping()
    public String applicants()
    {
        return prefix + "/applicants";
    }

    /**
     * 查询曲目信息列表
     */
    @RequiresPermissions("vote-own:applicants:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(Applicants applicants)
    {
        startPage();
        List<Applicants> list = applicantsService.selectApplicantsList(applicants);
        return getDataTable(list);
    }

    /**
     * 导出曲目信息列表
     */
    @RequiresPermissions("vote-own:applicants:export")
    @Log(title = "曲目信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(Applicants applicants)
    {
        List<Applicants> list = applicantsService.selectApplicantsList(applicants);
        ExcelUtil<Applicants> util = new ExcelUtil<Applicants>(Applicants.class);
        return util.exportExcel(list, "曲目信息数据");
    }

    /**
     * 新增曲目信息
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存曲目信息
     */
    @RequiresPermissions("vote-own:applicants:add")
    @Log(title = "曲目信息", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(Applicants applicants)
    {
        return toAjax(applicantsService.insertApplicants(applicants));
    }

    /**
     * 修改曲目信息
     */
    @RequiresPermissions("vote-own:applicants:edit")
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Integer id, ModelMap mmap)
    {
        Applicants applicants = applicantsService.selectApplicantsById(id);
        mmap.put("applicants", applicants);
        return prefix + "/edit";
    }

    /**
     * 修改保存曲目信息
     */
    @RequiresPermissions("vote-own:applicants:edit")
    @Log(title = "曲目信息", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(Applicants applicants)
    {
        return toAjax(applicantsService.updateApplicants(applicants));
    }

    /**
     * 删除曲目信息
     */
    @RequiresPermissions("vote-own:applicants:remove")
    @Log(title = "曲目信息", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(applicantsService.deleteApplicantsByIds(ids));
    }
}
