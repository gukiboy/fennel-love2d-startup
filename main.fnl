(fn love.load []
  ;; start a thread listening on stdin
  (: (love.thread.newThread "require('love.event')
while 1 do love.event.push('stdin', io.read('*line')) end") :start))

(fn love.handlers.stdin [line]
  ;; evaluate lines read from stdin as fennel code
  (let [(ok val) (pcall fennel.eval line)]
    (print (if ok (fennel.view val) val))))

;; ------------------------------------------------------------------------------------
;; GAME
;; ------------------------------------------------------------------------------------

(fn love.draw []
  (love.graphics.print "Hello World!" 10 10))

(fn love.keypressed [key]
  (love.event.quit))

;; ------------------------------------------------------------------------------------
;; GAME
;; ------------------------------------------------------------------------------------
