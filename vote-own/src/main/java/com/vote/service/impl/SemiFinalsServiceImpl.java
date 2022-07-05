package com.vote.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.vote.mapper.SemiFinalsMapper;
import com.vote.domain.SemiFinals;
import com.vote.service.ISemiFinalsService;
import com.vote.common.core.text.Convert;

/**
 * 复赛管理Service业务层处理
 * 
 * @author 魏渝辉
 * @date 2022-07-05
 */
@Service
public class SemiFinalsServiceImpl implements ISemiFinalsService 
{
    @Autowired
    private SemiFinalsMapper semiFinalsMapper;

    /**
     * 查询复赛管理
     * 
     * @param id 复赛管理主键
     * @return 复赛管理
     */
    @Override
    public SemiFinals selectSemiFinalsById(Integer id)
    {
        return semiFinalsMapper.selectSemiFinalsById(id);
    }

    /**
     * 查询复赛管理列表
     * 
     * @param semiFinals 复赛管理
     * @return 复赛管理
     */
    @Override
    public List<SemiFinals> selectSemiFinalsList(SemiFinals semiFinals)
    {
        return semiFinalsMapper.selectSemiFinalsList(semiFinals);
    }

    /**
     * 新增复赛管理
     * 
     * @param semiFinals 复赛管理
     * @return 结果
     */
    @Override
    public int insertSemiFinals(SemiFinals semiFinals)
    {
        return semiFinalsMapper.insertSemiFinals(semiFinals);
    }

    /**
     * 修改复赛管理
     * 
     * @param semiFinals 复赛管理
     * @return 结果
     */
    @Override
    public int updateSemiFinals(SemiFinals semiFinals)
    {
        return semiFinalsMapper.updateSemiFinals(semiFinals);
    }

    /**
     * 批量删除复赛管理
     * 
     * @param ids 需要删除的复赛管理主键
     * @return 结果
     */
    @Override
    public int deleteSemiFinalsByIds(String ids)
    {
        return semiFinalsMapper.deleteSemiFinalsByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除复赛管理信息
     * 
     * @param id 复赛管理主键
     * @return 结果
     */
    @Override
    public int deleteSemiFinalsById(Integer id)
    {
        return semiFinalsMapper.deleteSemiFinalsById(id);
    }
}
