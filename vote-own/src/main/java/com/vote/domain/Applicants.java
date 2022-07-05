package com.vote.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.vote.common.annotation.Excel;
import com.vote.common.core.domain.BaseEntity;

/**
 * 曲目信息对象 applicants
 * 
 * @author ruoyi
 * @date 2022-07-05
 */
public class Applicants extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键id */
    private Integer id;

    /** 比赛id */
    @Excel(name = "比赛id")
    private Integer matchId;

    /** 1-初赛 2-决赛 */
    @Excel(name = "1-初赛 2-决赛")
    private Integer raceSchedule;

    /** 选手id */
    @Excel(name = "选手id")
    private Integer playerId;

    /** 曲目名称 */
    @Excel(name = "曲目名称")
    private String songTitle;

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
    public void setPlayerId(Integer playerId) 
    {
        this.playerId = playerId;
    }

    public Integer getPlayerId() 
    {
        return playerId;
    }
    public void setSongTitle(String songTitle) 
    {
        this.songTitle = songTitle;
    }

    public String getSongTitle() 
    {
        return songTitle;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("matchId", getMatchId())
            .append("raceSchedule", getRaceSchedule())
            .append("playerId", getPlayerId())
            .append("songTitle", getSongTitle())
            .toString();
    }
}
