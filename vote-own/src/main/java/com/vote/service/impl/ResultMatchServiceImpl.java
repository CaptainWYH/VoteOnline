package com.vote.service.impl;

import java.math.BigDecimal;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.stream.Collectors;

import com.vote.domain.JudgesPoints;
import com.vote.domain.MatchSession;
import com.vote.domain.ViewerVote;
import com.vote.dto.AutoCalculateDTO;
import com.vote.mapper.JudgesPointsMapper;
import com.vote.mapper.MatchSessionMapper;
import com.vote.mapper.ViewerVoteMapper;
import com.vote.vo.ResultMatchVo;
import org.apache.commons.lang3.ObjectUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.vote.mapper.ResultMatchMapper;
import com.vote.domain.ResultMatch;
import com.vote.service.IResultMatchService;
import com.vote.common.core.text.Convert;
import org.springframework.transaction.annotation.Transactional;

import static java.util.stream.Collectors.averagingInt;

/**
 * 比赛结果Service业务层处理
 * 
 * @author 魏渝辉
 * @date 2022-07-05
 */
@Service
public class ResultMatchServiceImpl implements IResultMatchService 
{
    @Autowired
    private ResultMatchMapper resultMatchMapper;

    @Autowired
    private MatchSessionMapper matchSessionMapper;

    @Autowired
    private ViewerVoteMapper viewerVoteMapper;

    @Autowired
    private JudgesPointsMapper judgesPointsMapper;

    /**
     * 查询比赛结果
     * 
     * @param id 比赛结果主键
     * @return 比赛结果
     */
    @Override
    public ResultMatch selectResultMatchById(Integer id)
    {
        return resultMatchMapper.selectResultMatchById(id);
    }

    /**
     * 查询比赛结果列表
     * 
     * @param resultMatch 比赛结果
     * @return 比赛结果
     */
    @Override
    public List<ResultMatch> selectResultMatchList(ResultMatch resultMatch)
    {
        return resultMatchMapper.selectResultMatchList(resultMatch);
    }

    /**
     * 新增比赛结果
     * 
     * @param resultMatch 比赛结果
     * @return 结果
     */
    @Override
    public int insertResultMatch(ResultMatch resultMatch)
    {
        return resultMatchMapper.insertResultMatch(resultMatch);
    }

    /**
     * 修改比赛结果
     * 
     * @param resultMatch 比赛结果
     * @return 结果
     */
    @Override
    public int updateResultMatch(ResultMatch resultMatch)
    {
        return resultMatchMapper.updateResultMatch(resultMatch);
    }

