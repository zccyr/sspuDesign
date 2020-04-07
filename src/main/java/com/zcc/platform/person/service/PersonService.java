package com.zcc.platform.person.service;

import com.zcc.commons.utils.Page;
import com.zcc.platform.person.entity.PersonEntity;

import java.util.List;

/**
 * @author zcc
 */
public interface PersonService {
    /**
     * 保存人员
     *
     * @param personEntity
     * @param tags
     * @return
     */
    String save(PersonEntity personEntity, String tags);

    /**
     * 保存人员
     *
     * @param personEntity
     * @return
     */
    String save(PersonEntity personEntity);

    /**
     * 删除人员
     *
     * @param personId
     */
    void del(String personId);

    /**
     * 查找人员
     *
     * @param personId
     * @return
     */
    PersonEntity findById(String personId);

    /**
     * 查找人员
     *
     * @param gender gender
     * @return list
     */
    List<PersonEntity> findByGender(String gender);

    /**
     * 模糊查找
     *
     * @param param
     * @return
     */
    List<PersonEntity> find(String param);

    /**
     * 模糊查找+标签查找
     *
     * @param param
     * @param tags
     * @return
     */
    List<PersonEntity> find(String param, String tags);

    /**
     * 模糊查找+分页
     *
     * @param param
     * @param page
     * @return
     */
    List<PersonEntity> find(String param, Page page);

    /**
     * 模糊查找+标签+分页
     *
     * @param param
     * @param page
     * @param tags
     * @return
     */
    List<PersonEntity> find(String param, Page page, String tags);

    /**
     * 人物数据聚合
     *
     * @param personId personId
     * @return list
     */
    List<PersonEntity> dateTogether(String personId);

    /**
     * 数据聚合
     *
     * @param personId personId
     * @param page     page
     * @return list
     */
    List<PersonEntity> dateTogether(String personId, Page page);

    /**
     * 数据聚合
     *
     * @return
     */
    List<PersonEntity> dateTogetherAll();

    /**
     * 数据聚合
     *
     * @param page page
     * @return
     */
    List<PersonEntity> dateTogetherAll(Page page);
}