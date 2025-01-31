;; Custom Keybindings
(use-package evil-nerd-commenter
  :bind ("M-/" . evilnc-comment-or-uncomment-lines)) ;; using M-/ for comments

(map! :leader :desc "Visit Buffer" "b o" #'ibuffer-visit-buffer) ;; open buffer from ibuffer listing

;; pyvenv mode keybinds
(map! :leader
      (:prefix ("v" . "venv") ;; new entry in whichkey
       :desc "Manually activate venv" "a" #'pyvenv-activate
       :desc "Deactivate venv" "d" #'pyvenv-activate
       :desc "Select venv (workon)" "w" #'pyvenv-workon))
