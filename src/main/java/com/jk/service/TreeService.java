package com.jk.service;

import com.jk.model.Tree;

import java.util.List;

/**
 * Created by Administrator on 2018/4/9 0009.
 */
public interface TreeService {
    List<Tree> queryTree(Integer selectedpid);
}
