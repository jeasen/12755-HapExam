package hbi.core.demo.dto;

import com.hand.hap.system.dto.BaseDTO;

import javax.persistence.Table;

@Table(name = "hap_film")
public class Film extends BaseDTO {
	private String film_id;
	private String title;
	private String description;
	private String name;
	public String getFilm_id() {
		return film_id;
	}
	public void setFilm_id(String film_id) {
		this.film_id = film_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	
	
}
