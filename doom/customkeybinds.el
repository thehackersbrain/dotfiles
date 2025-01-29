;; Custom Keybindings
(use-package evil-nerd-commenter
  :bind ("M-/" . evilnc-comment-or-uncomment-lines)) ;; using M-/ for comments

(map! :leader :desc "Visit Buffer" "b o" #'ibuffer-visit-buffer) ;; open buffer from ibuffer listing
