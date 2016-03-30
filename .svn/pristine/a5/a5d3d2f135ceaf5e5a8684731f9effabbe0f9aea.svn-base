/**
 * Copyright &copy; 2014-2016 <a href="https://pactera.com">Pactera-JeeSite</a> All rights reserved.
 */
package com.pactera.jeesite.modules.qar.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.pactera.jeesite.modules.qar.entity.QarAgsSite;
import com.pactera.jeesite.modules.qar.service.QarAgsSiteService;

/**
 * AGS工作站状态监控Controller
 * @author Jeffen@pactera
 * @version 2015-06-08
 */
@Controller
@RequestMapping(value = "${adminPath}/qar/qarAgsSite")
public class QarAgsSiteController extends BaseController {

	@Autowired
	private QarAgsSiteService qarAgsSiteService;
	
	@ModelAttribute
	public QarAgsSite get(@RequestParam(required=false) String id) {
		QarAgsSite entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = qarAgsSiteService.get(id);
		}
		if (entity == null){
			entity = new QarAgsSite();
		}
		return entity;
	}
	
	@RequiresPermissions("qar:qarAgsSite:view")
	@RequestMapping(value = {"list", ""})
	public String list(QarAgsSite qarAgsSite, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<QarAgsSite> page = qarAgsSiteService.findPage(new Page<QarAgsSite>(request, response), qarAgsSite); 
		model.addAttribute("page", page);
		return "modules/qar/qarAgsSiteList";
	}

	@RequiresPermissions("qar:qarAgsSite:view")
	@RequestMapping(value = "form")
	public String form(QarAgsSite qarAgsSite, Model model) {
		model.addAttribute("qarAgsSite", qarAgsSite);
		return "modules/qar/qarAgsSiteForm";
	}

	@RequiresPermissions("qar:qarAgsSite:edit")
	@RequestMapping(value = "save")
	public String save(QarAgsSite qarAgsSite, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, qarAgsSite)){
			return form(qarAgsSite, model);
		}
		qarAgsSiteService.save(qarAgsSite);
		addMessage(redirectAttributes, "保存AGS工作站状态成功");
		return "redirect:"+Global.getAdminPath()+"/qar/qarAgsSite/?repage";
	}
	
	@RequiresPermissions("qar:qarAgsSite:edit")
	@RequestMapping(value = "delete")
	public String delete(QarAgsSite qarAgsSite, RedirectAttributes redirectAttributes) {
		qarAgsSiteService.delete(qarAgsSite);
		addMessage(redirectAttributes, "删除AGS工作站状态成功");
		return "redirect:"+Global.getAdminPath()+"/qar/qarAgsSite/?repage";
	}

}