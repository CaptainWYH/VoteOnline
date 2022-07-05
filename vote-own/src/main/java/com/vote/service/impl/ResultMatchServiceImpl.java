package com.vote.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.vote.mapper.ResultMatchMapper;
import com.vote.domain.ResultMatch;
import com.vote.service.IResultMatchService;
import com.vote.common.core.text.Convert;

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
}
