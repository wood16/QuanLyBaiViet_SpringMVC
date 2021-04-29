package com.laptrinhjavaweb.service.impl;


import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.laptrinhjavaweb.converter.NewConverter;
import com.laptrinhjavaweb.dto.NewDTO;
import com.laptrinhjavaweb.entity.CategoryEntity;
import com.laptrinhjavaweb.entity.NewEntity;
import com.laptrinhjavaweb.repository.CategoryRepository;
import com.laptrinhjavaweb.repository.NewRepository;
import com.laptrinhjavaweb.service.INewService;

@Service
public class NewService implements INewService {
	
	@Autowired
	private NewRepository newRepository;
	
	@Autowired
	private CategoryRepository categoryRepository;
	
	@Autowired
	private NewConverter newConverter;
		
	@Override
	public List<NewDTO> findAll(Pageable pageable) {
		List<NewDTO> models = new ArrayList<NewDTO>();
		List<NewEntity> entities = newRepository.findAll(pageable).getContent();
		for(NewEntity items : entities) {
			NewDTO newDTO = newConverter.toDTO(items);
			models.add(newDTO);
		}
		return models;
	}

	@Override
	public int getTotalItem() {
		return (int) newRepository.count();
	}

	@Override
	public NewDTO findById(long id) {
		NewEntity entity = newRepository.findOne(id);
		return newConverter.toDTO(entity);
	}

	@Override
	@Transactional
	public NewDTO save(NewDTO newDto) {
		CategoryEntity category = categoryRepository.findOneByCode(newDto.getCategoryCode());
		NewEntity newEntity = new NewEntity();
		
		// Update new
		if(newDto.getId() != null) {
			NewEntity oldNew = newRepository.findOne(newDto.getId());
			oldNew.setCategory(category);
			newEntity = newConverter.toEntity(oldNew, newDto);
		}
		// Add new
		else {
			newEntity = newConverter.toEntity(newDto);
			newEntity.setCategory(category);
		}
		return newConverter.toDTO(newRepository.save(newEntity));
		
	}

}
