<?php
namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use Laravel\Passport\Client;
use Illuminate\Support\Carbon;

trait IssuTokenTrait {
    
    private $client;
    private $response;

    public function RequestToken(Request $request, $grantType){
        
        $this->client = Client::find(config('services.passport.client_id'));
        

        if( $this->client ){

            $params = [
                'grant_type' => $grantType,
                'client_id' => $this->client->id,
                'client_secret' => $this->client->secret,    
                'password' => $request->password,
                'scope' => $request->scope,
            ];
                
            if($grantType !== 'social'){
                $params['username'] = $request->username ?: $request->email;
            }

            $http = new \GuzzleHttp\Client();
            
            try {
                
                $this->response = $http->post(config('services.passport.url_endpoint'), [
                    'form_params' => $params
                ]);

                return $this->response;
                
            } catch (\GuzzleHttp\Exception\BadResponseException $e) {
                
                if ($e->getCode() === 400) {
                    return response()->json('Invalid Request. Please enter a username or a password.', $e->getCode());
                } else if ($e->getCode() === 401) {
                    return response()->json('Your credentials are incorrect. Please try again', $e->getCode());
                }
                return response()->json('Something went wrong on the server.', $e->getCode());

            }

            // $this->response = $http->post(config('services.passport.url_endpoint'), [
            //     'form_params' => $params,
            // ]);
        }
        return $this->response;
    }

    public function RefreshToken(Request $request, $grantType, $clientID){
        $this->client = Client::find($clientID);

        $params = [
            'grant_type' => $grantType,
            'refresh_token' => $request->refresh_token,
            'client_id' => $this->client->id,
            'client_secret' => $this->client->secret,    
        ];
        
        $http = new \GuzzleHttp\Client();

        try {

            // $response = $http->post(config('services.passport.url_endpoint'), [
            //     'form_params' => $params,
            // ]);
                
            $this->response = $http->post(config('services.passport.url_endpoint'), [
                'form_params' => $params
            ]);
            
        } catch (\GuzzleHttp\Exception\BadResponseException $e) {
            
            if ($e->getCode() === 400) {
                return response()->json('Invalid Request. Please enter a username or a password.', $e->getCode());
            } else if ($e->getCode() === 401) {
                return response()->json('Your credentials are incorrect. Please try again', $e->getCode());
            }
            return response()->json('Something went wrong on the server.', $e->getCode());

        }
    }

    // CHECK TOKEN EXPIRE , TARUH DI FRONTEND
    public function tokenExpired(Request $request)
    {
        if (Carbon::parse($request->expires_at) < Carbon::now()) {
            return true;
        }
        return false;
    }
}

