package com.vote.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.vote.common.annotation.Excel;
import com.vote.common.core.domain.BaseEntity;

/**
 * 观众投票管理对象 viewer_vote
 * 
 * @author 魏渝辉
 * @date 2022-07-05
 */
public class ViewerVote extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键id */
    private Integer id;

    /** 比赛id */
    @Excel(name = "比赛id")
    private Integer matchId;

    /** 赛程  1-初赛  2-决赛 */
    @Excel(name = "赛程  1-初赛  2-决赛")
    private Integer raceSchedule;

    /** 场次id */
    @Excel(name = "场次id")
    private Integer sessionId;

    /** 选手id */
    @Excel(name = "选手id")
    private Integer playerId;

    /** 观众id */
    @Excel(name = "观众id")
    private Integer viewerId;

    public void setId(Integer id) 
    {
        this.id = id;
    }

    public Integer getId() 
    {
        return id;
    }
    public void setMatchId(Integer matchId) 
    {
        this.matchId = matchId;
    }

    public Integer getMatchId() 
    {
        return matchId;
    }
    public void setRaceSchedule(Integer raceSchedule) 
    {
        this.raceSchedule = raceSchedule;
    }

    public Integer getRaceSchedule() 
    {
        return raceSchedule;
    }
    public void setSessionId(Integer sessionId) 
    {
        this.sessionId = sessionId;
    }

    public Integer getSessionId() 
    {
        return sessionId;
    }
    public void setPlayerId(Integer playerId) 
    {
        this.playerId = playerId;
    }

    public Integer getPlayerId() 
    {
        return playerId;
    }
    public void setViewerId(Integer viewerId) 
    {
        this.viewerId = viewerId;
    }

    public Integer getViewerId() 
    {
        return viewerId;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("matchId", getMatchId())
            .append("raceSchedule", getRaceSchedule())
            .append("sessionId", getSessionId())
            .append("playerId", getPlayerId())
            .append("viewerId", getViewerId())
            .toString();
    }
}
