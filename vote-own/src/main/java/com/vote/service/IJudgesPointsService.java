package com.vote.service;

import java.util.List;
import com.vote.domain.JudgesPoints;

/**
 * 评委打分Service接口
 * 
 * @author ruoyi
 * @date 2022-07-05
 */
public interface IJudgesPointsService 
{
    /**
     * 查询评委打分
     * 
     * @param id 评委打分主键
     * @return 评委打分
     */
    public JudgesPoints selectJudgesPointsById(Integer id);

    /**
     * 查询评委打分列表
     * 
     * @param judgesPoints 评委打分
     * @return 评委打分集合
     */
    public List<JudgesPoints> selectJudgesPointsList(JudgesPoints judgesPoints);

    /**
     * 新增评委打分
     * 
     * @param judgesPoints 评委打分
     * @return 结果
     */
    public int insertJudgesPoints(JudgesPoints judgesPoints);

    /**
     * 修改评委打分
     * 
     * @param judgesPoints 评委打分
     * @return 结果
     */
    public int updateJudgesPoints(JudgesPoints judgesPoints);

    /**
     * 批量删除评委打分
     * 
     * @param ids 需要删除的评委打分主键集合
     * @return 结果
     */
    public int deleteJudgesPointsByIds(String ids);

    /**
     * 删除评委打分信息
     * 
     * @param id 评委打分主键
     * @return 结果
     */
    public int deleteJudgesPointsById(Integer id);
}
