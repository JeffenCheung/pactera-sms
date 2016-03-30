/**
 * Copyright &copy; 2014-2016 <a href="https://pactera.com">Pactera-JeeSite</a> All rights reserved.served.
 */
package com.pactera.jeesite.modules.qar.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.pactera.jeesite.modules.qar.entity.QarEvent;
import com.pactera.jeesite.modules.qar.dao.QarEventDao;

/**
 * QAR超限事件poiService
 * @author Jeffen@pactera
 * @version 2015-10-16
 */
@Service
@Transactional(readOnly = true)
public class QarEventService extends CrudService<QarEventDao, QarEvent> {

	public QarEvent get(String id) {
		return super.get(id);
	}
	
	public List<QarEvent> findList(QarEvent qarEvent) {
		return super.findList(qarEvent);
	}
	
	public Page<QarEvent> findPage(Page<QarEvent> page, QarEvent qarEvent) {
		return super.findPage(page, qarEvent);
	}
	
	@Transactional(readOnly = false)
	public void save(QarEvent qarEvent) {
		super.save(qarEvent);
	}
	
	@Transactional(readOnly = false)
	public void delete(QarEvent qarEvent) {
		super.delete(qarEvent);
	}

	@Transactional(readOnly = false)
	public void deleteList(QarEvent qarEvent) {
		super.deleteList(qarEvent);
	}
		
	@Transactional(readOnly = false)
	public void truncateTable(QarEvent qarEvent) {
		super.truncateTable(qarEvent);
	}
		
	@Transactional(readOnly = false)
	public void copy(QarEvent qarEvent) {
		super.copy(qarEvent);
	}
	
	@Transactional(readOnly = false)
	public void copyList(QarEvent qarEvent) {
		super.copyList(qarEvent);
	}
}