// import { Controller } from 'stimulus';
// import Sortable from 'sortablejs';

// export default class extends Controller {
// 	connect() {
// 		this.sortable = Sortable.create(this.element, {
// 			onEnd: this.end.bind(this),
// 		});
// 	}

// 	end(event) {
// 		let id = event.item.dataset.id;
// 		let data = new FormData();
// 		data.append('position', event.newIndex + 1);

// 		Rails.ajax({
// 			url: this.data.get('url').replace(':id', id),
// 			type: 'PATCH',
// 			data: data,
// 		});
// 	}
// }
import { Controller } from 'stimulus';
import Sortable from 'sortablejs';

export default class extends Controller {
	static targets = ['list'];
	static values = {
		url: String,
		attribute: String,
	};

	connect() {
		this.listTargets.forEach(this.initializeSortable.bind(this));
	}

	initializeSortable(target) {
		new Sortable(target, {
			group: 'shared',
			animation: 100,
			sort: true,
			onEnd: this.end.bind(this),
		});
	}

	end(event) {
		const id = event.item.dataset.id;
		const url = this.urlValue.replace(':id', id);
		const formData = new FormData();
		formData.append(this.attributeValue, event.to.dataset.newValue);
		window.mrujs
			.fetch(url, {
				method: 'PATCH',
				body: formData,
			})
			.then(() => {})
			.catch((error) => console.error(error));
	}
}
