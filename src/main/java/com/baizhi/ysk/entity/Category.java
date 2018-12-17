package com.baizhi.ysk.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import tk.mybatis.mapper.annotation.KeySql;

import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "super_category")
public class Category implements Serializable {
    @Id
    @KeySql(useGeneratedKeys = true)
    private Integer categoryId;
    private String categoryName;
}
