const cards = [...document.querySelectorAll('.qa')];
const search = document.querySelector('#search');
const topic = document.querySelector('#topic');
const count = document.querySelector('#count');
function filterQuestions() {
  const query = search.value.trim().toLocaleLowerCase();
  let visible = 0;
  cards.forEach(card => {
    card.hidden = Boolean((topic.value && card.dataset.topic !== topic.value) || !card.textContent.toLocaleLowerCase().includes(query));
    if (!card.hidden) visible++;
  });
  count.textContent = `${visible} of ${cards.length} questions${visible === 0 ? ' — try another search.' : ''}`;
}
search.addEventListener('input', filterQuestions);
topic.addEventListener('change', filterQuestions);
document.querySelector('#expand').addEventListener('click', event => {
  const visible = cards.filter(card => !card.hidden);
  const open = visible.some(card => !card.open);
  visible.forEach(card => { card.open = open; });
  event.currentTarget.textContent = open ? 'Collapse visible answers' : 'Expand visible answers';
});
