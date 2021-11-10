function getDocument(address, source, post, destName) {
	if (destName===undefined)
		destName='#content'
	if (post===undefined)
		post=''
	const comm = new XMLHttpRequest()
	comm.onreadystatechange= function(e) {
		console.log('OPERACJA')
		if (comm.readyState === 4) {
			if (comm.status === 200) {
				window.history.replaceState('', '', "?site="+source);
				document.querySelector(destName).innerHTML = comm.responseText				
				if (source==='kontakt')
					addFormEvents()
			}
		}
	}
	
	comm.open('POST',address)
	comm.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	comm.send(post)
}

//funkcja ta odsyła użytkownika po kliknięciu przycisku do innej stworzonej przez nas podstrony
function addEvents(){
	document.querySelectorAll(".button").forEach( v => {	
		v.onclick = (e) => {
			getDocument('./sites/'+v.dataset.link+'.html', v.dataset.link)
			//document.location='./sites/'+v.dataset.link+'.html'
			//document.location=v.dataset.link	
		}
	})		
}

function setSite() {
	const site = document.location.search.substr(1).split('=')[1]
	getDocument(`./sites/${site}.html`, site)
}
//Jest to funkcja, która dodaje wpisane dane do bazy
function addFormEvents() {
	document.querySelector("#form button").onclick=function() {
		let name = document.querySelector('input[name=name]').value
		let lname = document.querySelector('input[name=lastname]').value
		let email = document.getElementsByName('email')[0].value
		let content = document.getElementsByName('content')[0].value
		var sex ='';
		document.querySelectorAll('input[name=sex]').forEach((v) => {
			if (v.checked) 
				sex=v.value
		})
		
		/*let name = `<p>${document.querySelector('input[name=name]').value}</p>`
		//let name = `<p>${document.getElementsByName('name')[0].value}</p>`
		let lname = `<p>${document.querySelector('input[name=lastname]').value}</p>`
		//let lname = `<p>${document.getElementsByName('lastname')[0].value}</p>`
		let email = `<p>${document.getElementsByName('email')[0].value}</p>`
		let content = `<p>${document.getElementsByName('content')[0].value}</p>`
		var sex ='';
		document.querySelectorAll('input[name=sex]').forEach((v) => {
			if (v.checked) 
				sex=`<p>${v.value}</p>`
		})*/
		/*document.getElementsByName('sex').forEach((v) => {
			if (v.checked) 
				sex=`<p>${v.value}</p>`
		})*/
		//let sex = `<p>${document.getElementsByName('sex')[2].value}</p>`
		
		//document.querySelector('#output').innerHTML=name+lname+email+content+sex
		post=`name=${name}&lastname=${lname}&email=${email}&content=${content}&sex=${sex}`
		getDocument('./php/main.php','kontakt',post,'#output')
	}
}

