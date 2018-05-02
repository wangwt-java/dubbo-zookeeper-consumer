package com.jk.controller;

import com.jk.model.Review;
import com.jk.service.ReviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/review")
public class ReviewController {

    @Autowired
    private ReviewService reviewService;

    //跳转展示页面
    @RequestMapping("/toShowReview")
    public String toShowMemberRank(){
        return "WEB-INF/view/member/review/showReview";
    }

    //查询
    @RequestMapping("/queryReviewListPager")
    @ResponseBody
    public List<Review> queryReviewListPager(){
        List<Review> data = reviewService.queryReviewListPager();
        return data;
    }

    //跳转修改页面
    @RequestMapping("/toupdateReview")
    public String toupdateReview(){
        return "WEB-INF/view/member/review/updateReview";
    }

    //根据id查询
    @RequestMapping("/queryReviewById")
    public ModelAndView queryReviewById(Review review){
        ModelAndView mav = new ModelAndView();
        review = reviewService.queryReviewById(review);
        mav.addObject("review",review);
        mav.setViewName("WEB-INF/view/member/review/updateReview");
        return mav;
    }

    //修改
    @RequestMapping("/updateReview")
    @ResponseBody
    public Object updateReview(Review review){
        Integer i = reviewService.updateReview(review);
        return i;
    }

}
