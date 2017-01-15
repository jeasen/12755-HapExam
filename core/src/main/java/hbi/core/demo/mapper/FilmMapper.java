package hbi.core.demo.mapper;

import java.util.List;

import hbi.core.demo.dto.Film;
import org.apache.ibatis.annotations.Param;


public interface FilmMapper {
	
	public List<Film> selectFileList(@Param("id") Integer id);
	
	//统计film_id
	public int countNum();
	
	//根据id查询数据
	public List<Film> selectById(@Param("id") Integer id);
	
	//查询所有的数据，没有limit的方法
	public List<Film> selectFilmList();
	//批量删除
	public int delete(List<Film> list);
	
	public int deleteid(int id);
	
	public int addFilm(Film film);
}