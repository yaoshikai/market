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
        System.out.println("!!!!!!!");
        System.out.println("我是姚世凯");
        System.out.println("你对得起热巴吗=");
        System.out.println("狼图腾");
        List<Category> list = categoryService.queryAll();
        System.out.println("99999999");
        System.out.println("lallalallalal");
        System.out.println("00000000000000");
        return list;
    }


    public void m1(String s1, String s2) {
        System.out.println("this is ysk");
        System.out.println("this is wwy");
        System.out.println("my name is zhaocaihong");

        System.out.println("333333333333333333333");
        System.out.println("111111111111111111111111");
        System.out.println("22222222222222222222");
        System.out.println("33333333333333333333");
    }


}
