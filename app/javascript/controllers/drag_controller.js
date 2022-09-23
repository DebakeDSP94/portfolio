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

	listTargetConnected() {
		this.listTargets.forEach(this.initializeSortable.bind(this));
	}

	initializeSortable(target) {
		new Sortable(target, {
			group: 'position',
			animation: 100,
			sort: true,
		});
	}
}
