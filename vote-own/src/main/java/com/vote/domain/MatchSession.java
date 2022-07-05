package com.vote.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.vote.common.annotation.Excel;
import com.vote.common.core.domain.BaseEntity;

/**
 * 比赛场次对象 match_session
 * 
 * @author ruoyi
 * @date 2022-07-05
 */
public class MatchSession extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键id  场次id */
    private Integer id;

    /** 比赛id */
    @Excel(name = "比赛id")
    private Integer matchId;

    /** 赛程  1-初赛 2-决赛 */
    @Excel(name = "赛程  1-初赛 2-决赛")
    private Integer raceSchedule;

    /** a选手id */
    @Excel(name = "a选手id")
    private Integer aId;

    /** b选手id */
    @Excel(name = "b选手id")
    private Integer bId;

    /** 开始时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "开始时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date beginTime;

    /** 结束时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "结束时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date endTime;

    /** 投票是否开启  1-开启  2-关闭 */
    @Excel(name = "投票是否开启  1-开启  2-关闭")
    private Integer status;

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
    public void setaId(Integer aId) 
    {
        this.aId = aId;
    }

    public Integer getaId() 
    {
        return aId;
    }
    public void setbId(Integer bId) 
    {
        this.bId = bId;
    }

    public Integer getbId() 
    {
        return bId;
    }
    public void setBeginTime(Date beginTime) 
    {
        this.beginTime = beginTime;
    }

    public Date getBeginTime() 
    {
        return beginTime;
    }
    public void setEndTime(Date endTime) 
    {
        this.endTime = endTime;
    }

    public Date getEndTime() 
    {
        return endTime;
    }
    public void setStatus(Integer status) 
    {
        this.status = status;
    }

    public Integer getStatus() 
    {
        return status;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("matchId", getMatchId())
            .append("raceSchedule", getRaceSchedule())
            .append("aId", getaId())
            .append("bId", getbId())
            .append("beginTime", getBeginTime())
            .append("endTime", getEndTime())
            .append("status", getStatus())
            .toString();
    }
}
