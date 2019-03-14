package com.od.ssmshop.mapper;
  
import java.util.List;

import com.od.ssmshop.pojo.Category;
import com.od.ssmshop.util.Page;
 
public interface CategoryMapper {
    public List<Category> list(Page page);
    
    public int total();
}