    /**
     * 批量删除比赛结果
     * 
     * @param ids 需要删除的比赛结果主键
     * @return 结果
     */
    @Override
    public int deleteResultMatchByIds(String ids)
    {
        return resultMatchMapper.deleteResultMatchByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除比赛结果信息
     * 
     * @param id 比赛结果主键
     * @return 结果
     */
    @Override
    public int deleteResultMatchById(Integer id)
    {
        return resultMatchMapper.deleteResultMatchById(id);
    }


    /**
     * 自动计算比赛结果
     * 1.前端传值matchId,raceSchedule
     * 2.
     * 3.根据matchId,raceSchedule从(matchSession)查询出比赛场次  以此获得场次id,aid,bid
     * 4.根据matchId,raceSchedule,场次id在(viewerVote)查出当前场次投票总数
     * 5.根据matchId,raceSchedule,aid/bid在(viewerVote)查出a选手/b选手投票总数
     * 6.算出观众投票百分比
     * 7.根据matchId,raceSchedule,playerId 在(JudgesPoints) 直接算出平均分数
     * 8.插入数据到比赛结果
     * @param autoCalculateDTO
     * @return
     */
    @Override
    public HashMap<String,String> autoCalculate(AutoCalculateDTO autoCalculateDTO) {
        HashMap<String,String> map = new HashMap<>();

        //实体类
        MatchSession matchSession = new MatchSession();
        ViewerVote viewerVote = new ViewerVote();
        JudgesPoints judgesPoints = new JudgesPoints();
        ResultMatch resultMatch = new ResultMatch();
        Integer raceSchedule = autoCalculateDTO.getRaceSchedule();
        Integer matchId = autoCalculateDTO.getMatchId();
        NumberFormat percentInstance = NumberFormat.getPercentInstance();
        //赋值
        matchSession.setMatchId(matchId);
        matchSession.setRaceSchedule(raceSchedule);
        viewerVote.setMatchId(matchId);
        viewerVote.setRaceSchedule(raceSchedule);
        judgesPoints.setMatchId(matchId);
        judgesPoints.setRaceSchedule(raceSchedule);
        resultMatch.setMatchId(matchId);
        resultMatch.setRaceSchedule(raceSchedule);
        List<ResultMatch> resultMatches = resultMatchMapper.selectResultMatchList(resultMatch);
        //检查是否已经计算过结果
        if (!resultMatches.isEmpty()){
            map.put("err", "该比赛结果已经计算");
            return map;
        }
        //查询场次   步骤3
        List<MatchSession> matchSessions = matchSessionMapper.selectMatchSessionList(matchSession);
        if (matchSessions.isEmpty()){
            map.put("err", "该比赛场次暂未分配,无法计算结果");
            return map;
        }
        for (MatchSession session : matchSessions) {
            Integer id = session.getId();//取出场次id
            Integer aId = session.getaId();
            Integer bId = session.getbId();
            calculate( viewerVote, judgesPoints, resultMatch, id, aId);
            calculate(viewerVote, judgesPoints, resultMatch, id, bId);

        }
        return map;
    }

    List<ViewerVote> listViewerVoteByMatchId(Integer matchId,Integer raceSchedule,Integer sessionId){
        ViewerVote qo=new ViewerVote();
        qo.setMatchId(matchId);
        qo.setRaceSchedule(raceSchedule);
        qo.setSessionId(sessionId);
        return viewerVoteMapper.selectViewerVoteList(qo);
    }
    List<JudgesPoints> listJudgesPointsByMatchId(Integer matchId,Integer raceSchedule,Integer sessionId){
        JudgesPoints qo=new JudgesPoints();
        qo.setMatchId(matchId);
        qo.setRaceSchedule(raceSchedule);
        qo.setSessionId(sessionId);
        return judgesPointsMapper.selectJudgesPointsList(qo);
    }


    boolean saveBatch(Integer matchId,Integer raceSchedule,Integer sessionId,Integer playerA,Integer playerB) {
        try {
            List<ViewerVote> allViewerVote=listViewerVoteByMatchId(matchId,raceSchedule,sessionId);
            List<JudgesPoints> allJudgesPoints=listJudgesPointsByMatchId(matchId,raceSchedule,sessionId);

            List<ViewerVote> vList = allViewerVote.stream()
                    .filter(x -> x.getPlayerId().equals(playerA))
                    .collect(Collectors.toList());

            Double avgA = allJudgesPoints.stream()
                    .filter(x -> x.getPlayerId().equals(playerA))
                    .collect(averagingInt(JudgesPoints::getPoints));




            //A
            ResultMatch resultMatch = new ResultMatch();
            resultMatch.setMatchId(matchId);
            resultMatch.setRaceSchedule(raceSchedule);
            resultMatch.setPlayerId(playerA);
            resultMatch.setJudgesScore(new BigDecimal(avgA));
            resultMatch.setVoteCount(vList.size());
            BigDecimal percentA=new BigDecimal(0);
            if(allViewerVote.size()>0){
                percentA=new BigDecimal(100.0*resultMatch.getVoteCount()/(allViewerVote.size()*1.0));
            }
            resultMatch.setPercent(percentA);
            resultMatch.setFinalScore(resultMatch.getJudgesScore().add(resultMatch.getPercent()));
            resultMatchMapper.insertResultMatch(resultMatch);

            //B
            if (!ObjectUtils.isEmpty(playerB)){
                Double avgB = allJudgesPoints.stream()
                        .filter(x -> x.getPlayerId().equals(playerB))
                        .collect(averagingInt(JudgesPoints::getPoints));
                resultMatch = new ResultMatch();
                resultMatch.setMatchId(matchId);
                resultMatch.setRaceSchedule(raceSchedule);
                resultMatch.setPlayerId(playerB);
                resultMatch.setJudgesScore(new BigDecimal(avgB));
                resultMatch.setVoteCount(allViewerVote.size()-vList.size());
                BigDecimal percenB=new BigDecimal(0);
                if(allViewerVote.size()>0){
                    percenB=new BigDecimal(100.0*resultMatch.getVoteCount()/(allViewerVote.size()*1.0));
                }
                resultMatch.setPercent(percenB);
                resultMatch.setFinalScore(resultMatch.getJudgesScore().add(resultMatch.getPercent()));
                resultMatchMapper.insertResultMatch(resultMatch);
            }

        }catch (Exception e){
            e.printStackTrace();
            return false;
        }
        return true;
    }



    @Override
    public ResultMatch calculate(ViewerVote viewerVote,
                         JudgesPoints judgesPoints,ResultMatch resultMatch,
                         Integer sessionId, Integer playerId) {
        if (playerId != null){
            viewerVote.setSessionId(sessionId);
            //根据matchId,raceSchedule,场次id在(viewerVote)查出当前场次投票总数   步骤4
            BigDecimal voteAllCounts = new BigDecimal(viewerVoteMapper.selectCounts(viewerVote));//本场次所有观众票数
            viewerVote.setPlayerId(playerId);
            //对a选手投票数量
            BigDecimal voteCounts = new BigDecimal(viewerVoteMapper.selectCounts(viewerVote));

            BigDecimal percents;
            if(voteCounts.compareTo(new BigDecimal("0.00")) == 1 && voteAllCounts.compareTo(new BigDecimal("0.00"))  == 1){
                percents = new BigDecimal(String.valueOf(voteCounts.divide(voteAllCounts,2,BigDecimal.ROUND_HALF_UP))).multiply(new BigDecimal("100.00"));
            }else {
                percents = new BigDecimal("0.00");
            }
            //评委平均分
            judgesPoints.setPlayerId(playerId);
            BigDecimal aAvgPoints = judgesPointsMapper.selectAvgPointsByMatchIdAndRaceSchedleAndPlayerId(judgesPoints);
            aAvgPoints = aAvgPoints == null ? new BigDecimal("0.00") : aAvgPoints;
            System.out.println(playerId + "选手投票数" + voteCounts);
            System.out.println("本场总投票数" + voteAllCounts);
            System.out.println("评委评分:" + aAvgPoints);
            resultMatch.setPlayerId(playerId);
            resultMatch.setPercent(percents);
            resultMatch.setJudgesScore(aAvgPoints);
            resultMatch.setVoteCount(Integer.valueOf(voteCounts.toString()));
            System.out.println("最终分数" + percents.add(aAvgPoints));
            resultMatch.setFinalScore(percents.add(aAvgPoints));
            resultMatchMapper.insertResultMatch(resultMatch);
            viewerVote.setPlayerId(null);
            judgesPoints.setPlayerId(null);

//            System.out.println("最终插入数据:" + resultMatch);
        }else{

        }
        return resultMatch;
    }

    @Override
    @Transactional
    public HashMap<String, String> autoCalculatePlus(AutoCalculateDTO autoCalculateDTO) {

        HashMap<String, String> map = new HashMap<>();
        MatchSession matchSession = new MatchSession();
        ResultMatch resultMatch = new ResultMatch();
        Integer raceSchedule = autoCalculateDTO.getRaceSchedule();
        Integer matchId = autoCalculateDTO.getMatchId();
        //赋值
        resultMatch.setMatchId(matchId);
        resultMatch.setRaceSchedule(raceSchedule);
        matchSession.setMatchId(matchId);
        matchSession.setRaceSchedule(raceSchedule);
        //先检查是否已经计算过
        List<ResultMatch> resultMatches = resultMatchMapper.selectResultMatchList(resultMatch);
        if (!resultMatches.isEmpty()){
            map.put("err", "该比赛结果已经计算");
            return map;
        }
        //查询出比赛场次
        List<MatchSession> matchSessions = matchSessionMapper.selectMatchSessionList(matchSession);
        //如果查不出来  说明还未分配当前的场次
        if (matchSessions.isEmpty()){
            map.put("err", "该比赛场次暂未分配,无法计算结果");
            return map;
        }
        try {
            for (MatchSession session : matchSessions) {
                Integer id = session.getId();//取出场次id
                Integer aId = session.getaId();
                Integer bId = session.getbId();
                boolean flag = this.saveBatch(matchId, raceSchedule,id, aId, bId);
                if (flag){
                    map.put("success","比赛结果计算完毕");
                    continue;
                }
            }
        }catch (Exception e){
            map.put("err","计算出错");
            return map;
        }finally{
            return map;
        }
    }

    @Override
    public List<ResultMatchVo> selectResultMatchListByMatchIdAndRaceSchedule(Integer matchId, Integer raceSchedule) {
        return resultMatchMapper.selectResultMatchListByMatchIdAndRaceSchedule(matchId,raceSchedule);
    }
}
