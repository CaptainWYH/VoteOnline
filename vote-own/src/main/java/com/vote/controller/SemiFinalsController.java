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
import com.vote.domain.SemiFinals;
import com.vote.service.ISemiFinalsService;
import com.vote.common.core.controller.BaseController;
import com.vote.common.core.domain.AjaxResult;
import com.vote.common.utils.poi.ExcelUtil;
import com.vote.common.core.page.TableDataInfo;

/**
 * 复赛管理Controller
 * 
 * @author 魏渝辉
 * @date 2022-07-05
 */
@Controller
@RequestMapping("/vote-own/finals")
public class SemiFinalsController extends BaseController
{
    private String prefix = "vote-own/finals";

    @Autowired
    private ISemiFinalsService semiFinalsService;

    @RequiresPermissions("vote-own:finals:view")
    @GetMapping()
    public String finals()
    {
        return prefix + "/finals";
    }

    /**
     * 查询复赛管理列表
     */
    @RequiresPermissions("vote-own:finals:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(SemiFinals semiFinals)
    {
        startPage();
        List<SemiFinals> list = semiFinalsService.selectSemiFinalsList(semiFinals);
        return getDataTable(list);
    }

    /**
     * 导出复赛管理列表
     */
    @RequiresPermissions("vote-own:finals:export")
    @Log(title = "复赛管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(SemiFinals semiFinals)
    {
        List<SemiFinals> list = semiFinalsService.selectSemiFinalsList(semiFinals);
        ExcelUtil<SemiFinals> util = new ExcelUtil<SemiFinals>(SemiFinals.class);
        return util.exportExcel(list, "复赛管理数据");
    }

    /**
     * 新增复赛管理
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存复赛管理
     */
    @RequiresPermissions("vote-own:finals:add")
    @Log(title = "复赛管理", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(SemiFinals semiFinals)
    {
        return toAjax(semiFinalsService.insertSemiFinals(semiFinals));
    }

    /**
     * 修改复赛管理
     */
    @RequiresPermissions("vote-own:finals:edit")
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Integer id, ModelMap mmap)
    {
        SemiFinals semiFinals = semiFinalsService.selectSemiFinalsById(id);
        mmap.put("semiFinals", semiFinals);
        return prefix + "/edit";
    }

    /**
     * 修改保存复赛管理
     */
    @RequiresPermissions("vote-own:finals:edit")
    @Log(title = "复赛管理", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(SemiFinals semiFinals)
    {
        return toAjax(semiFinalsService.updateSemiFinals(semiFinals));
    }

    /**
     * 删除复赛管理
     */
    @RequiresPermissions("vote-own:finals:remove")
    @Log(title = "复赛管理", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(semiFinalsService.deleteSemiFinalsByIds(ids));
    }
}
