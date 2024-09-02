//Check for touch screens
if(!window.matchMedia("(pointer: coarse)").matches) {

  //Add body class
  document.body.classList.remove('not-scrollable')
  document.body.classList.add('scrollable');

  //Elements for app scroller
  const spaceHolderApp = document.querySelector('#app-scroller .scroller-space');
  const horizontalApp = document.querySelector('#app-scroller .scroller-content');
  const listItemsApp = document.querySelectorAll('#app-scroller .scroller-content ul li');
  const stickyApp = document.querySelector('#app-scroller .scroller-sticky');

  //Func to calculate scroller height
  function calcDynamicHeight(ref) {
    const vw = window.innerWidth;
    const vh = window.innerHeight;
    const objectWidth = ref.scrollWidth;
    return objectWidth - vw + vh;
  }

  //Func to calculate item width
  function calcDynamicItemWidth(ref, report) {
    const vh = ref.offsetHeight;
    if(report) {
      return vh*(908/1148);
    } else {
      return vh*(626/1148);
    }
  }

  //Resize app items on page load
  var appItemWidth = 0;
  listItemsApp.forEach(function(listItem){
    console.log(listItem.classList)
    appItemWidth = calcDynamicItemWidth(listItem, false);
    listItem.style.width = calcDynamicItemWidth(listItem, (listItem.classList.contains('large')))+'px';
  });

  //Resize on page load
  spaceHolderApp.style.height = calcDynamicHeight(horizontalApp)+'px';

  if(appItemWidth*listItemsApp.length < window.innerWidth) {
    document.body.classList.add('center-app-screens');
  } else {
    document.body.classList.remove('center-app-screens');
  }

  //Transform on scroll
  window.addEventListener('scroll', function(){
    horizontalApp.style.transform = 'translateX(-'+stickyApp.offsetTop+'px)';
  });

  //Adjust on resize
  window.addEventListener('resize', function(){
    spaceHolderApp.style.height = calcDynamicHeight(horizontalApp)+'px';

    listItemsApp.forEach(function(listItem){
      appItemWidth = calcDynamicItemWidth(listItem, false);
      listItem.style.width = calcDynamicItemWidth(listItem, (listItem.classList.contains('large')))+'px';
    });

    if(appItemWidth*listItemsApp.length < window.innerWidth) {
      document.body.classList.add('center-app-screens');
    } else {
      document.body.classList.remove('center-app-screens');
    }
  });
}
