function toggleDetails(button, type) {
    const itemDetails = button.parentElement.nextElementSibling;
    if (itemDetails.classList.contains('hidden')) {
        itemDetails.classList.remove('hidden');
        button.textContent = '- ' + type.charAt(0).toUpperCase() + type.slice(1);
    } else {
        itemDetails.classList.add('hidden');
        button.textContent = '+ ' + type.charAt(0).toUpperCase() + type.slice(1);
    }
}
