package com.baizhi.ysk.serviceimpl;

import com.baizhi.ysk.entity.Product;
import com.baizhi.ysk.mapper.ProductMapper;
import com.baizhi.ysk.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class ProductServiceImpl implements ProductService {
    @Autowired
    private ProductMapper productMapper;

    @Override
    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    public List<Product> queryAll(Integer categoryId) {
        Product p = new Product();
        p.setProductId(categoryId);
        List<Product> list = productMapper.select(p);
        return list;
    }
}
