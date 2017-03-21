package cn.BlackHumour.TaxSys.core.service.impl;

import java.lang.reflect.Field;
import java.lang.reflect.ParameterizedType;
import java.util.List;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.BlackHumour.TaxSys.complain.dao.ComplainMapper;
import cn.BlackHumour.TaxSys.core.dao.BaseMapper;
import cn.BlackHumour.TaxSys.core.entity.Page;
import cn.BlackHumour.TaxSys.core.service.BaseService;
import cn.BlackHumour.TaxSys.dept.dao.DeptMapper;
import cn.BlackHumour.TaxSys.info.dao.InfoMapper;
import cn.BlackHumour.TaxSys.privilege.dao.PrivilegeMapper;
import cn.BlackHumour.TaxSys.reply.dao.ReplyMapper;
import cn.BlackHumour.TaxSys.reply.service.ReplyService;
import cn.BlackHumour.TaxSys.role.dao.RoleMapper;
import cn.BlackHumour.TaxSys.user.dao.UserMapper;

/**
 * 
 * 
 * 
 */
public class BaseServiceImpl<T> implements BaseService<T>{

	@Autowired
	protected BaseMapper<T> baseMapper;
	
	@Autowired
	protected UserMapper userMapper;
	
	
	@Autowired 
	protected RoleMapper roleMapper;
	
	@Autowired
	protected PrivilegeMapper privilegeMapper;
	
	@Autowired
	protected DeptMapper deptMapper;
	
	@Autowired
	protected InfoMapper infoMapper;
	
	@Autowired
	protected ReplyMapper replyMapper;
	
	@Autowired
	protected ComplainMapper complainMapper;
	
	@PostConstruct//在构造方法后，初化前执行
	private void initBaseMapper() throws Exception{
		//完成以下逻辑，需要对研发本身进行命名与使用规范
		//this关键字指对象本身，这里指的是调用此方法的实现类（子类）
		System.out.println("=======this :"+this);
		System.out.println("=======父类基本信息："+this.getClass().getSuperclass());
		System.out.println("=======父类和泛型的信息："+this.getClass().getGenericSuperclass());
		
		ParameterizedType type =(ParameterizedType) this.getClass().getGenericSuperclass();
		//获取第一个参数的class
		Class clazz = (Class)type.getActualTypeArguments()[0];
		System.out.println("=======class:"+clazz);
		//转化为属性名（相关的Mapper子类的引用名）Supplier  supplierMapper
		String localField = clazz.getSimpleName().substring(0,1).toLowerCase()+clazz.getSimpleName().substring(1)+"Mapper";
		System.out.println("=======localField:"+localField);
		//getDeclaredField:可以使用于包括私有、默认、受保护、公共字段，但不包括继承的字段
		Field field=this.getClass().getSuperclass().getDeclaredField(localField);
		System.out.println("=======field:"+field);
		System.out.println("=======field对应的对象:"+field.get(this));
		Field baseField = this.getClass().getSuperclass().getDeclaredField("baseMapper");
		
		System.out.println("=======baseField:"+baseField);
		System.out.println("=======baseField对应的对象:"+baseField.get(this));	
		//field.get(this)获取当前this的field字段的值。例如：Supplier对象中，baseMapper所指向的对象为其子类型SupplierMapper对象，子类型对象已被spring实例化于容器中		
		baseField.set(this, field.get(this));		
		System.out.println("========baseField对应的对象:"+baseMapper);

	}	
	
	
	@Override
	public int insert(T entity) throws Exception {
		// TODO Auto-generated method stub
		return baseMapper.insert(entity);
	}

	@Override
	public int update(T entity) {
		// TODO Auto-generated method stub
		return baseMapper.update(entity);
	}

	@Override
	public int delete(String id) {
		// TODO Auto-generated method stub
		return baseMapper.delete(id);
	}

	@Override
	public List<T> selectPageList(Page<T> page) {
		// TODO Auto-generated method stub
		return baseMapper.selectPageList(page);
	}

	@Override
	public Integer selectRecordsCount(Page<T> page) {
		// TODO Auto-generated method stub
		return baseMapper.selectRecordsCount(page);
	}

	@Override
	public T select(String id) {
		// TODO Auto-generated method stub
		return baseMapper.select(id);
	}


	@Override
	public List<T> selectAll() {
		// TODO Auto-generated method stub
		return baseMapper.selectAll();
	}


	@Override
	public int DeleteAll(String[] ids) {
		// TODO Auto-generated method stub
		return baseMapper.deleteAll(ids);
	}


	@Override
	public int insertRelation(String id, List<String> list) {
		// TODO Auto-generated method stub
		return baseMapper.insertRelation(id,list);
	}


	@Override
	public int deleteRelation(String id) {
		// TODO Auto-generated method stub
		return baseMapper.deleteRelation(id);
	}


	@Override
	public List<T> selectByKey(String key) {
		// TODO Auto-generated method stub
		return baseMapper.selectByKey(key);
	}

}
