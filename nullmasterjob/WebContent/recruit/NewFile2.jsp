<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import ="web.bean.dao.SearchDAO" %>
<%@page import ="web.bean.vo.AreaVO" %>
<%@page import ="web.bean.vo.JobSubVO" %>
<%@page import ="web.bean.vo.JobDetailVO" %>
<%@page import ="web.bean.vo.JobVO" %>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<%
	SearchDAO serch = SearchDAO.getInstance();
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>	
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="table style.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script type="text/javascript" src="jquery.tinyscrollbar.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
	  $("#area_select").click(function(){
	    $("#area_select_on").toggle(), $("#job_catagory_on").hide();
	  });
	
	  $("#job_select").click(function(){
		    $("#job_catagory_on").toggle(), $("#area_select_on").hide();
		  });
	  $("#Search_P input[type='hidden']").each(function(i,item){

		    if(item.value != ""){

		        console.log(item.value)

		    }

		}); 
});
	</script>
	<script>
	
	function get_area(ano) {
		$.ajax({
			type :"post",
			url : "area2.jsp",
			data : { no : ano }, 
			success : test1
		});
	}
	function test1(data){	$("#area2").html(data);		}
	
	function get_job(jsno) {
			 $.ajax({
			type :"post",
			url : "job2.jsp",
			data : { jsno : jsno }, 
			success : test2
		});
			
	function test2(data){	$("#job1").html(data);	}
	}
	
	function goSubmit() {
		$("#get_area_form").submit;	}
	</script>



<body>
    <form id='get_area_form' name="search_panel_form" action="Result.jsp" method="post" onSubmit="goSubmit()">
        <fieldset>
            <div class="wrap_main_panel">
                <div class="default_option">
    <!-- btn_open_layer 클릭 시 부모 search_option 에 open 클래스 추가 -->
<div class="search_option recently_search_option" >
    <div class="layer_option">
        <div class="wrap_scroll_layer">
            <div class="layer_inner">
                <div class="wrap_title"><strong class="title">나의 검색 / 메일관리</strong>
                    <button type="button" class="btn_help" title="도움말">도움말</button>
                    <div class="sri_tooltip size_wide" style="top:30px; left:106px; width:238px; display: none;">
                        <span class="tail_top_left"></span>
                        <div class="tooltip_inner txt_left">
                            <strong class="title">최대 20건 관리기능</strong>
                            <p class="txt">최근 나의 검색 최대 10건 자동 노출<br>저장된 나의 검색 최대 10건 노출</p>
                        </div>
                        <button type="button" class="btn_close_tooltip" ><span class="blind">닫기</span></button>
                    </div>
                </div>
                <div class="wrap_box_sort">
                    <div class="inbox_sort">
                        <span class="sort on">
                            <button type="button" class="track_event">최근 나의 검색(<em>0</em>)</button>
                        </span>
                        <span class="sort" >
                            <button type="button" class="track_event">저장된 나의 검색(<em>0</em>)</button>
                        </span>
                        <span class="sort">
                            <button type="button" class="track_event">전체(<em>0</em>)</button>
                        </span>
                    </div>
                    <div class="inbox_right">
                        <span class="sort_txt">
                            저장 조건명
                        </span>
                        <div class="sri_select box_edit">
                            <label for="edit_word" class="blind">나의 검색 조건 수정</label>
                            <input type="text"class="sri_input" maxlength="15">
                            <button type="button" class="btn_option btn_title_search track_event"><span>검색</span></button>
                        </div>
                        <div class="sri_select">
                            <span class="sri_input3">
                                <select title="" style="width:96px" class="track_event" >
                                    <option value="3">3개 보기</option>
                                    <option value="5">5개 보기</option>
                                    <option value="10">10개 보기</option>
                                </select>
                            </span>
                        </div>
                    </div>
                </div>
                <div id="mySearchLHistory">
                </div>
            </div>
            <button type="button" class="closeDefaultOptionLayer btn_close">닫기</button>
        </div>
    </div>

</div>
</div>
<div class="main_option ">
    <ul class="tab_section">
                <li class="area_section on">
            <button type="button" class="btn_area btn_open_layer" id="area_select">
                <span class="input_placeholder filter_selected">지역</span>
                <span class="input_text"></span>
            </button>
        </li>
                <li class="job_category_section">
            <button type="button" class="btn_job_category btn_open_layer" id="job_select">
                <span class="input_placeholder">직업 선택</span>
                <span class="input_text"></span>
            </button>
        </li>
                <li class="keyword_section">
            <button type="button" class="btn_keyword btn_open_layer keyword">
                <span class="input_placeholder">검색어 입력</span>
                <span class="input_text"></span>
            </button>
        </li>
    </ul>
        <div class="wrap_section_contents">
                    <div class="option_content area_section on" id="area_select_on">
                <h2 class="blind">지역 선택</h2>
