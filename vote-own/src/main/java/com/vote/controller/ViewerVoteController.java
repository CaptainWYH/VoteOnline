package com.vote.controller;

import java.util.List;

import com.vote.domain.ViewerVote;
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
import com.vote.service.IViewerVoteService;
import com.vote.common.core.controller.BaseController;
import com.vote.common.core.domain.AjaxResult;
import com.vote.common.utils.poi.ExcelUtil;
import com.vote.common.core.page.TableDataInfo;

/**
 * 观众投票管理Controller
 * 
 * @author 魏渝辉
 * @date 2022-07-05
 */
@Controller
@RequestMapping("/vote-own/vote")
public class ViewerVoteController extends BaseController
{
    private String prefix = "vote-own/vote";

    @Autowired
    private IViewerVoteService viewerVoteService;

    @RequiresPermissions("vote-own:vote:view")
    @GetMapping()
    public String vote()
    {
        return prefix + "/vote";
    }

    /**
     * 查询观众投票管理列表
     */
    @RequiresPermissions("vote-own:vote:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(ViewerVote viewerVote)
    {
        startPage();
        List<ViewerVote> list = viewerVoteService.selectViewerVoteList(viewerVote);
        return getDataTable(list);
    }

    /**
     * 导出观众投票管理列表
     */
    @RequiresPermissions("vote-own:vote:export")
    @Log(title = "观众投票管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(ViewerVote viewerVote)
    {
        List<ViewerVote> list = viewerVoteService.selectViewerVoteList(viewerVote);
        ExcelUtil<ViewerVote> util = new ExcelUtil<ViewerVote>(ViewerVote.class);
        return util.exportExcel(list, "观众投票管理数据");
    }

    /**
     * 新增观众投票管理
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存观众投票管理
     */
    @RequiresPermissions("vote-own:vote:add")
    @Log(title = "观众投票管理", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(ViewerVote viewerVote)
    {
        return toAjax(viewerVoteService.insertViewerVote(viewerVote));
    }

    /**
     * 修改观众投票管理
     */
    @RequiresPermissions("vote-own:vote:edit")
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Integer id, ModelMap mmap)
    {
        ViewerVote viewerVote = viewerVoteService.selectViewerVoteById(id);
        mmap.put("viewerVote", viewerVote);
        return prefix + "/edit";
    }

    /**
     * 修改保存观众投票管理
     */
    @RequiresPermissions("vote-own:vote:edit")
    @Log(title = "观众投票管理", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(ViewerVote viewerVote)
    {
        return toAjax(viewerVoteService.updateViewerVote(viewerVote));
    }

    /**
     * 删除观众投票管理
     */
    @RequiresPermissions("vote-own:vote:remove")
    @Log(title = "观众投票管理", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(viewerVoteService.deleteViewerVoteByIds(ids));
    }
}
