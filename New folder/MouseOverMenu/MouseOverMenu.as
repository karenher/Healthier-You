﻿package{	import flash.display.MovieClip;	import flash.events.Event;	import flash.events.MouseEvent;	import flash.events.TimerEvent;	import flash.utils.Timer;		import com.greensock.*;	import com.greensock.easing.*;	public class MouseOverMenu extends MovieClip {				public var _sMouseOver:MovieClip;		public var _sMenu:MovieClip;				private var _menuTimer:Timer;		private var _menuOpen:Boolean = false;				public function MouseOverMenu():void {			addEventListener(Event.ADDED_TO_STAGE, init, false, 0, true);		}				private function init(e:Event):void {						_sMouseOver.buttonMode = true;			_sMouseOver.addEventListener(MouseEvent.MOUSE_OVER, showMenu, false, 0, true);			_sMouseOver.addEventListener(MouseEvent.MOUSE_OUT, startClose, false, 0, true);			_sMouseOver.addEventListener(MouseEvent.MOUSE_OVER, cancelClose, false, 0, true);						_menuTimer = new Timer( 50 );			_menuTimer.addEventListener ( TimerEvent.TIMER, doCloseMenu );						_sMenu.visible = false;			_sMenu.alpha = 0;			_sMenu.addEventListener(MouseEvent.MOUSE_OUT, startClose, false, 0, true);			_sMenu.addEventListener(MouseEvent.MOUSE_OVER, cancelClose, false, 0, true);		}		private function showMenu(e:MouseEvent):void {			_menuOpen = true;			_sMenu.visible = true;			TweenLite.to(_sMenu, .5, {y:73, alpha:1});		}		private function startClose ( e:Event ):void {			//trace('startClose ' + e.target);			_menuTimer.start();		}		private function cancelClose ( e:Event ):void {			//trace('cancelClose ' + e.target);			_menuTimer.stop();		}		private function doCloseMenu ( e:Event ) {			closeMenu();		}		private function closeMenu ():void {			if ( _menuOpen ) {				TweenLite.to(_sMenu, .5, {y:50, alpha:0, onComplete: hideMenu});			}			_menuTimer.stop();			_menuOpen = false;		}		private function hideMenu():void {			_sMenu.visible = false;		}	}}