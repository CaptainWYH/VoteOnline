package com.vote.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.vote.mapper.ViewerVoteMapper;
import com.vote.domain.ViewerVote;
import com.vote.service.IViewerVoteService;
import com.vote.common.core.text.Convert;

/**
 * 观众投票管理Service业务层处理
 * 
 * @author 魏渝辉
 * @date 2022-07-05
 */
@Service
public class ViewerVoteServiceImpl implements IViewerVoteService 
{
    @Autowired
    private ViewerVoteMapper viewerVoteMapper;

    /**
     * 查询观众投票管理
     * 
     * @param id 观众投票管理主键
     * @return 观众投票管理
     */
    @Override
    public ViewerVote selectViewerVoteById(Integer id)
    {
        return viewerVoteMapper.selectViewerVoteById(id);
    }

    /**
     * 查询观众投票管理列表
     * 
     * @param viewerVote 观众投票管理
     * @return 观众投票管理
     */
    @Override
    public List<ViewerVote> selectViewerVoteList(ViewerVote viewerVote)
    {
        return viewerVoteMapper.selectViewerVoteList(viewerVote);
    }

    /**
     * 新增观众投票管理
     * 
     * @param viewerVote 观众投票管理
     * @return 结果
     */
    @Override
    public int insertViewerVote(ViewerVote viewerVote)
    {
        return viewerVoteMapper.insertViewerVote(viewerVote);
    }

    /**
     * 修改观众投票管理
     * 
     * @param viewerVote 观众投票管理
     * @return 结果
     */
    @Override
    public int updateViewerVote(ViewerVote viewerVote)
    {
        return viewerVoteMapper.updateViewerVote(viewerVote);
    }

    /**
     * 批量删除观众投票管理
     * 
     * @param ids 需要删除的观众投票管理主键
     * @return 结果
     */
    @Override
    public int deleteViewerVoteByIds(String ids)
    {
        return viewerVoteMapper.deleteViewerVoteByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除观众投票管理信息
     * 
     * @param id 观众投票管理主键
     * @return 结果
     */
    @Override
    public int deleteViewerVoteById(Integer id)
    {
        return viewerVoteMapper.deleteViewerVoteById(id);
    }
}
