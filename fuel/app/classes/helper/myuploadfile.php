<?php

use Fuel\Core\Upload;

class MyUploadFile
{
  public static function doUpload(): array
  {
		$folder = Date::forge(time())->format("%m_%Y", true);
		$config = array(
			'path' => DOCROOT.'files'.DS.$folder,
			'randomize' => true,
			'ext_whitelist' => array('img', 'jpg', 'jpeg', 'gif', 'png'),
    );
    
    Upload::process($config);

    $uploadFile = array();
    $uploadFile['get_files'] = array();
    $uploadFile['get_errors'] = array();
    
    if (Upload::is_valid())
    {
      Upload::save();
      
      return Upload::get_files();
    }
    return Upload::get_errors();
  }

  public static function avatar()
  {
		$image = Image::forge(array(
				'quality' => 80
		));
		$folder = Date::forge(time())->format("%m_%Y", true);
    // Upload an image and pass it directly into the Image::load method.
    $path = DOCROOT.'files'.DS.$folder.DS.'avatar';
    $tmp_path = DOCROOT.'files/tmp'.DS.$folder;
		Upload::process(array(
      'path' => $tmp_path,
			'randomize' => true,
			'ext_whitelist' => array('img', 'jpg', 'jpeg', 'gif', 'png'),
		));

		if (Upload::is_valid())
		{
      Upload::save($tmp_path, 0);
      $data = Upload::get_files(0);
			// Using the file upload data, we can force the image's extension
			// via $force_extension
			$image->load($tmp_path.DS.$data['saved_as'], false, $data['extension'])
					->crop_resize(200, 200)
          ->save($path.DS.$data['saved_as']);
      return $data['saved_as'];
    }
    return null;
  }

  public static function product()
  {
		$image = Image::forge(array(
				'quality' => 80
		));
		$folder = Date::forge(time())->format("%m_%Y", true);
    // Upload an image and pass it directly into the Image::load method.
    $path = DOCROOT.'files'.DS.$folder.DS.'products';
    $tmp_path = DOCROOT.'files/tmp'.DS.$folder;
		Upload::process(array(
      'path' => $tmp_path,
			'randomize' => true,
			'ext_whitelist' => array('img', 'jpg', 'jpeg', 'gif', 'png'),
		));

		if (Upload::is_valid())
		{
      Upload::save($tmp_path, 0);
      $data = Upload::get_files(0);
			// Using the file upload data, we can force the image's extension
			// via $force_extension
			$image->load($tmp_path.DS.$data['saved_as'], false, $data['extension'])
					->crop_resize(800, 800)
          ->save($path.DS.$data['saved_as']);
      return $data['saved_as'];
    }
    return null;
  }
}