package models;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ShowtimeDao {
	

	@Autowired
	 SqlSessionTemplate template;
	
	public List<String> getAllTitle(){
		return template.selectList("showtime.getAllTitle");
	}
	
	public List<Map> getTimeByTitle(String title){
		return template.selectList("showtime.getTimeByTitle", title);
	}

}
