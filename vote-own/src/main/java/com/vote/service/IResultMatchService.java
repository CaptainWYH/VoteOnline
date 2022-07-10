package com.vote.service;

import java.util.HashMap;
import java.util.List;

import com.vote.domain.JudgesPoints;
import com.vote.domain.MatchSession;
import com.vote.domain.ResultMatch;
import com.vote.domain.ViewerVote;
import com.vote.dto.AutoCalculateDTO;

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

    /**
     * 自动计算比赛结果
     * 1.前端传值matchId,raceSchedule
     * 2.如果是初赛
     * 3.根据matchId,raceSchedule从(matchSession)查询出比赛场次  以此获得场次id,aid,bid
     * 4.根据matchId,raceSchedule,场次id在(viewerVote)查出当前场次投票总数
     * 5.根据matchId,raceSchedule,aid/bid在(viewerVote)查出a选手/b选手投票总数
     * 6.算出观众投票百分比
     * 7.根据matchId,raceSchedule,playerId 在(JudgesPoints) 直接算出平均分数
     * 8.插入数据到比赛结果
     * @param autoCalculateDTO
     * @return
     */
    public HashMap<String,String> autoCalculate(AutoCalculateDTO autoCalculateDTO);

    public ResultMatch calculate(ViewerVote viewerVote,
                         JudgesPoints judgesPoints,ResultMatch resultMatch,
                         Integer sessionId, Integer playerId);
}
