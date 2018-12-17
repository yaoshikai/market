package com.baizhi.ysk.controller;

import com.baizhi.ysk.entity.Category;
import com.baizhi.ysk.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("category")
public class CategoryController {
    @Autowired
    private CategoryService categoryService;

    @RequestMapping("queryAllCategory")
    public List<Category> queryAllCategory() {
        System.out.println("那些年我们一起追过的女孩");
        System.out.println("一起追过的哪个女孩");
        System.out.println("苍井空");
        System.out.println("我是姚世凯");
        List<Category> list = categoryService.queryAll();
        return list;
    }
}
