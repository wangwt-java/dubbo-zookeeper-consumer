package com.jk.service;

import com.alibaba.fastjson.JSONObject;
import com.jk.model.MemberRank;
import org.springframework.stereotype.Service;

@Service
public interface MemberRankService {
    JSONObject queryMemberRankListPager();

    Integer addMemberRank(MemberRank memberrank);

    MemberRank queryMemberRankById(MemberRank memberrank);

    Integer updateMemberRank(MemberRank memberrank);

    Integer deleteMemberRank(String ids);
}
