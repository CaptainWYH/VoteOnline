package com.vote.vo;

/**
 * @author 魏渝辉
 * @Date:2022年07月11日 16:58
 * @Description:
 */

import java.math.BigDecimal;

/**
 * 比赛结果数据展示
 */
public class ResultMatchVo {

    private String playerName;

    private String songTitle;

    private double finalScore;

    public ResultMatchVo() {
    }

    public ResultMatchVo(String playerName, String songTitle, double finalScore) {
        this.playerName = playerName;
        this.songTitle = songTitle;
        this.finalScore = finalScore;
    }

    public String getPlayerName() {
        return playerName;
    }

    public void setPlayerName(String playerName) {
        this.playerName = playerName;
    }

    public String getSongTitle() {
        return songTitle;
    }

    public void setSongTitle(String songTitle) {
        this.songTitle = songTitle;
    }

    public double getFinalScore() {
        return finalScore;
    }

    public void setFinalScore(double finalScore) {
        this.finalScore = finalScore;
    }

    @Override
    public String toString() {
        return "ResultMatchVo{" +
                "playerName='" + playerName + '\'' +
                ", songTitle='" + songTitle + '\'' +
                ", finalScore=" + finalScore +
                '}';
    }
}
