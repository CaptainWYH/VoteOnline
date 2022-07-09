package com.vote.service;

import java.util.HashMap;
import java.util.List;

import com.vote.common.core.domain.AjaxResult;
import com.vote.domain.ViewerVote;

/**
 * 观众投票管理Service接口
 * 
 * @author 魏渝辉
 * @date 2022-07-05
 */
public interface IViewerVoteService 
{
    /**
     * 查询观众投票管理
     * 
     * @param id 观众投票管理主键
     * @return 观众投票管理
     */
    public ViewerVote selectViewerVoteById(Integer id);

    /**
     * 查询观众投票管理列表
     * 
     * @param viewerVote 观众投票管理
     * @return 观众投票管理集合
     */
    public List<ViewerVote> selectViewerVoteList(ViewerVote viewerVote);

    /**
     * 新增观众投票管理
     * 
     * @param viewerVote 观众投票管理
     * @return 结果
     */
    public int insertViewerVote(ViewerVote viewerVote);

    /**
     * 修改观众投票管理
     * 
     * @param viewerVote 观众投票管理
     * @return 结果
     */
    public int updateViewerVote(ViewerVote viewerVote);

    /**
     * 批量删除观众投票管理
     * 
     * @param ids 需要删除的观众投票管理主键集合
     * @return 结果
     */
    public int deleteViewerVoteByIds(String ids);

    /**
     * 删除观众投票管理信息
     * 
     * @param id 观众投票管理主键
     * @return 结果
     */
    public int deleteViewerVoteById(Integer id);

    public HashMap<String,String> vote(ViewerVote viewerVote);

}
