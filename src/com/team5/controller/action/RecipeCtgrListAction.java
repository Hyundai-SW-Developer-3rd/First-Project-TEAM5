package com.team5.controller.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.team5.dao.RecipeDAO;
import com.team5.vo.RecipeVO;


/**
 * @author    : seop
 * @Date      : 2022. 3. 15.
 * @ClassName : RecipeCtgrListAction
 * @Comment   : 카테고리별 레시피 조회 조회
 */
public class RecipeCtgrListAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String url = "recipe/recipeCtgrList.jsp";
		
		/* 키워드 or 검색어 받아오기 */
		String keyword = request.getParameter("keyword");
		String category = request.getParameter("category");
		
		RecipeDAO recipeDAO = RecipeDAO.getInstance();
		/* 카테고리 또는 검색어를 통해서 레시피 조회 @seop */
		List<RecipeVO> recipeList = recipeDAO.selectRecipeList(category, keyword, 1, 12); // 처음엔 1페이지를 기본으로 가져옴
		
		request.setAttribute("keywordAjax", keyword);
		request.setAttribute("categoryAjax",category);
		request.setAttribute("recipeList", recipeList);
		
		request.getRequestDispatcher(url).forward(request, response);
	}
}