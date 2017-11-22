package com.cjj.service.system.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cjj.dao.system.ResourceMapper;
import com.cjj.po.Resource;
import com.cjj.service.system.ResourceService;
import com.cjj.vo.ResourceVo;

@Transactional
@Service("resourceService")
public class ResourceServiceImpl implements ResourceService{

	@Autowired
	private ResourceMapper resourceMapper;
	
	@Override
	public List<Resource> findAll() {
		return null;
	}

	@Override
	public int add(Resource t) {
		return resourceMapper.insert(t);
	}

	@Override
	public Resource findById(int id) {
		return resourceMapper.selectByPrimaryKey(id);
	}

	@Override
	public int edit(Resource t) {
		return resourceMapper.updateByPrimaryKeySelective(t);
	}

	@Override
	public int delete(int id) {
		List<Integer> idlist = new ArrayList<Integer>();
		idlist.add(id);
		findChilds(id, idlist);
		return resourceMapper.delete(idlist);
	}

	@Override
	public int deleteMore(String ids) {		
		List<Integer> idlist = new ArrayList<Integer>();
		String[] strArray = ids.split(",");
		for (int i = 0; i < strArray.length; i++) {
			idlist.add(Integer.parseInt(strArray[i]));
		}
		return resourceMapper.delete(idlist);
	}

	@Override
	public List<ResourceVo> findAllSp() {
		return resourceMapper.findAllSp();
	}
	
	/**
	 * 递归添加子树
	 * @param son
	 * @return
	 */
	private void findChilds(Integer id, List<Integer> idlist){
		List<Resource> resources = resourceMapper.findBySpId(id);
		for (Resource resource : resources) {
			findChilds(resource.getId(),idlist);
			idlist.add(resource.getId());
		}
	}

	@Override
	public List<ResourceVo> findFByPids(String pids) {
		return resourceMapper.findFByPids(pids);
	}

	@Override
	public List<ResourceVo> findByPids(String pids) {
		return resourceMapper.findByPids(pids);
	}
}
