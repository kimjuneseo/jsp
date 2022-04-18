const $ = (el,one="true") => one ?  document.querySelector(el) :document.querySelectorAll(el);
const $form = document.member;
{
	let page = $('section').id;
	page == "memberInsert" ? insertPage():
	"";
}

function insertPage(){
	const formChk = () => {
		try{
			if($form.num.value === ''){
				throw "참가번호가 입력되지 않았습니다!";
			}else if($form.name.value ===''){
				throw "참가자명이 입력되지 않았습니다!";
			}else if($form.b_1.value ==='' || $form.b_2.value ==='' || $form.b_3.value ===''){
				throw "생년월일이 입력되지 않았습니다!";
			}else if($form.sex.value ===''){
				throw "성별이 입력되지 않았습니다!";
			}else if($form.ten.value ===''){
				throw "특기가 입력되지 않았습니다!";
			}else if($form.so.value ===''){
				throw "소속사가 입력되지 않았습니다!";
			}
		}catch(e){
			alert(e);
			return;
		};
		$form.submit();		
	}
	
	$(".addBtn").addEventListener("click", formChk);
	$(".rewrite").addEventListener("click", () => $form.reset());
	
};
