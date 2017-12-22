package com.order.dao;

import com.order.model.Comment;

import java.util.List;

/**
 * Created by Tao on 2017/12/12.
 */
public interface CommentDao {
    public int add(Comment comment);
    public List<Comment> getByCustomer(int customer_id);
    public List<Comment> getByShop(int shop_id);
    public int updateResponse(Comment comment);
}
