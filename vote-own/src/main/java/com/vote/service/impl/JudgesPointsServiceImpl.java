package com.vote.service.impl;

import java.util.HashMap;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.vote.mapper.JudgesPointsMapper;
import com.vote.domain.JudgesPoints;
import com.vote.service.IJudgesPointsService;
import com.vote.common.core.text.Convert;

/**
 * 评委打分Service业务层处理
 * 
 * @author ruoyi
 * @date 2022-07-05
 */
@Service
public class JudgesPointsServiceImpl implements IJudgesPointsService 
{
    @Autowired
    private JudgesPointsMapper judgesPointsMapper;

    /**
     * 查询评委打分
     * 
     * @param id 评委打分主键
     * @return 评委打分
     */
    @Override
    public JudgesPoints selectJudgesPointsById(Integer id)
    {
        return judgesPointsMapper.selectJudgesPointsById(id);
    }

    /**
     * 查询评委打分列表
     * 
     * @param judgesPoints 评委打分
     * @return 评委打分
     */
    @Override
    public List<JudgesPoints> selectJudgesPointsList(JudgesPoints judgesPoints)
    {
        return judgesPointsMapper.selectJudgesPointsList(judgesPoints);
    }

    /**
     * 新增评委打分
     * 
     * @param judgesPoints 评委打分
     * @return 结果
     */
    @Override
    public int insertJudgesPoints(JudgesPoints judgesPoints)
    {
        return judgesPointsMapper.insertJudgesPoints(judgesPoints);
    }

    /**
     * 修改评委打分
     * 
     * @param judgesPoints 评委打分
     * @return 结果
     */
    @Override
    public int updateJudgesPoints(JudgesPoints judgesPoints)
    {
        return judgesPointsMapper.updateJudgesPoints(judgesPoints);
    }

    /**
     * 批量删除评委打分
     * 
     * @param ids 需要删除的评委打分主键
     * @return 结果
     */
    @Override
    public int deleteJudgesPointsByIds(String ids)
    {
        return judgesPointsMapper.deleteJudgesPointsByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除评委打分信息
     * 
     * @param id 评委打分主键
     * @return 结果
     */
    @Override
    public int deleteJudgesPointsById(Integer id)
    {
        return judgesPointsMapper.deleteJudgesPointsById(id);
    }

    @Override
    public HashMap<String, String> vote(JudgesPoints judgesPoints) {
        HashMap<String,String> result = new HashMap<>();
        //检验是否投过票
        Integer integer = judgesPointsMapper.selectBySessionIdAndJudgesId(judgesPoints);
        if (null == integer){
            int row = judgesPointsMapper.insertJudgesPoints(judgesPoints);
            if(row > 0){
                result.put("success", "打分成功");
            }else{
                result.put("err","打分失败");
            }
        }else{
            result.put("err", "您已为本选手打过分");
        }
        return result;
    }
}
