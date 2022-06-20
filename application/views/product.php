
<?php 
   
   foreach($count_active_users as $cau):       
     $count_au = $cau->active_users;
   endforeach;
   
   foreach($count_active_users_products as $caup):       
    $count_aup = $caup->total;
   endforeach;

   foreach($count_active_products as $cap):       
    $count_ap = $cap->total;
   endforeach;

   foreach($count_active_products_not_used as $capnu):       
    $count_apnu = $capnu->total;
   endforeach;

  $total_product_price=0;
  $summarize_price = 0;
  $value=0;



   foreach($amount_active_product as $acp):       
     
    $total_product_price += $acp->product_price;

    $value =  $acp->product_quantity*$acp->product_price;
    
    $summarize_price += $value;


   endforeach;


?>


<div class="jumbotron text-center">
  <h1>Project Upwork Test</h1>
  <p>User and Product Information</p> 
</div>
  
<div class="container">
  <div class="row">
    <div class="col-sm-3">
      <p>Count of active and verified users</p>    
      <h3><?=$count_au;?></h3>  
    </div>
    <div class="col-sm-3">
      <p>Active and Verified users with active products</p>
      <h3><?=$count_aup;?></h3>
    </div>
    <div class="col-sm-3">
      <p>Active Products</p>        
      <h3><?=$count_ap;?></h3>
    </div>
    <div class="col-sm-3">
      <p>Active Products dont belong to any user</p>        
      <h3><?=$count_apnu;?></h36>
    </div>
  </div>
  <div class="row">
    <div class="col-sm-3">
      <p>Total product Price</p>        
      <h3><?=$total_product_price;?></h3>
    </div>

    <div class="col-sm-3">
      <p>Summarize product Price</p>        
      <h3><?=$summarize_price;?></h3>
    </div>

    <div class="col-sm-6">
      <h4>Summarize price by user </h4>
      <?php
       
       foreach($summarize_price_products_per_user as $sppu):  ?>     
     
        <p> <?=$sppu->user_fullname;?> - <?=$sppu->sumarize;?>$  </p>

    
     <?php  endforeach; ?>
    
      
    </div>

  </div>
</div>

