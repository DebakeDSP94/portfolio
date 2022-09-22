function setPositions() {
	$('.card').each(function (index, value) {
		this.setAttribute('data-pos', index + 1);
	});
}

$(() => {
	setPositions();
	$('.sortable').sortable({
		update: function (event, ui) {
			let updated_order = [];
			setPositions();
			$('.card').each(function (index, value) {
				updated_order.push({
					id: this.getAttribute('data-id'),
					position: this.getAttribute('data-pos'),
				});
			});
			$.ajax({
				type: 'PUT',
				url: '/portfolios/sort',
				data: { order: updated_order },
			});
		},
	});
});
