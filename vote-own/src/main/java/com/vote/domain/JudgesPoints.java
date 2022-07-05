package com.vote.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.vote.common.annotation.Excel;
import com.vote.common.core.domain.BaseEntity;

/**
 * 评委打分对象 judges_points
 * 
 * @author ruoyi
 * @date 2022-07-05
 */
public class JudgesPoints extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键id */
    private Integer id;

    /** 比赛id */
    @Excel(name = "比赛id")
    private Integer matchId;

    /** 赛程 */
    @Excel(name = "赛程")
    private Integer raceSchedule;

    /** 场次id */
    @Excel(name = "场次id")
    private Integer sessionId;

    /** 评委id */
    @Excel(name = "评委id")
    private Integer judgesId;

    /** 选手id */
    @Excel(name = "选手id")
    private Integer playerId;

    /** 评委分数 */
    @Excel(name = "评委分数")
    private Integer points;

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
    public void setJudgesId(Integer judgesId) 
    {
        this.judgesId = judgesId;
    }

    public Integer getJudgesId() 
    {
        return judgesId;
    }
    public void setPlayerId(Integer playerId) 
    {
        this.playerId = playerId;
    }

    public Integer getPlayerId() 
    {
        return playerId;
    }
    public void setPoints(Integer points) 
    {
        this.points = points;
    }

    public Integer getPoints() 
    {
        return points;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("matchId", getMatchId())
            .append("raceSchedule", getRaceSchedule())
            .append("sessionId", getSessionId())
            .append("judgesId", getJudgesId())
            .append("playerId", getPlayerId())
            .append("points", getPoints())
            .toString();
    }
}
