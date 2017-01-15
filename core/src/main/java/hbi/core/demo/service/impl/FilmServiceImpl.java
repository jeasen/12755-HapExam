package hbi.core.demo.service.impl;

import java.util.List;

import javax.annotation.Resource;

import hbi.core.demo.dto.Film;
import hbi.core.demo.mapper.FilmMapper;
import hbi.core.demo.service.FilmService;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service("filmService")
public class FilmServiceImpl implements FilmService {

	@Resource
	public FilmMapper filmDao;

	@Override
	public List<Film> selectFileList(int id) {
		// TODO Auto-generated method stub
		if (id != 0) {
			id = 10 * (id - 1);
		}
		List<Film> list = filmDao.selectFileList(id);
		return list;
	}


	@Override
	public List<Film> selectById(int id) {
		// TODO Auto-generated method stub
		List<Film> selectByIdList = filmDao.selectById(id);
		return selectByIdList;
	}

	@Override
	public List<Film> selectFilmList() {
		List<Film> pageInfoList = filmDao.selectFilmList();
		if (pageInfoList == null) {
			System.out.println("没有数据");
			return null;
		}
		return pageInfoList;
	}

	// easyUi通过service层

	@Override
	public int delete(List<Film> list) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteId(int id) {
		// TODO Auto-generated method stub
		return filmDao.deleteid(id);
	}


	@Override
	public int addFilm(Film film) {
		// TODO Auto-generated method stub
		return filmDao.addFilm(film);
	}

}
