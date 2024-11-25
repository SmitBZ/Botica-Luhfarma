function toggleSidebar() {
    const sidebar = document.getElementById('sidebar');
    const body = document.body;
    
    sidebar.classList.toggle('closed');
    body.classList.toggle('sidebar-closed');
}

// Cerrar sidebar en móviles al hacer clic fuera
document.addEventListener('click', function(event) {
    const sidebar = document.getElementById('sidebar');
    const menuBtn = document.querySelector('.menu-btn');
    
    if (window.innerWidth <= 1024 && 
        !sidebar.contains(event.target) && 
        !menuBtn.contains(event.target) && 
        !sidebar.classList.contains('closed')) {
        toggleSidebar();
    }
});

// Ajustar sidebar al redimensionar ventana
window.addEventListener('resize', function() {
    const sidebar = document.getElementById('sidebar');
    const body = document.body;
    
    if (window.innerWidth <= 1024) {
        sidebar.classList.add('closed');
        body.classList.add('sidebar-closed');
    } else {
        sidebar.classList.remove('closed');
        body.classList.remove('sidebar-closed');
    }
});

function showDetails(saleId) {
    const sales = {
        1: {
            date: '28/10/2024',
            client: 'Juan Pérez',
            items: [
                { product: 'Paracetamol', quantity: 2, price: 15.25 },
                { product: 'Ibuprofeno', quantity: 1, price: 126.00 }
            ],
            total: 156.50
        },
        2: {
            date: '29/10/2024',
            client: 'María García',
            items: [
                { product: 'Amoxicilina', quantity: 1, price: 245.75 }
            ],
            total: 245.75
        }
    };

    const sale = sales[saleId];
    const detailsDiv = document.getElementById('saleDetails');
    
    let html = `
        <div>
            <p><strong>Fecha:</strong> ${sale.date}</p>
            <p><strong>Cliente:</strong> ${sale.client}</p>
            <table>
                <thead>
                    <tr>
                        <th>Producto</th>
                        <th>Cantidad</th>
                        <th>Precio Unit.</th>
                        <th>Subtotal</th>
                    </tr>
                </thead>
                <tbody>
    `;

    sale.items.forEach(item => {
        const subtotal = item.quantity * item.price;
        html += `
            <tr>
                <td>${item.product}</td>
                <td>${item.quantity}</td>
                <td>S/. ${item.price.toFixed(2)}</td>
                <td>S/. ${subtotal.toFixed(2)}</td>
            </tr>
        `;
    });

    html += `
                <tr class="total-row">
                    <td colspan="3">Total:</td>
                    <td>S/. ${sale.total.toFixed(2)}</td>
                </tr>
            </tbody>
        </table>
    </div>
    `;

    detailsDiv.innerHTML = html;
}
