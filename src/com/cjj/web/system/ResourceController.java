package com.cjj.web.system;

import java.util.List;

import net.sf.json.JSONSerializer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cjj.core.common.BaseController;
import com.cjj.po.Resource;
import com.cjj.service.system.ResourceService;
import com.cjj.vo.ResourceVo;

@Controller
@RequestMapping("/resourceController")
public class ResourceController extends BaseController{
	
	@Autowired
	private ResourceService resourceService;
	
	/**
	 * 资源页面
	 * @return
	 */
	@RequestMapping("/list")
	public String list(){
		return "/system/resourcemanage/resource";
	}
	
	/**
	 * 查询资源
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/findresource",produces="application/json")
	public Object findresource(){
		List<ResourceVo> list = resourceService.findAllSp();
		ResourceVo resource = new ResourceVo();
		resource.setId(0);
		resource.setResourcesuperiorid(-1);
		resource.setResourcename("资源目录");
		list.add(resource);
		return JSONSerializer.toJSON(list);
	}
	
	/**
	 * 新增资源
	 * @param bo
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/add",produces="application/json")
	public Object add(Resource bo){
		bo.setIsvalid(1);
		int i = resourceService.add(bo);
		String msg = i > 0 ? "新增成功！" : "新增失败！";
		return JSONSerializer.toJSON("{'msg':'"+ msg +"'}");
	}
	
	/**
	 * 修改资源
	 * @param bo
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/edit",produces="application/json")
	public Object edit(Resource bo){
		int i = resourceService.edit(bo);
		String msg = i > 0 ? "修改成功！" : "修改失败！";
		return JSONSerializer.toJSON("{'msg':'"+ msg +"'}");
	}
	
	/**
	 * 删除单个资源
	 * @param id
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/delete",produces="application/json")
	public Object delete(Integer id){
		int i = resourceService.delete(id);
		String msg = i > 0 ? "删除成功！" : "删除失败！";
		return JSONSerializer.toJSON("{'msg':'"+ msg +"'}");
	}
	
	/**
	 * 删除多个资源
	 * @param ids
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/deletemore",produces="application/json")
	public Object deletemore(String ids){
		int i = resourceService.deleteMore(ids);
		String msg = i > 0 ? "删除成功！" : "删除失败！";
		return JSONSerializer.toJSON("{'msg':'"+ msg +"'}");
	}
}
