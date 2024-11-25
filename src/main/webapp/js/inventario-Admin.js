// ================================
// Sidebar Functions
// ================================
function toggleSidebar() {
    const sidebar = document.getElementById('sidebar');
    const body = document.body;
    
    sidebar.classList.toggle('closed');
    body.classList.toggle('sidebar-closed');
}

// Cerrar sidebar en dispositivos móviles al hacer clic fuera
function closeSidebarOnClickOutside(event) {
    const sidebar = document.getElementById('sidebar');
    const menuBtn = document.querySelector('.menu-btn');
    
    if (window.innerWidth <= 1024 && 
        !sidebar.contains(event.target) && 
        !menuBtn.contains(event.target) && 
        !sidebar.classList.contains('closed')) {
        toggleSidebar();
    }
}

// Ajustar sidebar al redimensionar la ventana
function adjustSidebarOnResize() {
    const sidebar = document.getElementById('sidebar');
    const body = document.body;
    
    if (window.innerWidth <= 1024) {
        sidebar.classList.add('closed');
        body.classList.add('sidebar-closed');
    } else {
        sidebar.classList.remove('closed');
        body.classList.remove('sidebar-closed');
    }
}

// ================================
// Toggle Product Details
// ================================
function toggleDetails(button) {
            const details = button.nextElementSibling;
            const icon = button.querySelector('i');
            
            button.classList.toggle('active');
            details.classList.toggle('show');
        }

