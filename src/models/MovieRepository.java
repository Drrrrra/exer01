package models;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MovieRepository {
	

	@Autowired
	 SqlSessionTemplate template;

	
	public List<Map> getMoviePart(String aa){
		return template.selectList("movie.getMoviePart",aa);
	}
	
}
