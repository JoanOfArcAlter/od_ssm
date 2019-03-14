package com.od.ssmshop.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.od.ssmshop.mapper.CategoryMapper;
import com.od.ssmshop.pojo.Category;
import com.od.ssmshop.service.CategoryService;
import com.od.ssmshop.util.Page;

@Service
public class CategoryServiceImpl  implements CategoryService {
    @Autowired
    CategoryMapper categoryMapper;
    @Override
    public List<Category> list(Page page) {
        return categoryMapper.list(page);
    }
 
    @Override
    public int total() {
        return categoryMapper.total();
    }
}