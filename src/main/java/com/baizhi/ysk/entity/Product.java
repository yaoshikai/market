package com.baizhi.ysk.entity;

import com.alibaba.fastjson.annotation.JSONField;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;
import tk.mybatis.mapper.annotation.KeySql;

import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "super_product")
public class Product implements Serializable {
    @Id
    @KeySql(useGeneratedKeys = true)
    private Integer productId;
    private String productName;
    private String picPath;
    private Double price;
    private String pdescribe;
    private String content;
    private Integer isQuality;
    private String brand;
    private Integer saleCount;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @JSONField(format = "yyyy-MM-dd")
    private Date saleTime;
}
