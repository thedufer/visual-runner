VisualRunner = require('./index')

class VisualRunnerRange extends VisualRunner
  setSeek: (cur, max) ->
    @seekControl
      .val(cur)
      .attr('min', 0)
      .attr('step', 1)
      .attr('max', max)

  setupSeekControl: (control) ->
    if control?
      @seekControl = control

      pausedForSeek = false
      @seekControl.on 'mousedown', =>
        if @isPlaying()?
          pausedForSeek = true
          @pause()
      @seekControl.on 'mouseup', =>
        if pausedForSeek
          @play()
        pausedForSeek = false
        return
      @seekControl.on 'input', =>
        @setIndex(parseInt(@seekControl.val(), 10))

    @setSeekDefaults()

module.exports = VisualRunnerRange
