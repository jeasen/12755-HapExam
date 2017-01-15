package hbi.core.demo.controllers;

import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import com.hand.hap.system.controllers.BaseController;
import hbi.core.demo.dto.Film;
import hbi.core.demo.service.FilmService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("/film")
public class FilmControll   {

	@Resource
	private FilmService filmService;

	@RequestMapping("/selectList")
//	public @ResponseBody PageFilm selectList(Model model, HttpServletRequest request) {
    public @ResponseBody List<Film> selectList(Model model, HttpServletRequest request) {
		String pageNumStr = request.getParameter("index");
		int pageNum = Integer.parseInt(pageNumStr != null ? pageNumStr : "1");

		String pageSize = request.getParameter("size");
		int pageSizeNum = Integer.parseInt(pageSize != null ? pageSize : "123");

		PageHelper.startPage(pageNum, 10);
		List<Film> films = filmService.selectFilmList();
//		PageInfo<Film> pageInfo = new PageInfo<>(films);

//		PageFilm pageFilm = new PageFilm(films, pageInfo);

		return films;
	}

	@RequestMapping("/selectAllList")
	public @ResponseBody List<Film> selectAllList(Model model, HttpServletRequest request) {

		List<Film> films = filmService.selectFilmList();
//		PageInfo<Film> pageInfo = new PageInfo<>(films);
//		PageFilm pageFilm = new PageFilm(films, pageInfo);

		return films;
	}

	@RequestMapping("/addFilm")
	public String addFilm(HttpServletRequest requests) {
		System.out.println("到了add Control");
		String title = requests.getParameter("title");
		String desc = requests.getParameter("desc");
		String lang = requests.getParameter("lang");

		Film film = new Film();
		film.setTitle(title);
		film.setDescription(desc);
		film.setName(lang);
		filmService.addFilm(film);

		return "redirect:/showlist.html";
	}

	@RequestMapping("/delete")
	public String deleteList(HttpServletRequest requests) {
		System.out.println("到了	deleteList");
		String getId = requests.getParameter("id");
		System.out.println("要删除的ID" + getId);

		filmService.deleteId(Integer.parseInt(getId));

		return "redirect:/showlist.html";
	}

	@RequestMapping("/edit")
	public String editList(HttpServletRequest requests) {
		System.out.println("到了	editList");
		String getId = requests.getParameter("id");
		System.out.println(getId + "------------------------------------");
		return "redirect:/showlist.html";
	}

}
