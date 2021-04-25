<?php
return array(
  /**
   * These presets allow you to call controlled manipulations.
 */
  'presets' => array(
    'mypreset' => array(
      'bgcolor' => '#f00', // Set the background color red
      'filetype' => 'jpg', // Output as jpeg.
      'quality' => 75,
      'actions' => array(
        array('crop_resize', 2000, 1000),
        array('watermark', '$1', "bottom right", 5), // Note the $1 is a variable.
        array('output', 'png')
      )
    )
  )
);
