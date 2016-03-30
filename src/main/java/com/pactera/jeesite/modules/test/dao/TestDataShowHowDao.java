/**
 * Copyright &copy; 2014-2016 <a href="https://pactera.com">Pactera-JeeSite</a> All rights reserved.served.
 */
package com.pactera.jeesite.modules.test.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.pactera.jeesite.modules.test.entity.TestDataShowHow;

/**
 * 业务数据表演示updDAO接口
 * @author Jeffen@pactera
 * @version 2015-10-07
 */
@MyBatisDao
public interface TestDataShowHowDao extends CrudDao<TestDataShowHow> {
	
}