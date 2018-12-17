package com.baizhi.ysk.service;

import com.baizhi.ysk.entity.Product;

import java.util.List;

public interface ProductService {
    List<Product> queryAll(Integer categoryId);
}
