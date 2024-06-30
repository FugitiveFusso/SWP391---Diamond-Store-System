function toggleSection(sectionId, buttonId) {
  const section = document.getElementById(sectionId);
  const button = document.getElementById(buttonId);
  
  if (section.classList.contains('hidden')) {
    section.classList.remove('hidden');
    button.classList.add('active');
    button.textContent = `- ${button.textContent.split(' ')[1]}`;
  } else {
    section.classList.add('hidden');
    button.classList.remove('active');
    button.textContent = `+ ${button.textContent.split(' ')[1]}`;
  }
}
