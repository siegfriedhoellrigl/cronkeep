<?php

namespace models;
use \Symfony\Component\Process\Process;

/**
 * Models operations with command "at".
 * 
 * @see http://en.wikipedia.org/wiki/At_%28Unix%29
 * @author Bogdan Ghervan <bogdan.ghervan@gmail.com>
 */
class At
{
	/**
	 * Possible errors printed by "at".
	 */
	const ERROR_ACCESS_DENIED = 'You do not have permission to use at.';
	const ERROR_GARBLED_TIME  = 'Garbled time';
	
	/**
	 * Command is available and can be used.
	 * 
	 * @var bool
	 */
	protected static $_isAvailable;
	
	/**
	 * Last error output from the command.
	 * 
	 * @var string
	 */
	protected static $_errorOutput;
	
	/**
	 * Tells whether the "at" command is available and ready to use.
	 * 
	 * A common error is "You do not have permission to use at." which means
	 * the web server's user is not allowed access.
	 * 
	 * The command is available if it returns "Garbled time" when called
	 * without arguments. That's actually a standard error triggered
	 * if no switch or time setting is given.
	 * 
	 * @return bool
	 */
	public static function isAvailable()
	{
		if (self::$_isAvailable === null) {
			$process = new Process('at');
			$process->run();
			
			self::$_errorOutput = trim($process->getErrorOutput());
			
			// Receiving "Garbled time" is a good sign - it means the command
			// is available (but the input was not right)
			self::$_isAvailable = trim(self::$_errorOutput) == self::ERROR_GARBLED_TIME;
		}
		
		return self::$_isAvailable;
	}
	
	/**
	 * Returns last error output.
	 * 
	 * @return string
	 */
	public static function getErrorOutput()
	{
		return self::$_errorOutput;
	}
}