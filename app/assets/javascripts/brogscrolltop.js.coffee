ready = ->
  
  #一覧画面
  $(window).scroll ->
    element = $('#blog-page-top-btn')
    visible = element.is(':visible')
    height = $(window).scrollTop()
    if height > 200
      element.fadeIn() if !visible
    else
      element.fadeOut()
      
  $(document).on 'click', '#blog-move-page-top', ->
    $('html, body').animate({ scrollTop: 0 }, 'slow')
      
$(document).ready(ready)
$(document).on('page:load', ready)