function reqPage(page) {
	location.href = '/admin/order/requestOrders?page=' + page;
}

function showOrderDetail(oId) {
	window.open('/admin/order/detail/requestOrder?orderId=' + oId + '&page=1', '_blank', 'width=800, height=800, resizable=yes');
}
