package com.vote.mapper;

import java.util.List;

import com.vote.domain.ViewerVote;

/**
 * 观众投票管理Mapper接口
 * 
 * @author 魏渝辉
 * @date 2022-07-05
 */
public interface ViewerVoteMapper 
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
     * 删除观众投票管理
     * 
     * @param id 观众投票管理主键
     * @return 结果
     */
    public int deleteViewerVoteById(Integer id);

    /**
     * 批量删除观众投票管理
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteViewerVoteByIds(String[] ids);

    public Integer selectBySessionIdAndViewerId(ViewerVote viewerVote);




    /**
     * 根据matchId,raceSchedule,场次id在(viewerVote)查出当前场次投票总数
     * @param viewerVote
     * @return
     */
    public Integer selectCounts(ViewerVote viewerVote);
}
