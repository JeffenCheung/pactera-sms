/**
 * Copyright &copy; 2014-2016 <a href="https://pactera.com">Pactera-JeeSite</a> All rights reserved.
 */
package com.pactera.jeesite.modules.test.web;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.sys.utils.MutiLangUtils;
import com.pactera.jeesite.modules.test.entity.TestDataDs2;
import com.pactera.jeesite.modules.test.service.TestDataDs2Service;

/**
 * 业务数据表演示-数据源2Controller
 * @author Jeffen@pactera
 * @version 2015-10-25
 */
@Controller
@RequestMapping(value = "${adminPath}/test/testDataDs2")
public class TestDataDs2Controller extends BaseController {

	public static final String URL_ADMIN_REPAGE = "redirect:"+Global.getAdminPath()+"/test/testDataDs2/?repage";
	public static final String URL_MODULE_LIST = "modules/test/testDataDs2List";
	public static final String URL_MODULE_FORM = "modules/test/testDataDs2Form";
	
	public static final String PERMISSION_VIEW = "test:testDataDs2:view";
	public static final String PERMISSION_EDIT = "test:testDataDs2:edit";
	public static final String PERMISSION_DBA = "test:testDataDs2:dba";
	public static final String PERMISSION_IO = "test:testDataDs2:io";
	
	@Autowired
	private TestDataDs2Service testDataDs2Service;
	
	@ModelAttribute
	public TestDataDs2 get(@RequestParam(required=false) String id) {
		TestDataDs2 entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = testDataDs2Service.get(id);
		}
		if (entity == null){
			entity = new TestDataDs2();
		}
		return entity;
	}
	
	
	@RequiresPermissions(PERMISSION_VIEW)
	@RequestMapping(value = {"list", ""})
	public String list(TestDataDs2 testDataDs2, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<TestDataDs2> page = testDataDs2Service.findPage(new Page<TestDataDs2>(request, response), testDataDs2); 
		model.addAttribute("page", page);
		return URL_MODULE_LIST;
	}

	@RequiresPermissions(PERMISSION_VIEW)
	@RequestMapping(value = "form")
	public String form(TestDataDs2 testDataDs2, Model model) {
		model.addAttribute("testDataDs2", testDataDs2);
		return URL_MODULE_FORM;
	}

	@RequiresPermissions(PERMISSION_EDIT)
	@RequestMapping(value = "save")
	public String save(TestDataDs2 testDataDs2, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, testDataDs2)){
			return form(testDataDs2, model);
		}
		testDataDs2Service.save(testDataDs2);
		addMessage(redirectAttributes, MutiLangUtils.getLang("common.save.success.param", "【业务数据表演示-数据源2】"));
		return URL_ADMIN_REPAGE;
	}
	
	@RequiresPermissions(PERMISSION_EDIT)
	@RequestMapping(value = "delete")
	public String delete(TestDataDs2 testDataDs2, RedirectAttributes redirectAttributes) {
		testDataDs2Service.delete(testDataDs2);
		String physicalDelete = testDataDs2.getPhysicalDelete().booleanValue()?" <span class='text-warning'>[注：物理删除]</span>":"";
		addMessage(redirectAttributes, MutiLangUtils.getLang("common.delete.success.param", "【业务数据表演示-数据源2】") + physicalDelete);
		return URL_ADMIN_REPAGE;
	}
	
	@RequiresPermissions(PERMISSION_EDIT)
	@RequestMapping(value = "deleteChecked")
	public String deleteChecked(TestDataDs2 testDataDs2, RedirectAttributes redirectAttributes) {
		testDataDs2Service.deleteList(testDataDs2);
		String physicalDelete = testDataDs2.getPhysicalDelete().booleanValue()?" <span class='text-warning'>[注：物理删除]</span>":"";
		addMessage(redirectAttributes, MutiLangUtils.getLang("common.delete.success.param", "【业务数据表演示-数据源2】") + " （共批量删除 " + testDataDs2.getCbRowDataIds().size() + " 条数据）" + physicalDelete);
		return URL_ADMIN_REPAGE;
	}
	
	@RequiresPermissions(PERMISSION_DBA)
	@RequestMapping(value = "truncateTable")
	public String truncateTable(TestDataDs2 testDataDs2, RedirectAttributes redirectAttributes) {
		testDataDs2Service.truncateTable(testDataDs2);
		addMessage(redirectAttributes, MutiLangUtils.getLang("common.delete.success.param", "【业务数据表演示-数据源2，<span class='text-warning'>物理清空</span>】"));
		return URL_ADMIN_REPAGE;
	}
	
	@RequiresPermissions(PERMISSION_DBA)
	@RequestMapping(value = "copy")
	public String copy(TestDataDs2 testDataDs2, RedirectAttributes redirectAttributes) {
		testDataDs2Service.copy(testDataDs2);
		addMessage(redirectAttributes, MutiLangUtils.getLang("common.copy.success.param", "【业务数据表演示-数据源2】"));
		return URL_ADMIN_REPAGE;
	}
	
	@RequiresPermissions(PERMISSION_DBA)
	@RequestMapping(value = "copyChecked")
	public String copyChecked(TestDataDs2 testDataDs2, RedirectAttributes redirectAttributes) {
		testDataDs2Service.copyList(testDataDs2);
		addMessage(redirectAttributes, MutiLangUtils.getLang("common.copy.success.param", "【业务数据表演示-数据源2】") + " （共批量复制 " + testDataDs2.getCbRowDataIds().size() + " 条数据）");
		return URL_ADMIN_REPAGE;
	}
	
	
}