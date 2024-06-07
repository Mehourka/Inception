<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the website, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/documentation/article/editing-wp-config-php/
 *
 * @package WordPress
 */

/** CUSTOM PART */
if (!function_exists('getenf_docker')) {
  function getenv_docker($env, $default) {
    if ($fileEnv = getenv($env . '_FILE')) {
      return rtrim(file_get_content($fileEnv), "\r\n");
    }
    else if (($val = getenv($env)) !== false) {
      return $val;
    }
    else {
      return $default;
    }
  }
}

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', getenv_docker("DB_NAME", 'default') );

/** Database username */
define( 'DB_USER', getenv_docker('DB_USER', 'default') );

/** Database password */
define( 'DB_PASSWORD', getenv_docker('DB_PASSWORD', 'default') );

/** Database hostname */
define( 'DB_HOST', getenv_docker('DB_HOST', 'default') );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         'UZ[VND[<Bv!~wFO*Uj.@L_^Y1z:Mh/wC;2MA6<Qs}<~{G `O0E#d0{MoUc.#pL)y' );
define( 'SECURE_AUTH_KEY',  'wTA7#t[:MF/-i(:q1*n.k$? zI6rZ//j_{Qs3G{ p sK~<YpC3CX)N5A u()]L>*' );
define( 'LOGGED_IN_KEY',    '>jh8|}pZ?sRO0: ;PK%:VH`=y==Gn+ag&LTCGHPR<Cw?n(O%5[grUx[!rW72Jy6]' );
define( 'NONCE_KEY',        'UBhe6V+{b/VU]ir1q-|Clez@*t_!,IAtl0^. 8x1EyJq}|![wRwZWVP:23AM%Dw0' );
define( 'AUTH_SALT',        'YARjQFAKk,}NSvl}U<-E[g?A+FP%[b+}$uxC56C1D_5i-&V 5_pL@k>Dl3OQP#Rt' );
define( 'SECURE_AUTH_SALT', 'GU~;x$Xg qU*r-F8GfeY+DRvLB2]*(y$=hf eJ$BS%#zo<D~A8M-G#AXfTqed^cA' );
define( 'LOGGED_IN_SALT',   ':uh9SGYt@5Kc=}!36BoPv3gD,DXG62(9h*=(4l5Ibm67aW1;dhgfA#pM/H.HJy[K' );
define( 'NONCE_SALT',       'F.;qfB1J4G@M*Wa 7@cg{[$5`C/b74ve+0xxksAbd!1+Js~kCB91>gZsvx~;&.1H' );

/**#@-*/

/**
 * WordPress database table prefix.
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
 * @link https://wordpress.org/documentation/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* Add any custom values between this line and the "stop editing" line. */



/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
