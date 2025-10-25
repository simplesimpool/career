package com.bookmarket.app.controller.sw;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bookmarket.app.dto.sw.BookSW;
import com.bookmarket.app.dto.sw.BookSellRequestSW;
import com.bookmarket.app.dto.sw.BookSmallCaregorySW;
import com.bookmarket.app.service.sw.BookSellRequestServiceSW;
import com.bookmarket.app.service.sw.BookServiceSW;
import com.bookmarket.app.service.sw.BookSmallCaregoryServiceSW;

import jakarta.servlet.http.HttpSession;

import com.bookmarket.app.service.sw.AdminServiceSW;


@Controller
public class RegisterBookControllerSW {

    @Autowired
    private BookSmallCaregoryServiceSW bsc;  
      
    @Autowired
    private BookServiceSW bss;
    
    @Autowired
    private AdminServiceSW ass;
    
    @Autowired
    private BookSellRequestServiceSW bsrs;

    @GetMapping("/publisher/registerBookForm")
    public String registerBookForm(HttpSession session, Model model) {
        
        // 1. 출판사 세션이 있는지만 확인 (값 자체는 JSP에서 꺼내 씀)
        Object pubId = session.getAttribute("pubId");
        
        if (pubId == null) {
            // 세션 없으면 로그인 페이지로 보내기
            return "redirect:/login/selectLoginForm";
        }

        // 2. 카테고리 목록 조회
        List<BookSmallCaregorySW> smallCategoryList = bsc.select();

        // 3. 모델에 담기
        model.addAttribute("smallCategoryList", smallCategoryList);

        return "/publisher/registerBookForm";
    }

    @GetMapping("/admin/bookApproveList")
    public String bookApprovalList(Model model) {
    	List<BookSW> bookList = ass.getlist(); //join된 북 리스트가져오기
    	model.addAttribute("bookList" ,bookList);
        return "/admin/bookApproveList";
    }

    
    @PostMapping("/publisher/requestBook")
    public String registerBook(
        @ModelAttribute BookSW book,
        @ModelAttribute BookSellRequestSW bookSellRequest,
        @ModelAttribute BookSmallCaregorySW bookSmallCaregory,
        @RequestParam("book_img") MultipartFile bookImg,
        @RequestParam("bsrCnt") int bsrCnt,
        HttpSession session,
        RedirectAttributes redirectAttrs
    ) {
        try {
            // 1. 세션에서 출판사 ID 가져오기
            int pubId = (Integer) session.getAttribute("pubId");

            // 2. 이미지 저장 처리
            String uploadDir = "C:/spring/sts4Src/bookmarket/src/main/webapp/resources/sw/bookImg";
            String originalFilename = bookImg.getOriginalFilename();
            String uuid = UUID.randomUUID().toString();
            String newFileName = uuid + "_" + originalFilename;

            File saveFile = new File(uploadDir, newFileName);
            bookImg.transferTo(saveFile);

            // 3. Book 객체에 이미지명 설정
            book.setBookImg(newFileName);

            // 4. BookSellRequest에 정보 설정
            bookSellRequest.setPubId(pubId);
            bookSellRequest.setBsrCnt(bsrCnt);
            bookSellRequest.setBsrYn("n");
            bookSellRequest.setBsrDate(new Date());

            // 5. 묶어서 서비스로 전달
            Map<String, Object> map = new HashMap<>();
            map.put("pubId", pubId);
            map.put("book", book);
            map.put("bsr", bookSellRequest);
            map.put("bsc", bookSmallCaregory);

            int result = bss.insertBook(map);

            // 6. 결과에 따라 메시지 전달
            if (result > 0) {
                redirectAttrs.addFlashAttribute("msg", "도서 등록 신청이 완료되었습니다.");
            } else {
                redirectAttrs.addFlashAttribute("error", "도서 등록에 실패했습니다.");
                return "redirect:/publisher/registerBookForm";
            }

        } catch (Exception e) {
            e.printStackTrace();
            redirectAttrs.addFlashAttribute("error", "도서 등록 중 오류가 발생했습니다.");
            return "redirect:/publisher/registerBookForm";
        }

        // 7. 무조건 등록 폼으로 리다이렉트
        return "redirect:/publisher/myRequest";
    }

    
    @PostMapping("/admin/approveBook")
    public String approveBook(@RequestParam("bsrId") int bsrId, RedirectAttributes redirectAttrs) {
        try {
            int result = ass.approveBook(bsrId);  // 서비스 호출
            if (result > 0) {
                redirectAttrs.addFlashAttribute("msg", "도서가 성공적으로 승인되었습니다.");
            } else {
                redirectAttrs.addFlashAttribute("error", "승인에 실패했습니다.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            redirectAttrs.addFlashAttribute("error", "오류 발생: " + e.getMessage());
        }
        return "redirect:/admin/bookApproveList";
    }
    
    @PostMapping("/admin/rejectBook")
    public String rejectBook(
        @RequestParam("bsrId") int bsrId,
        @RequestParam("reason") String reason,  
        RedirectAttributes redirectAttrs
    ) {
        try {
            Map<String, Object> param = new HashMap<>();
            param.put("bsrId", bsrId);
            param.put("reason", reason);         // ✅ key 도 일치시킴

            int result = ass.rejectBook(param);  // Service 호출

            if (result > 0) {
                redirectAttrs.addFlashAttribute("msg", "도서가 반려 처리되었습니다.");
            } else {
                redirectAttrs.addFlashAttribute("error", "반려 처리에 실패했습니다.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            redirectAttrs.addFlashAttribute("error", "오류 발생: " + e.getMessage());
        }

        return "redirect:/admin/bookApproveList";
        
        
    }
    
    @GetMapping("/publisher/myRequest")
    public String myRequset(HttpSession session, Model model) {
        Integer pubId = (Integer) session.getAttribute("pubId");
        if (pubId == null) {
            return "redirect:/publisher/login";  // 로그인 안 되어 있으면 로그인 페이지로
        }

        List<Map<String, Object>> myRequest = bsrs.myRequests(pubId);
        model.addAttribute("myRequest", myRequest);
        return "/publisher/myRequest";  
    }

}