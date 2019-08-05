" kerboscript.vim: Syntax highlighting for kerboscript
" Copyright (C) 2015  Tom van der Lee
"
" This program is free software; you can redistribute it and/or modify
" it under the terms of the GNU General Public License as published by
" the Free Software Foundation; either version 2 of the License, or
" (at your option) any later version.
"
" This program is distributed in the hope that it will be useful,
" but WITHOUT ANY WARRANTY; without even the implied warranty of
" MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
" GNU General Public License for more details.
"
" You should have received a copy of the GNU General Public License along
" with this program; if not, write to the Free Software Foundation, Inc.,
" 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
"
" Vim syntax file
" Language:	kerboscript
" Maintainer:	Tom van der Lee <t0m.vd.l33@gmail.com>

if exists("b:current_syntax")
	finish
endif

syn clear
syn case ignore

" syn iskeyword @,48-57,:,_,128-167,224-235

" Identifier "{{{1
syn match	kerboscriptIdentifier	"\h\w\+"

" Booleans "{{{1
syn keyword	kerboscriptBoolean  	true false on off
hi! def link kerboscriptBoolean		Boolean

" Comments "{{{1
syn match	kerboscriptComment	"//.*" contains=kerboscriptTodo
hi! def link kerboscriptComment		Comment

" Conditionals "{{{1
syn keyword	kerboscriptConditional	if else when then and or not
hi! def link kerboscriptConditional	Conditional

" Constants "{{{1
syn keyword	kerboscriptConstant	pi e g
hi! def link kerboscriptConstant	Constant

" Floats "{{{1
syn match	kerboscriptFloat	"\.\d\+\>"
syn match	kerboscriptFloat	"\<\d\+\.\d*\>"
hi! def link kerboscriptFloat		Float

" Functions "{{{1
syn keyword	kerboscriptFuncKeyword	function contained
syn keyword	kerboscriptFunction	add remove stage clearscreen log copy rename delete edit run compile reboot shutdown batch deploy print
syn match	kerboscriptFuncCall	"\h\w*\s*(\@="
syn match	kerboscriptFuncDecl	"\<function\>\s*\h\w*" contains=kerboscriptFuncKeyword
syn match	kerboscriptDelegateDecl	"\v\h\w*\s+to(\s|\n)+\{" contains=kerboscriptKeyword,kerboscriptSep
syn match	kerboscriptDelegateRef	"\v\h\w*\@" contains=kerboscriptOperator
hi! def link kerboscriptFuncKeyword	Keyword
hi! def link kerboscriptFunction	Function
hi! def link kerboscriptFuncDecl	kerboscriptFunction
hi! def link kerboscriptFuncCall	kerboscriptFunction
hi! def link kerboscriptDelegateDecl	kerboscriptFunction
hi! def link kerboscriptDelegateRef	kerboscriptFunction

" Keywords "{{{1
syn keyword	kerboscriptKeyword	set to lock unlock declare parameter toggle return lazyglobal is
hi! def link kerboscriptKeyword		Keyword


" Separator "{{{1
syn match	kerboscriptSep		"\((\|)\|{\|}\|\[\|\]\|\.\)"
hi! def link kerboscriptSep		Special
" }}}

" Operators "{{{1
syn keyword	kerboscriptOperator	abs ceiling floor ln log10 mod min max round sqrt sin cos tan arcsin arccos arctan arctan2
syn match	kerboscriptOperator	'\V=\|-\|+\|*\|@\|%\|&\||\|\\|^\|~\|<\|>\|!='
hi! def link kerboscriptOperator	Operator

" Numbers "{{{1
syn match	kerboscriptNumber	"-\?\<\d\+\>"
hi! def link kerboscriptNumber		Number

" Repeats "{{{1
syn keyword	kerboscriptRepeat	for until
hi! def link kerboscriptRepeat		Repeat

" Statements "{{{1
syn keyword	kerboscriptStatement	wait break preserve
hi! def link kerboscriptStatement	Statement

" StorageClasses "{{{1
syn keyword	kerboscriptStorageClass	global local
hi! def link kerboscriptStorageClass	StorageClass

" Strings "{{{1
syn region	kerboscriptString	start=+"+ end=+"+
hi! def link kerboscriptString		String

" TODOs "{{{1
syn keyword	kerboscriptTodo		contained TODO
hi! def link kerboscriptTodo		Todo

" Types "{{{1
syn keyword	kerboscriptType		v vector direction latlng parameter
hi! def link kerboscriptType		Type

let b:current_syntax = "kerboscript"
" vim: set ts=8 sw=8 tw=78 fdm=marker noet :
