package com.kaishengit.dao;

import com.kaishengit.entity.Node;
import com.kaishengit.util.DbHelp;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.util.List;

public class TopicDao {


    public List<Node> findAllNode() {
        String sql = "select * from t_node";
        return DbHelp.query(sql,new BeanListHandler<>(Node.class));

    }
}
