package com.baizhi.ysk.serviceimpl;

import com.baizhi.ysk.entity.Category;
import com.baizhi.ysk.mapper.CategoryMapper;
import com.baizhi.ysk.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class CategoryServiceImpl implements CategoryService {
    @Autowired
    private CategoryMapper categoryMapper;

    @Override
    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    public List<Category> queryAll() {
        List<Category> list = categoryMapper.selectAll();
        return list;
    }
}
