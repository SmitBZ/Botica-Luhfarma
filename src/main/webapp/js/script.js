document.addEventListener('DOMContentLoaded', function() {
    setTimeout(function() {
        const loadingScreen = document.getElementById('loadingScreen');
        const mainContent = document.getElementById('mainContent');
        
        loadingScreen.classList.add('hidden');
        mainContent.classList.add('visible');

        setTimeout(function() {
            loadingScreen.style.display = 'none';
            window.location.href = "Usuario-Principal.jsp";
        }, 500);
    }, 3000);
});

function resetLoading() {
    const loadingScreen = document.getElementById('loadingScreen');
    const mainContent = document.getElementById('mainContent');
    
    loadingScreen.style.display = 'flex';
    loadingScreen.classList.remove('hidden');
    mainContent.classList.remove('visible');

    setTimeout(function() {
        loadingScreen.classList.add('hidden');
        mainContent.classList.add('visible');
        setTimeout(function() {
            loadingScreen.style.display = 'none';
            window.location.href = "principal.jsp";
        }, 500);
    }, 3000);
}