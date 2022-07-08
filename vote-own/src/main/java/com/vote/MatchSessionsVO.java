package com.vote;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.vote.common.annotation.Excel;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import java.util.Date;

/**
 * @author 魏渝辉
 * @Date:2022年07月08日 13:52
 * @Description:
 */


public class MatchSessionsVO {
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

    /**
     * a选手名字
     */
    private String aName;

    /**
     * a选手歌唱
     */
    private String aTitle;

    /**
     * b选手歌唱
     */
    private String bTitle;

    /**
     * b选手名字
     */
    private String bName;

    public String getaName() {
        return aName;
    }

    public void setaName(String aName) {
        this.aName = aName;
    }

    public String getaTitle() {
        return aTitle;
    }

    public void setaTitle(String aTitle) {
        this.aTitle = aTitle;
    }

    public String getbTitle() {
        return bTitle;
    }

    public void setbTitle(String bTitle) {
        this.bTitle = bTitle;
    }

    public String getbName() {
        return bName;
    }

    public void setbName(String bName) {
        this.bName = bName;
    }

    /** 开始时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "开始时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date beginTime;

    /** 结束时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
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
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
                .append("id", getId())
                .append("matchId", getMatchId())
                .append("raceSchedule", getRaceSchedule())
                .append("aId", getaId())
                .append("aName",getaName())
                .append("bId", getbId())
                .append("bName",getbName())
                .append("beginTime", getBeginTime())
                .append("endTime", getEndTime())
                .append("status", getStatus())
                .toString();
    }
}
