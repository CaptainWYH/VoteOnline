package com.vote.service;

import java.util.List;

import com.vote.MatchSessionsVO;
import com.vote.domain.MatchSession;

/**
 * 比赛场次Service接口
 * 
 * @author ruoyi
 * @date 2022-07-05
 */
public interface IMatchSessionService 
{
    /**
     * 查询比赛场次
     * 
     * @param id 比赛场次主键
     * @return 比赛场次
     */
    public MatchSession selectMatchSessionById(Integer id);

    /**
     * 查询比赛场次列表
     * 
     * @param matchSession 比赛场次
     * @return 比赛场次集合
     */
    public List<MatchSession> selectMatchSessionList(MatchSession matchSession);

    /**
     * 新增比赛场次
     * 
     * @param matchSession 比赛场次
     * @return 结果
     */
    public int insertMatchSession(MatchSession matchSession);

    /**
     * 修改比赛场次
     * 
     * @param matchSession 比赛场次
     * @return 结果
     */
    public int updateMatchSession(MatchSession matchSession);

    /**
     * 批量删除比赛场次
     * 
     * @param ids 需要删除的比赛场次主键集合
     * @return 结果
     */
    public int deleteMatchSessionByIds(String ids);

    /**
     * 删除比赛场次信息
     * 
     * @param id 比赛场次主键
     * @return 结果
     */
    public int deleteMatchSessionById(Integer id);


    /**
     * 自动配分场次
     * @param matchId
     * @param raceSchedule
     * @return
     */
    public int autoDistribute(Integer matchId,Integer raceSchedule);

    /**
     * 查询场次
     * @param matchSession
     * @return
     */
    public List<MatchSessionsVO> selectMatchSessions(MatchSession matchSession);
}