<div class="select_keyword">
    <div class="wrap_auto_keyword">
    <span class="ipt_keyword">
        <label for="area_ipt_keyword" class="blind">지역명 입력</label>
        <input type="text" name="loc" id="area_search"placeholder="지역명 입력" autocomplete="">
        <button type="button" class="btn_delete">삭제</button>
    </span>
    <div class="wrap_result has_result" style="display: none;">
        <div class="wrap_scroll" style="height: 183px;">
            <div class="scrollbar disable" style="height: 0px;"><div class="track" style="height: 0px;"><div class="thumb"><div class="end"></div></div></div></div>
            <div class="viewport">
                <div class="overview" style="top: 0px;">
                    <ul class="list_keyword"></ul>
                </div>
            </div>
        </div>
        <div class="area_btn">
            <button type="button" class="btn_close">닫기</button>
        </div>
    </div>
    <div class="wrap_result no_result" style="display: none;">
        <p class="txt">검색결과가 없습니다.</p>
        <div class="area_btn">
            <button type="button" class="btn_close">닫기</button>
        </div>
    </div>
</div>
    <div class="recently_keyword">
    <strong class="tit">최근 본</strong>
    </div>
</div>
<!-- 카테고리 depth -->
<div class="wrap_depth_category">
    <h4 class="blind">카테고리 선택</h4>
    <div class="wrap_scroll depth1" style="height: 245px;">
        <div class="scrollbar" style="height: 245px;"><div class="track" style="height: 245px;"><div class="thumb" id = "thumb1"style="top: 4.7025px; height: 115.211px;"><div class="end"></div></div></div></div>
        <div class="viewport">
            <div class="overview" style="top: -10px;">
                <ul id="area_ul">
                        <li class="depth1_btn_wrapper selected on"><button type="button" class="depth1_btn_1" id=""onclick="get_area(1);" ><span class="txt" id='seoul'>서울 </span><span class="count">(39,862)</span></button></li>
                        <li class="depth1_btn_wrapper " ><button type="button" class="depth1_btn_2" onclick="get_area(2);"><span class="txt">경기 </span><span class="count">(23,595)</span></button></li>
                        <li class="depth1_btn_wrapper " ><button type="button" class="depth1_btn_3" onclick="get_area(3);"><span class="txt">인천 </span><span class="count">(3,926)</span></button></li>
                        <li class="depth1_btn_wrapper " ><button type="button" class="depth1_btn_4" onclick="get_area(4);"><span class="txt">부산 </span><span class="count">(6,362)</span></button></li>
                        <li class="depth1_btn_wrapper " ><button type="button" class="depth1_btn_5" onclick="get_area(5);"><span class="txt">대구 </span><span class="count">(4,317)</span></button></li>
                        <li class="depth1_btn_wrapper " ><button type="button" class="depth1_btn_6" onclick="get_area(6);"><span class="txt">광주 </span><span class="count">(1,448)</span></button></li>
                        <li class="depth1_btn_wrapper " ><button type="button" class="depth1_btn_7" onclick="get_area(7);"><span class="txt">대전 </span><span class="count">(2,637)</span></button></li>
                        <li class="depth1_btn_wrapper " ><button type="button" class="depth1_btn_8" onclick="get_area(8);"><span class="txt">울산 </span><span class="count">(1,291)</span></button></li>
                        <li class="depth1_btn_wrapper " ><button type="button" class="depth1_btn_9" onclick="get_area(9);"><span class="txt">세종 </span><span class="count">(503)</span></button></li>
                        <li class="depth1_btn_wrapper " ><button type="button" class="depth1_btn_10" onclick="get_area(10);"><span class="txt">강원 </span><span class="count">(942)</span></button></li>
                        <li class="depth1_btn_wrapper " ><button type="button" class="depth1_btn_11" onclick="get_area(11);"><span class="txt">경남 </span><span class="count">(3,597)</span></button></li>
                        <li class="depth1_btn_wrapper " ><button type="button" class="depth1_btn_12" onclick="get_area(12);"><span class="txt">경북 </span><span class="count">(2,376)</span></button></li>
                        <li class="depth1_btn_wrapper " ><button type="button" class="depth1_btn_13" onclick="get_area(13);"><span class="txt">전남 </span><span class="count">(837)</span></button></li>
                        <li class="depth1_btn_wrapper " ><button type="button" class="depth1_btn_14" onclick="get_area(14);"><span class="txt">전북 </span><span class="count">(1,190)</span></button></li>
                        <li class="depth1_btn_wrapper " ><button type="button" class="depth1_btn_15" onclick="get_area(15);"><span class="txt">충남 </span><span class="count">(3,241)</span></button></li>
                        <li class="depth1_btn_wrapper " ><button type="button" class="depth1_btn_16" onclick="get_area(16);"><span class="txt">충북 </span><span class="count">(2,533)</span></button></li>
                        <li class="depth1_btn_wrapper " ><button type="button" class="depth1_btn_17" onclick="get_area(17);"><span class="txt">제주 </span><span class="count">(790)</span></button></li>
                        <li class="depth1_btn_wrapper " id="depth1_btn_117000"><button type="button" class="depth1_btn_117000"><span class="txt">전국 </span><span class="count">(419)</span></button></li>
                    
                </ul>
            </div>
        </div>
    </div>
    <div class="wrap_scroll depth_check" style="height: 245px;">
        <div class="scrollbar" style="height: 245px;"><div class="track" style="height: 245px;"><div class="thumb" style="top: 0px; height: 179.179px;"><div class="end"></div></div></div></div>
        <div class="viewport">
            <div class="overview" style="top: 0px;">
                <div class="wrap_list_check" >
                    <ul class="list_check" id="area2" style="display: block;">
                            <li>
                                <div class="sri_input3">
                                    <input type="checkbox" id="loc_mcd_101000" name="loc_mcd[]">
                                    <label for="loc_mcd_101000"><span class="txt">서울전체</span></label>
                                </div>
                            </li>
                            <li>
                                <div class="sri_input3">
                                    <input type="checkbox" id="loc_cd_101010" name="loc_cd">
                                    <label for="loc_cd_101010"><span class="txt">강남구</span><span class="count"> (13,201)</span></label>
                                </div>
                            </li>
                            <li>
                                <div class="sri_input3">
                                    <input type="checkbox" id="loc_cd_101020" name="loc_cd" >
                                    <label for="loc_cd_101020"><span class="txt">강동구</span><span class="count"> (848)</span></label>
                                </div>
                            </li>
                            <li>
                                <div class="sri_input3">
                                    <input type="checkbox" id="loc_cd_101030" name="loc_cd" value="101030">
                                    <label for="loc_cd_101030"><span class="txt">강북구</span><span class="count"> (368)</span></label>
                                </div>
                            </li>
                            <li>
                                <div class="sri_input3">
                                    <input type="checkbox" id="loc_cd_101040" name="loc_cd" value="101040">
                                    <label for="loc_cd_101040"><span class="txt">강서구</span><span class="count"> (1,425)</span></label>
                                </div>
                            </li>
                            <li>
                                <div class="sri_input3">
                                    <input type="checkbox" id="loc_cd_101050" name="loc_cd" value="101050">
                                    <label for="loc_cd_101050"><span class="txt">관악구</span><span class="count"> (901)</span></label>
                                </div>
                            </li>
                            <li>
                                <div class="sri_input3">
                                    <input type="checkbox" id="loc_cd_101060" name="loc_cd" value="101060">
                                    <label for="loc_cd_101060"><span class="txt">광진구</span><span class="count"> (832)</span></label>
                                </div>
                            </li>
                            <li>
                                <div class="sri_input3">
                                    <input type="checkbox" id="loc_cd_101070" name="loc_cd" value="101070">
                                    <label for="loc_cd_101070"><span class="txt">구로구</span><span class="count"> (2,180)</span></label>
                                </div>
                            </li>
                    </ul>
           
                    <div class="area_btn">
                        <button type="button" class="btn_all_category" data-logging-flow="area">지역 펼쳐보기</button>
                        <button type="button" class="btn_reset">지역 초기화</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>	
