;; Custom Keybindings
(use-package evil-nerd-commenter
  :bind ("M-/" . evilnc-comment-or-uncomment-lines)) ;; using M-/ for comments

(map! :leader :desc "Visit Buffer" "b o" #'ibuffer-visit-buffer) ;; open buffer from ibuffer listing
(map! :map emmet-mode-keymap "TAB" #'emmet-expand-line) ;; tab completion for emmet
