package com.baizhi.ysk.controller;

import com.baizhi.ysk.entity.Product;
import com.baizhi.ysk.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("product")
public class ProductController {
    @Autowired
    private ProductService productService;

    @RequestMapping("queryAllProductByCategoryId")
    public List<Product> queryAll(Integer categoryId) {
        List<Product> list = productService.queryAll(categoryId);
        return list;
    }
}
