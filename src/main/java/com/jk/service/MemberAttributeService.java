package com.jk.service;

import com.alibaba.fastjson.JSONObject;
import com.jk.model.MemberAttribute;
import org.springframework.stereotype.Service;

@Service
public interface MemberAttributeService {

    JSONObject queryMemberAttributeListPager();

    Integer addMemberAttribute(MemberAttribute memberAttribute);

    MemberAttribute queryMemberAttributeByid(MemberAttribute memberAttribute);

    Integer updateMemberAttribute(MemberAttribute memberAttribute);

    Integer deleteMemberAttribute(String ids);
}
