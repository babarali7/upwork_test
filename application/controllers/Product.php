<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Product extends CI_Controller {

	/**
	 * Index Page for this controller.
	 *
	 * Maps to the following URL
	 * 		http://example.com/index.php/welcome
	 *	- or -
	 * 		http://example.com/index.php/welcome/index
	 *	- or -
	 * Since this controller is set as the default controller in
	 * config/routes.php, it's displayed at http://example.com/
	 *
	 * So any other public methods not prefixed with an underscore will
	 * map to /index.php/welcome/<method_name>
	 * @see https://codeigniter.com/userguide3/general/urls.html
	 */
	
    public function __construct() {
        parent::__construct();
		
			//Load Models.............
			
			date_default_timezone_set("Asia/Karachi");
			 
			 $this->load->model('general');
			 
		
	}
    
    
    
     public function example()
	{
		
        $this->load->view('template/header');

        $this->load->view('example');

        $this->load->view('template/footer');
	
    }

    public function index()
	{
		
        $this->load->view('template/header');

        
        $data['count_active_users'] = $this->general->fetch_CoustomQuery("SELECT COUNT(*) as active_users 
                             FROM `user` WHERE `user_active` = 1");

        $data['count_active_users_products'] = $this->general->fetch_CoustomQuery("SELECT COUNT(DISTINCT(u.id)) as total 
                                    from users_products as up, user as u, products as p 
                                    WHERE
                                    up.user_id = u.id
                                    AND
                                    up.product_id = p.id
                                    AND
                                    u.user_active = 1
                                    AND
                                    p.status = 1");
        
        $data['count_active_products'] = $this->general->fetch_CoustomQuery("SELECT COUNT(*) as total 
                                FROM `products` WHERE `status` = 1");         
        

        $data['count_active_products_not_used'] = $this->general->fetch_CoustomQuery("SELECT COUNT(*) as total FROM `products` as p 
                                            WHERE p.status = 1 
                                            AND 
                                            p.id NOT IN (SELECT product_id from users_products)");


        $data['amount_active_product'] = $this->general->fetch_CoustomQuery("SELECT * 
                                        FROM `users_products` as up, products as p
                                        WHERE 
                                        up.product_id = p.id
                                        AND
                                        p.status = 1");

        $data['summarize_price_products_per_user'] = $this->general->fetch_CoustomQuery("SELECT SUM(product_quantity*product_price) 
                        as sumarize, user_id, u.user_fullname FROM `users_products` as up,
                        products as p, user as u 
                        WHERE up.product_id = p.id
                        AND
                        up.user_id = u.id
                        AND p.status = 1
                        GROUP BY user_id");


        
        
        $this->load->view('product',$data);

        $this->load->view('template/footer');
	
    }
}
