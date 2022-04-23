const chk = () => {
	let form = document.insert_form;
	try{
		if(!form[2].value){
			throw '판매구문을 입력하지 않았습니다';
		}else if(!form[3].value){
			throw '판매점포을 입력하지 않았습니다';
		}else if(!form[4].value){
			throw '판매상품을 입력하지 않았습니다';
		}else if(!form[5].value){
			throw '판매수량을 입력하지 않았습니다';
		}else if(!form[6].value){
			throw '판매구분을 입력하지 않았습니다';
		}
	}catch(e){
		alert(e);
		return false;
	};
	return true;
};