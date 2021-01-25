<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** MySQL database username */
define( 'DB_USER', 'admin' );

/** MySQL database password */
define( 'DB_PASSWORD', 'admin' );

/** MySQL hostname */
define( 'DB_HOST', '10.102.44.148' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         '~>D#YYOk/}+]x/W+GpmsqqdY q64kJBAmTcM1a@@yj-T@]b|823K]@b|}!-j@;iO');
define('SECURE_AUTH_KEY',  '(j+!R|8*>lF#jrj^G37Q4_4uoXRTZX3oa)OgZa(xO&BZTeSI4zp#YyoE((USh/1b');
define('LOGGED_IN_KEY',    'Gzg!-hhOPGN|,1*bb}!OZUsLi$.x9jSwanP=3|?+fhy-Xf$^a%*P @~Fa`gbl)5R');
define('NONCE_KEY',        'ST#VfiFcC|^#jv?8V]~@z16m/$NC?L[K9[Jj#h_A*:+T-B@{$l[5 A5k@hSzA[^Q');
define('AUTH_SALT',        'O>c(4^?hpOL-UETn`%ix~?yPR1_wtEb:BSUpd`h<,oxr>|&<(r<Exc}8bx<3& wb');
define('SECURE_AUTH_SALT', '&bh;;iL+x!*q2Q`y8!r/p(}=?h;wnm7+qHz$W]AA<(Q|s%iX?&>|MHu |D+pr97{');
define('LOGGED_IN_SALT',   '$_#ZAw/&`#g|sua$)b3,^vnc4|LSA&-|G-WU~M+-L|wc$b8n:Rq16^a+VuHu,Ece');
define('NONCE_SALT',       '9yv6!,9FoYs82:rq?)`lt1qh-]G$O+1*@YlrDl)l4aIVH_y)jPCeS8u&rp.+E<!<');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
