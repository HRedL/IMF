package com.qdu.dao;


import com.qdu.entity.Dict;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 字典Dao
 * @Author mqy
 * @Version 2018/11/6
 */

public interface DictDao  {

    Dict get(int id);/*获取指定数据*/


    List<Dict> findAllList();/*获取全部数据*/


    int delete(int id);/*删除指定数据*/


    int insert(Dict entity);/*插入数据*/


    int update(Dict entity);/*更新数据*/

    List<Dict> getDictsByCondition(@Param("type") String type);

    Dict getDictByTypeAndValue(@Param("type") String type, @Param("value") String value);




    List<Dict> getDictsByTypeAndLabel(@Param("type") String type, @Param("label") String label);

    Dict getDictByTypeAndLabel(@Param("type") String type, @Param("label") String label);

    /**
     * 通过type查找所有dict
     */
    List<Dict> getDictsByType(@Param("type") String type);

    List<Dict> getDictsByTypeAndParent(@Param("type") String type, @Param("ptype") String ptype, @Param("pvalue") String pvalue);
}
