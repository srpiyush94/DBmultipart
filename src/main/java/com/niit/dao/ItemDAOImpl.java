  package com.niit.dao;
import java.io.IOException;
import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.niit.model.Item;


@SuppressWarnings("unused")
@Repository
public class ItemDAOImpl implements ItemDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(ItemDAOImpl.class);

	
	@Autowired 
	private SessionFactory sessionFactory;
	
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	

	public boolean addItem(Item item) {
		 Session session=sessionFactory.getCurrentSession();
		   Transaction trans=session.beginTransaction();
		 //  item.setImage(bs);
		   session.saveOrUpdate(item);
		   trans.commit();
		   logger.info("Item saved successfully, Item Details="+item.getId()+""+item.getName());
		return false;
		}
	
	
	public void updateItem(Item item) {
		Item itemToUpdate = getItem(item.getId());
		itemToUpdate.setName(item.getName());
		itemToUpdate.setDescription(item.getDescription());
		itemToUpdate.setPrice(item.getPrice());		
		 Session session=sessionFactory.getCurrentSession();
		   Transaction trans=session.beginTransaction();
		   session.saveOrUpdate(item);
		   trans.commit();
		   logger.info("Item updated successfully, Item Details="+item);
	
         
    }
		

	public Item getItem(int id) {
		
		   Session session=sessionFactory.getCurrentSession();
		   Transaction trans=session.beginTransaction();
		   Item item=(Item)session.get(Item.class, id);
		   System.out.println("hello");
		   trans.commit();
		   logger.info("Item loaded successfully, Item details="+item);
	        return item;
	        
	}

	public void deleteItem(int id) {
		Session session=sessionFactory.openSession();
		Transaction trans=session.beginTransaction();
		 Item item = getItem(id);
	      /*  if (item != null)*/
	        session.delete(item);
	        logger.info("Item deleted successfully, Item details="+item);
	
	        trans.commit();
	}

	@SuppressWarnings("unchecked")
	public List<Item> getAllItems() {
		Session session=sessionFactory.getCurrentSession();
		   Transaction trans=session.beginTransaction();
		 List<Item> list=  session.createQuery("from Item").list();
		   trans.commit();
		   /*logger.info("Item List::"+list);*/
		   return list;
		   
	}

}