</div>
            <div class="option_content area_section" id="job_catagory_on">
                <h2 class="blind">직업 선택</h2>
<div class="select_keyword">
    <div class="wrap_auto_keyword">
    <span class="ipt_keyword">
        <label for="job_category_ipt_keyword" class="blind">직업(직종)명 입력</label>
        <input type="text" name="cat" id="job_category_ipt_keyword" placeholder="직업(직종)명 입력" autocomplete="off">
        <button type="button" class="btn_delete">삭제</button>
    </span>
    <div class="wrap_result has_result" id="autocomplete_has_result" style="display: none;">
        <div class="wrap_scroll" style="height: 183px;">
            <div class="scrollbar disable" style="height: 0px;"><div class="track" style="height: 0px;"><div class="thumb"><div class="end"></div></div></div></div>
            <div class="viewport">
                <div class="overview" style="top: 0px;">
                    <ul class="list_keyword"></ul>
                </div>
            </div>
        </div>
        <div class="area_btn">
            <button type="button" class="btn_close">닫기</button>
        </div>
    </div>
    <div class="wrap_result no_result" id="autocomplete_no_result" style="display: none;">
        <p class="txt">검색결과가 없습니다.</p>
        <div class="area_btn">
            <button type="button" class="btn_close">닫기</button>
        </div>
    </div>
</div>
 </div>
