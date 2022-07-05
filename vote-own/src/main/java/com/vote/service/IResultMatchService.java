package com.vote.service;

import java.util.List;
import com.vote.domain.ResultMatch;

/**
 * 比赛结果Service接口
 * 
 * @author 魏渝辉
 * @date 2022-07-05
 */
public interface IResultMatchService 
{
    /**
     * 查询比赛结果
     * 
     * @param id 比赛结果主键
     * @return 比赛结果
     */
    public ResultMatch selectResultMatchById(Integer id);

    /**
     * 查询比赛结果列表
     * 
     * @param resultMatch 比赛结果
     * @return 比赛结果集合
     */
    public List<ResultMatch> selectResultMatchList(ResultMatch resultMatch);

    /**
     * 新增比赛结果
     * 
     * @param resultMatch 比赛结果
     * @return 结果
     */
    public int insertResultMatch(ResultMatch resultMatch);

    /**
     * 修改比赛结果
     * 
     * @param resultMatch 比赛结果
     * @return 结果
     */
    public int updateResultMatch(ResultMatch resultMatch);

    /**
     * 批量删除比赛结果
     * 
     * @param ids 需要删除的比赛结果主键集合
     * @return 结果
     */
    public int deleteResultMatchByIds(String ids);

    /**
     * 删除比赛结果信息
     * 
     * @param id 比赛结果主键
     * @return 结果
     */
    public int deleteResultMatchById(Integer id);
}
