<?php

use Fuel\Core\Upload;
use Fuel\Core\Date;
use Fuel\Core\Image;
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
    $path = DOCROOT.'files'.DS.$folder.DS.'avatars';
    $tmp_path = DOCROOT.'files/tmp'.DS.$folder.DS.'avatars';
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
      return '/files/'.$folder.'/avatars/'.$data['saved_as'];
    }
    return null;
  }

  public static function product()
  {
		$folder = Date::forge(time())->format("%m_%Y", true);
		$config = array(
			'path' => DOCROOT.'files'.DS.$folder.DS.'products',
			'randomize' => true,
			'ext_whitelist' => array('img', 'jpg', 'jpeg', 'gif', 'png'),
    );
    
    Upload::process($config);

    if (Upload::is_valid())
    {
      Upload::save();
      $product_image = array();
      foreach(Upload::get_files() as $file)
      {
        $image_path = '/files/'.$folder.'/products/'.$file['saved_as'];
        array_push($product_image,$image_path);
      }

    }
    return $product_image;
  }

  public static function banner()
  {
		$folder = Date::forge(time())->format("%m_%Y", true);
		$config = array(
			'path' => DOCROOT.'files'.DS.$folder.DS.'banners',
			'randomize' => true,
			'ext_whitelist' => array('img', 'jpg', 'jpeg', 'gif', 'png'),
    );
    
    Upload::process($config);
    $banner_image = array();
    if (Upload::is_valid())
    {
      Upload::save();
      foreach(Upload::get_files() as $file)
      {
        $image_path = '/files/'.$folder.'/banners/'.$file['saved_as'];
        array_push($banner_image,$image_path);
      }

    }
    return $banner_image;
  }

  public static function brand()
  {
		$folder = Date::forge(time())->format("%m_%Y", true);
		$config = array(
			'path' => DOCROOT.'files'.DS.$folder.DS.'brands',
			'randomize' => true,
			'ext_whitelist' => array('img', 'jpg', 'jpeg', 'gif', 'png'),
    );
    
    Upload::process($config);
    $brand_image = array();
    if (Upload::is_valid())
    {
      Upload::save();
      foreach(Upload::get_files() as $file)
      {
        $image_path = '/files/'.$folder.'/brands/'.$file['saved_as'];
        array_push($brand_image,$image_path);
      }

    }
    return $brand_image;
  }

  public static function blog()
  {
		$folder = Date::forge(time())->format("%m_%Y", true);
		$config = array(
			'path' => DOCROOT.'files'.DS.$folder.DS.'blogs',
			'randomize' => true,
			'ext_whitelist' => array('img', 'jpg', 'jpeg', 'gif', 'png'),
    );
    
    Upload::process($config);
    $blog_image = array();
    if (Upload::is_valid())
    {
      Upload::save();
      foreach(Upload::get_files() as $file)
      {
        $image_path = '/files/'.$folder.'/blogs/'.$file['saved_as'];
        array_push($blog_image,$image_path);
      }

    }
    return $blog_image;
  }
}