/**
 * Copyright &copy; 2014-2016 <a href="https://pactera.com">Pactera-JeeSite</a> All rights reserved.served.
 */
package com.pactera.jeesite.modules.qar.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.pactera.jeesite.modules.qar.entity.QarAgsSite;
import com.pactera.jeesite.modules.qar.dao.QarAgsSiteDao;

/**
 * AGS工作站状态监控Service
 * @author Jeffen@pactera
 * @version 2015-06-08
 */
@Service
@Transactional(readOnly = true)
public class QarAgsSiteService extends CrudService<QarAgsSiteDao, QarAgsSite> {

	public QarAgsSite get(String id) {
		return super.get(id);
	}
	
	public List<QarAgsSite> findList(QarAgsSite qarAgsSite) {
		return super.findList(qarAgsSite);
	}
	
	public Page<QarAgsSite> findPage(Page<QarAgsSite> page, QarAgsSite qarAgsSite) {
		return super.findPage(page, qarAgsSite);
	}
	
	@Transactional(readOnly = false)
	public void save(QarAgsSite qarAgsSite) {
		super.save(qarAgsSite);
	}
	
	@Transactional(readOnly = false)
	public void delete(QarAgsSite qarAgsSite) {
		super.delete(qarAgsSite);
	}
	
}