<!-- 카테고리 depth -->
<div class="wrap_depth_category">
    <h4 class="blind">카테고리 선택</h4>
    <div class="wrap_scroll depth1" style="height: 245px;">
        <div class="scrollbar" style="height: 245px;"><div class="track" style="height: 245px;"><div class="thumb" style="top: 4.7025px; height: 115.211px;"><div class="end"></div></div></div></div>
        <div class="viewport">
            <div class="overview" style="top: -10px;">
                <ul id="area_ul">
                        <li class="depth1_btn_wrapper selected on"><button type="button" class="depth1_btn_1" id=""onclick="get_job(1);" ><span class="txt">개발 </span><span class="count">(39,862)</span></button></li>
                        <li class="depth1_btn_wrapper " ><button type="button" class="depth1_btn_2" onclick="get_job(2);"><span class="txt">비즈니스 </span><span class="count">(23,595)</span></button></li>
                        <li class="depth1_btn_wrapper " ><button type="button" class="depth1_btn_3" onclick="get_job(3);"><span class="txt">마케팅,광고 </span><span class="count">(3,926)</span></button></li>
                        <li class="depth1_btn_wrapper " ><button type="button" class="depth1_btn_4" onclick="get_job(4);"><span class="txt">디자인 </span><span class="count">(6,362)</span></button></li>
                        <li class="depth1_btn_wrapper " ><button type="button" class="depth1_btn_5" onclick="get_job(5);"><span class="txt">영업 </span><span class="count">(4,317)</span></button></li>
                        <li class="depth1_btn_wrapper " ><button type="button" class="depth1_btn_6" onclick="get_job(6);"><span class="txt">고객서비스 </span><span class="count">(1,448)</span></button></li>
                        <li class="depth1_btn_wrapper " ><button type="button" class="depth1_btn_7" onclick="get_job(7);"><span class="txt">게임 제작 </span><span class="count">(2,637)</span></button></li>
                        
                </ul>
            </div>
        </div>
    </div>
    <div class="wrap_scroll depth_check" style="height: 245px;">
        <div class="scrollbar" style="height: 245px;"><div class="track" style="height: 245px;"><div class="thumb" style="top: 0px; height: 179.179px;"><div class="end"></div></div></div></div>
        <div class="viewport">
            <div class="overview" style="top: 0px;">
                <div class="wrap_list_check" >
                    <ul class="list_check" id="job1" style="display: block;">
                            <li>
                                <div class="sri_input3">
                                    <input type="checkbox" id="Loc_cd_101000" name="Job_cd">
                                    <label for="Loc_cd_101000"><span class="txt">웹개발자</span></label>
                                </div>
                            </li>
                            <li>
                                <div class="sri_input3">
                                    <input type="checkbox" id="Joc_cd_101010" name="Job_cd">
                                    <label for="Joc_cd_101010"><span class="txt">서버개발자</span><span class="count"> (13,201)</span></label>
                                </div>
                            </li>
                            <li>
                                <div class="sri_input3">
                                    <input type="checkbox" id="Joc_cd_101020" name="Job_cd" >
                                    <label for="Joc_cd_101020"><span class="txt">프론트엔드 개발자</span><span class="count"> (848)</span></label>
                                </div>
                            </li>
                            <li>
                                <div class="sri_input3">
                                    <input type="checkbox" id="Joc_cd_101030" name="Job_cd" value="101030">
                                    <label for="Joc_cd_101030"><span class="txt">자바 개발자</span><span class="count"> (368)</span></label>
                                </div>
                            </li>
                            <li>
                                <div class="sri_input3">
                                    <input type="checkbox" id="Joc_cd_101040" name="Job_cd" value="101040">
                                    <label for="Joc_cd_101040"><span class="txt">파이썬 개발자</span><span class="count"> (1,425)</span></label>
                                </div>
                            </li>
                    </ul>
           
                    <div class="area_btn">
                        <button type="button" class="btn_all_category" data-logging-flow="area">지역 펼쳐보기</button>
                        <button type="button" class="btn_reset">지역 초기화</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
            </div>         </div>
    </div>
    </div>
<div id="sp_preview" class="wrap_search_result preview_v2">
        <div class="add_keyword" >
        <div class="keywords" id="Search_P">
        <p class="result_txt">채용공고를 찾고 있습니다. 잠시만 기다려주세요.</p>
        <p class="reset_txt">검색조건을 설정해 주세요.</p>
    </div>
    <div class="area_btn">
        <button type="button" class="btn_expand" style="display: none;">펼쳐보기</button>
    </div>
    <button type="submit" id="search_btn" class="btn_search" >
        <span>
            <span class="count"><span id="search_count_txt"> </span>
            <span id="search_btn_txt">검색완료</span>
        </span>
        <span class="ripple"></span>
    </button>
    </div>
               </div>
        </fieldset>
    </form>
</body>
</html>