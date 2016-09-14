$("document").ready(function (){
	$.ajax({
		url:"findbook.xqy",
		type:"get",
		dataType:"json",
		success:function(data){
			$.each(data.books.book, function(commentIndex, comment){
				$("#details").append(
						"<tr>" +
						"<td> <input type='text'  value="+comment.id+"></td>" +
						"<td> <input type='text'  value="+comment.title+"></td>" +
						"<td> <input type='text'  value="+comment.author+"></td>" +
						"<td> <input type='text'  value="+comment.page+"></td>" +
						"<td> <a href='delete.xqy?id="+comment.id+"'>Delete</a></td>" +
						"</td>"
				);
			});
		}
	});
})

/*
"<td> <a href='update.xqy?id="+$(".title").val()+"&title="+comment.title+"&author="+comment.author+"&page="+comment.page+"'>Update</a></td>" +*/