package com.vote.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.vote.mapper.MatchSessionMapper;
import com.vote.domain.MatchSession;
import com.vote.service.IMatchSessionService;
import com.vote.common.core.text.Convert;

/**
 * 比赛场次Service业务层处理
 * 
 * @author ruoyi
 * @date 2022-07-05
 */
@Service
public class MatchSessionServiceImpl implements IMatchSessionService 
{
    @Autowired
    private MatchSessionMapper matchSessionMapper;

    /**
     * 查询比赛场次
     * 
     * @param id 比赛场次主键
     * @return 比赛场次
     */
    @Override
    public MatchSession selectMatchSessionById(Integer id)
    {
        return matchSessionMapper.selectMatchSessionById(id);
    }

    /**
     * 查询比赛场次列表
     * 
     * @param matchSession 比赛场次
     * @return 比赛场次
     */
    @Override
    public List<MatchSession> selectMatchSessionList(MatchSession matchSession)
    {
        return matchSessionMapper.selectMatchSessionList(matchSession);
    }

    /**
     * 新增比赛场次
     * 
     * @param matchSession 比赛场次
     * @return 结果
     */
    @Override
    public int insertMatchSession(MatchSession matchSession)
    {
        return matchSessionMapper.insertMatchSession(matchSession);
    }

    /**
     * 修改比赛场次
     * 
     * @param matchSession 比赛场次
     * @return 结果
     */
    @Override
    public int updateMatchSession(MatchSession matchSession)
    {
        return matchSessionMapper.updateMatchSession(matchSession);
    }

    /**
     * 批量删除比赛场次
     * 
     * @param ids 需要删除的比赛场次主键
     * @return 结果
     */
    @Override
    public int deleteMatchSessionByIds(String ids)
    {
        return matchSessionMapper.deleteMatchSessionByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除比赛场次信息
     * 
     * @param id 比赛场次主键
     * @return 结果
     */
    @Override
    public int deleteMatchSessionById(Integer id)
    {
        return matchSessionMapper.deleteMatchSessionById(id);
    }
}
