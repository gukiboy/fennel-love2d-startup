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

(local WHITE [1 1 1])

(local game-start
       {:player   {:x 25
                   :y 25
                   :width 50
                   :height 50}
        :platform [{:color WHITE
                    :x 0
                    :y 200
                    :width 400
                    :height 500}]})


(fn coloured-draw [obj]
  (let [{: x : y : width : height : color} obj]
    (love.graphics.setColor (unpack WHITE))
    (love.graphics.rectangle "fill" x y width height)))


(fn love.draw []
  (let [{: platform} game-start
        [fst] platform]
    (love.graphics.print "Hello World!" 10 10)
    (coloured-draw fst)))

(fn love.keypressed [key]
  (love.event.quit))

;; ------------------------------------------------------------------------------------
;; GAME
;; ------------------------------------------------------------------------------------
