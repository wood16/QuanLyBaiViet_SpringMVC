package com.laptrinhjavaweb.converter;

import org.springframework.stereotype.Component;

import com.laptrinhjavaweb.dto.NewDTO;
import com.laptrinhjavaweb.entity.NewEntity;

@Component
public class NewConverter {
	public NewDTO toDTO(NewEntity entity) {
		NewDTO result = new NewDTO();
		result.setId(entity.getId());
		result.setTitle(entity.getTitle());
		result.setShortDescription(entity.getShortDescription());
		result.setContent(entity.getContent());
		result.setThumbnail(entity.getThumbnail());
		result.setCategoryCode(entity.getCategory().getCode());
		return result; 
	}
	
	public NewEntity toEntity(NewDTO newDTO) {
		NewEntity result = new NewEntity();
		result.setTitle(newDTO.getTitle());
		result.setShortDescription(newDTO.getShortDescription());
		result.setContent(newDTO.getContent());
		result.setThumbnail(newDTO.getThumbnail());
		return result; 
	}
	
	public NewEntity toEntity(NewEntity result, NewDTO newDTO) {
		result.setTitle(newDTO.getTitle());
		result.setShortDescription(newDTO.getShortDescription());
		result.setContent(newDTO.getContent());
		result.setThumbnail(newDTO.getThumbnail());
		return result; 
	}
}
