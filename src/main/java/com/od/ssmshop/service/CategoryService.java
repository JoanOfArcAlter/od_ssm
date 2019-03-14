package com.od.ssmshop.service;

import java.util.List;

import com.od.ssmshop.pojo.Category;
import com.od.ssmshop.util.Page;

public interface CategoryService{
    int total();
    List<Category> list(Page page);
}